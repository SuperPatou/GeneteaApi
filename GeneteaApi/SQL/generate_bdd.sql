/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/
DROP DATABASE Genetea;
GO

CREATE DATABASE Genetea;
GO
USE Genetea;

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


CREATE TABLE teas(
	ID_tea           INT IDENTITY (1,1) NOT NULL ,
	name_tea         VARCHAR (100) NOT NULL ,
	price_tea        FLOAT  NOT NULL ,
	image_path_tea   VARCHAR (1000) NOT NULL ,
	link_page_tea    VARCHAR (1000) NOT NULL  ,
	CONSTRAINT teas_PK PRIMARY KEY (ID_tea)
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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


CREATE PROCEDURE [dbo].[DeleteTea] 
	@ID_tea int
AS   
    SET NOCOUNT ON;  
    DELETE
	FROM teas
	WHERE ID_tea = @ID_tea
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTea] 
	@ID_tea int
AS   
    SET NOCOUNT ON;  
    SELECT ID_tea, name_tea, price_tea, image_path_tea, link_page_tea
    FROM teas
	WHERE ID_tea = @ID_tea
GO
/****** Object:  StoredProcedure [dbo].[GetTeas]    Script Date: 13/06/2022 09:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







INSERT INTO teas (name_tea, price_tea, image_path_tea, link_page_tea) VALUES
('Peach & Apricot dream', 4.4, '/assets/images/peach_apricot_dream.webp', 'https://fr.special-t.com/fr/8/capsules-the/peach-apricot-dream-the-blanc-biologique-aromatise.html'),
('Intense Mint', 4.4, '/assets/images/intense_mint.webp', 'https://fr.special-t.com/fr/8/capsules-the/intense-mint-the-vert-aromatise.html'),
('Lemon Sorbet', 4.4, '/assets/images/lemon_sorbet.webp', 'https://fr.special-t.com/fr/8/capsules-the/lemon-sorbet-infusion-biologique-aromatisee.html'),
('English Breakfast', 4.4, '/assets/images/english_breakfast.webp', 'https://fr.special-t.com/fr/8/capsules-the/english-breakfast-the-noir.html'),
('Red Romance', 4.4, '/assets/images/red_romance.webp', 'https://fr.special-t.com/fr/8/capsules-the/red-romance-infusion-biologique-aromatisee.html'),
('Mint Marrakech Style', 4.4, '/assets/images/mint_marrakech_style.webp', 'https://fr.special-t.com/fr/8/capsules-the/mint-marrakech-style-the-vert-aromatise.html'),
('Good Morning Sunshine', 4.4, '/assets/images/good_morning_sunshine.webp', 'https://fr.special-t.com/fr/8/capsules-the/good-morning-sunshine-the-noir.html'),
('Blueberry Muffin', 4.4, '/assets/images/blueberry_muffin.webp', 'https://fr.special-t.com/fr/8/capsules-the/blueberry-muffin-the-noir-aromatise.html'),
('Ice Mint', 4.4, '/assets/images/ice_mint.webp', 'https://fr.special-t.com/fr/8/capsules-the/ice-mint-infusion-biologique-aromatisee.html'),
('Aquarosa', 4.9, '/assets/images/aquarosa.webp', 'https://fr.special-t.com/fr/8/capsules-the/aquarosa-kusmi-infusion-aromatisee.html'),
('Exotic Boost', 4.4, '/assets/images/exotic_boost.webp', 'https://fr.special-t.com/fr/8/capsules-the/exotic-boost-the-vert-aromatise-bienetre-bio.html'),
('Pink Pamplemousse', 4.4, '/assets/images/pink_pamplemousse.webp', 'https://fr.special-t.com/fr/8/capsules-the/pink-pamplemousse-infusion-biologique-aromatisee.html'),
('Earl Grey Lime', 4.4, '/assets/images/earl_grey_lime.webp', 'https://fr.special-t.com/fr/8/capsules-the/earl-grey-lime-the-noir-aromatise.html'),
('Jasmin Flowers', 4.4, '/assets/images/jasmin_flowers.webp', 'https://fr.special-t.com/fr/8/capsules-the/jasmine-flowers-the-vert-aromatise.html'),
('Happy Fruity', 4.4, '/assets/images/happy_fruity.webp', 'https://fr.special-t.com/fr/8/capsules-the/happy-fruity-infusion-aromatisee-bienetre-bio.html'),
('Tropical Passion', 4.4, '/assets/images/tropical_passion.webp', 'https://fr.special-t.com/fr/8/capsules-the/tropical-passion-the-noir-aromatise.html'),
('Red Fruits Delight', 4.4, '/assets/images/red_fruits_delight.webp', 'https://fr.special-t.com/fr/8/capsules-the/red-fruits-delight-the-noir-aromatise.html'),
('Rooibos Orange', 4.4, '/assets/images/rooibos_orange.webp', 'https://fr.special-t.com/fr/8/capsules-the/rooibos-orange-rooibos-bio.html'),
('Darjeeling', 4.4, '/assets/images/darjeeling.webp', 'https://fr.special-t.com/fr/8/capsules-the/darjeeling-the-noir-bio.html'),
('Ceylon', 4.4, '/assets/images/ceylon.webp', 'https://fr.special-t.com/fr/8/capsules-the/ceylon-the-noir-bio.html'),
('After Meal', 4.4, '/assets/images/after_meal.webp', 'https://fr.special-t.com/fr/8/capsules-the/after-meal-infusion-aromatisee-bienetre-bio.html'),
('French Brunch', 4.4, '/assets/images/french_brunch.webp', 'https://fr.special-t.com/fr/8/capsules-the/french-brunch-the-noir.html'),
('Be Cool', 4.9, '/assets/images/be_cool.webp', 'https://fr.special-t.com/fr/8/capsules-the/be-cool-kusmi-infusion-aromatisee.html'),
('Good Night Kiss', 4.4, '/assets/images/good_night_kiss.webp', 'https://fr.special-t.com/fr/8/capsules-the/good-night-kiss-infusion-bienetre-bio.html'),
('Prince Vladimir', 4.9, '/assets/images/prince_vladimir.webp', 'https://fr.special-t.com/fr/8/capsules-the/prince-vladimir-kusmi-the-noir-aromatise.html'),
('Japanese Sencha', 4.4, '/assets/images/japanese_sencha.webp', 'https://fr.special-t.com/fr/8/capsules-the/japanese-sencha-the-vert-bio.html'),
('Rooibos Vanilla', 4.4, '/assets/images/rooibos_vanilla.webp', 'https://fr.special-t.com/fr/8/capsules-the/rooibos-vanilla-rooibos-bio.html'),
('Verbena', 4.4, '/assets/images/verbena.webp', 'https://fr.special-t.com/fr/8/capsules-the/verbena-infusion-bio.html'),
('Anastasia', 4.9, '/assets/images/anastasia.webp', 'https://fr.special-t.com/fr/8/capsules-the/anastasia-kusmi-the-noir-aromatise.html'),
('Earl Grey', 4.4, '/assets/images/earl_grey.webp', 'https://fr.special-t.com/fr/8/capsules-the/earl-grey-the-noir-aromatise.html'),
('Detox', 4.4, '/assets/images/detox.webp', 'https://fr.special-t.com/fr/8/capsules-the/detox-infusion-bienetre-bio.html'),
('Lemon & Ginger', 4.4, '/assets/images/lemon_ginger.webp', 'https://fr.special-t.com/fr/8/capsules-the/lemon-ginger-the-vert-aromatise.html'),
('Caramel Gourmand', 4.4, '/assets/images/caramel_gourmand.webp', 'https://fr.special-t.com/fr/8/capsules-the/caramel-gourmand-the-noir-aromatise.html'),
('Mandarin Peach', 4.4, '/assets/images/mandarin_peach.webp', 'https://fr.special-t.com/fr/8/capsules-the/mandarin-peach-the-vert-aromatise.html'),
('Oolong Fujian', 4.4, '/assets/images/oolong_fujian.webp', 'https://fr.special-t.com/fr/8/capsules-the/oolong-fujian-the-bleu.html');