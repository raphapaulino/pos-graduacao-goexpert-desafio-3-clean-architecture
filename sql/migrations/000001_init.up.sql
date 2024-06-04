CREATE TABLE IF NOT EXISTS `orders` (
  id varchar(255) NOT NULL,
--   id INT AUTO_INCREMENT NOT NULL,
  price float NOT NULL,
  tax float NOT NULL,
  final_price float NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;
