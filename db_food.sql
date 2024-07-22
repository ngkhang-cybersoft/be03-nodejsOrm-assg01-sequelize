/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `date_like` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(125) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Margherita Pizza', 'images/margherita_pizza.jpg', 12.99, 'Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Chicken Fajitas', 'images/chicken_fajitas.jpg', 15.5, 'Sizzling grilled chicken strips with peppers and onions, served with tortillas, salsa, and guacamole.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Pad Thai', 'images/pad_thai.jpg', 11.75, 'Stir-fried rice noodles with chicken, vegetables, and a flavorful peanut sauce.', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Cheeseburger', 'images/cheeseburger.jpg', 9.99, 'All-American cheeseburger with a juicy beef patty, melted cheddar cheese, lettuce, tomato, and onion on a toasted bun.', 4),
(5, 'Ratatouille', 'images/ratatouille.jpg', 14.25, 'Provençal vegetable stew with eggplant, zucchini, tomatoes, and herbs.', 6),
(6, 'Butter Chicken', 'images/butter_chicken.jpg', 13.95, 'Creamy Indian curry with tender chicken in a spiced tomato gravy.', 7),
(7, 'Black Bean Burger', 'images/black_bean_burger.jpg', 10.5, 'Vegetarian burger made with black beans, corn, and spices, served on a whole wheat bun.', 8),
(8, 'Salmon with Roasted Vegetables', 'images/salmon_roasted_vegetables.jpg', 18.75, 'Grilled salmon fillet with roasted seasonal vegetables', 5),
(9, 'Quinoa Salad', 'images/quinoa_salad.jpg', 11.25, 'Healthy and flavorful salad with quinoa, vegetables, and a light vinaigrette dressing.', 9);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Asian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'American'),
(5, 'French'),
(6, 'Mediterranean'),
(7, 'Indian'),
(8, 'Vegetarian'),
(9, 'Healthy'),
(10, 'Fast Food');

INSERT INTO `like_res` (`like_res_id`, `date_like`, `user_id`, `res_id`) VALUES
(1, '2024-07-03 00:00:00', 1, 3);
INSERT INTO `like_res` (`like_res_id`, `date_like`, `user_id`, `res_id`) VALUES
(2, '2024-06-20 00:00:00', 2, 5);
INSERT INTO `like_res` (`like_res_id`, `date_like`, `user_id`, `res_id`) VALUES
(3, '2024-05-12 00:00:00', 3, 1);
INSERT INTO `like_res` (`like_res_id`, `date_like`, `user_id`, `res_id`) VALUES
(4, '2024-07-02 00:00:00', 1, 3),
(5, '2024-06-25 00:00:00', 4, 2),
(6, '2024-07-01 00:00:00', 5, 8),
(7, '2024-06-18 00:00:00', 2, 10),
(8, '2024-04-10 00:00:00', 3, 2),
(9, '2024-06-30 00:00:00', 1, 16),
(10, '2024-06-15 00:00:00', 4, 2),
(11, '2024-06-15 00:00:00', 1, 4),
(12, '2024-07-22 07:00:00', 1, 2);

INSERT INTO `orders` (`order_id`, `amount`, `code`, `arr_sub_id`, `user_id`, `food_id`) VALUES
(1, 2, 'ORDER123', '[1,2,3]', 1, 3);
INSERT INTO `orders` (`order_id`, `amount`, `code`, `arr_sub_id`, `user_id`, `food_id`) VALUES
(2, 1, 'ORDER456', '[4,2,3]', 2, 5);
INSERT INTO `orders` (`order_id`, `amount`, `code`, `arr_sub_id`, `user_id`, `food_id`) VALUES
(3, 1, 'ORDER789', '[1,2,3]', 3, 1);
INSERT INTO `orders` (`order_id`, `amount`, `code`, `arr_sub_id`, `user_id`, `food_id`) VALUES
(4, 3, 'ORDER012', '[]', 4, 7),
(5, 1, 'ORDER345', '[]', 1, 4),
(6, 2, 'ORDER678', '[]', 5, 2),
(7, 1, 'ORDER901', '[]', 3, 8),
(8, 2, 'ORDER234', '[]', 2, 9),
(9, 1, 'ORDER124', '[]', 4, 2),
(10, 1, 'ORDER890', '[5,6,7]', 1, 4),
(11, 1, 'ORDER509', '[1]', 6, 7),
(12, 2, 'ORDER349', '[]', 7, 9),
(13, 1, 'ORDER781', '[3,7,9]', 8, 6),
(14, 1, 'ORDER058', '[]', 5, 8),
(15, 3, 'ORDER930', '[]', 9, 3),
(17, 2, 'ORDER019', '[]', 1, 9);

INSERT INTO `rate_res` (`rate_res_id`, `amount`, `date_rate`, `user_id`, `res_id`) VALUES
(1, 9, '2024-07-22 14:44:14', 1, 3);
INSERT INTO `rate_res` (`rate_res_id`, `amount`, `date_rate`, `user_id`, `res_id`) VALUES
(2, 4, '2024-06-20 00:00:00', 2, 5);
INSERT INTO `rate_res` (`rate_res_id`, `amount`, `date_rate`, `user_id`, `res_id`) VALUES
(3, 4, '2024-05-12 00:00:00', 3, 1);
INSERT INTO `rate_res` (`rate_res_id`, `amount`, `date_rate`, `user_id`, `res_id`) VALUES
(4, 5, '2024-07-02 00:00:00', 4, 7),
(5, 3, '2024-06-22 00:00:00', 1, 2),
(6, 4, '2024-07-01 00:00:00', 3, 8),
(7, 5, '2024-03-15 00:00:00', 6, 1),
(8, 4, '2024-05-08 00:00:00', 7, 9),
(9, 3, '2024-02-10 00:00:00', 9, 6),
(10, 5, '2024-06-19 00:00:00', 5, 10),
(11, 4, '2024-06-27 00:00:00', 2, 14),
(12, 5, '2024-06-12 00:00:00', 4, 16),
(13, 3, '2024-06-25 00:00:00', 1, 18),
(14, 5, '2024-04-20 00:00:00', 8, 12),
(15, 4, '2024-01-25 00:00:00', 10, 15),
(31, 9, '2024-07-22 14:47:18', 1, 4);

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Pizza Palace', 'images/pizza_palace.jpg', 'Delicious pizzas made with fresh ingredients and a variety of toppings.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Noodle Nirvana', 'images/noodle_nirvana.jpg', 'Authentic Asian noodle dishes with bold flavors and generous portions.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Taco Fiesta', 'images/taco_fiesta.jpg', 'Lively atmosphere with traditional and creative tacos, plus margaritas.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'The Curry Corner', 'images/curry_corner.jpg', 'Exquisite Indian curries with fragrant spices and a range of vegetarian options.'),
(5, 'Burger Barn', 'images/burger_barn.jpg', 'Classic American burgers made with juicy patties, fresh toppings, and crispy fries.'),
(6, 'Sushi Symphony', 'images/sushi_symphony.jpg', 'Upscale sushi restaurant offering fresh seafood, creative rolls, and traditional Japanese dishes.'),
(7, 'Crepe Heaven', 'images/crepe_heaven.jpg', 'Sweet and savory crepes made with authentic French batter and a variety of delicious fillings.'),
(8, 'Happy Wok', 'images/happy_wok.jpg', 'Healthy and flavorful stir-fries with fresh vegetables, protein options, and homemade sauces.'),
(9, 'Mamma\'s Kitchen', 'images/mammas_kitchen.jpg', 'Homestyle cooking with comforting dishes like pasta, lasagna, and slow-cooked meats.'),
(10, 'The Grill House', 'images/grill_house.jpg', 'High-quality steaks, seafood, and other grilled specialties in an elegant setting.'),
(11, 'Burrito Bandits', 'images/burrito_bandits.jpg', 'Large and flavorful burritos, tacos, and other Mexican favorites with fresh ingredients.'),
(12, 'Pasta Paradise', 'images/pasta_paradise.jpg', 'Italian comfort food with a variety of pasta dishes, sauces, and fresh seafood options.'),
(13, 'The Ramen Shop', 'images/ramen_shop.jpg', 'Authentic Japanese ramen with savory broths, perfectly cooked noodles, and customizable toppings.'),
(14, 'Falafel Frenzy', 'images/falafel_frenzy.jpg', 'Delicious and healthy Middle Eastern cuisine featuring falafel wraps, pita bread, and fresh dips.'),
(15, 'The French Table', 'images/french_table.jpg', 'Romantic French bistro offering classic dishes like steak frites, escargot, and decadent desserts.'),
(16, 'Taco Tuesday Everyday', 'images/taco_tuesday_everyday.jpg', 'Casual eatery celebrating tacos every day with creative fillings, delicious salsas, and refreshing drinks.'),
(17, 'Dim Sum Delight', 'images/dim_sum_delight.jpg', 'Traditional and innovative dim sum dishes in a vibrant and bustling atmosphere.'),
(18, 'The Healthy Choice', 'images/healthy_choice.jpg', 'Fresh and nutritious meals with a focus on healthy ingredients, dietary needs, and delicious flavors.'),
(19, 'Coffee Corner & Bakery', 'images/coffee_corner_bakery.jpg', 'Cozy cafe offering delicious coffee drinks, fresh-baked pastries, and light lunch options.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(11, 'Pizza', 25, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(12, 'Burger', 20, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(13, 'Pasta', 18, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(14, 'Noodles', 15, 4),
(15, 'Salad', 12, 5),
(16, 'Soup', 10, 6),
(17, 'Burrito', 22, 7),
(18, 'Sandwich', 16, 8),
(19, 'Wraps', 14, 9),
(20, 'Fries', 8, 2);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Kermit Shepherd', 'id.sapien@aol.ca', 'FWD94JJR7RQ');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Yael Sargent', 'mi@protonmail.edu', 'DKB18GUU7BW');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Allen Randolph', 'eleifend@google.org', 'WRT98MAN4HG');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Maisie Ross', 'purus.gravida.sagittis@google.com', 'HCO07LHK4FW'),
(5, 'Addison Carter', 'vitae.velit@aol.edu', 'COR42MMK6LV'),
(6, 'Shannon Aguilar', 'purus@icloud.org', 'UGJ38VBB3OE'),
(7, 'Dorothy Stanley', 'mauris@outlook.org', 'GYC91EHS3ID'),
(8, 'Cora Bender', 'id@hotmail.ca', 'RVF58KOS1NC'),
(9, 'Kuame Robinson', 'egestas.lacinia.sed@google.edu', 'QHR54DJJ0MO'),
(10, 'Rebekah Young', 'duis.ac@yahoo.com', 'SRH11GOO1KU'),
(11, 'Curran Thompson', 'tempor.lorem@yahoo.edu', 'JLU41VGE9KX'),
(12, 'Hiram Byers', 'in.at@hotmail.com', 'KJS56GEL1OV'),
(13, 'Jordan Holmes', 'magna.suspendisse@yahoo.net', 'IAE87DLV6LK');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;