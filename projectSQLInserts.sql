drop database if exists ecommerce;

create database ecommerce;

use ecommerce;

create table product
(
product_id int primary key auto_increment,
sku_number int not null unique,
product_name varchar(50) not null,
product_description varchar(100),
unit_price decimal(8,2) not null,
color varchar(10),
size char(5),
style varchar(10),
inventory int default 0
);

create table category
(
category_id int primary key	auto_increment,
category_name varchar(50) not null
);

create table product_category
(
product_id int not null,
category_id int not null,
primary key (product_id, category_id),
foreign key (product_id) references product(product_id),
foreign key (category_id) references category(category_id)
);

create table subcategory
(
category_id int not null,
subcategory_id int not null,
primary key (category_id, subcategory_id),
foreign key (category_id) references category(category_id),
foreign key (subcategory_id) references category(category_id)
);

CREATE TABLE `account` (
customer_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender char(1) default 'N',
date_of_birth date,
phone char(10),
username varchar(20) not null unique,
password varchar(20) not null
);

CREATE TABLE country (
country_id int primary key auto_increment,
country_name varchar(50)
);

CREATE TABLE city (
city_id int primary key auto_increment,
city_name varchar(50),
province char(2) not null,
country_id int not null,
foreign key (country_id) references country (country_id)
);

CREATE TABLE address (
address_id int primary key auto_increment,
street_number int not null,
civic_number int,
street_name varchar(50) not null,
city_id int not null,
postal_code char(6) not null,
account_id int not null,
foreign key (city_id) references city (city_id),
foreign key (account_id) references account (customer_id)
);

CREATE TABLE payment_method (
id int not null primary key auto_increment
);

CREATE TABLE paypal (
payment_method_id int not null,
email_address varchar(50),
foreign key (payment_method_id) references payment_method (id),
primary key (payment_method_id)
);

CREATE TABLE visa_mastercard (
payment_method_id int not null,
card_number char(16) not null,
expiry_date char(4) not null,
holder_name varchar(50) not null,
address_id int not null,
foreign key (payment_method_id) references payment_method (id),
foreign key (address_id) references address (address_id),
primary key (payment_method_id)
);

CREATE TABLE giftcard (
payment_method_id int not null,
bar_code char(18) unique,
code char(4),
foreign key (payment_method_id) references payment_method (id),
primary key (payment_method_id)
);

CREATE TABLE account_payment (
account_id int not null,
payment_method_id int not null,
foreign key (account_id) references account (customer_id),
foreign key (payment_method_id) references payment_method (id),
primary key (account_id, payment_method_id)
);

CREATE TABLE cart_item (
account_id int not null,
product_id int not null,
quantity int default 0,
foreign key (account_id) references account (customer_id),
foreign key (product_id) references product (product_id),
primary key (account_id, product_id)
);

CREATE TABLE `order` (
order_id int not null primary key auto_increment,
order_date date not null,
total_price decimal(10,2),
account_id int not null,
payment_method_id int not null,
address_id int not null,
foreign key (account_id) references account (customer_id),
foreign key (payment_method_id) references payment_method (id),
foreign key (address_id) references address (address_id)
);

CREATE TABLE order_detail (
order_id int not null,
quantity int not null,
product_id int not null,
foreign key (product_id) references product (product_id),
foreign key (order_id) references `order` (order_id),
primary key (product_id, order_id)
);

#40 rows for "account" table
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Arsenio","Shelton","F","1970-07-28","3996581839","NewmanChaney","OBO30SDN9UD");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Aimee","Craft","","1988-06-13","6402514863","BenderLawrence","QON38BEE7TR");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Reuben","Becker","F","1997-04-01","6402888062","DaleYuli","CEC02CDP5KP");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Timon","Mccarty","F","1954-05-26","1446752604","CastilloIngrid","ZFV43VVW8BS");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Buckminster","Jackson","","1958-12-21","2068313645","PowersAlan","OYN87UKB5AF");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Kessie","Dickson","","1978-09-14","3238271791","RosalesAmethyst","MOH23YOE1PP");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Sybill","Fischer","M","1967-06-04","7498983126","RushMaxwell","OIK73KEQ2IA");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("MacKenzie","Dickerson","F","1980-06-21","3365925077","HallJustin","STQ41SSZ2JE");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Ashton","Potts","N","1976-11-24","9070565650","McbrideIshmael","DRB99XML5YW");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Penelope","Robinson","N","1984-03-06","6144957265","MartinezChancellor","HRR27NQD4TZ");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Breanna","Graves","N","1957-02-07","5441162756","RiveraRebecca","EFM17RZM9DM");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Demetrius","Mcclure","M","1962-09-18","1862544921","KnowlesLee","BAQ60RCB8NQ");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Maxwell","Hart","F","1999-02-23","7625021624","DelgadoKenneth","NCA71FTR7ZS");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Genevieve","Mooney","","1993-12-01","9812501031","BlairClare","TXC47CMV7DL");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Berk","Moses","N","1971-01-03","9263374509","KelleyChandler","UPW65PJH4RQ");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Yuri","Bradshaw","M","1986-06-08","9921196342","YoungDorian","IYX18SLL3SR");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Josiah","Leon","","1955-03-29","2169939315","KellerTucker","ZZF45LGC9XI");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Jerome","Hogan","F","1990-05-13","2465472856","GreeneMay","HMY27BJD3TK");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Jemima","Randall","","1997-11-29","2149840735","DuffyBrendan","MDI07KQD1OV");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Jared","Wall","N","1982-08-18","1147755479","GatesJolie","QRP32DWM0GH");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Hayden","Lindsey","M","1976-04-25","2946915988","KentNero","UGY81BAS5WX");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Herman","Sweeney","M","1957-01-16","4672202699","HesterJenna","MOM62NDQ4UC");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Gregory","Gay","N","1951-06-09","8924749750","WoodLacota","MOW21ZKT6QR");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Brennan","Welch","M","1983-03-22","5051768253","BarreraShelby","TLU58GSK7XY");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Jackson","Craig","N","1968-02-16","8005724735","MccrayOleg","AIM70ZAT6ZE");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Alma","Moody","M","1995-11-17","5922447235","HendersonLacy","OQY71AAN8TP");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Kadeem","Valdez","M","1991-06-24","7717263051","SimonPhillip","VYB52XNQ3DF");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Ava","Dennis","M","1960-07-19","3077813220","MaddoxXavier","OMJ08XGL0OM");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Cleo","Montgomery","","1952-05-24","1233158789","DayIgnatius","MLS02JOF9RD");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Omar","Peck","F","1977-04-18","2373010165","DotsonBrady","VIM38GKI3LP");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Branden","Richard","N","1952-05-03","7302475133","MccartyIvory","IOV97WWY2QG");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Jessamine","Romero","F","1985-11-18","2258628415","McneilJesse","KGT90GLH8IM");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Nomlanga","Cantrell","N","1977-05-17","6191131502","CaseBrian","EPP37CSK6YG");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Eaton","Prince","F","1972-01-25","9457889309","DuranCathleen","TOH58IUA5FF");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Elijah","Watkins","N","1990-04-01","9246660726","SanfordSharon","EJT52MWP8VF");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Violet","Schmidt","","1982-10-26","8197191297","GuthrieMaxwell","RDI94NOT1WR");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Mikayla","Skinner","N","1983-01-25","5280815543","GrimesFelicia","RLF40LOX0EW");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Winifred","French","","1952-09-25","9793450388","HewittIngrid","ITI34TUL7AY");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Brendan","Vargas","M","1990-08-24","5870965545","WongKelly","YTP99JDH6EA");
INSERT INTO `account` (`first_name`,`last_name`,`gender`,`date_of_birth`,`phone`,`username`,`password`) VALUES ("Sloane","Francis","F","1971-10-15","4088364720","TurnerJaime","GNV18KYQ2WF");

#50 rows for "country" table
INSERT INTO `country` (`country_name`) VALUES ("Canada");
INSERT INTO `country` (`country_name`) VALUES ("USA");
INSERT INTO `country` (`country_name`) VALUES ("Sudan");
INSERT INTO `country` (`country_name`) VALUES ("New Zealand");
INSERT INTO `country` (`country_name`) VALUES ("Cyprus");
INSERT INTO `country` (`country_name`) VALUES ("Belarus");
INSERT INTO `country` (`country_name`) VALUES ("Solomon Islands");
INSERT INTO `country` (`country_name`) VALUES ("Tunisia");
INSERT INTO `country` (`country_name`) VALUES ("Honduras");
INSERT INTO `country` (`country_name`) VALUES ("Seychelles");
INSERT INTO `country` (`country_name`) VALUES ("Bosnia and Herzegovina");
INSERT INTO `country` (`country_name`) VALUES ("Morocco");
INSERT INTO `country` (`country_name`) VALUES ("Bonaire, Sint Eustatius and Saba");
INSERT INTO `country` (`country_name`) VALUES ("Mali");
INSERT INTO `country` (`country_name`) VALUES ("Tonga");
INSERT INTO `country` (`country_name`) VALUES ("Norway");
INSERT INTO `country` (`country_name`) VALUES ("Northern Mariana Islands");
INSERT INTO `country` (`country_name`) VALUES ("France");
INSERT INTO `country` (`country_name`) VALUES ("Cambodia");
INSERT INTO `country` (`country_name`) VALUES ("Pakistan");
INSERT INTO `country` (`country_name`) VALUES ("Afghanistan");
INSERT INTO `country` (`country_name`) VALUES ("Benin");
INSERT INTO `country` (`country_name`) VALUES ("Chile");
INSERT INTO `country` (`country_name`) VALUES ("Isle of Man");
INSERT INTO `country` (`country_name`) VALUES ("Latvia");
INSERT INTO `country` (`country_name`) VALUES ("Mongolia");
INSERT INTO `country` (`country_name`) VALUES ("Liberia");
INSERT INTO `country` (`country_name`) VALUES ("Thailand");
INSERT INTO `country` (`country_name`) VALUES ("Portugal");
INSERT INTO `country` (`country_name`) VALUES ("Togo");
INSERT INTO `country` (`country_name`) VALUES ("Malaysia");
INSERT INTO `country` (`country_name`) VALUES ("Marshall Islands");
INSERT INTO `country` (`country_name`) VALUES ("Saint Helena, Ascension and Tristan da Cunha");
INSERT INTO `country` (`country_name`) VALUES ("Virgin Islands, United States");
INSERT INTO `country` (`country_name`) VALUES ("Djibouti");
INSERT INTO `country` (`country_name`) VALUES ("Latvia");
INSERT INTO `country` (`country_name`) VALUES ("Estonia");
INSERT INTO `country` (`country_name`) VALUES ("China");
INSERT INTO `country` (`country_name`) VALUES ("Honduras");
INSERT INTO `country` (`country_name`) VALUES ("Bouvet Island");
INSERT INTO `country` (`country_name`) VALUES ("Burundi");
INSERT INTO `country` (`country_name`) VALUES ("Bangladesh");
INSERT INTO `country` (`country_name`) VALUES ("Iran");
INSERT INTO `country` (`country_name`) VALUES ("Micronesia");
INSERT INTO `country` (`country_name`) VALUES ("Heard Island and Mcdonald Islands");
INSERT INTO `country` (`country_name`) VALUES ("Brunei");
INSERT INTO `country` (`country_name`) VALUES ("Malta");
INSERT INTO `country` (`country_name`) VALUES ("Bulgaria");
INSERT INTO `country` (`country_name`) VALUES ("Jamaica");
INSERT INTO `country` (`country_name`) VALUES ("Rwanda");

#50 rows for "city" table
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Kumluca","KF",14);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Navadwip","TR",18);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Wolvertem","FC",26);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Peine","PF",7);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Oban","OX",10);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Ayr","FZ",47);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Villenave-d'Ornon","PZ",50);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Dokkum","NE",42);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Horsham","SY",37);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Acerra","ZB",27);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Valtournenche","CK",21);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Zwijnaarde","VJ",50);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Estevan","JW",43);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Kerkhove","UX",47);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Fort William","WS",17);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Loralai","LS",24);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Kupang","LY",17);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Norman Wells","OH",6);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Terlago","LZ",14);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Clare","OK",34);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Camerino","QV",42);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Moxhe","WP",36);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Tirupati","LR",5);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Halifax","BY",38);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Wilmont","OK",29);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Castiglione di Sicilia","QR",37);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Namyangju","TF",16);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Valenciennes","UU",30);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Beauport","ZY",18);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Tampa","FL",18);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Central Jakarta","KZ",26);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Port Hope","IL",16);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Schwechat","ZG",31);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Quilicura","QD",14);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Little Rock","CJ",46);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Vallentuna","QK",8);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Salzgitter","AH",20);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Jemeppe-sur-Sambre","YZ",31);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Castel Giorgio","LB",24);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Radom","QS",2);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Tuscaloosa","OS",19);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Lisciano Niccone","FL",23);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Kanchipuram","FR",2);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Maintal","LL",39);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Nives","ML",41);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("GomzŽ-Andoumont","DA",20);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Çeşme","ZR",16);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Porto Cesareo","BP",41);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Melton Mowbray","CU",46);
INSERT INTO `city` (`city_name`,`province`,`country_id`) VALUES ("Harrisburg","US",38);

#50 rows for "address" table
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (123,18,"Moody",32,"C7O1B8",1);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (860,51,"Sandoval",33,"Z6P2G8",2);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (569,61,"Frost",46,"C3W6X6",3);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (727,99,"Cherry",31,"M4P1B2",4);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (578,59,"Haynes",13,"K0M5S3",5);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (270,67,"David",36,"Y8I7J9",6);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (858,83,"Holland",1,"B4W4M5",7);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (141,29,"Brown",2,"J3P6Y5",8);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (849,88,"Miranda",15,"H7E3B4",9);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (372,39,"Valdez",31,"P2H1G0",10);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (138,28,"Benton",23,"D9A6L2",11);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (404,99,"Jacobs",36,"S9T4C0",12);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (204,15,"Cooley",39,"Y7Q8V2",13);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (551,10,"Nichols",44,"A2Q7A2",14);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (112,80,"Mooney",35,"M4N5J6",15);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (568,51,"Burnett",2,"B3Q1F9",16);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (403,99,"Riggs",19,"V3C5C8",17);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (807,69,"Osborn",6,"Z2Z6W1",18);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (366,39,"Lane",20,"D9D6C6",19);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (764,57,"Trevino",29,"R0Q1T1",20);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (994,56,"Hogan",28,"X7E5J0",21);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (584,82,"Guerrero",28,"J9S7L3",22);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (339,40,"Bolton",19,"X0R3Q7",23);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (918,58,"Day",30,"W0N2S5",24);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (500,17,"Rios",49,"V1E0C3",25);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (714,3,"Christian",48,"W3J7N7",26);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (663,5,"Kelley",31,"X8E2P6",27);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (654,13,"Phelps",17,"T1A4U4",28);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (150,10,"Peters",50,"J1V5O7",29);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (794,38,"Mueller",14,"C8Q8O8",30);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (817,45,"Robbins",42,"O1Q5F2",31);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (622,39,"Talley",28,"V1F2W4",32);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (363,75,"Tyson",35,"K5R1H3",33);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (976,9,"Mckenzie",14,"W7E7O1",34);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (235,31,"Mcbride",1,"L0J8H4",35);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (735,41,"Ramsey",34,"E6T5B7",36);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (573,79,"Gallagher",27,"A8U0Z9",37);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (579,44,"Ingram",3,"G6Q0O2",38);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (494,2,"Haney",45,"W2G7E1",39);
INSERT INTO `address` (`street_number`,`civic_number`,`street_name`,`city_id`,`postal_code`,`account_id`) VALUES (958,75,"Sanford",47,"F8K8U6",40);

#20 rows for "category" table
INSERT INTO `category` (category_name) VALUES ('Books');
INSERT INTO `category` (category_name) VALUES ('Fiction');
INSERT INTO `category` (category_name) VALUES ('Thriller');
INSERT INTO `category` (category_name) VALUES ('Video Games');
INSERT INTO `category` (category_name) VALUES ('PC');
INSERT INTO `category` (category_name) VALUES ('X-Box');
INSERT INTO `category` (category_name) VALUES ('PS5');
INSERT INTO `category` (category_name) VALUES ('Music');
INSERT INTO `category` (category_name) VALUES ('Rock');
INSERT INTO `category` (category_name) VALUES ('Jazz');
INSERT INTO `category` (category_name) VALUES ('Movies & TV Shows');
INSERT INTO `category` (category_name) VALUES ('Action');
INSERT INTO `category` (category_name) VALUES ('Horror');
INSERT INTO `category` (category_name) VALUES ('Eletronics');
INSERT INTO `category` (category_name) VALUES ('Appliances');
INSERT INTO `category` (category_name) VALUES ('Home');
INSERT INTO `category` (category_name) VALUES ('Garden');
INSERT INTO `category` (category_name) VALUES ('Pets');
INSERT INTO `category` (category_name) VALUES ('Dog');
INSERT INTO `category` (category_name) VALUES ('Cat');
INSERT INTO `category` (category_name) VALUES ('Health & Bealty');
INSERT INTO `category` (category_name) VALUES ('Make-up');
INSERT INTO `category` (category_name) VALUES ('Grocery');
INSERT INTO `category` (category_name) VALUES ('Frozen');
INSERT INTO `category` (category_name) VALUES ('Fruits');
INSERT INTO `category` (category_name) VALUES ('Handmade');
INSERT INTO `category` (category_name) VALUES ('Wood carvings');
INSERT INTO `category` (category_name) VALUES ('Clothing');
INSERT INTO `category` (category_name) VALUES ('T-shirts');
INSERT INTO `category` (category_name) VALUES ('Jewelry');
INSERT INTO `category` (category_name) VALUES ('Made of gold');
INSERT INTO `category` (category_name) VALUES ('Automotive');
INSERT INTO `category` (category_name) VALUES ('Wheels');
INSERT INTO `category` (category_name) VALUES ('Accessories');
INSERT INTO `category` (category_name) VALUES ('For Him');
INSERT INTO `category` (category_name) VALUES ('Guns');
INSERT INTO `category` (category_name) VALUES ('For Her');
INSERT INTO `category` (category_name) VALUES ('Purses');
INSERT INTO `category` (category_name) VALUES ('Toys');
INSERT INTO `category` (category_name) VALUES ('Board games');
INSERT INTO `category` (category_name) VALUES ('Sports & Outoors');
INSERT INTO `category` (category_name) VALUES ('Weight lifting');
INSERT INTO `category` (category_name) VALUES ('Baby & Kids');
INSERT INTO `category` (category_name) VALUES ('Diapers');
INSERT INTO `category` (category_name) VALUES ('Smart Devices');
INSERT INTO `category` (category_name) VALUES ('Hobby');

#80 rows for "payment_method" table
#20 reserved for PayPal
INSERT INTO `payment_method` (`id`) VALUES (1);
INSERT INTO `payment_method` (`id`) VALUES (2);
INSERT INTO `payment_method` (`id`) VALUES (3);
INSERT INTO `payment_method` (`id`) VALUES (4);
INSERT INTO `payment_method` (`id`) VALUES (5);
INSERT INTO `payment_method` (`id`) VALUES (6);
INSERT INTO `payment_method` (`id`) VALUES (7);
INSERT INTO `payment_method` (`id`) VALUES (8);
INSERT INTO `payment_method` (`id`) VALUES (9);
INSERT INTO `payment_method` (`id`) VALUES (10);
INSERT INTO `payment_method` (`id`) VALUES (11);
INSERT INTO `payment_method` (`id`) VALUES (12);
INSERT INTO `payment_method` (`id`) VALUES (13);
INSERT INTO `payment_method` (`id`) VALUES (14);
INSERT INTO `payment_method` (`id`) VALUES (15);
INSERT INTO `payment_method` (`id`) VALUES (16);
INSERT INTO `payment_method` (`id`) VALUES (17);
INSERT INTO `payment_method` (`id`) VALUES (18);
INSERT INTO `payment_method` (`id`) VALUES (19);
INSERT INTO `payment_method` (`id`) VALUES (20);
#20 reserved for Giftcard
INSERT INTO `payment_method` (`id`) VALUES (21);
INSERT INTO `payment_method` (`id`) VALUES (22);
INSERT INTO `payment_method` (`id`) VALUES (23);
INSERT INTO `payment_method` (`id`) VALUES (24);
INSERT INTO `payment_method` (`id`) VALUES (25);
INSERT INTO `payment_method` (`id`) VALUES (26);
INSERT INTO `payment_method` (`id`) VALUES (27);
INSERT INTO `payment_method` (`id`) VALUES (28);
INSERT INTO `payment_method` (`id`) VALUES (29);
INSERT INTO `payment_method` (`id`) VALUES (30);
INSERT INTO `payment_method` (`id`) VALUES (31);
INSERT INTO `payment_method` (`id`) VALUES (32);
INSERT INTO `payment_method` (`id`) VALUES (33);
INSERT INTO `payment_method` (`id`) VALUES (34);
INSERT INTO `payment_method` (`id`) VALUES (35);
INSERT INTO `payment_method` (`id`) VALUES (36);
INSERT INTO `payment_method` (`id`) VALUES (37);
INSERT INTO `payment_method` (`id`) VALUES (38);
INSERT INTO `payment_method` (`id`) VALUES (39);
INSERT INTO `payment_method` (`id`) VALUES (40);
#40 reserved for Visa and Mastercard
INSERT INTO `payment_method` (`id`) VALUES (41);
INSERT INTO `payment_method` (`id`) VALUES (42);
INSERT INTO `payment_method` (`id`) VALUES (43);
INSERT INTO `payment_method` (`id`) VALUES (44);
INSERT INTO `payment_method` (`id`) VALUES (45);
INSERT INTO `payment_method` (`id`) VALUES (46);
INSERT INTO `payment_method` (`id`) VALUES (47);
INSERT INTO `payment_method` (`id`) VALUES (48);
INSERT INTO `payment_method` (`id`) VALUES (49);
INSERT INTO `payment_method` (`id`) VALUES (50);
INSERT INTO `payment_method` (`id`) VALUES (51);
INSERT INTO `payment_method` (`id`) VALUES (52);
INSERT INTO `payment_method` (`id`) VALUES (53);
INSERT INTO `payment_method` (`id`) VALUES (54);
INSERT INTO `payment_method` (`id`) VALUES (55);
INSERT INTO `payment_method` (`id`) VALUES (56);
INSERT INTO `payment_method` (`id`) VALUES (57);
INSERT INTO `payment_method` (`id`) VALUES (58);
INSERT INTO `payment_method` (`id`) VALUES (59);
INSERT INTO `payment_method` (`id`) VALUES (60);
INSERT INTO `payment_method` (`id`) VALUES (61);
INSERT INTO `payment_method` (`id`) VALUES (62);
INSERT INTO `payment_method` (`id`) VALUES (63);
INSERT INTO `payment_method` (`id`) VALUES (64);
INSERT INTO `payment_method` (`id`) VALUES (65);
INSERT INTO `payment_method` (`id`) VALUES (66);
INSERT INTO `payment_method` (`id`) VALUES (67);
INSERT INTO `payment_method` (`id`) VALUES (68);
INSERT INTO `payment_method` (`id`) VALUES (69);
INSERT INTO `payment_method` (`id`) VALUES (70);
INSERT INTO `payment_method` (`id`) VALUES (71);
INSERT INTO `payment_method` (`id`) VALUES (72);
INSERT INTO `payment_method` (`id`) VALUES (73);
INSERT INTO `payment_method` (`id`) VALUES (74);
INSERT INTO `payment_method` (`id`) VALUES (75);
INSERT INTO `payment_method` (`id`) VALUES (76);
INSERT INTO `payment_method` (`id`) VALUES (77);
INSERT INTO `payment_method` (`id`) VALUES (78);
INSERT INTO `payment_method` (`id`) VALUES (79);
INSERT INTO `payment_method` (`id`) VALUES (80);

#20 rows for "paypal" table
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (1,"dictum.placerat.augue@consequatlectus.ca");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (2,"urna.Nunc.quis@sempercursus.com");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (3,"nec@Utnecurna.edu");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (4,"orci.in.consequat@ornareplaceratorci.co.uk");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (5,"Nullam.ut@purussapiengravida.edu");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (6,"urna.et@felisNullatempor.edu");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (7,"mauris@ipsumsodalespurus.co.uk");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (8,"nec.ante.blandit@Aliquamfringilla.co.uk");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (9,"ornare.lectus.justo@velarcueu.org");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (10,"dignissim@Vivamus.net");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (11,"in@temporerat.co.uk");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (12,"et.ultrices@Donecnibh.com");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (13,"Cum.sociis.natoque@nuncinterdumfeugiat.edu");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (14,"justo.nec.ante@nequeMorbi.com");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (15,"eu.dolor@consequatauctor.net");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (16,"lacus.varius@mi.co.uk");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (17,"suscipit.est.ac@necquamCurabitur.ca");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (18,"fringilla@mollisvitae.net");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (19,"dictum.sapien.Aenean@gravidaPraesent.ca");
INSERT INTO `paypal` (`payment_method_id`,`email_address`) VALUES (20,"sagittis.Duis.gravida@in.net");

#20 rows for "giftcard" table
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (21,"RMJ41JRZ6JB761SC8H",8335);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (22,"SPS62YNE0AD554UM0V",8109);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (23,"JXE94SPG0TA078EH1J",1664);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (24,"VZQ25CUP2WW196ZL6I",4326);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (25,"IYQ85JJV3QY133GJ8V",3028);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (26,"ECZ53KCX9BM617LN0O",3744);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (27,"JWD55OZO7SG776IO5H",4642);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (28,"LLY07UKD0XH439YY3J",6041);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (29,"QTI63NOB2KP544JG5Y",1174);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (30,"DLY29ZNW3ME114PB6M",3030);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (31,"EUN85FMH5DO962ZX6Z",8706);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (32,"AKB75UTW8SV378WT2X",5143);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (33,"OTG14XAY5KU998MD6O",2622);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (34,"CNM85FWE6SO270WW8T",3903);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (35,"FAP75SPH1IS273XN7L",5394);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (36,"BRW07ZLM9XZ198OD7H",7607);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (37,"OFQ39PAL6GR768FG6B",1123);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (38,"RAV06ICD2NO622AE2Z",9095);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (39,"DOR80VCO6ZB401EF5O",4642);
INSERT INTO `giftcard` (`payment_method_id`,`bar_code`,`code`) VALUES (40,"CRH49JDA9KL242LM3L",4863);

#40 rows for "visa_mastercard" table
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (41,4147576344577914,"0123","Lucian",1);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (42,6386238723181647,"0527","Maxwell",2);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (43,6076365879376674,"1123","Jena",3);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (44,5299736304645949,"0730","Sonia",4);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (45,8643701182535300,"0829","Marsden",5);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (46,8542413383192465,"0329","Denise",6);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (47,1519338945861981,"0725","Quemby",7);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (48,3481165439900399,"0923","Elvis",8);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (49,5564351609990258,"0624","Chastity",9);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (50,3000127891480555,"1120","Leilani",10);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (51,1412343002547170,"0621","Montana",11);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (52,4747854274696678,"0324","Graham",12);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (53,4625534878686437,"1121","Murphy",13);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (54,3501002881618372,"0225","Hashim",14);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (55,5505977935464600,"1128","Callum",15);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (56,2652538574377087,"0521","Baxter",16);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (57,2849429090546337,"0525","Scarlett",17);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (58,2615048151602367,"0929","Thane",18);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (59,1470477430030978,"1129","Blossom",19);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (60,4905820685113597,"0225","Dominic",20);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (61,5228102168180772,"0330","Lewis",21);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (62,7868517098056008,"0223","Ira",22);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (63,8043260945432253,"1127","Len",23);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (64,5420064449274683,"0227","Ria",24);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (65,7648731244516791,"0522","Ria",25);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (66,4374766280392712,"0630","Xantha",26);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (67,3912318700871105,"0324","Venus",27);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (68,8655800546325673,"0330","David",28);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (69,4336252470753771,"0429","Cameran",29);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (70,7827032481416908,"0126","Grant",30);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (71,4759776390744743,"0822","Lana",31);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (72,6299802882293797,"0329","Naida",32);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (73,4343583039442574,"0924","Nora",33);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (74,5876687937242261,"0929","Barry",34);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (75,1778674058793360,"0322","Savannah",35);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (76,2177248384259883,"0727","Phelan",36);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (77,6318270033378104,"0726","Ali",37);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (78,3683602710508986,"1027","Baker",38);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (79,2297562672377555,"0821","Catherine",39);
INSERT INTO `visa_mastercard` (`payment_method_id`,`card_number`,`expiry_date`,`holder_name`,`address_id`) VALUES (80,5891336449004823,"1220","Vivien",40);

#40 rows for "account_payment" table
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (1,12);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (2,21);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (3,49);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (4,7);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (5,59);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (6,55);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (7,75);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (8,32);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (9,60);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (10,29);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (11,27);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (12,50);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (13,33);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (14,24);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (15,72);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (16,32);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (17,49);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (18,51);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (19,61);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (20,25);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (21,71);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (22,14);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (23,64);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (24,57);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (25,21);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (26,68);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (27,55);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (28,79);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (29,6);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (30,19);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (31,75);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (32,31);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (33,21);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (34,64);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (35,56);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (36,4);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (37,24);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (38,35);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (39,55);
INSERT INTO `account_payment` (`account_id`,`payment_method_id`) VALUES (40,74);

#21 rows for "subcategory" table
INSERT INTO subcategory (category_id, subcategory_id) VALUES (1,2);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (1,3);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (4,5);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (4,6);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (4,7);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (8,9);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (8,10);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (11,12);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (11,13);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (14,15);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (16,17);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (18,19);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (18,20);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (21,22);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (23,24);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (23,25);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (26,27);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (28,29);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (30,31);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (32,33);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (32,34);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (35,36);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (37,38);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (39,40);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (41,42);
INSERT INTO subcategory (category_id, subcategory_id) VALUES (43,44);

#40 rows for "product" table
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (74177529, 'The Book', 'A book that is about books.', 14.99, 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (90146004, 'World of Warcraft', 'Computer game', 49.99 , 31);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (67358094, 'Black Sabbath', 'Metal vinyl record', 19.99, 'black', 'LP', '12"', 4);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (95677203, 'Rage Against The Machine', 'Punk/Hardcore vinyl record', 19.99, 'black', 'LP', '12"', 3);	
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (78807346, 'Friends', 'A very friendly tv show', 6.99, 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (72955176, 'Microwave', 'Dont know how to cook? Say no more', 94.99, 'red', 13);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, inventory) VALUES (37653392, 'HP Laptop XZ690', 'Top of the line laptop', 414.99, 'black', '12"', 5);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (36830609	, 'Pack of 5 Pens', 'Buy 5 and save 0.001%', 4.99, 'blue',  12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (27076043	, 'E-cigarette', 'better than real cigarettes', 44.99, 'black',  33);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, inventory) VALUES (32602654	, 'Computer Chair', 'ergnomically sound', 114.99, 'red', 'Large', 11);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (88413702	, 'Chefs Knife', 'cut things real good', 129.99, 'black', '12"', 'Japanese', 2);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (55989815	, 'Flat Screen TV', 'a TV with a flat screen', 614.99, 'black', '50"', 'LCD', 1);
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (47202290	, 'Cat Food', 'blend of chicken and beef', 44.99, 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (55937645	, 'Dog Food', 'blend of chicken and beef', 44.99, 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, size, inventory) VALUES (52632457	, 'Hand Sanitizer', 'covid be gone', 14.99, '500ml', 192);
INSERT INTO product (sku_number, product_name, product_description, unit_price, size, inventory) VALUES (64903212	, 'Basketball Net', 'typically used in basketball', 144.99, 'NBA', 1);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color,inventory) VALUES (91955634	, 'Hockey Net', 'typically used in hockey', 124.99, 'black', 2);
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (54520797	, 'Pack of 3 Tennis Balls', 'why buy 1 when you can buy 3?', 14.99, 32);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (92780051	, 'Badminton Racket', 'hit the badminton with it', 34.99, 'green', 1);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (11341937	, 'Nike Shoes', 'Made in Bangladesh', 144.99, 'white', '13', 'High Top', 2);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (29452539	, 'Adidas Shoes (Women)', 'Made in Bangladesh', 144.99, 'white', '7', 'Low Top', 2);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (39537891	, 'Pack of 5 razors', 'Buy 5 and save 0.0001%', 9.99, 'orange', 52);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (11863838	, 'Antipersperant', 'no animal testing', 14.99, 'red',  8);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (83322037	, 'Womens Deodorant', 'no animal testing', 14.99, 'purple', 11);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (64253691	, 'Car Seat Warmer', 'gotta have one', 78.99, 'black', 3);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (70741246	, 'Laundry Basket', 'put laundry in here', 34.99, 'white', 5);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, inventory) VALUES (79180698	, 'Pack of 5 Copybooks', 'Buy 5 and save 0.0001%', 14.99, 'gray','200pg', 14);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (32821425	, 'Mens Shorts', '99.9% cotton', 34.99, 'tan', 'M', 'high knee', 5);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (81203380	, 'Mens Hoodie', '100% cotton', 44.99, 'red', 'M', 'pocket', 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (67092441	, 'Womans Jeans', 'affordable jeans', 54.99, 'blue', 'M', 'regular', 6);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (49628123	, 'Beanie', 'keep ya head warm', 14.99, 'black', 'L', 'regular', 31);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (26225596		, 'Nintendo Switch', 'pretty cool', 314.99, 'white', 2);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (95924320		, 'Mattress Cover', 'make a fort', 44.99, 'blue', 'King', 'regular', 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (44655158		, 'Pillow', 'put your head on this', 14.99, 'white', 'L', 'regular', 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, style, inventory) VALUES (13278445		, 'Pillowcases', 'put these on your pillows', 14.99, 'white', 'L', 'regular', 12);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (57948806	, 'Childrens Drum Set', 'dont buy this', 145.99, 'red', 1);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (32462428	, 'Portable Battery', 'charge your phone anywhere', 14.99, 'black', 41);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, size, inventory) VALUES (62865478	, 'Office Desk', 'Put things on it', 14.99, 'tan', 'L', 3);
INSERT INTO product (sku_number, product_name, product_description, unit_price, color, inventory) VALUES (98718057		, 'Barbeque Lighter', 'Great for BBQs', 14.99, 'red', 22);
INSERT INTO product (sku_number, product_name, product_description, unit_price, inventory) VALUES (42579703		, 'Fertilizer', 'for the pro gardeners', 41.99,  22);

#40 rows for "product_category" table
INSERT INTO product_category (product_id, category_id) VALUES (1,1);
INSERT INTO product_category (product_id, category_id) VALUES (2,2);
INSERT INTO product_category (product_id, category_id) VALUES (3,3);
INSERT INTO product_category (product_id, category_id) VALUES (4,3);
INSERT INTO product_category (product_id, category_id) VALUES (5,4);
INSERT INTO product_category (product_id, category_id) VALUES (6,6);
INSERT INTO product_category (product_id, category_id) VALUES (7,5);
INSERT INTO product_category (product_id, category_id) VALUES (8,6);
INSERT INTO product_category (product_id, category_id) VALUES (9,21);
INSERT INTO product_category (product_id, category_id) VALUES (10,6);
INSERT INTO product_category (product_id, category_id) VALUES (11,6);
INSERT INTO product_category (product_id, category_id) VALUES (12,5);
INSERT INTO product_category (product_id, category_id) VALUES (13,7);
INSERT INTO product_category (product_id, category_id) VALUES (14,7);
INSERT INTO product_category (product_id, category_id) VALUES (15,8);
INSERT INTO product_category (product_id, category_id) VALUES (16,17);
INSERT INTO product_category (product_id, category_id) VALUES (17,17);
INSERT INTO product_category (product_id, category_id) VALUES (18,17);
INSERT INTO product_category (product_id, category_id) VALUES (19,17);
INSERT INTO product_category (product_id, category_id) VALUES (20,14);
INSERT INTO product_category (product_id, category_id) VALUES (21,15);
INSERT INTO product_category (product_id, category_id) VALUES (22,8);
INSERT INTO product_category (product_id, category_id) VALUES (23,8);
INSERT INTO product_category (product_id, category_id) VALUES (24,8);
INSERT INTO product_category (product_id, category_id) VALUES (25,13);
INSERT INTO product_category (product_id, category_id) VALUES (26,6);
INSERT INTO product_category (product_id, category_id) VALUES (27,21);
INSERT INTO product_category (product_id, category_id) VALUES (28,11);
INSERT INTO product_category (product_id, category_id) VALUES (29,11);
INSERT INTO product_category (product_id, category_id) VALUES (30,11);
INSERT INTO product_category (product_id, category_id) VALUES (31,11);
INSERT INTO product_category (product_id, category_id) VALUES (32,5);
INSERT INTO product_category (product_id, category_id) VALUES (33,6);
INSERT INTO product_category (product_id, category_id) VALUES (34,6);
INSERT INTO product_category (product_id, category_id) VALUES (35,6);
INSERT INTO product_category (product_id, category_id) VALUES (36,18);
INSERT INTO product_category (product_id, category_id) VALUES (37,5);
INSERT INTO product_category (product_id, category_id) VALUES (38,6);
INSERT INTO product_category (product_id, category_id) VALUES (39,17);
INSERT INTO product_category (product_id, category_id) VALUES (40,17);

#20 rows for "order" table
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-11-22', 224.95, 4, 7, 33);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-04-15', 414.99, 1, 3, 31);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-02-22', 189.98, 3, 1, 19);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-04-12', 34.99, 7, 8, 29);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-04-13', 19.98, 11, 22, 21);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-05-11', 44.97, 23, 17, 4);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-06-12', 41.99, 14, 25, 7);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-05-24',  14.99, 5, 26, 1);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-03-20', 59.96, 6, 29, 3);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-03-28', 14.99, 8, 35, 8);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-05-26', 109.98, 13, 38, 11);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-01-25', 78.99, 21, 42, 21);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-07-24', 144.99, 2, 12, 22);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-08-20', 19.99, 1, 46, 14);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2019-03-28', 44.99, 7, 34, 7);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-09-20', 13.98, 2, 46, 16);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-11-22', 49.99, 5, 58, 27);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-02-21',  59.96, 8, 53, 31);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-02-24', 44.99, 9, 52, 29);
INSERT INTO `order` (order_date, total_price, account_id, payment_method_id, address_id) VALUES ('2020-05-21', 314.99, 10, 51, 2);

#20 rows for "order_detail" table
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (1, 5, 13);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (2, 1, 7);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (3, 2, 6);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (4, 1, 19);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (5, 2, 22);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (6, 3, 27);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (7, 1, 40);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (8, 1, 38);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (9, 4, 34);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (10, 1, 31);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (11, 2, 30);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (12, 1, 25);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (13, 1, 20);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (14, 1, 4);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (15, 1, 9);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (16, 2, 5);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (17, 1, 2);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (18, 4, 37);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (19, 1, 33);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (20, 1, 32);

#20 rows for "cart_item" table
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (1, 21, 2);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (2, 31, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (3, 11, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (4, 9, 3);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (5, 8, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (6, 7, 4);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (7, 6, 12);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (8, 4, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (9, 12, 4);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (10, 13, 5);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (11, 19, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (12, 18, 2);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (13, 16, 2);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (14, 15, 3);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (15, 22, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (16, 23, 1);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (17, 24, 8);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (18, 35, 7);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (19, 38, 3);
INSERT INTO cart_item (account_id, product_id, quantity) VALUES (20, 2, 1);

#Creates roles
DROP ROLE IF EXISTS administrator, registered_customer;

CREATE ROLE administrator, registered_customer;

GRANT ALL
ON *
TO administrator;

GRANT SELECT, UPDATE
ON `account`
TO registered_customer; 

GRANT SELECT, UPDATE
ON `address`
TO registered_customer; 

GRANT SELECT, INSERT, UPDATE, DELETE
ON `cart_item`
TO registered_customer; 

GRANT SELECT
ON `giftcard`
TO registered_customer; 

GRANT SELECT
ON `order`
TO registered_customer; 

GRANT SELECT
ON `order_detail`
TO registered_customer; 

GRANT SELECT, INSERT, UPDATE, DELETE
ON `paypal`
TO registered_customer; 

GRANT SELECT
ON `product`
TO registered_customer; 

GRANT SELECT
ON `subcategory`
TO registered_customer; 

GRANT SELECT
ON `product_category`
TO registered_customer; 

GRANT SELECT, INSERT, UPDATE, DELETE
ON `visa_mastercard`
TO registered_customer; 

#Creates users
DROP USER IF EXISTS filipem, kevind, NewmanChaney, BenderLawrence, DaleYuli, CastilloIngrid;

CREATE USER filipem
IDENTIFIED BY '123456';

CREATE USER kevind
IDENTIFIED BY '123456';

GRANT administrator
TO filipem, kevind;

CREATE USER NewmanChaney
IDENTIFIED BY 'OBO30SDN9UD';

CREATE USER BenderLawrence
IDENTIFIED BY 'QON38BEE7TR';

CREATE USER DaleYuli
IDENTIFIED BY 'CEC02CDP5KP';

CREATE USER CastilloIngrid
IDENTIFIED BY 'ZFV43VVW8BS';

GRANT registered_customer
TO NewmanChaney, BenderLawrence, DaleYuli, CastilloIngrid;

# Indexes
# Product look up index
CREATE INDEX product_search
ON product (product_name, size, color, style);

SELECT * from product
where product_name LIKE'%laptop%';

SELECT *
FROM product
WHERE size = 'L'
AND color= 'black'
AND style = 'regular';

# Selecting orders placed between a certain time period
CREATE INDEX order_history
ON `order` (order_date);

SELECT account_id, order_id from `order`
WHERE order_date BETWEEN '2020-04-08' AND '2020-12-31';

# Selecting account_ids that meet requirements for national and/or regional shipping
CREATE INDEX regional_or_national_shipping
ON address (province, country);

SELECT account_id from address 
WHERE country = 'CA'
AND province IN ('QC', 'ON');

# Finding all product IDs of certain categories
CREATE INDEX category_lookup
on product_category(category_id);

SELECT product_id 
FROM product_category 
WHERE category_id IN (1,2,3);

# Selecting the product name and ID which has low inventory
CREATE INDEX inventory_maintenance
ON product (inventory);

SELECT PRODUCT_NAME, PRODUCT_ID FROM PRODUCT
WHERE INVENTORY <= 3;

# Finding the address assosciated with an order
CREATE INDEX account_shipping_lookup
ON `order` (account_id, address_id);

SELECT * 
FROM account 
WHERE customer_id =
(SELECT address_id 
FROM `order` 
WHERE account_id = 4);

# Finding the address assosciated with a payment method
CREATE INDEX payment_address_visa
ON visa_mastercard (address_id);

SELECT * 
FROM account 
WHERE customer_id =(
SELECT address_id 
FROM visa_mastercard 
WHERE payment_method_id = 72);




# Admin Views
# Can select/update everything EXCEPT passwords

DROP VIEW IF EXISTS admin_account;

CREATE VIEW admin_account AS
SELECT customer_id, first_name, last_name, gender, date_of_birth, phone, username
FROM `account`
WITH CHECK OPTION;

# Can select/update everything EXCEPT card number and expiry date

DROP VIEW IF EXISTS admin_visa_mastercard;

CREATE VIEW admin_visa_mastercard AS
SELECT payment_method_id, holder_name, address_id
FROM `account`
WITH CHECK OPTION;



# Customer Views
DROP VIEW IF EXISTS customer_account;

CREATE VIEW customer_account AS
SELECT first_name, last_name, gender, phone, password
from account
WITH CHECK OPTION;


DROP VIEW IF EXISTS customer_address;

CREATE VIEW customer_address AS
SELECT street_number, civic_number, street_name, city, province, country, account_id
from address
WITH CHECK OPTION;

DROP VIEW IF EXISTS customer_cart_item;

CREATE VIEW customer_cart_item AS
SELECT product_id, quantity
from cart_item
WITH CHECK OPTION;

DROP VIEW IF EXISTS customer_gift_card;

CREATE VIEW customer_gift_card AS
SELECT bar_code, code
from giftcard;

DROP VIEW IF EXISTS customer_order;

CREATE VIEW customer_order AS
SELECT order_id, order_date, total_price;

DROP VIEW IF EXISTS customer_order_detail;

CREATE VIEW customer_order AS
SELECT order_id, quantity, product_id;

DROP VIEW IF EXISTS customer_paypal;

CREATE VIEW customer_paypal AS
SELECT email_address
from paypal
WITH CHECK OPTION;

DROP VIEW IF EXISTS customer_product;

CREATE VIEW customer_product AS
SELECT product_name, product_description, unit_price, color, size, style, inventory
FROM product
WITH CHECK OPTION;

DROP VIEW IF EXISTS customer_product_category;

CREATE VIEW customer_product_category AS
SELECT product_id, category_id
FROM product_category;

DROP VIEW IF EXISTS customer_visa_mastercard;

CREATE VIEW customer_visa_mastercard AS
SELECT card_number, expiry_date, holder_name
FROM visa_mastercard
WITH CHECK OPTION;


#Triggers
delimiter //

create trigger update_inventory_after_order 
before insert on `order_detail`
for each row

begin

declare actual_inventory int;

select inventory into actual_inventory from product where product_id = new.product_id;

if (select inventory from product where product_id = new.product_id) < new.quantity
then
signal sqlstate '45000' SET MESSAGE_TEXT = 'There is not enough inventory for this order.';
else
update product set inventory = (actual_inventory - new.quantity) where product_id = new.product_id;
end if; 

end //

delimiter ;

/* QUERIES TO CHECK THE TRIGGER ABOVE
select inventory,product_id from product where product_id = 15;
select * from order_detail order by order_id desc limit 1;
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (20, 2, 15);
INSERT INTO order_detail (order_id, quantity, product_id) VALUES (19, 191, 15);
*/
