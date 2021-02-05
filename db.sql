PRAGMA foreign_keys = ON;
.headers on
.mode columns
CREATE TABLE journalist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    country TEXT NOT NULL,
    supervisor INTEGER REFERENCES journalist,
    password TEXT NOT NULL
);
CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT NOT NULL UNIQUE
);
CREATE TABLE news (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    writer INTEGER NOT NULL REFERENCES journalist,
    editor INTEGER NOT NULL REFERENCES journalist,
    state TEXT NOT NULL CHECK(state="notpublished" OR state="published" OR state="deleted"),
    createdAt DATE NOT NULL, /*created at*/
    updatedAt DATE NOT NULL CHECK(updatedAt >= createdAt), /*last update*/
    content TEXT NOT NULL
);
CREATE TABLE newsCategory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    newsId INTEGER NOT NULL REFERENCES news,
    categoryId INTEGER NOT NULL REFERENCES category
);
CREATE TABLE images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    path TEXT NOT NULL UNIQUE,
    newsId INTEGER NOT NULL REFERENCES news
);


INSERT INTO "category" VALUES(1,'Breaking News');
INSERT INTO "category" VALUES(2,'Colleges and Universities');
INSERT INTO "category" VALUES(3,'Current Events');
INSERT INTO "category" VALUES(4,'Environmental');
INSERT INTO "category" VALUES(5,'Government');
INSERT INTO "category" VALUES(6,'Magazines');
INSERT INTO "category" VALUES(7,'Media');
INSERT INTO "category" VALUES(8,'Newspapers');
INSERT INTO "category" VALUES(9,'Politics');
INSERT INTO "category" VALUES(10,'Regional News');
INSERT INTO "category" VALUES(11,'Religion-and-Spirituality');
INSERT INTO "category" VALUES(12,'Sports');
INSERT INTO "category" VALUES(13,'Technology');
INSERT INTO "category" VALUES(14,'Traffic & Roads');
INSERT INTO "category" VALUES(15,'Weather');

INSERT INTO "journalist" VALUES(1,'Curae@loremvitae.co.uk','Desirae','Patton','Denmark',NULL, 'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(2,'Ut@aliquameu.org','Roth','Conley','Portugal',NULL, 'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(3,'quis@incursus.ca','Lysandra','Bailey','Spain',NULL, 'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(4,'pellentesque.eget.dictum@rutrumFuscedolor.co.uk','Fatima','Sargent','Ethiopia',NULL,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(5,'vel.arcu.eu@molestie.com','Kennan','Sellers','Lithuania',NULL,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(6,'fringilla@velitSed.co.uk','Mufutau','Riley','Portugal',2,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(7,'Phasellus.elit@urnajustofaucibus.net','Leroy','Hyde','Denmark',5,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(8,'Aliquam.rutrum.lorem@felis.net','Fatima','Ellison','Sierra Leone',1,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(9,'pede@posuerevulputatelacus.co.uk','Miriam','Gross','Philipines',5,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
INSERT INTO "journalist" VALUES(10,'aptent.taciti.sociosqu@sociisnatoque.net','Kirsten','Morrison','Sierra Leone',2,'a3d7af6adc08605295561fe10a1ea4c9ad93fd76');
--id , writer , editor
INSERT INTO "news" VALUES(1, 8, 3, 'published', '2015/02/13', '2015/02/19', 'libero mauris, aliquam eu, accumsan sed');
INSERT INTO "news" VALUES(2, 9, 9, 'published', '2015/02/15', '2016/03/09', 'facilisis vitae, orci. Phasellus dapibus quam quis diam.');
INSERT INTO "news" VALUES(3, 8, 9, 'published', '2015/04/12', '2015/04/21', 'Pellentesque habitant morbi tristique senectus');
INSERT INTO "news" VALUES(4, 8, 1, 'notpublished', '2015/03/12', '2015/03/12', 'et netus et malesuada fames ac turpis egestas.');
INSERT INTO "news" VALUES(5, 6, 5, 'deleted', '2015/03/12', '2015/03/12', 'Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus.');
INSERT INTO "news" VALUES(6, 4, 1, 'published', '2015/04/12', '2015/04/16', 'Integer mollis. Integer tincidunt aliquam arcu.');
INSERT INTO "news" VALUES(7, 8, 1, 'notpublished', '2015/04/10', '2015/05/01', 'Aliquam ultrices iaculis odio. Nam interdum enim non nisi.');
INSERT INTO "news" VALUES(8, 6, 5, 'deleted', '2015/02/11', '2015/02/11', 'Aenean eget metus. In nec orci. Donec nibh.');
INSERT INTO "news" VALUES(9, 7, 3, 'published', '2015/04/24', '2015/04/25', 'Quisque nonummy ipsum non arcu. Vivamus sit amet risus.');
INSERT INTO "news" VALUES(10, 4, 1, 'deleted', '2015/04/02', '2015/05/21', 'Donec egestas. Aliquam nec enim. Nunc ut erat.');

INSERT INTO "images" VALUES(1,'/var/www/html/images/682931511.png',9);
INSERT INTO "images" VALUES(2,'/var/www/html/images/647030763.jpeg',2);
INSERT INTO "images" VALUES(3,'/var/www/html/images/247146358.png',4);
INSERT INTO "images" VALUES(4,'/var/www/html/images/430416241.jpg',3);
INSERT INTO "images" VALUES(5,'/var/www/html/images/413217045.gif',3);
INSERT INTO "images" VALUES(6,'/var/www/html/images/560930440.jpeg',1);
INSERT INTO "images" VALUES(7,'/var/www/html/images/630458348.png',7);
INSERT INTO "images" VALUES(8,'/var/www/html/images/34253633.jpg',8);
INSERT INTO "images" VALUES(9,'/var/www/html/images/999031302.gif',1);
INSERT INTO "images" VALUES(10,'/var/www/html/images/715655849.jpeg',9);

INSERT INTO "newsCategory" VALUES(1,1,7);
INSERT INTO "newsCategory" VALUES(2,4,5);
INSERT INTO "newsCategory" VALUES(3,5,1);
INSERT INTO "newsCategory" VALUES(4,5,6);
INSERT INTO "newsCategory" VALUES(5,3,4);
INSERT INTO "newsCategory" VALUES(6,9,12);
INSERT INTO "newsCategory" VALUES(7,7,14);
INSERT INTO "newsCategory" VALUES(8,7,4);
INSERT INTO "newsCategory" VALUES(9,1,8);
INSERT INTO "newsCategory" VALUES(10,3,2);
