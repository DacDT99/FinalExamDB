CREATE DATABASE fedex_4295
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.delivery (
  id_delivery decimal(10, 0) NOT NULL,
  id_packet int(11) DEFAULT NULL,
  id_status decimal(10, 0) DEFAULT NULL,
  date_delivered datetime DEFAULT NULL,
  PRIMARY KEY (id_delivery)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

ALTER TABLE fedex_4295.delivery
ADD CONSTRAINT FK_delivery_packet_id_packet FOREIGN KEY (id_delivery)
REFERENCES fedex_4295.packet (id_packet) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fedex_4295.delivery
ADD CONSTRAINT FK_delivery_status_delivery_Id_status FOREIGN KEY (id_delivery)
REFERENCES fedex_4295.status_delivery (Id_status) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE fedex_4295.client (
  Id_Client decimal(10, 0) NOT NULL,
  firstName text DEFAULT NULL,
  lastName text DEFAULT NULL,
  Address text DEFAULT NULL,
  City text DEFAULT NULL,
  email text DEFAULT NULL,
  PRIMARY KEY (Id_Client)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.fedex (
  Column1 varchar(50) DEFAULT NULL,
  Column2 varchar(50) DEFAULT NULL,
  Column3 varchar(50) DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.fedex (
  Column1 varchar(50) DEFAULT NULL,
  Column2 varchar(50) DEFAULT NULL,
  Column3 varchar(50) DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.paketprice (
  id_packet_Price decimal(10, 0) NOT NULL,
  weight text DEFAULT NULL,
  price decimal(10, 0) DEFAULT NULL,
  PRIMARY KEY (id_packet_Price)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.recipient (
  id_recipient decimal(10, 0) NOT NULL,
  fullName text NOT NULL,
  address text NOT NULL,
  PRIMARY KEY (id_recipient)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.stat (
  ID_STAT decimal(10, 0) NOT NULL,
  Desc_STAT text DEFAULT NULL,
  DATE_STAT datetime DEFAULT NULL,
  PRIMARY KEY (ID_STAT)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE TABLE fedex_4295.status_delivery (
  Id_status decimal(10, 0) NOT NULL,
  status text NOT NULL,
  PRIMARY KEY (Id_status)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

CREATE 
	DEFINER = 'root'@'localhost'
TRIGGER fedex_4295.trigger1
	AFTER INSERT
	ON fedex_4295.packet
	FOR EACH ROW
BEGIN
INSERT INTO fedex_4295.stat SET
desc_stat = CONCAT('NEW CATEGORY', NEW.id_packet, NEW.fk_price_packet),
date_stat = NOW();
END