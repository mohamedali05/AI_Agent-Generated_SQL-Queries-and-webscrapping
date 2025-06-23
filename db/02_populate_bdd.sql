-- filepath: c:\PostGress_Database\populate_bdd.sql

-- Insert products
INSERT INTO Product (nom, description, ingredients, prix) VALUES
('Crème Source Hydra', 'Soin hydratant intensif pour le visage', 'acide hyaluronique, aloé vera, camomille', 14.9),
('Crème Équilibre Jour', 'Crème légère pour usage quotidien', 'glycérine, vitamine E, extrait de thé vert', 13.5),
('Crème Nutrition Intense', 'Soin riche pour peau sèche ou déshydratée', 'beurre de karité, huile d’argan, céramides', 15.8),
('Fluide Perfect Teint', 'Crème teintée effet naturel', 'pigments minéraux, acide hyaluronique, aloe vera', 16.5),
('Voile Éclat', 'Crème hydratante unifiante', 'niacinamide, mica, vitamine C', 17.2),
('Crème Lumière Teintée', 'Crème hydratante teintée avec fini lumineux', 'huile de jojoba, cacao, pigments végétaux', 17.9),
('Contour Regard Fraîcheur', 'Soin défatiguant pour le contour des yeux', 'caféine, acide hyaluronique, extrait de bleuet', 12.9),
('Écran Solaire Quotidien SPF 50', 'Haute protection solaire sans résidu blanc', 'oxyde de zinc, aloe vera, vitamine E', 15.6),
('Crème Apaisante Douce Nuit', 'Soin réparateur après-soleil', 'menthol, aloe vera, calendula', 11.8),
('Crème Cell Repair Nuit', 'Crème de nuit régénérante et nourrissante', 'rétinol, peptides, huile d’avocat', 19.9),
('Crème Riche Réconfort', 'Hydratation profonde pour peaux sensibles', 'huile d’amande douce, glycérine, panthénol', 13.8),
('Sérum Tenseur Immédiat', 'Lisse et raffermit le teint', 'collagène, acide hyaluronique, silice', 22.4),
('Gel Matifiant Jour', 'Contrôle la brillance et l’excès de sébum', 'extrait de bambou, zinc PCA, hamamélis', 12.2),
('Lotion Tonique Équilibrante', 'Resserre les pores et rafraîchit la peau', 'eau florale, extrait de concombre, allantoïne', 9.9),
('Crème Détox Antipollution', 'Protège la peau contre les agressions urbaines', 'charbon actif, thé vert, acide lactique', 18.1);

-- Insert stores
INSERT INTO Store (nom, adresse) VALUES
('Beauté Naturelle', '10 Rue des Lilas'),
('Éclat Parisien', '45 Avenue Montaigne'),
('Zen Cosmétiques', '88 Boulevard Haussmann');

-- Insert store stock
INSERT INTO Store_Products (id_store, id_product, stock_unit) VALUES
(1, 1, 40),
(1, 4, 20),
(1, 7, 25),
(1, 8, 30),
(1, 12, 15),
(2, 2, 35),
(2, 5, 15),
(2, 7, 20),
(2, 9, 18),
(2, 14, 22),
(3, 3, 30),
(3, 6, 20),
(3, 7, 22),
(3, 10, 25),
(3, 15, 10);

-- Insert promotions
INSERT INTO Promotion (id_product, taux_reduction, date_debut, date_fin) VALUES
(1, 20.00, '2025-06-01', '2025-06-30'),
(4, 15.00, '2025-06-15', '2025-07-15'),
(6, 10.00, '2025-06-10', '2025-06-25'),
(10, 25.00, '2025-06-01', '2025-06-30');

-- Insert teinte peau et produits
INSERT INTO Teinte_Peau_Produits (teinte, id_product) VALUES
('claire', 1),
('claire', 4),
('claire', 8),
('moyenne claire', 2),
('moyenne claire', 5),
('moyenne claire', 8),
('moyenne', 2),
('moyenne', 5),
('moyenne', 10),
('moyenne foncée', 3),
('moyenne foncée', 6),
('moyenne foncée', 10),
('foncée', 3),
('foncée', 6),
('foncée', 9),
('très foncée', 3),
('très foncée', 6),
('très foncée', 9);