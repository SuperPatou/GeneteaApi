/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/

/* Creation de la base de données */
CREATE DATABASE Genetea;
GO
USE Genetea;

/* Table: users */
CREATE TABLE users(
	ID_user          INT IDENTITY (1,1) NOT NULL ,
	username_user    VARCHAR (50) NOT NULL ,
	password_user    VARCHAR (500) NOT NULL ,
	firstname_user   VARCHAR (50) NOT NULL ,
	lastname_user    VARCHAR (50) NOT NULL ,
	email_user       VARCHAR (100) NOT NULL  ,
	CONSTRAINT users_PK PRIMARY KEY (ID_user)
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table: teas */
CREATE TABLE teas(
	ID_tea           INT IDENTITY (1,1) NOT NULL ,
	name_tea         VARCHAR (100) NOT NULL ,
	description_tea  VARCHAR (1000) NOT NULL ,
	price_tea        FLOAT  NOT NULL ,
	image_path_tea   VARCHAR (1000) NOT NULL ,
	link_page_tea    VARCHAR (1000) NOT NULL  ,
	CONSTRAINT teas_PK PRIMARY KEY (ID_tea)
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table: baskets */
CREATE TABLE baskets(
	ID_basket           INT IDENTITY (1,1) NOT NULL ,
	order_date_basket   DATETIME NOT NULL ,
	validate_basket     bit  NOT NULL  ,
	CONSTRAINT baskets_PK PRIMARY KEY (ID_basket)
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table: appreciation */
CREATE TABLE appreciation(
	ID_tea    INT  NOT NULL ,
	ID_user   INT  NOT NULL ,
	note      VARCHAR (1) NOT NULL  ,
	CONSTRAINT appreciation_PK PRIMARY KEY (ID_tea,ID_user)

	,CONSTRAINT appreciation_teas_FK FOREIGN KEY (ID_tea) REFERENCES teas(ID_tea)
	,CONSTRAINT appreciation_users0_FK FOREIGN KEY (ID_user) REFERENCES users(ID_user)
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table: to_command */
CREATE TABLE to_command(
	ID_basket   INT  NOT NULL ,
	ID_tea      INT  NOT NULL ,
	number      INT  NOT NULL  ,
	CONSTRAINT to_command_PK PRIMARY KEY (ID_basket,ID_tea)

	,CONSTRAINT to_command_baskets_FK FOREIGN KEY (ID_basket) REFERENCES baskets(ID_basket)
	,CONSTRAINT to_command_teas0_FK FOREIGN KEY (ID_tea) REFERENCES teas(ID_tea)
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure: GetTeas */
CREATE PROCEDURE [dbo].[GetTeas]   
AS   
    SET NOCOUNT ON;  
    SELECT *
    FROM teas
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure: GetTea (int ID_tea) */
CREATE PROCEDURE [dbo].[GetTea] 
	@ID_tea int
AS   
    SET NOCOUNT ON;  
    SELECT ID_tea, name_tea, description_tea, price_tea, image_path_tea, link_page_tea
    FROM teas
	WHERE ID_tea = @ID_tea
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure: InsertTea (varchar name_tea, varchar description_tea, float price_tea, varchar image_path_tea, varchar link_page_tea) */
CREATE PROCEDURE [dbo].[InsertTea]
	@name_tea varchar(100),
	@description_tea varchar(1000),
	@price_tea float,
	@image_path_tea varchar(1000),
	@link_page_tea varchar(1000)
AS   
    SET NOCOUNT ON; 
	INSERT INTO teas
           (name_tea
		   ,description_tea
           ,price_tea
           ,image_path_tea
		   ,link_page_tea)
	 OUTPUT
			inserted.ID_tea
			,inserted.description_tea
			,inserted.price_tea
			,inserted.image_path_tea
			,inserted.link_page_tea
     VALUES
           (@name_tea
		   ,@description_tea
           ,@price_tea
           ,@image_path_tea
		   ,@link_page_tea);
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure: UpdateTea (int ID_tea, varchar name_tea, varchar description_tea, float price_tea, varchar image_path_tea, varchar link_page_tea) */
CREATE PROCEDURE [dbo].[UpdateTea] 
	@ID_tea int,
	@name_tea varchar(100),
	@description_tea varchar(1000),
	@price_tea float,
	@image_path_tea varchar(1000),
	@link_page_tea varchar(1000)
AS   
    SET NOCOUNT ON; 
	UPDATE teas
	SET name_tea = @name_tea, description_tea = @description_tea, price_tea = @price_tea, image_path_tea = @image_path_tea, link_page_tea = @link_page_tea
    WHERE ID_tea = @ID_tea;
	SELECT * from teas WHERE ID_tea=@ID_tea;
GO

/* Procedure: DeleteTea (int ID_tea) */
CREATE PROCEDURE [dbo].[DeleteTea] 
	@ID_tea int
AS   
    SET NOCOUNT ON;  
    DELETE
	FROM teas
	WHERE ID_tea = @ID_tea
	SELECT @ID_tea AS 'ID_tea'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insertion: teas */
INSERT INTO teas (name_tea, description_tea, price_tea, image_path_tea, link_page_tea) VALUES
('Peach & Apricot dream', 'Un thé blanc Bio originaire du Fujian, en Chine. La douceur de la pêche, délicatement relevée d''un soupçon d''abricot, en fera rêver plus d''un(e). Un thé blanc fruité et délicat.', 4.4, '/assets/images/peach_apricot_dream.webp', 'https://fr.special-t.com/fr/8/capsules-the/peach-apricot-dream-the-blanc-biologique-aromatise.html'),
('Intense Mint', 'Intense Mint est un thé vert parfumé selon les grandes traditions orientales, mariant menthe fraîche et thé Gunpowder aux légères notes naturellement fumées.', 4.4, '/assets/images/intense_mint.webp', 'https://fr.special-t.com/fr/8/capsules-the/intense-mint-the-vert-aromatise.html'),
('Lemon Sorbet', 'Une infusion biologique rafraîchissante mêlant les saveurs acidulées du citron et du cynorrhodon. Un délicieux cocktail fruité à déguster chaud ou froid.', 4.4, '/assets/images/lemon_sorbet.webp', 'https://fr.special-t.com/fr/8/capsules-the/lemon-sorbet-infusion-biologique-aromatisee.html'),
('English Breakfast', 'Le thé English Breakfast révèle toute l''élégance d''un authentique thé noir d''Assam à la saveur corsée et maltée. Un thé parfait pour accompagner vos petits-déjeuners.', 4.4, '/assets/images/english_breakfast.webp', 'https://fr.special-t.com/fr/8/capsules-the/english-breakfast-the-noir.html'),
('Red Romance', 'Une infusion fruitée biologique aux saveurs gourmandes de fraise, de framboise et de cynorrhodon sur un fond chaud vanillé.', 4.4, '/assets/images/red_romance.webp', 'https://fr.special-t.com/fr/8/capsules-the/red-romance-infusion-biologique-aromatisee.html'),
('Mint Marrakech Style', 'Une création authentique où se mêlent les notes fumées du thé vert Gunpowder, la fraîcheur de la menthe douce et la subtilité des épices héritée de la tradition marocaine.', 4.4, '/assets/images/mint_marrakech_style.webp', 'https://fr.special-t.com/fr/8/capsules-the/mint-marrakech-style-the-vert-aromatise.html'),
('Good Morning Sunshine', 'Un mélange ensoleillé de Darjeeling, Assam et Ceylan aux fragrances fruitées, maltées et florales. Le thé Good Morning Sunshine est votre meilleur ami au petit-déjeuner.', 4.4, '/assets/images/good_morning_sunshine.webp', 'https://fr.special-t.com/fr/8/capsules-the/good-morning-sunshine-the-noir.html'),
('Blueberry Muffin', 'Une création exclusive mariant des effluves fruités et gourmands de muffins aux saveurs raffinées et délicatement maltées des thés d''Assam et de Ceylan.', 4.4, '/assets/images/blueberry_muffin.webp', 'https://fr.special-t.com/fr/8/capsules-the/blueberry-muffin-the-noir-aromatise.html'),
('Ice Mint', 'L''infusion biologique Ice Mint procure une sensation de fraîcheur apportée par des feuilles de menthe revigorante. Un plaisir simple et intense à déguster à tout moment.', 4.4, '/assets/images/ice_mint.webp', 'https://fr.special-t.com/fr/8/capsules-the/ice-mint-infusion-biologique-aromatisee.html'),
('Aquarosa', 'Sous sa belle robe rose rougeoyante, cette infusion d’hibiscus inspirée du Karkadé cache de délicates notes de fruits rouges et de baies noires. Sans théine, AquaRosa se déguste glacée ou chaude, à tout moment.', 4.9, '/assets/images/aquarosa.webp', 'https://fr.special-t.com/fr/8/capsules-the/aquarosa-kusmi-infusion-aromatisee.html'),
('Exotic Boost', 'Tonus au rendez-vous avec ce thé vert Bien-Etre BIO. Exotic Boost allie la fraîcheur de la mangue et de l’ananas aux vertus stimulantes de l’acérola, source de vitamine C, reconnue pour réduire la fatigue.', 4.4, '/assets/images/exotic_boost.webp', 'https://fr.special-t.com/fr/8/capsules-the/exotic-boost-the-vert-aromatise-bienetre-bio.html'),
('Pink Pamplemousse', 'Une vague de fraîcheur intense et stimulante aux accents acidulés de pamplemousse. Dégustez cette création exclusive biologique pour un plaisir rafraichissant.', 4.4, '/assets/images/pink_pamplemousse.webp', 'https://fr.special-t.com/fr/8/capsules-the/pink-pamplemousse-infusion-biologique-aromatisee.html'),
('Earl Grey Lime', 'Earl Grey Lime : un thé noir Earl Grey unique, mariant les traditionnelles essences de bergamote à la saveur acidulée du citron vert et aux accents fruités du thé noir de Ceylan.', 4.4, '/assets/images/earl_grey_lime.webp', 'https://fr.special-t.com/fr/8/capsules-the/earl-grey-lime-the-noir-aromatise.html'),
('Jasmin Flowers', 'Un prestigieux thé vert Chung Hao parfumé avec des fleurs de jasmin fraîchement cueillies. Laissez-vous transporter par le bouquet floral du thé Jasmine Flowers.', 4.4, '/assets/images/jasmin_flowers.webp', 'https://fr.special-t.com/fr/8/capsules-the/jasmine-flowers-the-vert-aromatise.html'),
('Happy Fruity', 'Cette infusion biologique promet bien-être et bonne humeur avec ses notes de superfruits, connus pour être riches en vitamines et antioxydants à l’état naturel.', 4.4, '/assets/images/happy_fruity.webp', 'https://fr.special-t.com/fr/8/capsules-the/happy-fruity-infusion-aromatisee-bienetre-bio.html'),
('Tropical Passion', 'Le thé noir parfumé Tropical Passion associe des fragrances de mangue, d''ananas et de fruit de la passion à un délicieux thé noir de Ceylan. Un goût venu tout droit du Sri Lanka.', 4.4, '/assets/images/tropical_passion.webp', 'https://fr.special-t.com/fr/8/capsules-the/tropical-passion-the-noir-aromatise.html'),
('Red Fruits Delight', 'Un harmonieux mélange de thés noirs venant de Ceylan et Keemun, associé à des fragrances troublantes de framboise et de cerise. Un thé gourmand de l''après-midi.', 4.4, '/assets/images/red_fruits_delight.webp', 'https://fr.special-t.com/fr/8/capsules-the/red-fruits-delight-the-noir-aromatise.html'),
('Rooibos Orange', 'Un délicieux et exotique Rooibos BIO d''Afrique du Sud associé à de savoureuses écorces d''orange. Laissez-vous emporter pour un safari sensoriel avec cette boisson sans théine.', 4.4, '/assets/images/rooibos_orange.webp', 'https://fr.special-t.com/fr/8/capsules-the/rooibos-orange-rooibos-bio.html'),
('Darjeeling', 'Un thé noir Darjeeling de qualité exceptionnelle dévoilant des notes de muscat et de miel typiques de la récolte d''été. Sélectionné dans les prestigieux jardins de la région de Darjeeling.', 4.4, '/assets/images/darjeeling.webp', 'https://fr.special-t.com/fr/8/capsules-the/darjeeling-the-noir-bio.html'),
('Ceylon', 'Ce Ceylon de grande qualité provient du jardin Biologique Idulgashinna, au Sri Lanka. Grâce à sa cueillette fine, où seules les meilleures feuilles de thé (Flowery Orange Pekoe) sont sélectionnées, ce thé noir offre un bouquet riche et rafraichissant.', 4.4, '/assets/images/ceylon.webp', 'https://fr.special-t.com/fr/8/capsules-the/ceylon-the-noir-bio.html'),
('After Meal', 'Une infusion aromatisée en toute légèreté aux saveurs délicates de fenouil et d''anis. La douce promesse d''un bon moment après le repas.', 4.4, '/assets/images/after_meal.webp', 'https://fr.special-t.com/fr/8/capsules-the/after-meal-infusion-aromatisee-bienetre-bio.html'),
('French Brunch', 'Un thé de petit-déjeuner de caractère mêlant Yunnan, Assam et Kenya pour une boisson raffinée aux notes fumées, maltées et cacaotées.', 4.4, '/assets/images/french_brunch.webp', 'https://fr.special-t.com/fr/8/capsules-the/french-brunch-the-noir.html'),
('Be Cool', 'Une infusion de plantes subtilement relevée par la réglisse et la menthe poivrée. Be Cool offre un moment parfait de détente et de douceur avec son goût fruité et épicé.', 4.9, '/assets/images/be_cool.webp', 'https://fr.special-t.com/fr/8/capsules-the/be-cool-kusmi-infusion-aromatisee.html'),
('Good Night Kiss', 'Une apaisante caresse aux accents de mélisse, de tilleul, de rose et de vanille exquises. Un mélange pour un pur moment de bien-être sans théine, idéal en soirée.', 4.4, '/assets/images/good_night_kiss.webp', 'https://fr.special-t.com/fr/8/capsules-the/good-night-kiss-infusion-bienetre-bio.html'),
('Prince Vladimir', 'Mélange créé en 1888 en hommage au Prince Vladimir Ier. Ses arômes de vanille et d’orange, associés aux notes épicées font de cet Earl Grey une référence de la maison KUSMI TEA.', 4.9, '/assets/images/prince_vladimir.webp', 'https://fr.special-t.com/fr/8/capsules-the/prince-vladimir-kusmi-the-noir-aromatise.html'),
('Japanese Sencha', 'Thé vert biologique de grande qualité issu de l''île de Kyushu au Japon, le Japanese Sencha révèle d''emblématiques notes végétales pour la fraîcheur, rehaussées de notes torréfiées.', 4.4, '/assets/images/japanese_sencha.webp', 'https://fr.special-t.com/fr/8/capsules-the/japanese-sencha-the-vert-bio.html'),
('Rooibos Vanilla', 'Un séduisant Rooibos d’Afrique du Sud velouté marié à l''opulente vanille Bourbon. Une gourmandise BIO sans théine à déguster à tout moment de la journée.', 4.4, '/assets/images/rooibos_vanilla.webp', 'https://fr.special-t.com/fr/8/capsules-the/rooibos-vanilla-rooibos-bio.html'),
('Verbena', 'Avec l''infusion Verbena, savourez le goût authentique de la nature révélé grâce à une sélection de feuilles de verveine citronnelle. Dégustez toute la délicatesse et la fraîcheur de cette plante.', 4.4, '/assets/images/verbena.webp', 'https://fr.special-t.com/fr/8/capsules-the/verbena-infusion-bio.html'),
('Anastasia', 'Succombez pour le fameux goût russe de la maison KUSMI TEA avec Anastasia, une création inspirée par la grande duchesse. Ce légendaire Earl Grey marie thé noir, bergamote, citron et notes de fleur d’oranger. Cette recette historique de KUSMI TEA est gardée secrète depuis sa création à Saint-Pétersbourg il y a plus de cent ans.', 4.9, '/assets/images/anastasia.webp', 'https://fr.special-t.com/fr/8/capsules-the/anastasia-kusmi-the-noir-aromatise.html'),
('Earl Grey', 'Unique mélange de Keemun et Ceylan parfumé aux écorces de bergamote venues directement de Calabre en Italie, ce thé noir Earl Grey est synonyme d''escapade à tout moment de la journée.', 4.4, '/assets/images/earl_grey.webp', 'https://fr.special-t.com/fr/8/capsules-the/earl-grey-the-noir-aromatise.html'),
('Detox', 'Grâce aux vertus des plantes, et notamment du pissenlit, recherché pour ses bienfaits diurétiques, notre nouvelle infusion biologique vous offre un moment Détox.', 4.4, '/assets/images/detox.webp', 'https://fr.special-t.com/fr/8/capsules-the/detox-infusion-bienetre-bio.html'),
('Lemon & Ginger', 'Un thé vert rafraîchissant agrémenté d''un zeste de citron et de gingembre pour une expérience inédite. Un moment unique qui reconnecte le corps et l''esprit.', 4.4, '/assets/images/lemon_ginger.webp', 'https://fr.special-t.com/fr/8/capsules-the/lemon-ginger-the-vert-aromatise.html'),
('Caramel Gourmand', 'Un irrésistible parfum de caramel se mêle à ce mélange de thés noirs, caractérisé par l''intensité de l''Assam et la finesse du Ceylan. Un sublime plaisir pour chaque après-midi.', 4.4, '/assets/images/caramel_gourmand.webp', 'https://fr.special-t.com/fr/8/capsules-the/caramel-gourmand-the-noir-aromatise.html'),
('Mandarin Peach', 'Le Mandarin Peach est un mélange équilibré de deux grands thés verts chinois Chun Mee et Sencha, associé à la douceur de la mandarine et de la pêche et rehaussé d''une pointe de gingembre.', 4.4, '/assets/images/mandarin_peach.webp', 'https://fr.special-t.com/fr/8/capsules-the/mandarin-peach-the-vert-aromatise.html'),
('Oolong Fujian', 'Un délicat Oolong Ti Kuan Yin de la région du Fujian en Chine, composé de feuilles entières roulées à la main libérant des fragrances végétales, fruitées et biscuitées.', 4.4, '/assets/images/oolong_fujian.webp', 'https://fr.special-t.com/fr/8/capsules-the/oolong-fujian-the-bleu.html');

INSERT INTO users (username_user, password_user, firstname_user, lastname_user, email_user) VALUES
('root', 'ab5fab9d8241e2ee803265b86753f2e5146c7ddc', 'root', 'root', '***'); /*mdp (sha1): genetec */