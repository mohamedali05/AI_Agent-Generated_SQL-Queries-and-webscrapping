import logging
import os
from typing import Dict, Any
from dataclasses import dataclass
from contextlib import asynccontextmanager
from collections.abc import AsyncIterator
import psycopg2
from psycopg2.extensions import connection

import httpx
from mcp.server.fastmcp import FastMCP, Context
import time

time.sleep(5)
host = os.getenv("DB_HOST", "localhost")
DB_PORT = 5432
print(f"Connecting to PostgreSQL at {host}:{DB_PORT}...")

# Connexion à la base de données PostgreSQL


MCP_PORT = int(os.getenv("MCP_PORT", "5001"))
time.sleep(6)

# Configuration du logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@dataclass
class AppContext:
    """Contexte de l'application MCP"""
    conn: connection

@asynccontextmanager
async def app_lifespan(_: FastMCP) -> AsyncIterator[AppContext]:
    """Initialise et nettoie les ressources au démarrage/arrêt."""
    logger.info("Connecting to PostgreSQL using psycopg2...")
    conn = psycopg2.connect(
    dbname="postgres",  
    user="postgres",
    password="3Gy5uwht4*",
    host=host,  
    port=DB_PORT
    )
    yield AppContext(conn=conn)
    conn.close()
    logger.info("Connection to PostgreSQL closed.")


# Création du serveur MCP simple
mcp = FastMCP(
    "MCP Produits Beauté",
    description="Expose un outil de récupération de données via une requête SQL.",
    version="0.1.0",
    lifespan=app_lifespan,
    port=MCP_PORT,
    host="0.0.0.0", 
)

@mcp.tool()
def query_mcp(query: str, ctx: Context = None) -> Dict[str, Any]:
    """
    Executes a SQL query and returns the result as dictionaries.
    """
    try:
        with ctx.request_context.lifespan_context.conn.cursor() as cur:
            cur.execute(query)
            rows = cur.fetchall()
            columns = [desc[0] for desc in cur.description]
            result = [dict(zip(columns, row)) for row in rows]
            return {"result": result, "count": len(result)}
    except Exception as e:
        logger.error(f"Query error: {e}")
        return {"error": str(e), "result": [], "count": 0}


def run_server(transport: str = "sse") -> None:
    """Point d'entrée pour exécuter le serveur MCP."""
    try:
        mcp.run(transport=transport)
    except KeyboardInterrupt:
        logger.info("Arrêt manuel du serveur MCP")
    except Exception as e:
        logger.error(f"Erreur au démarrage du serveur: {str(e)}")

if __name__ == "__main__":
    run_server()