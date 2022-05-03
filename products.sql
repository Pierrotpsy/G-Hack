CREATE DATABASE product;

USE product;
CREATE TABLE objects
   (UniqueID INT NOT NULL AUTO_INCREMENT,
    TypeOfObject VARCHAR(255),
    Marque VARCHAR(255),
    RefObject VARCHAR(255),
    Sun INT,
    Wind INT,
    Hydro INT,
    GeoThermal INT,
    Nuclear INT,
    Coal INT ,
    Petroleum INT,
    NaturalGas INT,
    HydrocarbonGasLiq INT,

    PRIMARY KEY(UniqueID));

INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Plane", "Airbus", "A320",0,0,0,0,0,0,100,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Car", "Tesla", "model 3",0,0,50,0,40,0,10,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Computer", "Apple", "Macbook",0,0,0,0,0,30,60,10,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("TV", "LG", "LG42",0,10,15,0,0,50,0,25,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Train", "Alstom", "A254",0,0,0,0,10,20,60,0,10);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Bike", "VanMoof", "Cowboy4",0,30,0,60,0,0,10,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Headphone", "Sony", "WHM1000M3",0,0,0,0,10,0,80,10,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Phone", "Apple", "Iphone 12",0,0,0,50,40,0,10,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Screen", "Iiyama", "wh655",0,0,10,0,5,0,45,0,40);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("watch", "Apple", "Apple watch",10,0,10,0,0,0,80,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Table", "Ikea", "Sandsberg",0,0,0,0,40,6,0,54,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Bed", "Bultex", "Toundra",0,0,50,40,0,9,1,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Pencil", "Bic", "Cristal",0,0,0,10,30,0,10,50,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Chair", "Ikea", "Tower",0,0,40,50,10,0,0,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Cup", "Ikea", "Gurb",0,0,40,0,0,0,30,30,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Fork", "Ikea", "Mopsig",0,20,20,40,0,0,20,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Knife", "Opinel", "N06",25,25,0,0,40,0,10,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Desk", "Ikea", "Vasagle",10,10,10,70,0,0,100,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Plane", "Boeing", "777",0,0,0,0,0,10,90,0,0);
INSERT INTO objects (TypeOfObject,Marque,RefObject,Sun,Wind,Hydro,GeoThermal,Nuclear,Coal,Petroleum,NaturalGas,HydrocarbonGasLiq) values ("Bag", "Eastpack", "EK620",0,0,10,0,40,0,50,0,0);



CREATE TABLE Picture
    (
        img_id INT NOT NULL AUTO_INCREMENT,
        img_name VARCHAR(50) NOT NULL,
        img_link VARCHAR(255) NOT NULL,
        UniqueID INT,
        primary key(img_id),
        foreign KEY(UniqueID) references objects(UniqueID) on delete cascade on update cascade
    );



INSERT INTO Picture (img_name,img_link) VALUES("Plane","https://storage.cloud.google.com/hackathon3004/Pictures/AirbusA320.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Car","https://storage.cloud.google.com/hackathon3004/Pictures/tesla.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Computer","https://storage.cloud.google.com/hackathon3004/Pictures/macbookpro.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("TV","https://storage.cloud.google.com/hackathon3004/Pictures/TVLG.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Train","https://storage.cloud.google.com/hackathon3004/Pictures/train.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Bike","https://storage.cloud.google.com/hackathon3004/Pictures/bike.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Headphone","https://storage.cloud.google.com/hackathon3004/Pictures/headphoneSony.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Phone","https://storage.cloud.google.com/hackathon3004/Pictures/iphone12.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Screen","https://storage.cloud.google.com/hackathon3004/Pictures/screen.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Watch","https://storage.cloud.google.com/hackathon3004/Pictures/watch.jpeg");
INSERT INTO Picture (img_name,img_link) VALUES("Table","https://storage.cloud.google.com/hackathon3004/Pictures/table.png");
INSERT INTO Picture (img_name,img_link) VALUES("Bed","a");
INSERT INTO Picture (img_name,img_link) VALUES("Pencil","a");
INSERT INTO Picture (img_name,img_link) VALUES("Chair","a");
INSERT INTO Picture (img_name,img_link) VALUES("Cup","a");
INSERT INTO Picture (img_name,img_link) VALUES("Fork","a");
INSERT INTO Picture (img_name,img_link) VALUES("Knife","a");
INSERT INTO Picture (img_name,img_link) VALUES("Desk","a");
INSERT INTO Picture (img_name,img_link) VALUES("Plane","a");
INSERT INTO Picture (img_name,img_link) VALUES("Bag","a");



USE product;
DROP function IF EXISTS levenshtein;

DELIMITER $$
USE product$$
CREATE FUNCTION levenshtein( s1 VARCHAR(255), s2 VARCHAR(255) )
    RETURNS INT
    DETERMINISTIC
    BEGIN
        DECLARE s1_len, s2_len, i, j, c, c_temp, cost INT;
        DECLARE s1_char CHAR;
        -- max strlen=255
        DECLARE cv0, cv1 VARBINARY(256);

        SET s1_len = CHAR_LENGTH(s1), s2_len = CHAR_LENGTH(s2), cv1 = 0x00, j = 1, i = 1, c = 0;

        IF s1 = s2 THEN
            RETURN 0;
        ELSEIF s1_len = 0 THEN
            RETURN s2_len;
        ELSEIF s2_len = 0 THEN
            RETURN s1_len;
        ELSE
            WHILE j <= s2_len DO
                SET cv1 = CONCAT(cv1, UNHEX(HEX(j))), j = j + 1;
            END WHILE;
            WHILE i <= s1_len DO
                SET s1_char = SUBSTRING(s1, i, 1), c = i, cv0 = UNHEX(HEX(i)), j = 1;
                WHILE j <= s2_len DO
                    SET c = c + 1;
                    IF s1_char = SUBSTRING(s2, j, 1) THEN
                        SET cost = 0; ELSE SET cost = 1;
                    END IF;
                    SET c_temp = CONV(HEX(SUBSTRING(cv1, j, 1)), 16, 10) + cost;
                    IF c > c_temp THEN SET c = c_temp; END IF;
                    SET c_temp = CONV(HEX(SUBSTRING(cv1, j+1, 1)), 16, 10) + 1;
                    IF c > c_temp THEN
                        SET c = c_temp;
                    END IF;
                    SET cv0 = CONCAT(cv0, UNHEX(HEX(c))), j = j + 1;
                END WHILE;
                SET cv1 = cv0, i = i + 1;
            END WHILE;
        END IF;
        RETURN c;
        END$$

DELIMITER ;