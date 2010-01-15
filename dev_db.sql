PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20090309090721');
INSERT INTO "schema_migrations" VALUES('20090311100908');
INSERT INTO "schema_migrations" VALUES('20090318083346');
INSERT INTO "schema_migrations" VALUES('20090318094754');
INSERT INTO "schema_migrations" VALUES('20090319100747');
INSERT INTO "schema_migrations" VALUES('20090320100614');
INSERT INTO "schema_migrations" VALUES('20090320100703');
INSERT INTO "schema_migrations" VALUES('20090323125300');
INSERT INTO "schema_migrations" VALUES('20090323125818');
INSERT INTO "schema_migrations" VALUES('20090331083320');
INSERT INTO "schema_migrations" VALUES('20090331084604');
INSERT INTO "schema_migrations" VALUES('20090409150200');
INSERT INTO "schema_migrations" VALUES('20090507154113');
INSERT INTO "schema_migrations" VALUES('20090729014005');
INSERT INTO "schema_migrations" VALUES('20090802120237');
INSERT INTO "schema_migrations" VALUES('20090802120328');
INSERT INTO "schema_migrations" VALUES('20090804130825');
INSERT INTO "schema_migrations" VALUES('20090813122439');
INSERT INTO "schema_migrations" VALUES('20090813132159');
INSERT INTO "schema_migrations" VALUES('20090814061620');
INSERT INTO "schema_migrations" VALUES('20090816055306');
INSERT INTO "schema_migrations" VALUES('20090831100156');
INSERT INTO "schema_migrations" VALUES('20090903143423');
INSERT INTO "schema_migrations" VALUES('20090904094442');
INSERT INTO "schema_migrations" VALUES('20090904094519');
INSERT INTO "schema_migrations" VALUES('20090911121005');
INSERT INTO "schema_migrations" VALUES('20091128131707');
INSERT INTO "schema_migrations" VALUES('20091128132016');
INSERT INTO "schema_migrations" VALUES('20090915080419');
INSERT INTO "schema_migrations" VALUES('20091203082245');
CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "permalink" varchar(255), "body" text, "created_at" datetime, "updated_at" datetime);
INSERT INTO "pages" VALUES(1,'Impressum','about','*Wuxing* ist eine Online Datenbank zur Traditionellen Chinesischen Ern√§hrungslehre.
Wuxing wurde von Dominik Wei-Fieg entwickelt und wird derzeit von ihm und einigen weiteren Editoren gepflegt.


<div xmlns:cc="http://creativecommons.org/ns#" about="http://www.flickr.com/photos/wadem/3232906059/">Das im QiFood Logo verwendete Enso-Zeichen stammt von Wadem: <a rel="cc:attributionURL" href="http://www.flickr.com/photos/wadem/"> http://www.flickr.com/photos/wadem/</a> / <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.0/">CC BY-SA 2.0</a></div> ','2009-03-18 10:21:20','2009-09-07 09:16:47');
INSERT INTO "pages" VALUES(2,'Kontakt','contact','Dominik Wei-Fieg
Astrid-Lindgren-Str. 13
79100 Freiburg i. Br.

<%= mail_to info@wuxing.info %>

','2009-03-18 11:17:40','2009-03-18 11:24:00');
INSERT INTO "pages" VALUES(3,'Weiteres','more','Mehr √ºber die Chinesische Ern√§hrungslehre','2009-06-23 12:54:06','2009-06-23 12:54:06');
INSERT INTO "pages" VALUES(4,'Home','home','QiFood','2009-08-18 05:29:11','2009-08-18 05:29:11');
INSERT INTO "pages" VALUES(5,'Unterst√ºtzen','support','Unters&uuml;tzen','2009-08-18 05:33:28','2009-08-18 06:49:52');
CREATE TABLE "effects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "effects" VALUES(1,'bewegt Blut','2009-03-20 10:13:08','2009-03-20 10:13:08');
INSERT INTO "effects" VALUES(2,'stillt Blutung','2009-03-20 10:13:22','2009-03-20 10:13:22');
INSERT INTO "effects" VALUES(3,'st√§rkt Milz und Niere','2009-03-20 10:14:18','2009-03-20 10:14:18');
INSERT INTO "effects" VALUES(4,'diuretisch','2009-03-20 10:15:00','2009-03-20 10:15:00');
INSERT INTO "effects" VALUES(10,'regt Darm an','2009-03-21 21:23:33','2009-03-21 21:23:33');
CREATE TABLE "properties" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "aliment_id" integer, "effect_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "properties" VALUES(1,2,1,NULL,NULL);
INSERT INTO "properties" VALUES(2,2,2,NULL,NULL);
INSERT INTO "properties" VALUES(5,1,3,'2009-03-23 13:53:05','2009-03-23 13:53:05');
INSERT INTO "properties" VALUES(6,1,4,'2009-03-23 13:53:05','2009-03-23 13:53:05');
CREATE TABLE "aliments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "latin_name" varchar(255), "pinyin" varchar(255), "chinese" varchar(255), "description" text(255), "savor" integer, "savor_tendence" integer, "temperature" integer, "temperature_tendence" integer, "created_at" datetime, "updated_at" datetime, "category_id" integer DEFAULT 14 NOT NULL, "plural_name" varchar(255), "photo_attribution" varchar(512));
INSERT INTO "aliments" VALUES(1,'Hirse','Panicum miliaceum','xiaomi','Â∞èÁ±≥','Hirse',2,NULL,2,3,'2009-03-09 13:04:54','2009-03-19 11:20:27',1,NULL,NULL);
INSERT INTO "aliments" VALUES(4,'Gerste','','','','Gerste ist ein einj√§hriges Gras, das Wuchsh√∂hen von 0,7 bis 1,2 m erreicht. Die Pflanze ist glatt und unbehaart. Der Halm ist aufrecht. Die wechselst√§ndig und zweizeilig (distich) angeordneten Laubbl√§tter sind einfach und parallelnervig. Die flache Blattspreite weist eine L√§nge von 9 bis 25 cm und eine Breite von 0,6 bis 2 cm auf. Morphologisches Erkennungsmerkmal sind die zwei langen, unbewimperten Blatt√∂hrchen der Blattscheide, die den Halm vollst√§ndig umschlie√üt. Das schmale und leicht gez√§hnte Blatth√§utchen (Ligula) ist 1 bis 2 mm lang.
Der √§hrige Bl√ºtenstand besitzt eine flexible, also nicht zerbrechliche Rhachis, darin unterscheidet sie sich von den anderen Hordeum-Arten. Die in Reihen stehenden, ungestielten √Ñhrchen sind alle gleich und fertil. Die √Ñhrchen enthalten meist nur eine (selten zwei) Bl√ºte. Die H√ºllspelze ist lineal-lanzettlich. Die Grannen sind 8 bis 15 cm lang.',2,NULL,2,NULL,'2009-09-11 12:25:16','2009-09-13 11:29:25',1,NULL,'<div xmlns:cc="http://creativecommons.org/ns#" about="http://www.flickr.com/photos/photomek/3616006453/"><a rel="cc:attributionURL" href="http://www.flickr.com/photos/photomek/">http://www.flickr.com/photos/photomek/</a> / <a rel="license" href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a></div>');
INSERT INTO "aliments" VALUES(5,'Dinkel','','','','',2,NULL,2,NULL,'2009-09-13 11:53:53','2009-09-13 11:53:53',1,NULL,'<div xmlns:cc="http://creativecommons.org/ns#" about="http://www.flickr.com/photos/globetrotter1937/3728924960/"><a rel="cc:attributionURL" href="http://www.flickr.com/photos/globetrotter1937/">http://www.flickr.com/photos/globetrotter1937/</a> / <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.0/">CC BY-SA 2.0</a></div>');
CREATE TABLE "elements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "elements" VALUES(1,'Holz','2009-03-23 13:12:42','2009-03-23 13:12:42');
INSERT INTO "elements" VALUES(2,'Feuer','2009-03-23 13:12:42','2009-03-23 13:12:42');
INSERT INTO "elements" VALUES(3,'Erde','2009-03-23 13:12:42','2009-03-23 13:12:42');
INSERT INTO "elements" VALUES(4,'Metall','2009-03-23 13:12:42','2009-03-23 13:12:42');
INSERT INTO "elements" VALUES(5,'Wasser','2009-03-23 13:12:42','2009-03-23 13:12:42');
CREATE TABLE "organs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "yinyang" varchar(255), "time" integer, "element_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "organs" VALUES(1,'Leber','Yin',1,1,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(2,'Gallenblase','Yang',23,1,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(3,'Herz','Yin',11,2,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(4,'D√ºnndarm','Yang',13,2,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(5,'Sanjiao','Yin',21,2,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(6,'Perikard','Yang',19,2,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(7,'Milz','Yin',9,3,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(8,'Magen','Yang',7,3,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(9,'Lunge','Yin',3,4,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(10,'Dickdarm','Yang',5,4,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(11,'Nieren','Yin',17,5,'2009-03-23 13:19:21','2009-03-23 13:19:21');
INSERT INTO "organs" VALUES(12,'Blase','Yang',15,5,'2009-03-23 13:19:21','2009-03-23 13:19:21');
CREATE TABLE "target_organs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "aliment_id" integer, "organ_id" integer);
INSERT INTO "target_organs" VALUES(1,1,7);
INSERT INTO "target_organs" VALUES(2,1,8);
INSERT INTO "target_organs" VALUES(3,1,11);
INSERT INTO "target_organs" VALUES(10,2,2);
INSERT INTO "target_organs" VALUES(11,2,7);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "content" text, "user_id" integer, "commentable_type" varchar(255), "commentable_id" integer, "lang" varchar(255), "published" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime);
INSERT INTO "comments" VALUES(1,'Ein Kommentar','Test Kommentar',1,'Aliment',2,NULL,'f','2009-04-02 10:14:19','2009-04-02 10:14:19');
INSERT INTO "comments" VALUES(2,'Test','Ein hoffentlich publizierter Kommentar',1,'Aliment',2,NULL,'t','2009-04-02 10:21:47','2009-04-02 10:21:47');
INSERT INTO "comments" VALUES(3,'Und noch einer','Test content',1,'Aliment',2,NULL,'t','2009-04-02 10:41:59','2009-04-02 10:41:59');
INSERT INTO "comments" VALUES(4,'Und wieder einer','Test content',1,'Aliment',2,NULL,'t','2009-04-02 10:42:33','2009-04-02 10:42:33');
INSERT INTO "comments" VALUES(5,'Noch mehr kommentare','sudhfiol
alkjha


aslkdhjon aiusdf askhdgflkj h<kjshdfkjhasldkfhlkjh alskdjfhlkajsh dlkjfh lakjsdhf',1,'Aliment',2,NULL,'t','2009-04-02 10:44:35','2009-04-02 10:44:35');
INSERT INTO "comments" VALUES(6,'Noch mehr kommentare','sudhfiol
alkjha


aslkdhjon aiusdf askhdgflkj h<kjshdfkjhasldkfhlkjh alskdjfhlkajsh dlkjfh lakjsdhf',1,'Aliment',2,NULL,'t','2009-04-02 10:47:09','2009-04-02 10:47:09');
INSERT INTO "comments" VALUES(9,'Test','ins
eins
einsdfljh
adkjhf ',1,'Post',2,NULL,'t','2009-08-18 04:07:06','2009-08-18 04:07:06');
INSERT INTO "comments" VALUES(10,'Hello','Hello, World',1,'Post',1,NULL,'t','2009-08-18 06:46:19','2009-08-18 06:46:19');
CREATE TABLE "flags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "flaggable_id" integer, "flaggable_type" varchar(255), "flaggable_user_id" integer, "reason" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "flags" VALUES(10,1,6,'Comment',1,'inappropriate','2009-04-09 14:01:47','2009-04-09 14:01:47');
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "description" text DEFAULT '');
INSERT INTO "categories" VALUES(1,'Getreide','2009-03-19 10:30:29','2009-12-08 09:37:31','Getreide bildet seit dem Neolithikum die Basis der Ern&auml;hrung der Menschen. Auch f&uuml;r die Chinesische Ern&auml;hrungslehre bilden Getreide die Basis einer gesunden Ern&auml;hrung.
Alle Getreidearten sind dem s&uuml;&szlig;em Geschmack, dem Erdelement, und der neutralen Temperatur zugeordnet. Allerdings haben einzelne Getreidearten tendenzen zu anderen Elementen/Geschmack und anderen Temperaturen. Wie die Zuordnung zum Erdelement zeigt, haben Getreide eine die Milz und den Magen st&auml;rkende Wirkung, sie n&auml;hren das Blut und das Qi.
Getreide sollte 2/3 unserer Ern&auml;hrung ausmachen.');
INSERT INTO "categories" VALUES(2,'H√ºlsenfr√ºchte','2009-03-19 10:30:29','2009-03-19 10:30:29','');
INSERT INTO "categories" VALUES(3,'N√ºsse & Samen','2009-03-19 10:30:29','2009-03-19 10:30:29','');
INSERT INTO "categories" VALUES(4,'Gem√ºse','2009-03-19 10:30:29','2009-03-19 10:30:29','');
INSERT INTO "categories" VALUES(5,'Salate','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(6,'Fleisch','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(7,'Fisch & Meeresfr√ºchte','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(8,'Fr√ºchte & Beeren','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(9,'√ñle & Fette','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(10,'Getrocknete Gew√ºrze','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(11,'Frische Kr√§uter','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(12,'S√ºssmittel','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(13,'Milchprodukte','2009-03-19 10:30:30','2009-03-19 10:30:30','');
INSERT INTO "categories" VALUES(14,'Sonstiges','2009-03-19 10:30:30','2009-07-29 06:06:11','');
CREATE TABLE "authorships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "book_id" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "authorships" VALUES(1,1,1,'2009-08-02 13:39:00','2009-08-02 13:39:00');
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "isbn" varchar(255), "language" varchar(255), "created_at" datetime, "updated_at" datetime, "authors" varchar(255));
INSERT INTO "books" VALUES(1,'Healing With Whole Foods: Asian Traditions and Modern Nutrition','Healing With Whole Foods: Asian Traditions and Modern Nutrition','1556434308','de','2009-04-09 15:08:09','2009-08-04 05:39:30',NULL);
CREATE TABLE "profiles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "about" text, "birthday" date, "quote" varchar(255), "user_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "profiles" VALUES(1,'',NULL,'foo',NULL,'2009-08-13 12:31:11','2009-08-13 12:32:02');
INSERT INTO "profiles" VALUES(2,'Erfinder von QiFood.de','1972-11-01','foo',NULL,'2009-08-13 12:32:02','2009-08-13 12:52:56');
INSERT INTO "profiles" VALUES(3,'',NULL,'foo',NULL,'2009-08-13 12:52:56','2009-08-13 12:53:07');
INSERT INTO "profiles" VALUES(4,'Initiator von QiFood','1972-11-01','Foo',1,'2009-08-13 12:53:07','2009-08-13 13:15:29');
INSERT INTO "profiles" VALUES(5,'sdfihj
','1972-11-01','Foo',2,'2009-09-03 15:36:38','2009-09-03 15:36:38');
INSERT INTO "profiles" VALUES(6,'',NULL,'',3,'2009-09-07 07:45:39','2009-09-07 07:45:50');
CREATE TABLE "user_photos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "parent_id" integer, "content_type" varchar(255), "filename" varchar(255), "thumbnail" varchar(255), "size" integer, "width" integer, "height" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "user_photos" VALUES(1,NULL,'image/jpeg','IMG_3552.JPG',NULL,8469,100,75,NULL,'2009-08-13 12:42:57','2009-08-13 12:51:45');
INSERT INTO "user_photos" VALUES(2,1,'image/jpeg','IMG_3552_thumb.JPG','thumb',8466,100,75,NULL,'2009-08-13 12:42:58','2009-08-13 12:51:45');
INSERT INTO "user_photos" VALUES(3,NULL,'image/jpeg','IMG_3547.JPG',NULL,31671,300,225,1,'2009-08-13 12:51:45','2009-08-18 06:51:28');
INSERT INTO "user_photos" VALUES(4,3,'image/jpeg','IMG_3547_thumb.JPG','thumb',9376,100,75,NULL,'2009-08-13 12:51:45','2009-08-18 06:51:28');
CREATE TABLE "favorite_aliments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "aliment_id" integer, "reason" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "friendships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "friend_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "title" varchar(255), "body" text, "permalink" text, "created_at" datetime, "updated_at" datetime);
INSERT INTO "posts" VALUES(1,1,'Der erste Block-Eintrag','Test one
*two* 
three','der-erste-block-eintrag','2009-08-17 05:56:21','2009-08-17 05:56:21');
INSERT INTO "posts" VALUES(2,1,'Der erste Block-Eintrag','error_message_on(object, method, *args)
Returns a string containing the error message attached to the method on the object if one exists. This error message is wrapped in a DIV tag, which can be extended to include a :prepend_text and/or :append_text (to properly explain the error), and a :css_class to style it accordingly. object should either be the name of an instance variable or the actual object. The method can be passed in either as a string or a symbol. As an example, let‚Äòs say you have a model @post that has an error message on the title attribute:
  <%= error_message_on "post", "title" %>
  # => <div class="formError">can''t be empty</div>

  <%= error_message_on @post, :title %>
  # => <div class="formError">can''t be empty</div>

  <%= error_message_on "post", "title",
      :prepend_text => "Title simply ",
      :append_text => " (or it won''t work).",
      :css_class => "inputError" %>
[ show source ]
error_messages_for(*params)
Returns a string with a DIV containing all of the error messages for the objects located as instance variables by the names given. If more than one object is specified, the errors for the objects are displayed in the order that the object names are provided.
This DIV can be tailored by the following options:
:header_tag - Used for the header of the error div (default: "h2").
:id - The id of the error div (default: "errorExplanation").
:class - The class of the error div (default: "errorExplanation").
:object - The object (or array of objects) for which to display errors, if you need to escape the instance variable convention.','der-erste-block-eintrag-','2009-08-17 06:11:59','2009-08-17 06:11:59');
INSERT INTO "posts" VALUES(3,1,'Test',' <a class="plain" href="http://localhost:3000/aliments/1_hirse">Hirse</a>  <a class="plain" href="http://localhost:3000/aliments/1_hirse">Hirse</a>brei
Dies ist ein Blog eintrag ueber <a class="plain" href="http://localhost:3000/aliments/1_hirse">Hirse</a>.','test','2009-08-31 09:48:31','2009-08-31 10:29:09');
INSERT INTO "posts" VALUES(4,2,'Test','Hirse
foo bar woop Dinkel
Test

Gerste','test-','2009-10-29 09:42:59','2009-12-21 08:41:52');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(40), "name" varchar(100) DEFAULT '', "first_name" varchar(100) DEFAULT '', "email" varchar(100), "crypted_password" varchar(120), "password_salt" varchar(120), "created_at" datetime, "updated_at" datetime, "remember_token" varchar(40), "remember_token_expires_at" datetime, "activation_code" varchar(40), "activated_at" datetime, "role" integer DEFAULT 0, "persistence_token" varchar(255), "login_count" integer DEFAULT 0 NOT NULL, "failed_login_count" integer DEFAULT 0 NOT NULL, "last_request_at" datetime, "current_login_at" datetime, "last_login_at" datetime, "current_login_ip" varchar(255), "last_login_ip" varchar(255), "openid_identifier" varchar(255));
INSERT INTO "users" VALUES(1,'dominik','Wei-Fieg','Dominik','dominik.weifieg@gmail.com','85832bf29a8acdeeeca39750a327a111b1508e73','365dd21ad2a0b60649a9a6a9fd457b4ced4bc780','2009-03-18 09:13:42','2009-12-21 08:34:07',NULL,NULL,NULL,'2009-03-18 09:30:18',15,NULL,0,17,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "users" VALUES(2,'dominik1','Wei-Fieg','Dominik','dominik.weifieg+test2@gmail.com','4495de1bec59f60edec903cd6d6e8f39a028abbf971caa7feaf8691be761f8c77cbd02dcc198a962ca4ac966128452b243af95d85208fb55995db31f8ef14fde','HiP1bw4RRomzbY_FzlAY','2009-09-03 15:36:38','2009-12-21 14:08:07',NULL,NULL,NULL,NULL,3,'6c90c8e06d9dfad57b442b197781dbed4322bddb2195115d5d861901d4e25dd4fbe8eed9c9c6330d19b7f847ad3fe2f1be0dce3a1a2677a09fac19035abf38e2',11,0,'2009-12-21 14:08:07','2009-12-21 14:05:57','2009-12-21 08:34:11','127.0.0.1','127.0.0.1',NULL);
INSERT INTO "users" VALUES(3,'dom1001','Wei-Fieg','Dominik','dominik.weifieg4@gmail.com',NULL,NULL,'2009-09-07 07:43:54','2009-12-16 10:33:24',NULL,NULL,NULL,NULL,15,'e7cbfe3c559d00ecdcfa0835beab497a30e29592119286d6466b43024f0c4e4dd5833dc6c6ffc363a2d790805899d0da26dceb0d06db6940a6f49923454df20e',16,0,'2009-12-16 10:33:24','2009-12-15 10:58:36','2009-12-10 13:32:29','127.0.0.1','127.0.0.1','http://dominikweifieg.myopenid.com/');
CREATE TABLE "open_id_authentication_associations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "issued" integer, "lifetime" integer, "handle" varchar(255), "assoc_type" varchar(255), "server_url" blob, "secret" blob);
INSERT INTO "open_id_authentication_associations" VALUES(4,1260260072,1209600,'{HMAC-SHA1}{4b1e0ae8}{UGPpvw==}','HMAC-SHA1','http://www.myopenid.com/server','û1Rﬁy¡2°Âj ¢%00ÁbÄß√T');
INSERT INTO "open_id_authentication_associations" VALUES(5,1260960195,1209600,'{HMAC-SHA1}{4b28b9c3}{AyqR3g==}','HMAC-SHA1','http://openid-provider.appspot.com/Dominik.WeiFieg%2540googlemail.com','ﬂ€‰Aê0sp#Û(o2≤aÀ"H');
INSERT INTO "open_id_authentication_associations" VALUES(6,1260960251,1209600,'{HMAC-SHA1}{4b28b9fb}{F9tXug==}','HMAC-SHA1','http://openid-provider.appspot.com/Dominik.WeiFieg%2540googlemail.com','+≈%00gí=J‡=ˆà√ÊÁÆ\“”„≤');
INSERT INTO "open_id_authentication_associations" VALUES(7,1260960307,1209600,'{HMAC-SHA1}{4b28ba33}{iXwP6A==}','HMAC-SHA1','http://openid-provider.appspot.com/Dominik.WeiFieg%2540googlemail.com','tl6ùø∞©∆¨¡¡a3≠ŸüÂâ');
CREATE TABLE "open_id_authentication_nonces" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "timestamp" integer NOT NULL, "server_url" varchar(255), "salt" varchar(255) NOT NULL);
INSERT INTO "open_id_authentication_nonces" VALUES(1,1252309345,'http://www.myopenid.com/server','KlyERF');
INSERT INTO "open_id_authentication_nonces" VALUES(2,1252309434,'http://www.myopenid.com/server','8lv3s6');
INSERT INTO "open_id_authentication_nonces" VALUES(3,1252313317,'http://www.myopenid.com/server','ZD7pN5');
INSERT INTO "open_id_authentication_nonces" VALUES(4,1252671523,'http://www.myopenid.com/server','3yKKGm');
INSERT INTO "open_id_authentication_nonces" VALUES(5,1253265321,'http://www.myopenid.com/server','croJp4');
INSERT INTO "open_id_authentication_nonces" VALUES(6,1253778402,'http://www.myopenid.com/server','Puf8x6');
INSERT INTO "open_id_authentication_nonces" VALUES(7,1258465709,'http://www.myopenid.com/server','IeaKMl');
INSERT INTO "open_id_authentication_nonces" VALUES(8,1259499504,'http://www.myopenid.com/server','PozsZP');
INSERT INTO "open_id_authentication_nonces" VALUES(9,1259570886,'http://www.myopenid.com/server','Enbhem');
INSERT INTO "open_id_authentication_nonces" VALUES(10,1259572746,'http://www.myopenid.com/server','dVEXgf');
INSERT INTO "open_id_authentication_nonces" VALUES(11,1259656039,'http://www.myopenid.com/server','2r8Ard');
INSERT INTO "open_id_authentication_nonces" VALUES(12,1259662415,'http://www.myopenid.com/server','67P9pv');
INSERT INTO "open_id_authentication_nonces" VALUES(13,1259672455,'http://www.myopenid.com/server','vnLvG7');
INSERT INTO "open_id_authentication_nonces" VALUES(14,1259674796,'http://www.myopenid.com/server','SyI0Vx');
INSERT INTO "open_id_authentication_nonces" VALUES(15,1260260073,'http://www.myopenid.com/server','IIutK2');
INSERT INTO "open_id_authentication_nonces" VALUES(16,1260451948,'http://www.myopenid.com/server','GF5D7B');
INSERT INTO "open_id_authentication_nonces" VALUES(17,1260874714,'http://www.myopenid.com/server','YXU1dZ');
CREATE TABLE "aliment_photos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "parent_id" integer, "aliment_id" integer, "content_type" varchar(255), "filename" varchar(255), "thumbnail" varchar(255), "size" integer, "width" integer, "height" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "aliment_photos" VALUES(1,NULL,2,'image/jpeg','dscn3782.jpg',NULL,30480,267,200,'2009-05-07 15:53:26','2009-07-26 12:39:35');
INSERT INTO "aliment_photos" VALUES(2,1,NULL,'image/jpeg','dscn3782_thumb.jpg','thumb',7583,100,75,'2009-05-07 15:53:26','2009-07-26 12:39:35');
INSERT INTO "aliment_photos" VALUES(3,NULL,1,'image/jpeg','dscn3783.jpg',NULL,818218,1024,768,'2009-05-07 16:11:05','2009-05-07 16:11:05');
INSERT INTO "aliment_photos" VALUES(4,3,NULL,'image/jpeg','dscn3783_thumb.jpg','thumb',7696,100,75,'2009-05-07 16:11:05','2009-05-07 16:11:05');
INSERT INTO "aliment_photos" VALUES(5,NULL,3,'image/jpeg','3616006453_cd5ee05763_o.jpg',NULL,59944,334,500,'2009-09-11 12:20:58','2009-09-11 12:20:58');
INSERT INTO "aliment_photos" VALUES(6,5,NULL,'image/jpeg','3616006453_cd5ee05763_o_thumb.jpg','thumb',8203,67,100,'2009-09-11 12:20:58','2009-09-11 12:20:58');
INSERT INTO "aliment_photos" VALUES(7,NULL,4,'image/jpeg','3616006453_cd5ee05763_o.jpg',NULL,59944,334,500,'2009-09-11 12:25:16','2009-09-13 11:44:29');
INSERT INTO "aliment_photos" VALUES(8,7,NULL,'image/jpeg','3616006453_cd5ee05763_o_thumb.jpg','thumb',8203,67,100,'2009-09-11 12:25:16','2009-09-13 11:44:29');
INSERT INTO "aliment_photos" VALUES(9,NULL,5,'image/jpeg','3728924960_25e06c2f57_b.jpg',NULL,238198,751,500,'2009-09-13 11:53:53','2009-09-13 11:53:53');
INSERT INTO "aliment_photos" VALUES(10,9,NULL,'image/jpeg','3728924960_25e06c2f57_b_thumb.jpg','thumb',8976,100,67,'2009-09-13 11:53:53','2009-09-13 11:53:53');
CREATE TABLE "consultations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "pro" boolean, "pro_identifier" varchar(255), "website" varchar(255), "email" varchar(255), "phone" varchar(255), "fax" varchar(255), "user_id" integer, "created_at" datetime, "updated_at" datetime, pro_start_day int);
INSERT INTO "consultations" VALUES(1,'QiFood','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mollis arcu non leo mollis ultrices. Nulla tempus nunc nec dui ullamcorper porttitor ultrices velit iaculis. Donec in sem a augue sagittis malesuada sit amet eget ligula. Donec in purus non velit faucibus commodo ac non dui. Nullam eu enim sem. Aenean placerat, eros sed faucibus aliquam, tellus orci consequat dolor, sed convallis turpis elit nec risus. Nunc bibendum egestas felis, nec tempus augue convallis nec. Cras accumsan nulla arcu, eget auctor nibh. Praesent tellus risus, auctor in molestie tincidunt, pretium a nisl. Curabitur dapibus aliquam nibh, tincidunt imperdiet massa molestie eget. In eget ipsum enim, sed malesuada purus.

Donec tristique mauris at ipsum pharetra placerat. Nunc sed lorem at mauris dignissim ornare ac aliquet felis. Curabitur id nisl quis quam commodo facilisis id vehicula turpis. Integer luctus, enim vitae sagittis elementum, est turpis congue erat, non vehicula nulla quam in turpis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis faucibus lectus eu orci accumsan euismod. Donec mollis dapibus libero, eu pretium enim pulvinar non. Phasellus sit amet lobortis turpis. Nam cursus tincidunt ultrices. Proin est turpis, iaculis non pharetra quis, sagittis et ipsum.

Proin vitae eleifend massa. Nam purus risus, auctor mattis sagittis sed, pellentesque vel justo. Fusce mollis magna eu lectus sollicitudin id pharetra ligula euismod. Sed urna leo, congue quis ultrices non, vulputate vel dolor. Aliquam augue sem, facilisis eu imperdiet in, mattis ut urna. In hac habitasse platea dictumst. Morbi mi erat, iaculis vel mattis eu, pellentesque sed nibh. Phasellus sed nulla lacus, vel sodales nibh. Cras a risus ut est tempor hendrerit. Donec mollis volutpat mattis.

Nulla eu sagittis mauris. Quisque a magna nec augue interdum lacinia eget sit amet mi. Morbi tempor, arcu sed posuere placerat, justo risus volutpat magna, in molestie massa neque at enim. Etiam ligula turpis, blandit ac viverra ac, ultrices vitae ligula. Integer dictum, erat vitae varius venenatis, tortor dolor elementum lacus, eget commodo sem purus eget risus. Quisque vulputate porta malesuada. Phasellus ullamcorper quam nec erat lacinia in vestibulum libero facilisis. Ut vehicula ultrices mollis. Praesent porttitor, tortor vitae fringilla scelerisque, nisi urna iaculis nisi, id lacinia mi velit et libero. Ut in sem diam, non blandit nibh.

Pellentesque sit amet aliquam neque. Etiam facilisis, tortor sit amet laoreet ornare, tellus ipsum blandit enim, eleifend dignissim ligula enim et leo. Sed dapibus, dolor vitae gravida ultricies, risus odio tincidunt sapien, eget faucibus odio nibh at sapien. Etiam lacus diam, laoreet nec convallis a, tincidunt quis sem. Etiam tellus justo, faucibus nec pretium ac, varius eu eros. Fusce et vulputate metus. Aliquam eget nulla rhoncus erat fringilla pulvinar non eget leo. Fusce quis tempus neque. Nulla facilisi. Morbi consequat fermentum ante. Donec venenatis libero felis. Sed id leo est. Duis ullamcorper ultrices lacus. Donec malesuada felis ut neque condimentum id imperdiet nisl faucibus. Sed est massa, convallis ac suscipit sit amet, hendrerit sed risus. Aliquam id leo magna, id dignissim lorem. Mauris posuere sem at enim tristique volutpat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','t',NULL,'http://www.qifood.eu','info@qifood.eu','0761 7663324','0761 7663323',3,'2009-11-30 10:47:11','2009-12-01 09:23:22',NULL);
INSERT INTO "consultations" VALUES(4,'Test','test','t','2_2048857884','test.de','support@test.de','','',2,'2009-12-01 13:40:48','2009-12-01 13:40:48',1);
CREATE TABLE "consultation_photos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "parent_id" integer, "aliment_id" integer, "content_type" varchar(255), "filename" varchar(255), "thumbnail" varchar(255), "size" integer, "width" integer, "height" integer, "title" varchar(255), "created_at" datetime, "updated_at" datetime, consultation_id int default 1);
INSERT INTO "consultation_photos" VALUES(1,NULL,NULL,'image/jpeg','IMG_0330.jpg',NULL,56792,NULL,NULL,'Eins','2009-11-30 10:47:11','2009-11-30 10:47:11',1);
INSERT INTO "consultation_photos" VALUES(2,NULL,NULL,'image/jpeg','IMG_0343_1.jpg',NULL,65366,NULL,NULL,'Zwei','2009-11-30 10:47:11','2009-11-30 10:47:11',1);
INSERT INTO "consultation_photos" VALUES(3,NULL,NULL,'image/jpeg','IMG_0348.jpg',NULL,59288,NULL,NULL,'Drei','2009-11-30 10:47:11','2009-11-30 10:47:11',1);
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "street" varchar(255), "number" varchar(255), "additional1" varchar(255), "additional2" varchar(255), "zip" varchar(255), "city" varchar(255), "state" varchar(255), "country" varchar(255) DEFAULT 'de', "locatable_id" integer, "locatable_type" varchar(255), "lat" float, "lng" float, "created_at" datetime, "updated_at" datetime);
INSERT INTO "locations" VALUES(1,'Astrid-Lindgren-Strasse','13','','','79100','Freiburg i. Br.','BW','Deutschland',1,'Consultation',47.977508,7.820292,'2009-11-30 10:47:11','2009-11-30 10:47:11');
INSERT INTO "locations" VALUES(2,'Rheinbergstrasse','11','','','76187','Karlsruhe','','Deutschland',2,'Consultation',49.034997,8.333516,'2009-12-01 10:01:29','2009-12-01 10:01:29');
INSERT INTO "locations" VALUES(3,'Nebeniusstrasse','47','','','76137','Karlruhe','','Deutschland',3,'User',39.145271,-75.418762,'2009-12-01 10:23:44','2009-12-01 10:29:13');
INSERT INTO "locations" VALUES(4,'Rheinbergstrasse','11','','','76187','Karlsruhe','','Deutschland',3,'Consultation',49.0349531,8.3336904,'2009-12-01 13:35:46','2009-12-01 13:35:46');
INSERT INTO "locations" VALUES(5,'Rheinbergstrasse','11','','','76187','Karlsruhe','','Deutschland',4,'Consultation',49.0349531,8.3336904,'2009-12-01 13:40:48','2009-12-01 13:40:48');
INSERT INTO "locations" VALUES(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'de',2,'User',39.145271,-75.418762,'2009-12-03 10:40:37','2009-12-03 10:40:37');
INSERT INTO "locations" VALUES(7,'Rheinbergstrasse','11','','','76187','Karlsruhe','','Deutschland',1,'Event',49.0349531,8.3336904,'2009-12-07 09:09:17','2009-12-07 09:09:17');
INSERT INTO "locations" VALUES(8,'Nebeniusstrasse','47','','','76137','Karlruhe','','Deutschland',2,'Event',48.998852,8.41924,'2009-12-10 13:34:11','2009-12-10 13:34:11');
INSERT INTO "locations" VALUES(9,'Nebeniusstrasse','47','','','76137','Karlruhe','','Deutschland',3,'Event',48.998852,8.41924,'2009-12-10 13:34:57','2009-12-10 13:34:57');
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "start" datetime, "end" datetime, "commercial" boolean, "reference_number" varchar(255), "user_id" integer, "consultation_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "events" VALUES(1,'TestEvent','Test','2009-12-12 20:15:00','2009-12-12 20:45:00','t','4_-850563145',NULL,4,'2009-12-07 09:09:17','2009-12-07 10:39:59');
INSERT INTO "events" VALUES(2,'Test1','Test1','2009-12-20 13:00:00','2009-12-20 15:00:00','f','3_-591183815',3,NULL,'2009-12-10 13:34:11','2009-12-10 13:34:11');
INSERT INTO "events" VALUES(3,'FooBar','Woop','2010-01-10 13:00:00','2010-01-10 15:15:00','f','3_-813887963',3,NULL,'2009-12-10 13:34:57','2009-12-10 13:34:57');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('pages',5);
INSERT INTO "sqlite_sequence" VALUES('effects',12);
INSERT INTO "sqlite_sequence" VALUES('aliments',5);
INSERT INTO "sqlite_sequence" VALUES('properties',6);
INSERT INTO "sqlite_sequence" VALUES('elements',5);
INSERT INTO "sqlite_sequence" VALUES('organs',12);
INSERT INTO "sqlite_sequence" VALUES('target_organs',11);
INSERT INTO "sqlite_sequence" VALUES('comments',10);
INSERT INTO "sqlite_sequence" VALUES('flags',10);
INSERT INTO "sqlite_sequence" VALUES('categories',14);
INSERT INTO "sqlite_sequence" VALUES('authorships',1);
INSERT INTO "sqlite_sequence" VALUES('books',1);
INSERT INTO "sqlite_sequence" VALUES('profiles',6);
INSERT INTO "sqlite_sequence" VALUES('user_photos',4);
INSERT INTO "sqlite_sequence" VALUES('favorite_aliments',5);
INSERT INTO "sqlite_sequence" VALUES('posts',4);
INSERT INTO "sqlite_sequence" VALUES('users',3);
INSERT INTO "sqlite_sequence" VALUES('open_id_authentication_associations',7);
INSERT INTO "sqlite_sequence" VALUES('open_id_authentication_nonces',17);
INSERT INTO "sqlite_sequence" VALUES('aliment_photos',10);
INSERT INTO "sqlite_sequence" VALUES('consultations',4);
INSERT INTO "sqlite_sequence" VALUES('consultation_photos',3);
INSERT INTO "sqlite_sequence" VALUES('locations',9);
INSERT INTO "sqlite_sequence" VALUES('events',3);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE UNIQUE INDEX "index_users_on_login" ON "users" ("login");
COMMIT;
