/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/

/* Creation de la base de donn�es */
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
('Peach & Apricot dream', 'Un th� blanc Bio originaire du Fujian, en Chine. La douceur de la p�che, d�licatement relev�e d''un soup�on d''abricot, en fera r�ver plus d''un(e). Un th� blanc fruit� et d�licat.', 4.4, '/assets/images/peach_apricot_dream.webp', 'https://fr.special-t.com/fr/8/capsules-the/peach-apricot-dream-the-blanc-biologique-aromatise.html'),
('Intense Mint', 'Intense Mint est un th� vert parfum� selon les grandes traditions orientales, mariant menthe fra�che et th� Gunpowder aux l�g�res notes naturellement fum�es.', 4.4, '/assets/images/intense_mint.webp', 'https://fr.special-t.com/fr/8/capsules-the/intense-mint-the-vert-aromatise.html'),
('Lemon Sorbet', 'Une infusion biologique rafra�chissante m�lant les saveurs acidul�es du citron et du cynorrhodon. Un d�licieux cocktail fruit� � d�guster chaud ou froid.', 4.4, '/assets/images/lemon_sorbet.webp', 'https://fr.special-t.com/fr/8/capsules-the/lemon-sorbet-infusion-biologique-aromatisee.html'),
('English Breakfast', 'Le th� English Breakfast r�v�le toute l''�l�gance d''un authentique th� noir d''Assam � la saveur cors�e et malt�e. Un th� parfait pour accompagner vos petits-d�jeuners.', 4.4, '/assets/images/english_breakfast.webp', 'https://fr.special-t.com/fr/8/capsules-the/english-breakfast-the-noir.html'),
('Red Romance', 'Une infusion fruit�e biologique aux saveurs gourmandes de fraise, de framboise et de cynorrhodon sur un fond chaud vanill�.', 4.4, '/assets/images/red_romance.webp', 'https://fr.special-t.com/fr/8/capsules-the/red-romance-infusion-biologique-aromatisee.html'),
('Mint Marrakech Style', 'Une cr�ation authentique o� se m�lent les notes fum�es du th� vert Gunpowder, la fra�cheur de la menthe douce et la subtilit� des �pices h�rit�e de la tradition marocaine.', 4.4, '/assets/images/mint_marrakech_style.webp', 'https://fr.special-t.com/fr/8/capsules-the/mint-marrakech-style-the-vert-aromatise.html'),
('Good Morning Sunshine', 'Un m�lange ensoleill� de Darjeeling, Assam et Ceylan aux fragrances fruit�es, malt�es et florales. Le th� Good Morning Sunshine est votre meilleur ami au petit-d�jeuner.', 4.4, '/assets/images/good_morning_sunshine.webp', 'https://fr.special-t.com/fr/8/capsules-the/good-morning-sunshine-the-noir.html'),
('Blueberry Muffin', 'Une cr�ation exclusive mariant des effluves fruit�s et gourmands de muffins aux saveurs raffin�es et d�licatement malt�es des th�s d''Assam et de Ceylan.', 4.4, '/assets/images/blueberry_muffin.webp', 'https://fr.special-t.com/fr/8/capsules-the/blueberry-muffin-the-noir-aromatise.html'),
('Ice Mint', 'L''infusion biologique Ice Mint procure une sensation de fra�cheur apport�e par des feuilles de menthe revigorante. Un plaisir simple et intense � d�guster � tout moment.', 4.4, '/assets/images/ice_mint.webp', 'https://fr.special-t.com/fr/8/capsules-the/ice-mint-infusion-biologique-aromatisee.html'),
('Aquarosa', 'Sous sa belle robe rose rougeoyante, cette infusion d�hibiscus inspir�e du Karkad� cache de d�licates notes de fruits rouges et de baies noires. Sans th�ine, AquaRosa se d�guste glac�e ou chaude, � tout moment.', 4.9, '/assets/images/aquarosa.webp', 'https://fr.special-t.com/fr/8/capsules-the/aquarosa-kusmi-infusion-aromatisee.html'),
('Exotic Boost', 'Tonus au rendez-vous avec ce th� vert Bien-Etre BIO. Exotic Boost allie la fra�cheur de la mangue et de l�ananas aux vertus stimulantes de l�ac�rola, source de vitamine C, reconnue pour r�duire la fatigue.', 4.4, '/assets/images/exotic_boost.webp', 'https://fr.special-t.com/fr/8/capsules-the/exotic-boost-the-vert-aromatise-bienetre-bio.html'),
('Pink Pamplemousse', 'Une vague de fra�cheur intense et stimulante aux accents acidul�s de pamplemousse. D�gustez cette cr�ation exclusive biologique pour un plaisir rafraichissant.', 4.4, '/assets/images/pink_pamplemousse.webp', 'https://fr.special-t.com/fr/8/capsules-the/pink-pamplemousse-infusion-biologique-aromatisee.html'),
('Earl Grey Lime', 'Earl Grey Lime : un th� noir Earl Grey unique, mariant les traditionnelles essences de bergamote � la saveur acidul�e du citron vert et aux accents fruit�s du th� noir de Ceylan.', 4.4, '/assets/images/earl_grey_lime.webp', 'https://fr.special-t.com/fr/8/capsules-the/earl-grey-lime-the-noir-aromatise.html'),
('Jasmin Flowers', 'Un prestigieux th� vert Chung Hao parfum� avec des fleurs de jasmin fra�chement cueillies. Laissez-vous transporter par le bouquet floral du th� Jasmine Flowers.', 4.4, '/assets/images/jasmin_flowers.webp', 'https://fr.special-t.com/fr/8/capsules-the/jasmine-flowers-the-vert-aromatise.html'),
('Happy Fruity', 'Cette infusion biologique promet bien-�tre et bonne humeur avec ses notes de superfruits, connus pour �tre riches en vitamines et antioxydants � l��tat naturel.', 4.4, '/assets/images/happy_fruity.webp', 'https://fr.special-t.com/fr/8/capsules-the/happy-fruity-infusion-aromatisee-bienetre-bio.html'),
('Tropical Passion', 'Le th� noir parfum� Tropical Passion associe des fragrances de mangue, d''ananas et de fruit de la passion � un d�licieux th� noir de Ceylan. Un go�t venu tout droit du Sri Lanka.', 4.4, '/assets/images/tropical_passion.webp', 'https://fr.special-t.com/fr/8/capsules-the/tropical-passion-the-noir-aromatise.html'),
('Red Fruits Delight', 'Un harmonieux m�lange de th�s noirs venant de Ceylan et Keemun, associ� � des fragrances troublantes de framboise et de cerise. Un th� gourmand de l''apr�s-midi.', 4.4, '/assets/images/red_fruits_delight.webp', 'https://fr.special-t.com/fr/8/capsules-the/red-fruits-delight-the-noir-aromatise.html'),
('Rooibos Orange', 'Un d�licieux et exotique Rooibos BIO d''Afrique du Sud associ� � de savoureuses �corces d''orange. Laissez-vous emporter pour un safari sensoriel avec cette boisson sans th�ine.', 4.4, '/assets/images/rooibos_orange.webp', 'https://fr.special-t.com/fr/8/capsules-the/rooibos-orange-rooibos-bio.html'),
('Darjeeling', 'Un th� noir Darjeeling de qualit� exceptionnelle d�voilant des notes de muscat et de miel typiques de la r�colte d''�t�. S�lectionn� dans les prestigieux jardins de la r�gion de Darjeeling.', 4.4, '/assets/images/darjeeling.webp', 'https://fr.special-t.com/fr/8/capsules-the/darjeeling-the-noir-bio.html'),
('Ceylon', 'Ce Ceylon de grande qualit� provient du jardin Biologique Idulgashinna, au Sri Lanka. Gr�ce � sa cueillette fine, o� seules les meilleures feuilles de th� (Flowery Orange Pekoe) sont s�lectionn�es, ce th� noir offre un bouquet riche et rafraichissant.', 4.4, '/assets/images/ceylon.webp', 'https://fr.special-t.com/fr/8/capsules-the/ceylon-the-noir-bio.html'),
('After Meal', 'Une infusion aromatis�e en toute l�g�ret� aux saveurs d�licates de fenouil et d''anis. La douce promesse d''un bon moment apr�s le repas.', 4.4, '/assets/images/after_meal.webp', 'https://fr.special-t.com/fr/8/capsules-the/after-meal-infusion-aromatisee-bienetre-bio.html'),
('French Brunch', 'Un th� de petit-d�jeuner de caract�re m�lant Yunnan, Assam et Kenya pour une boisson raffin�e aux notes fum�es, malt�es et cacaot�es.', 4.4, '/assets/images/french_brunch.webp', 'https://fr.special-t.com/fr/8/capsules-the/french-brunch-the-noir.html'),
('Be Cool', 'Une infusion de plantes subtilement relev�e par la r�glisse et la menthe poivr�e. Be Cool offre un moment parfait de d�tente et de douceur avec son go�t fruit� et �pic�.', 4.9, '/assets/images/be_cool.webp', 'https://fr.special-t.com/fr/8/capsules-the/be-cool-kusmi-infusion-aromatisee.html'),
('Good Night Kiss', 'Une apaisante caresse aux accents de m�lisse, de tilleul, de rose et de vanille exquises. Un m�lange pour un pur moment de bien-�tre sans th�ine, id�al en soir�e.', 4.4, '/assets/images/good_night_kiss.webp', 'https://fr.special-t.com/fr/8/capsules-the/good-night-kiss-infusion-bienetre-bio.html'),
('Prince Vladimir', 'M�lange cr�� en 1888 en hommage au Prince Vladimir Ier. Ses ar�mes de vanille et d�orange, associ�s aux notes �pic�es font de cet Earl Grey une r�f�rence de la maison KUSMI TEA.', 4.9, '/assets/images/prince_vladimir.webp', 'https://fr.special-t.com/fr/8/capsules-the/prince-vladimir-kusmi-the-noir-aromatise.html'),
('Japanese Sencha', 'Th� vert biologique de grande qualit� issu de l''�le de Kyushu au Japon, le Japanese Sencha r�v�le d''embl�matiques notes v�g�tales pour la fra�cheur, rehauss�es de notes torr�fi�es.', 4.4, '/assets/images/japanese_sencha.webp', 'https://fr.special-t.com/fr/8/capsules-the/japanese-sencha-the-vert-bio.html'),
('Rooibos Vanilla', 'Un s�duisant Rooibos d�Afrique du Sud velout� mari� � l''opulente vanille Bourbon. Une gourmandise BIO sans th�ine � d�guster � tout moment de la journ�e.', 4.4, '/assets/images/rooibos_vanilla.webp', 'https://fr.special-t.com/fr/8/capsules-the/rooibos-vanilla-rooibos-bio.html'),
('Verbena', 'Avec l''infusion Verbena, savourez le go�t authentique de la nature r�v�l� gr�ce � une s�lection de feuilles de verveine citronnelle. D�gustez toute la d�licatesse et la fra�cheur de cette plante.', 4.4, '/assets/images/verbena.webp', 'https://fr.special-t.com/fr/8/capsules-the/verbena-infusion-bio.html'),
('Anastasia', 'Succombez pour le fameux go�t russe de la maison KUSMI TEA avec Anastasia, une cr�ation inspir�e par la grande duchesse. Ce l�gendaire Earl Grey marie th� noir, bergamote, citron et notes de fleur d�oranger. Cette recette historique de KUSMI TEA est gard�e secr�te depuis sa cr�ation � Saint-P�tersbourg il y a plus de cent ans.', 4.9, '/assets/images/anastasia.webp', 'https://fr.special-t.com/fr/8/capsules-the/anastasia-kusmi-the-noir-aromatise.html'),
('Earl Grey', 'Unique m�lange de Keemun et Ceylan parfum� aux �corces de bergamote venues directement de Calabre en Italie, ce th� noir Earl Grey est synonyme d''escapade � tout moment de la journ�e.', 4.4, '/assets/images/earl_grey.webp', 'https://fr.special-t.com/fr/8/capsules-the/earl-grey-the-noir-aromatise.html'),
('Detox', 'Gr�ce aux vertus des plantes, et notamment du pissenlit, recherch� pour ses bienfaits diur�tiques, notre nouvelle infusion biologique vous offre un moment D�tox.', 4.4, '/assets/images/detox.webp', 'https://fr.special-t.com/fr/8/capsules-the/detox-infusion-bienetre-bio.html'),
('Lemon & Ginger', 'Un th� vert rafra�chissant agr�ment� d''un zeste de citron et de gingembre pour une exp�rience in�dite. Un moment unique qui reconnecte le corps et l''esprit.', 4.4, '/assets/images/lemon_ginger.webp', 'https://fr.special-t.com/fr/8/capsules-the/lemon-ginger-the-vert-aromatise.html'),
('Caramel Gourmand', 'Un irr�sistible parfum de caramel se m�le � ce m�lange de th�s noirs, caract�ris� par l''intensit� de l''Assam et la finesse du Ceylan. Un sublime plaisir pour chaque apr�s-midi.', 4.4, '/assets/images/caramel_gourmand.webp', 'https://fr.special-t.com/fr/8/capsules-the/caramel-gourmand-the-noir-aromatise.html'),
('Mandarin Peach', 'Le Mandarin Peach est un m�lange �quilibr� de deux grands th�s verts chinois Chun Mee et Sencha, associ� � la douceur de la mandarine et de la p�che et rehauss� d''une pointe de gingembre.', 4.4, '/assets/images/mandarin_peach.webp', 'https://fr.special-t.com/fr/8/capsules-the/mandarin-peach-the-vert-aromatise.html'),
('Oolong Fujian', 'Un d�licat Oolong Ti Kuan Yin de la r�gion du Fujian en Chine, compos� de feuilles enti�res roul�es � la main lib�rant des fragrances v�g�tales, fruit�es et biscuit�es.', 4.4, '/assets/images/oolong_fujian.webp', 'https://fr.special-t.com/fr/8/capsules-the/oolong-fujian-the-bleu.html');

INSERT INTO users (username_user, password_user, firstname_user, lastname_user, email_user) VALUES
('root', 'ab5fab9d8241e2ee803265b86753f2e5146c7ddc', 'root', 'root', '***'); /*mdp (sha1): genetec */