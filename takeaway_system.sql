-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2020 at 11:15 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `takeaway_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `food_order`
--

CREATE TABLE `food_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_ordered` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food_order`
--

INSERT INTO `food_order` (`order_id`, `customer_id`, `date_ordered`, `status`) VALUES
(1, 1, '2020-10-07', 'PICKED UP'),
(2, 1, '2020-10-08', 'PROCESSING'),
(3, 1, '2020-10-08', 'READY'),
(8, 1, '2020-10-08', 'READY'),
(9, 1, '2020-10-30', 'READY');

-- --------------------------------------------------------

--
-- Table structure for table `food_order_item`
--

CREATE TABLE `food_order_item` (
  `food_order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food_order_item`
--

INSERT INTO `food_order_item` (`food_order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 51, 1),
(2, 2, 51, 1),
(3, 3, 51, 1),
(4, 8, 50, 1),
(5, 9, 51, 1),
(6, 9, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'C8mqMufFAH7IQI9zrOvglRVG771FedZRywg4rcytw7H7GAXBh9eSGV3G0oW2fcJ82hdLO3buQykJWFGlVd6P6QQz0MXTRr2XQ8hFgC9preTJGjhxAQaEvybEZGcMSaHJfXwM1BfH4TgataNmkxRHDBIuX58z5fwHknvqrImMWU9X8OT4Y8j43FejKWiYs5WZLK7Kob3CGFcOO5xUlZfk0BMCbPWOdPp52WdMSqtRh9Vjb8PVygUNjewyHkZPiw5a', 1, '2020-09-24 15:44:55', '2020-09-24 15:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(117, 7, 1, 'iPhone 6', 'https://nandos.com.my/', 'catalog/nandos.jpg', 0),
(116, 6, 1, 'HP Banner', 'https://www.mcdonalds.com.my/', 'catalog/mcD.jpg', 0),
(115, 8, 1, 'NFL', 'https://kfc.com.my/', 'catalog/kfc.jpg', 0),
(114, 8, 1, 'RedBull', 'https://www.texaschickenmalaysia.com/', 'catalog/texas.jpg', 0),
(113, 8, 1, 'Sony', 'https://marrybrown.com/', 'catalog/mBrown.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(60, '', 0, 0, 1, 0, 1, '2020-10-02 14:13:40', '2020-10-02 14:13:40'),
(59, '', 0, 0, 1, 0, 1, '2020-10-02 13:26:09', '2020-10-02 13:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(60, 1, 'Rice', '', 'Rice', '', ''),
(59, 1, 'Noodles', '', 'Noodles', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(60, 60, 0),
(59, 59, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.61250001, 1, '2014-09-25 14:40:00'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2020-10-30 05:35:37'),
(3, 'Euro', 'EUR', '', '€', '2', 0.78460002, 1, '2014-09-25 14:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `safe`, `token`, `code`, `date_added`) VALUES
(1, 1, 0, 1, 'Lim', 'Lip Joo', 'abcd@gmail.com', '0124932311', '', 'f898ac8013e81f5f768c26d7295b83046a88cce2', 'Rn2MAXltd', NULL, NULL, 0, 0, '', '192.168.0.137', 1, 0, 'dsH2szF-wAY:APA91bGtL1wmQ8yDUZ11O4b6ewwoYj66BIM5q4WXXNZ6PnZ8Ntjvo6SzYaAqfzlodDcKq2c3TK2xdME8C53hUSxj0fVZ-ftsR25LkKeUUI0tycXM1YKuwXFFN36n8bvOkqX3cJdVlPHS', '', '2020-09-30 16:05:02'),
(2, 1, 0, 1, 'Lim', 'Lip Zhi', 'cdef@gmail.com', '0124983212', '', '913137fc7e0ef991a4c5c27a5c68f8835bf7de94', 'gYMhdaoBn', NULL, NULL, 0, 0, '', '::1', 1, 0, '', '', '2020-09-30 16:13:59'),
(5, 1, 0, 1, 'Lang', 'Long Ling', 'pfer@gmail.com', '0124736211', '', '7e0807f26935c26ca6470f9599c665961bb1c3ac', 'tccSC2AH1', NULL, NULL, 0, 0, '', '192.168.0.135', 1, 0, '', '', '2020-10-01 14:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_affiliate`
--

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_approval`
--

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '::1', '2020-09-30 16:05:04'),
(2, 2, '::1', '2020-09-30 17:40:39');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2009-01-06 23:26:25', '2010-02-26 22:33:24'),
(4, 'UK Shipping', 'UK Shipping Zones', '2009-06-23 01:14:53', '2010-12-15 15:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_category`
--

CREATE TABLE `oc_googleshopping_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product`
--

CREATE TABLE `oc_googleshopping_product` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `conversions` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `conversion_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_googleshopping_product`
--

INSERT INTO `oc_googleshopping_product` (`product_advertise_google_id`, `product_id`, `store_id`, `has_issues`, `destination_status`, `impressions`, `clicks`, `conversions`, `cost`, `conversion_value`, `google_product_category`, `condition`, `adult`, `multipack`, `is_bundle`, `age_group`, `color`, `gender`, `size_type`, `size_system`, `size`, `is_modified`) VALUES
(1, 50, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 51, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 52, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product_status`
--

CREATE TABLE `oc_googleshopping_product_status` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product_target`
--

CREATE TABLE `oc_googleshopping_product_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_target`
--

CREATE TABLE `oc_googleshopping_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused',
  `date_added` date DEFAULT NULL,
  `roas` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_shipment`
--

CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(52, 'Egg Fried Rice', '', '', '', '', '', '', '', 1, 6, 'catalog/friedRice.jpg', 0, 1, '6.0000', 0, 0, '2020-10-02', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-10-02 14:14:11', '2020-10-02 15:38:40'),
(51, 'Char Hor Fun', '', '', '', '', '', '', '', 1, 6, 'catalog/charHorFun.jpg', 0, 1, '5.9000', 0, 0, '2020-10-02', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-10-02 13:49:06', '2020-10-02 13:53:46'),
(50, 'Char Koay Teow', '', '', '', '', '', '', '', 1, 6, 'catalog/charKoayTeow.jpg', 0, 0, '4.5000', 0, 0, '2020-09-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-09-24 15:50:12', '2020-10-02 14:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(50, 1, 'Char Koay Teow', '', '', 'Char Koay Teow', '', ''),
(51, 1, 'Char Hor Fun', '', '', 'Char Hor Fun', '', ''),
(52, 1, 'Egg Fried Rice', '', '', 'Egg Fried Rice', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(50, 59),
(51, 59),
(52, 60);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(50, 0, 0),
(51, 0, 0),
(52, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(50, 0),
(51, 0),
(52, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_seo_url`
--

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(730, 0, 1, 'manufacturer_id=8', 'apple'),
(772, 0, 1, 'information_id=4', 'about_us'),
(828, 0, 1, 'manufacturer_id=9', 'canon'),
(829, 0, 1, 'manufacturer_id=5', 'htc'),
(830, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(831, 0, 1, 'manufacturer_id=6', 'palm'),
(832, 0, 1, 'manufacturer_id=10', 'sony'),
(841, 0, 1, 'information_id=6', 'delivery'),
(842, 0, 1, 'information_id=3', 'privacy'),
(843, 0, 1, 'information_id=5', 'terms');

-- --------------------------------------------------------

--
-- Table structure for table `oc_session`
--

CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('003b1d2eb36ecf23fa44ded602', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:43:20'),
('005edf3e4a00b8195330ad42fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:28:44'),
('00614657b2adfbe9806d99d54b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 06:04:08'),
('00ae239571cacc3d961b42b477', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:30:11'),
('00b164b29632bb0639ea71fa4d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:35:28'),
('00b63f00cb0fd05843f948b806', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:18:04'),
('00e0285b12be964a3c2f689b53', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:26'),
('010db0754234d060921d5a369f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:42:20'),
('015deb83e1223c1a0e16aa3560', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:13'),
('01723bb96d9e73dabdfc735bdd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:07:46'),
('017fd30be33a853e2296932002', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:43:45'),
('019b1814e9c5ebc454d27ba269', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:10'),
('01a80b8b2233a43a6bdb0aca02', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:46'),
('0205ba95262cb88aea5a40dbd8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:19:55'),
('020c1da156291a727c3ef26138', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 10:00:39'),
('020db57ace3fc2f5b2547eb113', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:54:14'),
('021a5f13cecec09dcb3ada66de', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:12:20'),
('0221b61429fe342fd08d361d33', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:09'),
('022672699107d94aa3febc1c2f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:05:15'),
('02310799b594db04d98b1fc27e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:09:04'),
('023829c950f1790c8bc904bc62', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:33:00'),
('0242b711d95ed9ccfa891b64c4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:38:14'),
('024950ef1f9aead9cb7c1f9058', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:06'),
('025ccdf9de22cebbff9ef095a8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 09:43:11'),
('02da1f4a017787521e68b12d22', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:41:00'),
('034f1bd64b2388fc8ddd9d15ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:44'),
('0358c8ca885136ef61424a6354', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:30:26'),
('039bfd5ee0afb79319ba6c90a5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:38:00'),
('042cdf381dc9db042143b26384', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:11:23'),
('04a2d1fc927170b1bed1613dd6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:55'),
('04c49ce201eb7c80422205422d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:02'),
('04ec5cfc44f8d8b97783cf14ef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:55:42'),
('0516beaea86d86b1f4480a6106', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:49:22'),
('05296ed6fd79b9c54d272ebed7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:00:06'),
('0549df2898d2ebf52263d98fd2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 12:06:39'),
('054b76df3d321672ec64e5a04a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:31:56'),
('05658c77a3a7342733d9297fec', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 05:27:34'),
('056f332021caeea07993122914', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:43:20'),
('057384c3e4655fa4a39d49a8e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:08:06'),
('057406b4751bdcbc1b2008c84a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:20'),
('05882a78614a1bebb6f1a3b573', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:20'),
('05d6c4c630388a9780e10b8114', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:43'),
('06147b516da91044b30fdae542', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:47:07'),
('0647866d714e9490ce42d0f776', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:57:53'),
('06aa829e65f831b4668883f8cd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:51:10'),
('06cd9e90715088a441da49c10d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:41'),
('06f004de0f457dfe64e7704cc7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:01'),
('074432af96634fdd3bc26378e8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:57'),
('078233eee5297770998e94218d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:08'),
('078ceabcb7a22aebbbacf93ec1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:10'),
('07a75e99e55ffddba7729ec771', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:32:10'),
('07ad3a44266ff2af0a1d780640', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:51'),
('07b66eea7d708e81700680c4d7', '{\"user_id\":\"1\",\"user_token\":\"yOXdzF7JN7cNcWaAkZWnR41m4PutulMJ\"}', '2020-09-24 08:14:22'),
('07b90a7753e7b73e5a9270a799', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:28'),
('07d215d4c73b4f081591a60dca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:06'),
('07e848e6a2a9197de50a551c4d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:43:12'),
('07f001f245662fe574a78b4a25', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:48:23'),
('081d31091e4e38747b60edd570', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:02:03'),
('085704f9042237c4ad402f4083', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:39'),
('08764522f282d909662f59dd1d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:21:54'),
('096c5b849218cc8ea11d8ccd19', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:19'),
('0a4f696558debb55f801e7440c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:39:52'),
('0a5d26180dedcb0878a778147d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:39'),
('0aae4427edc6a6a18065af0484', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:18:32'),
('0b563379e8de06e11d7a9659b9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:59:23'),
('0b6d94041e484f582c31b1b9d6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 05:48:41'),
('0bbbbaf1f84afa3c74e5c6e0b5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:42:21'),
('0c2ac134afbd193e6dd65d4d90', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:26'),
('0c9f7adeff5a614191494ce45f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:12'),
('0cb73496a301fa88eea9597892', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:49:26'),
('0cdea99ad7290aaf00231217f1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:48'),
('0cf502042813f3f21b120f8c07', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:45:13'),
('0d290b9c484d037c48c49cacd0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-09 06:39:27'),
('0d5e75299660627f70f2e2d98d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:23:56'),
('0dabee817671fca01441d61c73', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:33:59'),
('0de42aa85a5f606532e0f059e1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:42'),
('0e175d2e74ef83ad22388b824e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:18:02'),
('0e2f5b30a21fcbefaf66344aac', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:37'),
('0e391ac98492ad60b3c73ba897', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:39:28'),
('0e49484800e8fefdfcfc5e9b66', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:51:51'),
('0e5ba4185c0ba6c4893b9ae2b5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:42:54'),
('0e5c257aa9eaf7a9030df3e383', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:49:33'),
('0e867d04e96d2a2c8cee79d742', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:16:29'),
('0e8c1c1e502cccc378ef7a97e7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"2\"}', '2020-09-30 10:06:11'),
('0ea1c161f89c7ddd10ccaadb11', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:20:36'),
('0eb44e24f1533fb9a8bd810abc', '{\"user_id\":\"1\",\"user_token\":\"sbYTGD8llQGeohNufl5pLMMUWNsApLXY\"}', '2020-10-20 09:11:56'),
('0ed0d171a7c355106ca341edb9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:27'),
('0ed41c9a28d30fcb871c022350', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:47:39'),
('0f32fd4a06602e7a37788ecb62', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:18'),
('0f5ff85fab2ded75262b20be4b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:41:54'),
('0f61676e39d13b968dd039e025', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:42:20'),
('0f7a46830eeca6148d8c9a55d6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:30:11'),
('0fab1b68897843675e12d4fcb6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:24:51'),
('0fe50aa632ff5c29c0db80d7cf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:30:27'),
('10192c0dfcbe7eb77afb8185aa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:17:15'),
('1070f4ffe0fde50f1d9748be3f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:46:46'),
('10a0edd23750b1b980dc5e4119', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:57:33'),
('10a132749619bd0f83c29c01ea', '{\"user_id\":\"1\",\"user_token\":\"rDpVyUO8Kv8cDZWdNt6IJVhw0AGackrx\"}', '2020-10-09 06:32:26'),
('10c87001fe62f8b2a8af027781', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:05:18'),
('10f184cf8d8de308085a978aca', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:40:34'),
('112c0d71a1ef09f2adf79d2a99', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 10:40:31'),
('1169cc4e9b63e44e48a566c0ec', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:40'),
('1170f0ea3ffaa585cceb562d61', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:15:10'),
('11715fb33c9fc37d72711a9c88', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:37'),
('11998a75b7038b641ab704c28d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:21'),
('11c56f87e9610e869933e88dfa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:36'),
('11c6a61ca32c218dde4576fdce', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:29:35'),
('11e94aa213432270a14f5ed438', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-20 08:55:36'),
('11f5db98f4c7120e05cde4df21', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:10:36'),
('1252d68f139c7c980a4533065a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:44'),
('126dd45e3c9704fb565745167d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:20'),
('126f4ccf11273d8f90ca15362a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:34:33'),
('1288de3b9faff623bbbec6a418', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 07:22:13'),
('12ccb39b83547a1b984d1d428b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:54:17'),
('1310da28ca3fa405aa09111ec1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:42:56'),
('138d62d5b5ba8333fc8993fa13', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:42:20'),
('13c7c786d9f26f9936a9c7b2f6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:13'),
('13c8246d8969a4ed92357c6e59', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:20:41'),
('13da76ac1e75e72a1f461115bb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:05:39'),
('13f5d376eb871ee24e86103356', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:22'),
('142d9517ce1400787dc4c96046', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:51:24'),
('147a33933f961f58492c7911ea', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:31'),
('14989ee4e6001bfa6cee8fd0ff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:50:32'),
('14e745d85566caae597cde2981', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:21:52'),
('152110d14ff394c94c2e53167d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:46:45'),
('1534e25bdbd56fe8e3574224b3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:51:58'),
('1575d43124ae6786ea83b9ad8e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:42:31'),
('161b1c813f873b733c39c8f644', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:05:38'),
('16387c7d77fc1bce80b4f04bb4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:58:41'),
('1704c8bb0b5070bea4d3de4ab6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:55:11'),
('17277120c244b5c9aaa3d3d4b5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:53'),
('17278c68bfa098a86ac6f3a281', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:44'),
('17ac71504e9ca8421b76517bf0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:02:32'),
('17b93f45ddc49338b3bf284e41', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:15:11'),
('17c73b00c87fc537b8e2365801', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:15:58'),
('17f46d13d716956efbbbd27ec1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:23:10'),
('183c8846c6236a81df56f55175', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 10:43:25'),
('1857a10da2da3f60fb08c23e4f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:21'),
('185a84842ad678e655972c02a5', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:37:39'),
('18705bda7cf7fbd762152128e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:52:33'),
('187440a7a8e4d4e19a60073366', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:33:26'),
('18986d1097441aba5f6f23fb79', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:34:19'),
('190d1c7c451670366ef67dd3a6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:53:00'),
('191a1c147bdba55a681572842e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:41:54'),
('1921628d2312dad4a841a27482', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:01:24'),
('19302de77bc7851998fc914737', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:19:15'),
('1981d14d117f2ce1c733703106', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:14:26'),
('19aad5b071047c8d48e3a528d5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:46:41'),
('19c50ef93cb645880abbe44de6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:27:54'),
('19fc0993985f3d2d7799cfaf41', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:56'),
('1a0ffc2b3ab58247a2fd256c44', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 03:41:53'),
('1a42aa8fe70a71b95790372df7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-30 06:10:35'),
('1a505f5d7c8c06504044ab5192', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:54:46'),
('1a7460392f64417a5611a4b403', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:07:46'),
('1a9010721ba35703fb68205ade', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:46:41'),
('1aa6f78a27b8fdecf6b89fc13a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:05:56'),
('1b1d5c5a764ac1e294e0f1d06b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 07:46:22'),
('1b85e0991e0a82a2c18f84f48b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:42:25'),
('1b99b66bb262872d82fb4021f5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:02:15'),
('1bb742e2daec3b099b631809fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:33:53'),
('1bb7af32e49341b0dd1f627e68', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:38:56'),
('1bdad74005692ceb836e1249f9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:09:04'),
('1c19e87fa45ca9263eae994d7a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:08'),
('1c5bb2039c81b238fdac04b724', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:03:37'),
('1c5e2a17147fc868bf44e9140b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:33:00'),
('1c67ca8051289212ab180240f3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:11'),
('1c78cf31219093b473e9d89400', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:37:54'),
('1c8cbfca4241d89038b8ddc5d5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:10:46'),
('1c9e7c5978603e8c2095848a52', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:16'),
('1cc3595a4ba428c54b1e80da82', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:34:35'),
('1d4221d33a521b4ef1c4f15e38', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 07:03:48'),
('1d4f3365a2dba1afae8ba2ee14', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:52'),
('1d842f0f10bed7d521f4ba32ef', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 03:40:12'),
('1db1da11ee48447723dab64449', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:37'),
('1dc2d505658b422f4ae460b124', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:36'),
('1e2da6f27c6d044d17e92c05bb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:50'),
('1e497e1a231edd3a7414540466', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:42:45'),
('1e895283751bd3e75239edd968', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:40:01'),
('1ece1d0b88155670107965c6ba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:26:43'),
('1efea043b29d124d564edfc47e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:50:44'),
('1f2005a97c3c7086fdc2dac30a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:02'),
('1f3fefe696a642e40affd40cc3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:18:06'),
('1f6543538b274359fc90f76145', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:02:12'),
('1f7c3a5496102f0f2ca5372dc9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:17'),
('1f8259a61637de4fabf73dc634', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:34:56'),
('1f8f67efce9afb16ee338071f1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:21:09'),
('1fd88280d0f277770e9d26d570', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:18:33'),
('1fecda8f5f5d038c4eae763fb6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:23'),
('2006ce3cd2a71158749b75504f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:02'),
('2047da4b5451c66bb64ff43ec7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:33:26'),
('206080c42eca2ac9a9371673d2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:28'),
('207e3163a6106d39380cafcee8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:34:13'),
('208f7722f24303abbb02a13233', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:32:29'),
('211274f325265e169856e157ff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:31'),
('2119183fb816972b122eccfef3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:39:38'),
('21a28c272e9f2fd8d356ee9e98', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:27:29'),
('21a4c520a057b651dd3ab93a32', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:52'),
('21a5c311f63199455e789cc09e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:54:46'),
('21b29d0d6063455d84a8a47b34', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:19'),
('21d73712187d44762b561e2595', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:58:03'),
('21ea4277db8b661ebbcddf9ec6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:57'),
('2225f509c8b9243dbf177463f0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:34'),
('2271efc0839e77a54b666873b7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 07:59:06'),
('228b37c31106c863fd83ccc670', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:40:39'),
('22b129213bb448b73ace9487b7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:42:23'),
('22bae656ff81c5b43967f8e858', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:00'),
('22cda6ece2b3c9a78b00add3cc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:52:23'),
('22fd2813aeb2bfb5a16b2c0895', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:09:45'),
('2312104369347fe02336523424', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:31:07'),
('2341a3324435c70e7615d13ef2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:57:17'),
('23f09dd6aba3a469c5ac8c85e1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:18:17'),
('240bf26b8dbd6d6963018050b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:47'),
('242310279aaf663caedc98a5d2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:18'),
('24730a4e0a0dbc7b63b555ecd0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:17'),
('24a5e315c895f1ba661e79de22', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:54'),
('24c648453c0790a51b2a3211df', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:19'),
('24d61abdfca714a4d2134c542a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:00:43'),
('24e8e29bee28652d8ff4207de0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:05:24'),
('252c7544ef0694b91c19cc5b7e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:53:05'),
('256bfe028b657e04622030da7a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:10'),
('256da8ec99a7daef268d854138', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:07:40'),
('25dd4bffdeb736d1359280519d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 10:19:27'),
('25f60aec01f1f084895be55ce8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:54:44'),
('261c9d0e0613cc1095b7b495c8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 12:03:10'),
('261f6baea85b3c6813dbc58d81', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:14:26'),
('262d7575ec53371cef51ab1a25', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:14'),
('26365164ea790220bd95bd251e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:40:25'),
('26578d85fbfc30e08a9de21431', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:20:43'),
('2684f40bb71b5911c76f1fe24c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:47:25'),
('26b0bc0d455bc893d4f5b488ff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:22'),
('272538c3cb12e0964ee6d1bde9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:32:10'),
('2778dbc43a16f4cc5b4a86d621', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:05:30'),
('2785f9ff5bacbb5efc65e72acc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:18:16'),
('278de56ce39215f4cf580455b3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:30:43'),
('278f4c25129c227f6fd30feef0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:20:42'),
('2797615171ce19d87e0154a106', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:51:14'),
('27ec6856ac6135b47a46334059', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:58:42'),
('27f21464400c2f39b7aa934071', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:30:35'),
('2812d0f2b93ef3b28d24337e1a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:08:52'),
('282a5144496647a40bfc059e7d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:49:22'),
('283e9826008af88c609c0fad5c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:40:49'),
('28402db5130870565c05a96d52', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:25'),
('28777407b5141c35c355b19fda', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:57:01'),
('28983c3cfb0b9446fbf03462f6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:56:21'),
('289d3130fdcc91366e8838bb65', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:37'),
('28dbc3011d56035886b0473836', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:18'),
('2914794478b58c8bbefc21114b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:35:54'),
('292d24fea1684a3ce4c5f89ed7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:31:19'),
('292d7c6afd3cf6595b4ef00812', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:36'),
('2932c9364bc550d2e302b2634f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:21:59'),
('29828e9cc4ca51dc5ea6797fe4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:55:51'),
('2a43bb8870eba2c7e5999127ca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:16:31'),
('2a51778ae4b8eff6724eac6f90', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:21'),
('2aa1401e6841af5bffd215c2fa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:37:51'),
('2acbe2f6d4aec68a62d006be4b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:47:24'),
('2ad58022c2701282ac4138b912', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:58:57'),
('2ad63aca99ad69e1ab48ae7100', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:05:29'),
('2b086be6a2ff4c719533676ea5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:28:15'),
('2b276dd54e63f4b33ea10684e1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:39:22'),
('2b32d3b04a0f6c7897bae02064', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:08:06'),
('2b3bab352b7aacb1399cbf7c11', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:43:15'),
('2b5876dab47db9aa45801d3510', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:20:37'),
('2b76da4fba07c2af9de4cc7708', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:14'),
('2b7d6df28bafead3377488a8ad', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:52:23'),
('2bd3bec60bbf5daa32a8784499', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:27:34'),
('2be01fea5cb12d4ccd418a373d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:31:08'),
('2bf10d160aa4901654694c6db6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:09:51'),
('2c51d5d96e2dd06fdf5628fdfa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:17:21'),
('2cc2b20cc9de4b2d6fa239b1a9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:31'),
('2cdda7f1606c7d1b5f96f7e8d1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:15'),
('2d0be78da6f8bf1bae222569bc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 09:50:07'),
('2d4a7d839aaa254afce55898d2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:11:04'),
('2d6dd64b93a70b468fcfd52580', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:19'),
('2db09ff20b52f983e2dbb9bac3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:23'),
('2df47d6ec52760d1d780e979c3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:06:15'),
('2e1a9a85b61b0656808ef0f692', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:10:05'),
('2e3b2baa1806d8f184205733bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:27:19'),
('2e9f2fb7ab256f1e0188ef70c5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:21:55'),
('2eb447e9f9d2fabba516c5ffd2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:18:04'),
('2ec7e538f763bb8babed524c05', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:09'),
('2f0970ab366129d2bfa57f68c3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:46'),
('2f55df035243452024afdebb6e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 05:24:54'),
('2f9d083a1312c77f99c953c846', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:18:26'),
('3013a1785917c83ed547bad3db', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 10:00:39'),
('30267d57e07c677dbebd283991', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:18:06'),
('302af3283d1e69ffbbc9a2257d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:03'),
('303ec82722f38d9f9214f060bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:34:16'),
('3074f79e4777da794cf4a97ca6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:46'),
('307a371287260d9d9c840a3154', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:09:53'),
('30a6d8f559961e1ec0f2607356', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:46:59'),
('30b904f1815181b4b9bb2c22ba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:52:27'),
('30e27d0d1611b615b180b6a809', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:49:26'),
('30f2f983686df0e82c664057bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:43:33'),
('311edaac77da7d0ddf93b9e6f8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 07:39:44'),
('313ce9f6c4c7f156f56e1e10e4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('314414dfac8b851143134b6e6c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:07:46'),
('3152c36c1ec115a872766716d6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:26:26'),
('31618080a7c990579532f57f2a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:35:33'),
('3170c6439d07c9d380f93d6c0f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:24:18'),
('317b880d87b25dfdf72a2348d4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:12:19'),
('3180b809f584c01ada84307afd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:42'),
('3194dc37681aecfe07b36f5c1e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 06:01:30'),
('31a77bc64cc23fd9dfb4cdaebd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:31'),
('31a80680057d2f7fa5c7a809a9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:48'),
('31bc4631cfea63de9c64d38a12', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 09:56:19'),
('31ea02613027191f1594a105e3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:53:18'),
('3208d537902ae1d41ad8ed912c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:01'),
('321525d5033b4ffb3ac07c7445', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:20:20'),
('3215c8ffb86bdb31f33bc522f8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:02'),
('325621199bc396f5ac8991260a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:22'),
('326afb68e4295528dd738f5131', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 12:01:46'),
('3280328b180cf728f0712e6da2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:48:45'),
('329c5a455515873af3e2f9b243', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:50:55'),
('32b43d4e45936dcdb10e869a41', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:20'),
('32bc17190fd11400e946b2867e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:39'),
('32e56db1c9c3cacb785b314ca0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:28:15'),
('334c45edd4ed120ec8ecc5905c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:33:33'),
('337eaa62205a853b3554228379', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:40:35'),
('33d7ff9855fda6c84b707ec788', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:55:48'),
('33fe98a73d964d321e963dde54', '{\"user_id\":\"1\",\"user_token\":\"3Ug8RYjmuRmGhpTZ1bwxKilCWzGrkvIT\"}', '2020-10-30 07:02:45'),
('341b0803d67083aa13ad9dba55', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:14'),
('341e41bb469dd4ecc21d3001c0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:11:42'),
('3451a0aedfd78c84a7ed4103ed', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:41:29'),
('34c9628b96d5a0f3f06eb28f3f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:05'),
('3523be086c939dadce0d96e266', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:00:49'),
('35b73e2b00895d67ffa95be10f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('35cb515e2388ea9dc726814605', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-09 06:33:22'),
('36456b7e8d9c8c6a4f50425af7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:42'),
('3662c64109ddf654c266294aac', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:39:06'),
('367561b7ca6942909a75a70621', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('36eb60989731dc7af56c58e363', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:59:51'),
('36f31183a09a82beede8a47de0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:24:05'),
('36f7ddb9b6a2192c1b95c73bc2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:21'),
('370db59d4afe818d9a29e8ef64', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:00'),
('372cbc77001ab3cd8dfaa34a98', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:53'),
('37409ddc2da13e8bcc8b040e29', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:42:30'),
('376395c72b29bdc81b3f841f44', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:59:52'),
('379232ab8bfddaa6b6f24df07b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:47:25'),
('37a53e9bddcba7def836ba2174', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:09:03'),
('37ecb4778ade962b01f9c08c78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:40:57'),
('382b8c22103aba9734e46f423a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:54:44'),
('3846ba4bcf2536aa90d2b95fd7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:01:49'),
('38a7000c16b1e42328b362cb0a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:21'),
('390a7073283fc00a83c04ef177', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:20'),
('394996d34d6da2dabdb6fcd1fc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:04:42'),
('394aa7292875bfe8f2da23c387', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:05:18'),
('396f5ff68c3ac68022eaffc364', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:18'),
('397246e65391d8bd48f31fd90a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:18:22'),
('398ad6a7ba40eb8ace405884d9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:18'),
('39a268e0b1603749d978ede84a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:27:29'),
('39a83719bb0dac40ee00d3fd83', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:51:10'),
('39c1889b3e3153fc4f1687e663', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:04:09'),
('39f84392a92fba7ff9e1808af1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:12'),
('39ffc5cb69fb65fa75d92ea774', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:27:17'),
('3a12ed2b6189fd45b36bd67939', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:06:30'),
('3a176909d0820f9064b3a487b8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:21:55'),
('3a2561ce2b227ffb39bbba3b5f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:58:56'),
('3a412c715c789b8d4f4aa9879b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:01:04'),
('3a805aec9b3d6389a79e3dfd03', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:43:12'),
('3aa8789f7aeec867149cc9d9aa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:42'),
('3ac5dfd8399d16547a53135ebe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:52:54'),
('3ae83447f0388145e4b21e5389', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:53:53'),
('3aebc8b9c7bd6ab4fbb5a6f721', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:05:38'),
('3af92a411568f9129d812b735d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:05:56'),
('3b4ac344928d3b5b8890b0b13e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:01:24'),
('3b582d107f4f701641e9d60679', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:30:25'),
('3b95142d858b083fbb4903e460', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:55:31'),
('3ba922bde3f42eff3f6be194ed', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:36:55'),
('3bc4044b6cbe565780984d29e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:34:42'),
('3bd119deb59c6b62946645f8b2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:47:59'),
('3be59dd1276e93eb596587ab94', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:09:50'),
('3bf0f9fb4ba437c1c386e1093b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:23:05'),
('3c69f4f760400689b875b927b5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:02:32'),
('3c91611bb9706552f23c6835ca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:28:18'),
('3c9da86ad32541009673171b4a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:51'),
('3cb21b051a79c852918331f83e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-09-30 10:10:50'),
('3ccbc52399ded1596a58f6e36e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 03:45:49'),
('3cf40a0dabb1fe61a163311ec5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:51:51'),
('3d1f5b71738f300256e96cac68', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:39:57'),
('3d4561e516b546cb3d0fe6af12', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:18:50'),
('3d71bcb8a5f47bcb645620ba11', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:09'),
('3d8a3d25fbe012f5820be34f27', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:18:07'),
('3dba0d2657fdb9724bc544d65a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:48:43'),
('3e0b4d882a7175b027e0bdf541', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:05:24'),
('3e0feb9e9e7ea9d57da60f53e6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:05:15'),
('3e2d87fd609f92aa3b2bdc54bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:15:56'),
('3e3a54974750862fee2238f110', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:45:16'),
('3e3e68f0d6e4bc8a0a4cd7c7a4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:05:24'),
('3e5ce1a9383ba77e8b4961703d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:42:04'),
('3e8877c24f27691405df2d1fba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:04:59'),
('3ea7b62cb5f18b83e89f3d319f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:46:07'),
('3eaae5ff0e650bf6fee50eaf9a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:46:32'),
('3eaf2e487932da02f149b696da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:36:33'),
('3ed8c62d9a205215a87f20478e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:21:54'),
('3ee190375389dd271e56a93992', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:32:32'),
('3f2b3224e7ff3014a0893b8918', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:06'),
('3f3d3c2e6a62de0cba756eca6c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:48:23'),
('3f5c1160e0e51da5a9655b4d5e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:30'),
('3f7d656aa893400867c9a871f2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:36'),
('3fb86798187a4eb36e69a8c5c5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:55:39'),
('3ff5d9d1dd2be860f93386f965', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:06'),
('403de0bb453ebd742c6ad8986c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:49:56'),
('4058575d12fabfb2e49da5deb4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:58:19'),
('407a703440704076f7a3670028', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:31:19'),
('40a5c6dad1ee94fea87e069567', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:08:51'),
('40d49368d42a70f533aef7bd63', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:31:11'),
('40e4a8fca09358c908deb391da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:38:57'),
('413082edbe939d1c83fbf1a6ef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:46:32'),
('41534f522190daad33be78cc09', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 07:56:34'),
('4189cc02004b15b987ed74c5e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:15'),
('41c017262758a1e5bc0edfe33e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:39:01'),
('41d6deaa9f28a05b8eca34c20a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:42:02'),
('41ff9d4df9e6db816a4951083f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:15'),
('42390283443113f1fe220c45b4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('4270ef96a45f927cb671559392', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:48:29'),
('42cccbae03496087faee828b27', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:33'),
('434d07747c8b69637ba2c2e94b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:29'),
('439e6677c9f8e77e65ec752d5f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:09'),
('43a66a414a364172f222c98d30', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:39:38'),
('43d31f3d18b470505f2bc0cb79', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:30'),
('43f054a053f1cd591683c96f7e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:36:52'),
('445f2c6fcab00f13a1615a166d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:00:19'),
('4506c23d2a20a8c1d4778c3855', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:06:40'),
('4522e016ca186bb1fce2283bfe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:53:05'),
('453b34a51a37d5f119b91dd755', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:00:03'),
('45c03c8e555f382cc837b0a89d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:39:57'),
('45d2fb84276c4b69853b786f57', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:42:43'),
('45ee431a51d04e1f7d7fcd9034', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:30:35'),
('4603b2833d2bd63b0f19b21c04', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:23'),
('4607ffe4621b5cd6901cd5f87a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:00:03'),
('4646ffb42231c800dc42be39dc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:03'),
('464dba460cf9ecf560ca96e890', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:19:39'),
('4650fa23a479e58e6e4d4326e6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:40:59'),
('46650aaa91b2b65915392d1bca', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:20:04'),
('4666180f302b0e514c4723211c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:39'),
('468098ba23c54ee362fb2bdd6c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:52:39'),
('469190963f447a05dc98a37c35', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:21'),
('46cd500739e90c47cfd68488d0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:11:04'),
('46f2629893a38b4ebf1b8c4925', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:35:30'),
('46f3d24245b085b3324fc94df9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:09:52'),
('46f6de27d402eb6f524f453014', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:25:39'),
('4703c6e7c39f018cb7937317cd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:22:02'),
('471231c744b741108a8cd61f4a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 07:39:45'),
('4712d507def33c162ccf06aa73', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:19:11'),
('47813765d28702dd08213694bd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:31:56'),
('4799f6e2c038748622a414c892', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:32:28'),
('47e0baef2e8b6c362594b48693', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:33:26'),
('482faad419617c7bf448a787ae', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:00:46'),
('48adc6a1180b9814bdcbbe31fd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 10:20:19'),
('48cfcaad69426b7fc27adc49ab', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:23:51'),
('49e135d16064849b6f36b99048', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:35'),
('49e43552583e9777f6966787d9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:34:56'),
('49e55dd3863b4e0999ca1d0df6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:14:42'),
('4a12633e4f7ffb7ff508863e21', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:56:36'),
('4a3302960bc08a195e27b86e87', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:39:19'),
('4a5376edfad0779e740de63e22', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:49:56'),
('4a734fbaa41993b783abe582b4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:03'),
('4a93c56ec13e83019b3fed34ac', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:43:15'),
('4a9bd0e88032fd6fe73d57837b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:17'),
('4aea7e19526898b2568eeb72b1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:39:58'),
('4aeadaf8b3cc95cbb738f80525', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:54'),
('4aeba582bf2f3645d1fd0a639a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:12'),
('4b0160fb07103807b296257d82', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 07:07:59'),
('4b5b13bc09060834267b0307e3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:37'),
('4b64ee2cf1734c1bad5b019266', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:17:27'),
('4b7f8d5bdefa862d099053a81f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:30:44'),
('4b8c537cf012e10d26dc3a1b72', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:02:15'),
('4b97a25ada3a02861a0c3d83be', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:37:15'),
('4bc11665a0b65e233ab83dc401', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:23'),
('4c044a7816ff3264aaa444f067', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:28:58'),
('4c1fbf8e1c751cc05e0ea0f2ff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:00'),
('4c3805a9cc9dab3327f2bc2b15', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:22:16'),
('4c389a05930887b587977edb58', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 09:25:36'),
('4c76d5224df07a2ee830fec61c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:08:11');
INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('4c8d2a0b2a8a45e61009d63f5b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:31:19'),
('4c97fe08440a837d36be2d95c4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:00'),
('4c99034e515c094e5908d33780', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:37'),
('4cb31004b6c47037136e48b876', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:45'),
('4d196701438fb1363754e01180', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:19:11'),
('4d584dc561abfefa5baad55cd0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:13'),
('4d6d99b76fff77043bc6d2639a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:40:25'),
('4d71f1082dd150aef6b994cb0d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:17:33'),
('4d8eaccab0ac43eb696fad81c6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:42:49'),
('4d9ee7aa40adf5e9067a737e6d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 10:05:24'),
('4df5d64fe2fca5958efe0a7004', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:34:19'),
('4e06c8ea6f6d04bddd1897e6a6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:52'),
('4e3f7b13c620ed28a6e58a37bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:54:44'),
('4e6b49dd1bd46e6f8cfa5a2392', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:18:50'),
('4e77453a81edd05ed491dc2489', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:14:25'),
('4e926465f9e7e3dd240a9eeb08', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:49:29'),
('4e94c3a9f9b069f50f73cb459c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:17'),
('4ec226367028c1074864d81252', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:15'),
('4ec8ebceb4cbe084195bcc9966', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:40'),
('4ed81a246ab4f9b813a5f7b5f5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:01:47'),
('4f21f81af70921f2a5f4b5f3cb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:40'),
('4f60ec2fcf871c2851d7a9b057', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:04'),
('4f9ab28e11276900a77c1af9fc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:15'),
('5000a76683b25c9e30b58c9318', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:46:47'),
('5004bf442894ce89c3d557c7af', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:33:40'),
('507da155d5984a7555720ce57b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:52:27'),
('50bd21be2a92adb07ffd09b075', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-30 06:03:18'),
('50d5b5ae6c57e186da51cc2494', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:40:39'),
('50eef68acb044c72000a14e885', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:00:06'),
('50fc7315ade63346fe864a9a84', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:51:02'),
('50fd7b750248bdb1cd6e23fed1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:34'),
('5108b9844213a87626e394e2b4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:25'),
('51092708facd9f25c265c63729', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:39:06'),
('511e789bf90515c659047059f3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:03:27'),
('5158eaf3264046cdccffdd513a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:34'),
('51dbdb88486a361c162b6c7424', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:55'),
('51e83693bec8a2e8ad28eed386', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:08'),
('52057bc023a853ffd03db8eb45', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:08:11'),
('5241cd7a1b2f4c555106ea45a8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:31:04'),
('524f0a271a7f74fc705bd91656', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:52'),
('525118a0787bda4d9b35be7fca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:23'),
('52c04861dd7686f7362c0fd5f2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:54'),
('5310668b2df6b4acdcb4dcd1e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:20:18'),
('533ca7cb52988c0d254fb9a9f2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:06:15'),
('53450557b580569d5e4349edda', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:03'),
('534fedab62b8fbf996a8345af7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:49:25'),
('5361f4034dc4e2d78b8e62d5c4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:48:29'),
('5377eeccb960873d74a6172b49', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:33:00'),
('537dc6fa87e4e9dfce23f0cf48', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:10'),
('53a399973348a64ba49bb262cc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:16:18'),
('53f4dfa173d820a77ce426cad0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:46:32'),
('543838ae9c85cf57d06b868528', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:08:58'),
('54a57ab37bd3847d50bec73db7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:31'),
('54c03fd67af321f115e63814f5', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:38:00'),
('54d0755a35b076df88e30efd95', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:03'),
('54e2d423908346aff62ea8d91d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:25:00'),
('556310beaed92b658cc0ac009e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 07:05:13'),
('5571f4938b1e9a3d0fe5da2b18', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:42:43'),
('55794f5f8ccce0c93a8c079062', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-20 07:05:11'),
('557bab2e21f76449c06f3fded6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:26'),
('557da4266d12667cafc498561c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:52:29'),
('559fbd12351cbceb5fe7ba9288', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:42:26'),
('55f71c7118391aed160bae1d5c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:30:25'),
('56155d8fc5fe2cccd928ed9e4b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-20 08:34:07'),
('5616c01db1fc05a7463971812a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:45:50'),
('563fe576133a503f30063258c5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:49:38'),
('56613a02d3245d8c1ea83b0be8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 10:00:46'),
('56d216f9e9bd77c83c140405ab', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:35:33'),
('56ebde82e7ebca6e8152ca52e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:47:25'),
('573751679e888490e19c7252cb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:43:12'),
('5744a21358b4ce924e96407bd0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:10:46'),
('5761303b8c3491369a13cd21c7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:12:35'),
('5787e8e4daa82865c8f233ff13', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:01:17'),
('57a46cf43b123e5391b546014b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:11:38'),
('57afb77c431ba2fc7a55a0d50c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:30:26'),
('57efe7a4ef2da8fa69b2dc2c8b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:59:23'),
('5810be8bebecda4ee3477d468d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:38:57'),
('582772904281e781b1a7b42dc0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:38:34'),
('58297c005f8c5f3347a32ea583', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:30'),
('589b48d2666967e105da07639a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 10:07:40'),
('58bdca8388a10bcc7efa4e029a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:53:21'),
('58d96a528878f564cc2da382a1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:28:44'),
('590df34b6210987827fd6fc1dc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:44'),
('5926d40d3f28bf5722b0a055bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:23:56'),
('5938235c03e262bb8f88c17f05', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:01:18'),
('596d9d41429027ddaca2d96422', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:44'),
('59907d264b8fb33c55403a61da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:38:35'),
('59a5ac0783d123daa50c4d40fe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:18:50'),
('59b3a8497da330bea6352c9482', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:17:02'),
('59cb0bf119c825d076b6953647', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:02:13'),
('59e306be6e50de86b9966e56af', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:47:00'),
('59f2293894e1d233644e406de3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('59fb04420ec004a820f5bf5f11', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:47:24'),
('5a220accbfb29a635e83f2828a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:29'),
('5a3b0c74d3f3ccb42c9edeab50', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:49'),
('5a88600624529b3ac1a2ef9b65', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:44'),
('5a8f63a461e8b58655f9ccc7a3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:04'),
('5ab11eab298c34ea8bcca6f5c9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:24:52'),
('5acdf6651d6df58140d272e0ef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:38:48'),
('5ad1ab74df76fc69ce196722be', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:25:20'),
('5af7f361d6a3fdb2bff8fc554a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:49'),
('5b137bdcfcd6c63e92ff2db100', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:17:02'),
('5b2ce7c871619f9a37f14220df', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:13'),
('5b66b954f86aad733051d53462', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:08'),
('5b7b780fa6c4ae3a3617643af3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:54:13'),
('5bfc730465b27fc134b6ef2484', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:33:22'),
('5c6475b0029cdebad8781a99d9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:12:54'),
('5c894e998577468f663bfe5e0e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:40:49'),
('5ca0ffb3010758b9908c370fb3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:00'),
('5ce3535481b71e8b7030ae9459', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:12:00'),
('5d2c96a4b46f301ee2013ccd83', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:15:39'),
('5d4736a914da665a07c74a5c3b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:19:10'),
('5d8c87d32a414ba8557183e426', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:46'),
('5d90beab469f9e9cb326b7df76', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:56:19'),
('5d93bedb935b93c0ecdf0c66de', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:23:51'),
('5dd1a1fbd72384f5f8cbf20ebd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:20:18'),
('5df780ae4601fa828ad41a94cf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:37'),
('5e3253c0b201579459378ece7a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 09:00:36'),
('5e418f65ad7ab51125a33ab40e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:47:39'),
('5e717c1f240d41e8307037d633', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:05:40'),
('5e733242dd9b66f2ee1cad9ac5', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:15:46'),
('5ea1bd466bec9e79ee88e99e1b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:41:21'),
('5ea6abc5e875a29dc48713738d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:36:04'),
('5f3e7b45ad1b18f27252b53a7c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:37'),
('5f9b8aa3935b1885b16c4d66cc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:07:46'),
('5fd55889b5d9d017865f3d1ede', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:39:58'),
('5fe7b75d230243d10d132a69a1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 10:15:38'),
('6000230d6f5f27714bca3d35a0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:11'),
('602eb8c319f7d552c2b35c6104', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:02:32'),
('6032f0b93fe244f59f610c2a34', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 09:49:25'),
('60557410acf9f24102fda816a5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:36'),
('60661257b2e77e4fdb2f6d7c80', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:39'),
('611b37e6471587553406cd4d5c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:14:42'),
('611b5311760df75b3bd064d444', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:55:11'),
('611bfdb57e3a10f473f1d91876', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:02:20'),
('61210f01418772d1c9eafef884', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:18:19'),
('61bbda55e1cfc192905e2a824c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:41:43'),
('61cc843706beda5e3d39b9d5d8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:56:17'),
('61e278b2c0a6a88796c68cdcc7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:57:01'),
('61fafcca4f9180fbb4070e22d5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:10:22'),
('620ee124a513259e32358a3f83', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:07:49'),
('624735d143da28cdac74f8df00', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:34:13'),
('6253518f05fd86e6979f3b9ccc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:57'),
('6256c6d1be54438bf95a62ed38', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:46'),
('6269944e33a60e691354d7898b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:16:31'),
('628f1a18fa7840621c9160954c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:34'),
('62ad3ea2035334621510de6ed4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:56'),
('630f34b7d0a1b111d3ac874cd1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:40:38'),
('634553a3c3e2c09038880600d0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:55'),
('63a2a520fc3d009cbf07014ba0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:22:01'),
('63b931cb3da3d977d0a110f700', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:19:28'),
('640c20bb29613a1833492fc80b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:44'),
('641282da07ca7539d283ba337c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:55'),
('64395c6ecfe2a3bd2f36a97568', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:16:29'),
('6445db84c9c5330d1be614e698', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:33:43'),
('64574defc060c51f8f0a54188e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-09-30 10:33:49'),
('64c12e002c1df6ec44a529e2f4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:19'),
('650688d20d1d59b2e4f45278ff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:16'),
('6543a1153eb26b0b23fe539470', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:33:59'),
('654ccff136c08fb6e22228f803', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:58:24'),
('658aa516a22ee4abb156702c59', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:33:42'),
('65a1e0813480b97821e8673c63', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:15:59'),
('65b176497a346446527bb20a5e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:24:54'),
('65b3ca4b266353ee32847c8bc2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:20:07'),
('65e1cc7731cbf4c75532042c3f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:09:51'),
('65eb107c431509db924d8325cc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:00:49'),
('6611ca9ad9ef236c7290bb0684', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:53:23'),
('66ecdd5d122a918488e7a31f4f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:19:15'),
('66ed7aeaa9a5d672144ef46f2d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-30 06:12:00'),
('66f80c9facbb8e033958762f79', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:26:41'),
('671ef556e2ea18558f6b51904f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:03:27'),
('6721c78599bac7dc32a5c60365', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:23:55'),
('67432619624e9981493c89c881', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:33:16'),
('675d0d60a91b7e7424cdd1ae79', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:31:19'),
('678c23116b9257117252e95727', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:16'),
('67b302ba98f3be4792ee08c52b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:28:15'),
('67d026381393ea70f36a82483d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:49:12'),
('67dbab2e58e94785c2c03e7353', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:45:47'),
('67f6eeb5c96a6bf98874c360c0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:19:55'),
('6824a9b8a9c39919b141f90c82', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:27:19'),
('684b70a9528e744d31cb56e5a8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 12:10:46'),
('6855d415c4abdf0e93bb0440e7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:35:45'),
('689e5b9326c66086c3e0e9bc78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:56:05'),
('68a33285a756f8b00d3b6d9d5e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:31:11'),
('68a6fe17a4bd238054926dbed4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:01:24'),
('68cf8030156739129195382439', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:15:42'),
('68d1cd40a758fdfa4ad97113e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:16:40'),
('690dad6856be7b3f7af6680699', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:19:09'),
('692f71746c3d93f6976bd55687', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:16'),
('69b8041b1547a379549b4b0812', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:02'),
('69b9aa0774e73b93bdbc9854cf', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:27:29'),
('69c831281dab7b41ed44bf5e42', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:39:32'),
('69d8f1a945a5cb3425d587a454', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:06:44'),
('6a01869807d183eb69d24b0d33', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 09:45:16'),
('6a08b4a668e27d6e04cfe1ba59', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:46:07'),
('6a2581493d1b2143cc1964a744', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 12:09:02'),
('6b050e0e7ec3ec3a97011e438c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:36'),
('6b138f78a051ea113386dd7e4e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:05:58'),
('6b459bf498232ae0407390a3da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:54:45'),
('6b6d55fe6fc6c33a020b4fc04a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:00'),
('6b9ce9dd680a358acf78537292', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:48:24'),
('6bb2c6f27dbd87cdd14ae2f748', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:04:11'),
('6bc7cf2cac74e8fb5b85cdb415', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:23'),
('6c525d5f32ee09768e691478b3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:37:15'),
('6c6373dec98d181f96df34b38d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:39:22'),
('6c847ab9fef017942df1e688f6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:35:45'),
('6c91cf7f20bd6ef53c4c070f32', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:59:51'),
('6cc7149d64f7001e82ff601f71', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:46:05'),
('6ccbe3c1463499efa7b01f4be6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:36:34'),
('6d0e7d6af3051917ea6686090a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:51:24'),
('6d746c07d6aaba1ea902a656d1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:35'),
('6dd567b6e82b19d94d4abcae30', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:49:56'),
('6dd91e852fef768ba39e539c09', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:45:00'),
('6dd968bbdeb21e2a31690fdaba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:52'),
('6de20ba6066185b8870f88e83d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:06:17'),
('6de540ca759715dfc4161ff039', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:03:00'),
('6e0668cd0a56d7e50314025647', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:17:15'),
('6e0ff7de75fdfab220faa96c26', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:16:30'),
('6e1df9b05500eea0b422f1406a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:56:19'),
('6e4cd76110d8f7052c2a73529c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:08:10'),
('6e62a85f7858b1b26c5049e5fe', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:34:32'),
('6ea0d2e36dc01760a8abe3a637', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:31:35'),
('6ecbd249fc4c9ea764cd4328d7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:22'),
('6effae284d66dcfc34ee546ccc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:36'),
('6f111ccfc7265fa7ed9e6f8f23', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:44:55'),
('6f1dd66f10e06b99bd8869fb14', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:26:43'),
('6f20a909e95ce3151e9f161ffc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:58:31'),
('6f4797baa60410a997750a507e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:18'),
('6f74bd9693e23d54efa1024f83', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:58:57'),
('6f8b922f18e858633ce74e4dd8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:20:18'),
('6f91e76a5040517f9244b68583', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('6f987e89bd6f0589b4f65d542f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:38:00'),
('6ffbc97e96d31d2eb697a5879a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('700f1e257f28ed8e0fd6ae753f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:32:49'),
('702220dd3e71adf6e15cbae831', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:41:33'),
('7029b600628997c2b71be4892b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:13'),
('7030473f8354edda9e01cac4a4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:58:23'),
('7036ffc34598a7b7f60334a79c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:45'),
('7053f7914b718c4e6bdff51bb4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:09'),
('70597395e8ce435db5f51ac3d8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:22:16'),
('705d086a3a85536fe925d60388', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:46'),
('7099ea48f460d0cdcdee5962e7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:36:55'),
('70c91c365a8a14c708f3d24a05', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:51:58'),
('70dd32b12b975bcf00cb8d703a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:44:59'),
('70ddaccfd969250cb056cf2b68', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:21:59'),
('70f7b09ab6334a29cc969be55f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:30:43'),
('711a0cd61a2c87c49f7ce7cc32', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:06'),
('711e149704c781f3c8ff4dc6b9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:25:37'),
('716315da92b053f7752996b0f9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:51'),
('7177c236eff4dd9f3ca2b1861c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:56'),
('717b3d6a28c032a5e62a6e1535', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:12'),
('717d9c19a5abf393501e99094a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:02:12'),
('718d9193ec76a6327971c949b9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:21:52'),
('718fcad6043d000041828cad1c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:50'),
('719c1a15cd9d1aac7cf076a412', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:12:35'),
('71de13319ff18201d4bd9e1eae', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:18:37'),
('71def24337face43f038afd998', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"5\"}', '2020-10-01 07:08:23'),
('723067e04e3d90502c572cbe75', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:16:29'),
('723da96ddfe4d70c15a624d9f1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:43'),
('72663f447a3891483182efef58', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:02:54'),
('72b06e107e3ef2ca61d292dba4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:52'),
('730b6a27a66d4d0a7b80c154ba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:20:35'),
('731ece7b05f71e279b79ceb43e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 05:30:25'),
('733a3143bb738b615d71e2a2db', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:24:23'),
('734c29028831aee8acf0ceb95c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:19:37'),
('7355b951d7e8b76ffed109a725', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:17'),
('7377ed45061c58e6388a5a1162', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('739f28bf9b4f71e3630c57d22f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:44:14'),
('73ee865c974e9e7e48b8887f5d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:40'),
('740a69b14f7bdb8292455197b8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 05:59:43'),
('7411425b9c5bf05bffd5fc955b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:35:24'),
('74479b1470f6e1c75d2c49de39', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:21:59'),
('7484ca404c5be2a75df4184aeb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:05:39'),
('74a7f7761ac89af38959a6ecf6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:58:03'),
('74ae9c44276b18dd39253d6119', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:01:17'),
('74d49a6955b24fa4d436230a9a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:51:14'),
('75238acf4422aa295bd2062070', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:11:25'),
('7539854d46da4572dd1308f52c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:22:00'),
('75553e7774ce459c059e51887c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:05:56'),
('755e902b2a91122c1548335eee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:34'),
('759a1a9e94374ca51668c16fab', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:09:49'),
('75c1e78934ab581df876212256', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:14:27'),
('7618d67ef640ef704100a5ccb0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:59:22'),
('761b4e6277ae4f5b9ea1b6dc4a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:42:17'),
('762244dd2b4247260a7ccf152f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:38:14'),
('764e97fd9445e3be883d6ec88c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:14'),
('76640aadfa02e8d723d2a5214a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:38:00'),
('76a409b4e28681adf00b20e5dd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:30'),
('76bba5911a73c9278f3c79d8fc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:22:28'),
('76f441b4ecc93f780f428a1733', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:19:38'),
('7713e0659d381878f7b6b536fb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:50'),
('773775186fca15477359a051ca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:35'),
('77555c73d4d6db1d7d6b6f337f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:34:45'),
('776d127ff1a76ac5bc591992dd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:48'),
('77b54558ddeed34f03e59aad91', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:41:30'),
('77bb6988eff97e2db8c15a99da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:18:19'),
('77e867d72c4242b694002f0de0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:06'),
('77f675b28f46a7284a98570590', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:43:20'),
('77fac32f4169045d84fbc79842', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:40:22'),
('781c4817ccd22d5dfc8add089a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:43'),
('7821649e4b23a7535629e6173c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:52:56'),
('7828ae36ffcd2337d20c0681da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:53:51'),
('793f46e30cabdafa8d0b1e1353', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:08:51'),
('79468e5b6cdce5741adc400e86', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:47:39'),
('79bbb314e3cca131a41e56d609', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:59:51'),
('79dcfe82fb6d57319a7c35582b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:57:12'),
('79f863e0e1b0a8cc55ef6b1957', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:34:42'),
('7a1151c667815f92ab45c0a0c9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 10:00:49'),
('7a1a8e8ff8d6d1255f9c4f98a4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:20'),
('7a21eb07e0e2ae1b0f8801b98d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:18:17'),
('7a5424a5f05d7c2d613115165d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:38'),
('7a8bfd65cdc6f36d22570c887d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:09:38'),
('7a90a81a6143790b70a478246a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:46'),
('7abb4038143fe859d3ae059048', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:45:16'),
('7acb64862561e1b7ae6637c114', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:33:01'),
('7ad13a7df5d0f0b874c5875533', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:10:45'),
('7aeb2fdaf8bfe5519b3c28cd19', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:43:45'),
('7af7880304de45d5ee792ed157', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:51:24'),
('7b070bb7e6ae556f3ba938b2e1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:25'),
('7b5a85b86e0ed710d826045187', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:52:10'),
('7b64d785eef05590e673c89000', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:58:56'),
('7b8ca69d803a8f30feaf7f3c7c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:04:59'),
('7ba01c58a3c8d8e0c09725612c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 07:32:01'),
('7ba1f7958fdadc80a803f2a9e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:20'),
('7bd387927caceb2c09f6c067fb', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:34:56'),
('7c08d5c694c434980e9216f230', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-30 06:38:55'),
('7ce672db889a2bd3456f00c854', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:43:43'),
('7d14d5d157df8a329633fadb77', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:29'),
('7d377d6e0553057c7c278c62dd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:58:19'),
('7d6c32242b66962e0102bdf217', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:35:18'),
('7dc0a13f64c931bf212d4b6e55', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:49:13'),
('7dc2b795ce185a6abe2127c9d9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:55:50'),
('7dd29dd6065a305d6a61940822', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:32'),
('7e03020dd357b75bd6a8bb049d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:41'),
('7e2e827f0e873fff5553962586', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:11'),
('7e699c8af14b250df708beea45', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:30:25'),
('7e92ba179ae61a97c36754f893', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:17:19'),
('7e991459edccb2ab9544136e2f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:59:07'),
('7ed544f69a08ac0830969ee6d9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:57:56'),
('7f0677c4cde5e79da95374eaa0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:12:20'),
('7f266360d753c92a50e019cf75', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:58:03'),
('7f41c254c510b49237b3908fb3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:27'),
('7f49c292673f2411f092493a37', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:46'),
('7f5c6539ba7258ea37acf763e3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:31:55'),
('8008d5124303dc9dbf2bf7383e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:00:06'),
('8008e4c19f52f21053d637498b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:25:39'),
('80102156b26e1278299bc5cb6c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:03:27'),
('806231084d6d0e669eb43e2227', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:55:11'),
('806273e30a27827e87bf412ed8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:08:50'),
('806623a4882a545a65a814448d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-09-30 10:31:36'),
('807312fd11190deee7ab450e77', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:57:01'),
('80a8668983c15a3c8603d9c896', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 08:05:37'),
('80bfe9e03d9e309334243c66f1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:53:06'),
('80e7536e7e25e42c6a943ce0aa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:13'),
('8107a2b37956253894b99e607b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:09'),
('811472cca4af915dd6addad980', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:24:52'),
('812acc04c295cd24bb258035d8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:47:45'),
('81367a5b90dd59088df46bbd45', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:33:32'),
('814ad320fb3b3b1bead0cabbee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:27'),
('8160256ede5b1e822132c3a06f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:51:08'),
('81648d6f797c04fbcf60c8cde9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:16'),
('816a35ec82f4895cd5949ba272', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:24:18'),
('8181805222660e7bc56823b0fb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:38:33'),
('81841a022688dbdf28036de91f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 05:35:28'),
('820c2edf663543748661b4baa7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 09:42:42'),
('8244759778eea614d1ae5f8555', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:12:33'),
('8266dea7d143541da7a885f7c7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:15:23'),
('8277f3cee54f846f1756486526', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:38:39'),
('828d671a06bd76fc028977196b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:31:10'),
('82e2707cff5f1a5f88c4c1f980', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:40:13'),
('8302b15bc62befb0587544f354', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:50:31'),
('831065c7d0ba6be8efa3aa6821', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:36:52'),
('8330c689f7e9695abe1786a149', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:35:28'),
('8431a4236c2c9a9f94d364888f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:30:44'),
('846b72665a0f54cd15e8b1ce84', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:12'),
('8473f9f0520c290524ef99eae4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:47:07'),
('848cd20903e919e8dd35d44d36', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:03:48'),
('8490ec720fa7801c8331bf8b5a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:47:01'),
('84ac1d189c7bf6832af1df8d54', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:51:10'),
('84c048f02fa318c07d5e4ba95b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:36:53'),
('84c69c6b0a489635216df9434a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:59:00'),
('84f9e5b9ce8cba99ded562fe56', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:03'),
('852165941a7a49d8fb0a09c1e1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:42:05'),
('8582e9f0a5d5d360d0323007d7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:46'),
('859488aeecf4a55e23e749e811', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:55:48'),
('859a85b62a01b6e009be4971f8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:37:44'),
('859e7bd049525c9e9466e76800', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:22:43'),
('85a96c339897f3ed3e6c6751a2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:58:20'),
('85c9675f206557d4b03adf1dea', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:22:17'),
('86040884279836ca3b9857a4ae', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:39:22'),
('8604ceba834ff7c183037e0faf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:47'),
('860eb1ac9aacb79625eddae14a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:04'),
('868b00843b2cb2ed48055abad8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:04:42'),
('86b3c6b3f3e50c4e1f65e853c8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:24:51'),
('86d5e59d2dc8440351068c975b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:49:33'),
('86f1091126bf1254724d8f6603', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:31'),
('872ce509a9b6633de26c494e84', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:42'),
('876b12c4e9e76df4453ac74a41', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:45'),
('877b782f11b4006e9174666574', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:20'),
('87bce960b595412d0cf5f6120e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-09-30 10:33:52'),
('881233af6199c37c75e61b5771', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:18:22'),
('891723c4fdcb87fae15f86f761', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:18'),
('896aa0abedfe992e6bd5a595d8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:43:18'),
('89acb456cb3e1dfdc76a429503', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:43:38'),
('89e9dcd76ad2d3e7afcca05c62', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-30 06:20:07'),
('8a00cfa7425a2c5e55206670fa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:23'),
('8a1812e8b73248143d87b8aef2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:45:47'),
('8a4209fe2c4fd5d41153fda46c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:48:42'),
('8a42e87c46210441d542a2828f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:05:39'),
('8a51d919f0eb3cb6898d90aa17', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 07:00:16'),
('8a5c1052d753e246f257de35d0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:30:44'),
('8a6636f360a036a65a76c78544', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:18'),
('8a96949bb8db9b29eac89b518f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:30'),
('8abf08c82005bbce1b653817b4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:45:41'),
('8b6e7dfb640c34954c869660aa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:51:09'),
('8b8b347a35f9af3bced7f8ca16', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-30 06:17:26'),
('8b91c88cdfa8014f87c56540a0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:40:01'),
('8ba396b094ec51c105a60fd887', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:17:27'),
('8ba5db15afb18c4acc709a1d7a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:23:56'),
('8bb17b207fe5335937fd346cb5', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 10:43:24'),
('8bc9bf51fbb91ae577a019f6e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:11:25'),
('8bce536519109e13ef3000e655', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:37'),
('8c14c982b831bbcc2158fb084b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:14:44'),
('8c1bd2e85b4df70f82fd3c2f02', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:09:53'),
('8c2b08989e4bf6c5685e728212', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:18:32'),
('8c480850ac6e2d2b3053621509', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:12:00'),
('8c8f98f94e60f6e1864e211adf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:55:31'),
('8c9ab720bcb403a598c9928280', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:35:45'),
('8cc08c82db4df7ebb77f89064f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:50:42'),
('8cd9fb39d46dacda70a2470fac', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:50:07'),
('8ce23ec5926e0944318383de2b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:39:06'),
('8cf1174531941ec3a13279efbd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:35:28'),
('8d22e28f86eec3b31848567f8f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:49:29'),
('8d39d886995716dd30d339866b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:32'),
('8db4bd52f0d25735e09c71e3b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:48'),
('8dccbd8d976425962c99147154', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:46'),
('8dd1c58a3eebbda6d83cb00a61', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:43:33'),
('8ddd19e508412cfcdec9133a53', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:58'),
('8e1663c3e9d9467d66fd9306c0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:39'),
('8e336fdfcd9c8e85222afc27e0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:41'),
('8e482940382772bce2b4f0bfef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:36:28'),
('8e5af750fe2f387d2be9e57b94', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:14'),
('8ea68f8b6b033ce60681c4a66b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:39:30'),
('8f0ee30662cde6982309a09b25', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 10:08:06'),
('8f485c965741ad571af00bdeaa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:40:22'),
('8f4f4d7f3dfd14fe3924666c17', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:46'),
('8f563dbb23e3f51e87f670d0a6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:34'),
('8f61b5a6e50113b0b97ad6f894', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:11:26'),
('8f85f0a8cbb51217792a20e23f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:41:42'),
('8fb07f533cf1188c110a151f1c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:54:41'),
('8fb197de349ad656ff6d661bd8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:34:04'),
('90157180e395ce26accefcee59', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:07:58'),
('901fa352853b188d9072377380', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:28'),
('90232bb8658d6eff91a34927bd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:44:57'),
('904eb907f58a50a4f9fb3280e9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:18'),
('904fda06fc2b92e8991082d4c5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:19:35'),
('9053e3b862e92d60f3bb295f2a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:31:11'),
('906542a0a8add93fcb0eb8b761', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:54:14'),
('907bbac1c1333c7c84396f92d5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:39'),
('907c08c6e95d22aee106df3221', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:27:35'),
('909bf54e58655ad8d137f0ee6b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:09:37'),
('90c033c0e732d3d740f238053a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:34:32'),
('90db5210f2f09f9d6773a55179', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:00:07'),
('91939e2d5e49e5acca2507bf76', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:29:01'),
('91ef173efb81ab6a3ecef3b634', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:41'),
('92035fa0e0f19fb1d009410aa7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:59:23'),
('9224ab6b9421560a716e5304b9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:53:18'),
('9274c5ab42ee4165057e309fd0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:44'),
('92a67bb1594441555b8ca50618', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:22:28'),
('92a80df5eac980490c2bda1f1a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:53:18');
INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('92de4d615b2220f009c4802070', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:00:46'),
('92e97456e8b83b659910d6631a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:08:06'),
('92fdf759522d22a260f262fdb1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:09:03'),
('930a4b87cc37fc211a09f6e79e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:53:23'),
('93226f23ad1ee985e035570b76', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:03:19'),
('932fe0e599cfbffbc781766ee1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:16:59'),
('933b2f922130c8341e07055b79', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 05:28:17'),
('9342e4146d92da7707de724bd7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:06:43'),
('934f60ffb520a7f59969955ec5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:04:09'),
('93532126251633c37470a8121c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:37:15'),
('936c4f0ca699b6317c4909c73f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:20:41'),
('93735cfc90e30563fe2f60d2e6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:08:06'),
('93878df6ce193121726aeb5066', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:22'),
('938b8cb23a3e3cd30875626bcd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('944f8c5d38c2d8406614658e76', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:42'),
('9471ba6600fef4fb4741823445', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:17:15'),
('94ef229c00dee1a5cae4db0105', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:52'),
('951bf55acaeccf79ecff51b5ea', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:32:59'),
('956a0d45b262d075639f251546', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:38'),
('9585dbde84dd29719d63bf66ec', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:48'),
('95a0d0c8195171651fc67f1ddc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:39:20'),
('95bc3aeef9f6ffba602aef1350', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:05'),
('95e5eebf3221bad7a48069ca1f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:20:07'),
('95e8835b98b5119680a38112d1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:59:07'),
('962fd527c3096218acbe129071', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:45:48'),
('9647917816f42b0848d4540644', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:27'),
('965ca663fcec68d04947cebe64', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:27:48'),
('9671c46fffffeca3881d7ca9b7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:31:06'),
('968bac56bf773781ed669da0db', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:22'),
('96913ab9fe452f2d1fb0e6f109', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:33:16'),
('96a40039683c2cc4b219e2caf1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:34'),
('96bffae0551f4e3cef61333911', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:05:40'),
('96e9a95bc21677b48587d0a48e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:45:50'),
('96fd5193d7a4dbd7df2878693b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:10'),
('976e39dfb1513be719dda0eead', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:58:03'),
('97f23056fcf827220634b426c5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:18:17'),
('9838b3e6e810dbd33df64a6d23', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:44'),
('9844f6369aa7202ee930667d3f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:37:54'),
('984b83c3bddfd383667d97ba35', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:15:23'),
('98642e42a99696c5036c9d608e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:21'),
('988c55286a1ac957c3223a893a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:16'),
('98a07f35f73fc84883637d3a2b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:40:36'),
('98a3dec0dec8f37fe618abdca0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:04:59'),
('98ff18bb0e18cee0f4b2471b12', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:28:06'),
('994bd34ff9c80d609abe2f97d0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:37:15'),
('99784c62d2eea790eb88d4c151', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:34:45'),
('9984b3c377425c3fbb48656bda', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:14'),
('99a612d405acc58bc56abc0462', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:22'),
('99b77b8a37fc740d2a25a961ea', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:32:01'),
('9a043fcd97755dcd95e0576e47', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:51:51'),
('9a1123e0cbd12676c009dcf0d4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:55:39'),
('9a2219ea69854f38591b759216', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:42:43'),
('9a3e97e5d3fecb880e805c287b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:21:55'),
('9a5c137d529b6b1e4229580132', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 05:54:51'),
('9a8983ffa1d559f3cfa10bf26b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:32:29'),
('9ac08b427270a9763bf6c5b2db', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:16:32'),
('9ad02207f28f707627ca6409f2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:21'),
('9adb51f4411bd97b804e7c1160', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:52:29'),
('9b13a6eeab689fb067d11edf1d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 03:43:07'),
('9b5b69c0eba56276655930a6f0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:56:05'),
('9b73aca4dcc5e94688490b6230', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:36:25'),
('9b7954bc82cf133234a8e3f8c8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:54:57'),
('9b98a85f49e97bd9a2cf741acb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:14:42'),
('9bdfbaaa25dbb689996c2cfa32', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:32'),
('9c09b02da086f26915648e3d28', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:54:39'),
('9c24b5c01f4b0c7773bdc6cddb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:44:15'),
('9c2618c994316dca5fb96a8b09', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:52:10'),
('9c4b08c7850dc881bbd39b6e92', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:23'),
('9c5062f4271f77c08e10826632', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:09:06'),
('9c9a54a1cc54eaf38417374188', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:38:56'),
('9cad95cf376155698123f7d95f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:00:03'),
('9cc21c4d3c869d2f549f1e0b37', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:24:23'),
('9cd079ee03ae3a5f1c8d3f82a2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:38'),
('9d54ef7ee04b35565a0e810285', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:25:38'),
('9d5c89baa9337153e88b718b7e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:43:32'),
('9d86c5da1a9c18ca6cfaeb6f7e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:34:32'),
('9db3d341d3ef7135d38d323f08', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:03'),
('9ddc8697269b4dba53f363a5ae', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:46:47'),
('9e09cf3ee8f55b188a7d9e7e73', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:51:47'),
('9e4aa2f2541866653454ffda79', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:53'),
('9e69c4e3ea6b74c3e907b91a23', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:43:44'),
('9e8fe57e45fd996f903efb9c2f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:56'),
('9ec52f3a1bbeb53ab1fbcb9f74', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:34'),
('9f31d624921a6f41eadfefe91e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:31:08'),
('9f4e2cb51f72475c365d13b6aa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:07:49'),
('9f93df8adadb50afe46834edcf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:02'),
('9fa96089ffb96229e7f762c348', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:48:29'),
('9face3d0836ab38336d5b7dabb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:32:48'),
('9fc7499bc0c4db252469fec56c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:07:40'),
('9ff7cc712c0d0e605e7a042747', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:19:15'),
('a023352c13f7cde31d498a9a50', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:21'),
('a054c07c2e164bf663a9f53d48', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:40:13'),
('a094a14ca368dac6bafc961c2d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:17:15'),
('a0a24267c949d78be3ff4da947', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:46:32'),
('a0da7ef962dc2342f8b0c25f0a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:11:33'),
('a0df837bd41175962254ab35bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:45:48'),
('a1233ccf6ae077426df41ec708', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:53:17'),
('a15401299b3fcad5dafc4f3c04', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:23:10'),
('a15d2bd7f6730a011b96706589', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 07:32:01'),
('a1f03687351f6edf956823a917', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:19:54'),
('a23572abadfc47b63146c7f935', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:31:25'),
('a25231c11582ddc1a8df5a0bc0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:02:53'),
('a26c5f9e594143545c4adf2b5b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:41:42'),
('a2af9aa8385686b7a2a44a01be', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:15:11'),
('a2bfece9080461a788a7dcf3ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:22'),
('a2c2afe951e107c5335c746e2e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:24'),
('a2d9a0f96bce70ea6125604243', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:02:51'),
('a2f2774eaa9d04b8e6e502a128', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:36:52'),
('a2f33e00a4b6e98760e1a4d689', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:29:59'),
('a313b711978afee11bd8016c78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:20'),
('a339bbb933bbf88c37c717ac2a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:12:35'),
('a34d36d8aea4c39134fa5e1bdd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:55:51'),
('a3a60a87cc9a7035d076080c4a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:07'),
('a3ba8f33907eddd788b4b7f55d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:51:47'),
('a3e70d0fc679c212d992282775', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:52:29'),
('a40a0b2d238d64b07be1de620a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:28:18'),
('a426b45ee01752b06db24be55d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 09:57:17'),
('a43fd33d5090151d94a5a0419e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:26:26'),
('a462ceb810fd6f4d6bb7bf58c1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:14'),
('a47292639db975bd74b7ba633b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:37'),
('a490b8498ec566b1475707a817', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:39:53'),
('a4ea41d2bec8ebd027d8c96070', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:47:58'),
('a523af0d80858384316e3e3eaa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:39:06'),
('a545f26c498409cdff016bfc71', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:06:44'),
('a568ef9e6507a441fa09bdcde9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:38:00'),
('a59a6df23e0d7c3863e08b46d9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:11:16'),
('a5a6c3f8122e908f8764604d04', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:23:05'),
('a6347be5db4f17cf7d40f52e7f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:01:50'),
('a6dbbe1df2a07ceaf62b7ce10f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:47:01'),
('a6e4e96a2e243f5d61ad25f84f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:16:18'),
('a719568bb37f6747227e72e3c1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:37:38'),
('a71f3e983ea0f9a754907f9967', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:19:35'),
('a72b52cfe2432d04f3e415e704', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:58:03'),
('a7bb4974c6c6d542304d3a0b4a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:52:29'),
('a801feb0a61471919b1452f64c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:52:17'),
('a82ce0088430ce45fdb0295bb2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:04:09'),
('a8409023dac82ce4ad0d8f27e8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:19:15'),
('a8bc83ac78bc8fc49dfe044bca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:39'),
('a8f649e4894e87d5be1fa3e1a6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:25'),
('a8f7d16a70845d8f522719b30f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:52:23'),
('a97e09d6d5129e492df2bdc457', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:28'),
('a9c97b721bc76a0d7cc0bc785e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:06'),
('a9d5170a49edc42ea6286c52ea', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:34'),
('aa01ee9a7f6250a5b393ba3aa8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:44:59'),
('aa403ecfaf38bafc6c2dc0b338', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:07:49'),
('aa438de384b6e5edc7502b3709', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 05:59:43'),
('aa7e969fefb45258271cc164df', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:10:35'),
('ab18eee2882552b4f0d01a677a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:45'),
('ab1c8d015d2661dc25e81abb46', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:38'),
('ab3cb15f94ab2857b7e86d82fa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:35:45'),
('ab6dc2b5aa214092dd59176348', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:15:56'),
('ab8f939df649071e7dd5ee4eee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:49:38'),
('ab9fe0deea99f73b38df37edbf', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:29:04'),
('aba002fffa9b988d4014804797', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:01'),
('abc0c09eb29dffb0bb8e45ebcb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:09:05'),
('abda99e24cf898fd585279c5f5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:18:23'),
('abeb1da70b7bcb948b1df6d5ec', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:12:00'),
('ac2f6d30a223cd00eabbdf64c8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:48'),
('ac5b48760e5619f72240791bb4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:10'),
('acb40431f849b531d80fcbde5a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:03'),
('acc1a0a7fff9199a50905da4d5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:19'),
('acc43d90f4178edea34db76465', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:28:15'),
('ad19312095b7cf75196d2c3c72', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:28:18'),
('ad5efb65b176975713e198fddc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:19:10'),
('ad6feefeb9f64f8ec4d9803220', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:37:42'),
('ad7aa65063a4399321f4917817', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:06'),
('ad9a110f1221e144a52804a0fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:33'),
('adb00310b07048e2b5f32c5dda', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:35:54'),
('adc92d5c0d1ccd5dfd0b80a271', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:34:45'),
('adebfc73728a4433e8d4dee47d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:58:42'),
('adf4232a9008f1071ad162ed08', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:05'),
('ae474735e97ae3ad4151098668', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:22'),
('ae4c67de97832deb4d3c2d4b8a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 10:09:19'),
('aea10120faa0e001703b1b10e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:10:35'),
('aea858eb474f558a5139ece6e4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:33'),
('aed6899d751f1c68df2e65eac8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:49'),
('af13b75a9f5b3dc132484f1bfb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:08:11'),
('af442c7ff99075febc34bed171', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 10:27:16'),
('af79e3745bda6859254db5cf9a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:36:12'),
('af81f9db7817b4e3ff8595409e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"5\"}', '2020-10-01 07:08:37'),
('afc753152f5a0ef71527eb1ed3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:41:30'),
('afffd6edb37c948be0160b52b1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:48:42'),
('b001fc806d658fbf84b42e3696', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:33'),
('b003af79f4037e4f118f28dc8a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:50:55'),
('b05d2703dfb453ea3d7df49cfe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:07'),
('b069e376e00fd8fabbc6df4e13', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:33:23'),
('b0a2dbe1ed7ba260c231fa6c47', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:29:35'),
('b0bb06029104ad63d5bdba59b2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:12'),
('b0c94fa2b5890f7dac1cdac1cf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:27:34'),
('b0e5805c83a5184a3f621d2c98', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:54'),
('b0f698ae38b530c1a8d3822088', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:12:54'),
('b15d31832d88026ba88bb981c3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:41:21'),
('b161219089983569dd78343b08', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:23:50'),
('b19eae04eb8e8768ef90dd3a2b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:44:55'),
('b1c6c8b84e3ee36b2efc2a84fe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:34:45'),
('b203d86d49784a0303b7dead9a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:47'),
('b2163246d2e932e8e5efdab9cb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:45'),
('b264d5519db9fced1fc82d9f78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:29:35'),
('b272a85c62f09db9cf25b657d3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:41:30'),
('b27f0ecf1c37e436bd8287f0a7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:03:19'),
('b2b388749c1a46d95daf1de4ae', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:02'),
('b2eb1980923ac8820ec9e1c620', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:30:44'),
('b2eeb594871a2b62b8628bc695', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:45'),
('b32013e908975212dd40213aa7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:50:55'),
('b38aaf36b2a16f1e4474aa5489', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 07:55:10'),
('b3ba5ae5d97963d9d73dff3066', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:40:37'),
('b3e5d845d860fbc3edd0f07a84', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:37'),
('b43100aaa4488442ceac56edf9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:30:10'),
('b43d568a21186c9a0d80fb9847', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:56:17'),
('b446102744b1e93be132750edf', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:16:31'),
('b45abb032ec655d986255182f7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:01:24'),
('b464a7a6b17e5a44184e0b2f2a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('b46954c2a6bc4658e823e8758b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:19:12'),
('b591b2a00d4801b49866db155c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:18'),
('b5c359aca745c24a27fd251fa7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:43'),
('b5cd9d995da15512b49e8f2b70', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:56:35'),
('b5d58d82e3e75e088ce5fdf3d2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:18:32'),
('b5f17f8ee1a2d89d0a96bcd660', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:54:30'),
('b62649f9cf1232f6772f452499', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:51:10'),
('b65492aba4ea07efea852b7ddc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:24:05'),
('b6633025207a8bbb488641c3ac', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:24:54'),
('b6bb7a57e2bf859f8085646c34', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:24:18'),
('b6c71b15b091d693bdfc1c2355', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:52'),
('b6e821557a62f198ce840a3708', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:51:01'),
('b70f5ed6e32c5d0bb4f1bf7889', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:57:33'),
('b73514e89278dc9388a16fe46f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:43:13'),
('b7ab9dc2c6c971ba6ecbbe87a0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:45:16'),
('b8725c29b06e2a2e2bc962e50b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:21'),
('b87aec1aae58cf141df5f729bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:11:04'),
('b883460df3c53326284fb7b285', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:09:07'),
('b89a87d6a8ab39a2d816a1a634', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:23:51'),
('b8bd0c85bcbc2848d9afa8bfdd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:17'),
('b8ce26ba1385ac975180c010f6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:09:51'),
('b8f45c0553b339c396682a537f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:23'),
('b953b65633a0a7beadaa01dc9a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:52:23'),
('b9595d23e9c7c8711936d78867', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 09:30:15'),
('b9665ed22fb1cd56b80ec85751', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:01:19'),
('b984c86f94c0062b6b985a412b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:21:52'),
('b98ede4fcdaf28f6e4939e3aa9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:18'),
('b9c56930e92b4228ff566f3f90', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:39:59'),
('b9d5a721fd2c2779b1abbfa2db', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:20'),
('ba26a5949108ff5e6bf29a7ec3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:32'),
('ba527360ffce4d587c3248de27', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:24:23'),
('ba8272defb60dc38001f3fe9ab', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:03'),
('baf019310ace8604b80024b206', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:42:01'),
('bb022f0bca7fe050446d490cef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:40:49'),
('bb46c3ca63e518a0e4fff71afd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:06:17'),
('bb4829162b732e091346aaba13', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:09:50'),
('bbb473b461f24a0c6f282e2a42', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:46:41'),
('bbc405cf03d2d5c5263a009cef', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:02:53'),
('bbe020f227e45db92c74caebe1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:51:47'),
('bbf08c9b78d160e283629c8227', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:37:39'),
('bbf1071fbc5c091ff230d762e4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:31:52'),
('bc55de915e8b7e519cae053059', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:55'),
('bcaad9211fb4a7097a823d5843', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:52'),
('bcb225e44932cc42d88627f907', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:19:35'),
('bcd9d6bf8271d8eef2802fa725', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:33'),
('bcdfe20d13f781d2c28ce1571c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:12'),
('bcedba5f43b35970c16856da79', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:31:56'),
('bd256c68d59feb8183f1068358', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:36:12'),
('bd449f44b4ad4188536fe59d3b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:28:44'),
('bd4641dd72445b1edc89a91b7b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:49:33'),
('bd6e0a9281b2f868f6aaf77943', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:33:21'),
('bd7a382887ab779df1dc8b80b4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:34:34'),
('bd9307d57ef73782d783478dac', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:54:57'),
('bdc26adae91b7580012e2b9a87', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:19'),
('bddf255a1648fdececd66a10d9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:34:04'),
('be0900fc2f1d348d6e931d1b85', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:28:14'),
('be2e62b7d9360f23a24c70e88a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:07:10'),
('be9b4bac1088243c40502a9c3e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:41:54'),
('be9ff45619e021711c0d0dea15', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:48:25'),
('beb018476fc848fe12fa7f5abd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:46'),
('beefac9068bc153d1b7570dcd3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:11'),
('bf10ff1e6b2b503bc9b650f40f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:12'),
('bf143c0fedbb5537a5010b02ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:14:26'),
('bf2723690b50b62c151cf3862d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:42:01'),
('bf7cc24a8ca75dbbc9c9c81c93', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:15:47'),
('bf7f29f85e7be034663d627e60', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:47'),
('bf9ffd5e55b480e969caf78fda', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:36:25'),
('bfa70759cce92f808b43bfc894', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 10:16:39'),
('c0080ba70a2e646440878bacc8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:31:19'),
('c02e41a5de41c173e7c804a0ce', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:47:39'),
('c09eb90de9dc4abb6535be9e9d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:00:08'),
('c0b7bac78186323285e7594248', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:31:07'),
('c0cb831d6edaf06c9d0cd06055', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:46:05'),
('c11595ad95c922d13e5d0c0d7e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:50:44'),
('c132dec12db048ce4f59d3b89a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:16:58'),
('c13b9c0e5b3a916c9820ab2e33', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:02:03'),
('c16f11ca813780f3dc67e18a36', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:15:39'),
('c19bcdcc55ce7f684c4bca1974', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:29:34'),
('c20f0c576453f31b18d85c887b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:05:40'),
('c22fdac442023cbec60bcacc69', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:31'),
('c28bae7b37a3a2f6ac798a0fa9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:15:47'),
('c29f9981d316a9b1573d8d7589', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 09:21:51'),
('c2a367066ad7ead0dc04e41752', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:16:33'),
('c2bce0be7134bcf058b8993f3d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:31:34'),
('c2f700f12c1ca31ae6904420f3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:41:41'),
('c312829ecfe58a94a5c8dce83b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:59:45'),
('c319e887a0c44dd8627408dcd3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:57:53'),
('c32c9e2fc2baaf5e60c6d16e45', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:52'),
('c39236147ed708c1fe2f6ace82', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:44:19'),
('c3e9e795784bebb9a514d509b3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 05:54:52'),
('c3ed1baee503129cd104e1263e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:30'),
('c3f20abc9cabde9af92468f707', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:49:29'),
('c40c85749b161eacea854fbf2a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:23'),
('c418ed7ae11b0f5dcdcdfca825', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('c44570a36355155955d9c11416', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:53:23'),
('c4468bb6fa8469e5d9ea9eb81a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:01:17'),
('c46ae81e34e49e1a46a465fb43', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:41:32'),
('c48618f8241f7c53aa614455ed', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:36:15'),
('c4a9635bc7dfbcf259df568f14', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:38'),
('c4d179de42d398818c4d2bab6f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 08:37:42'),
('c514909fbdeea1580d6ce94ad4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:58:24'),
('c54397e20c7bf4e5c5dd7699e9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:17'),
('c55f1a30b9ba9f0878793e5e2d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:32:11'),
('c579186b28eb44dcd6e5c13702', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:01:19'),
('c599f26eb24ca0ad6f7bea2f78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:40:14'),
('c5f2b9769d4ff73e76e973cb1c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 10:02:12'),
('c5fbb269686a0c1c0933ee0d6f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:21:53'),
('c5fbf7d40281d5afa8d296564c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:32:10'),
('c612656a651f480a536d923dcc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:27:53'),
('c623702ebd1065b097fc8f68a8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:27:54'),
('c629f922602ad17a95f6779a4e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:51:38'),
('c640da9e581375e0b3a47efe27', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:14:39'),
('c642d6c14eef0a01d84463ab98', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:26:41'),
('c6c159684b4e3963ee50e438c7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:39:28'),
('c6e1a1e1a541d5f39dea93fe7c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:07:41'),
('c73b6ed2b92abb81adcca40c01', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:13:35'),
('c73c90a440d4e19bc494166bc0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 12:03:10'),
('c766bb45170649e2ee23a17df3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:02'),
('c76d54e08ab4c33db6838db34a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:33:23'),
('c7f159442e4a86656dcd1fc423', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:04'),
('c906e32ca18e51cae0ff463af0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:33'),
('c9147d8110dc22081b3edfdcd7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:46:40'),
('c934713d3eb01e380d14dbe0fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:09:03'),
('c947cc294699ff7d08c8ab37d4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:57:12'),
('c9891bcdfb2e609e6c52f06668', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:32:29'),
('c9fa21993a80f6258848560098', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:18:21'),
('ca04bef0ff637dc1281d849377', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:52:32'),
('ca22bb81ee09b2a4118f2e457f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:43'),
('ca8c0f2d433d9d2327331d9d0f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:52:37'),
('cad30b4a91b47e1029f08dce6a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:17:20'),
('cae3e13f703e0df8cd18933214', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:25:39'),
('cb4812532e12951f2d9c2175b9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:10:46'),
('cba6eb433c0acaea96b7f31f32', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:50:31'),
('cbc3f91254b51bed131e0765e7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:28:14'),
('cc04dac771af18595c07560be6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:32:10'),
('cc16e1ace3dcf921467aac9709', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:27:17'),
('cc2ae90cd2ded5689925397ab3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:44:56'),
('cc44b40e08003ed1ec659f1fb1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:28'),
('cc48d9263250b59b59fbc106f5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:24:05'),
('cc9395d24bc7fbe512caf2634d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:16'),
('cd34d33f0b8f57af377346a65b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:33:17'),
('cd472b1ec177eaaaa56ac06444', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:00:06'),
('cd6327cc3b6fedc6f3803c80c9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:37'),
('cd640c1c0c6d51fcc1453fd27e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:32:29'),
('cd9e981a30db377ddc3bc551b4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:39:57'),
('cdd92f7dd30c0cc0947d216b95', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:36:04'),
('ce1bbd6882aaaebefb5241075a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:39:38'),
('ce1d135b8d07bf89799ae555fb', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:18:50'),
('ce2c88ca502d26d4a15bc54173', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:22:16'),
('ce31a787db4338d6f3207b8071', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:02:22'),
('ce489834375712c92d8c04623d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:56'),
('ce64e6b50407036fba83691b31', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:09:50'),
('ceb92a098e610b792b697c4437', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:02:55'),
('cec94c7f35370bd5afea107a3a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:33:36'),
('cef68d76ea9e060dc4419f9cd2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:57:17'),
('cf072f1342a7a2514d1e31307d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:15:55'),
('cf232677f28c6df75777c9833b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:04'),
('cf2f428d86c969ffc752766c17', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:46:46'),
('cf45438336af54bde829ec5530', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:01:05'),
('cf6fcc2705ce5684d7304e693d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 06:09:04'),
('cf8997bb4b89ce5ba10df8ff97', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('cf8f5867962128b32a1228d56a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:28:20'),
('cfaf3e398c9e86a6a680d647b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:00'),
('cfb5a34964b5af73548b486a07', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 10:09:20'),
('cfba20278933a2dff310bbc0d5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:39:22'),
('cfc2a02f03ad08bb23f08d3b18', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 10:04:59'),
('cfd6452f9b6ac05e31d75a990f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:47:24'),
('d040d68ef3add04f343b78279d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:48:23'),
('d06ce136709880323f3a2c11b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:26'),
('d070775ab6016397c80cd6dda6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:11'),
('d0902d9ee099ab2bab10054dfe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:47:46'),
('d09ea8b030aa5609c24de6626c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:48:25'),
('d0b801089f6f273e7112f9820c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:56:35'),
('d0b82a9bbc8b0faf6304302a98', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:31'),
('d11b5acc30da2417a3fef565a8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:58'),
('d124e03bda3761d571327d32ab', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:22:28'),
('d129e531930d97403eb5aa6981', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:37'),
('d1533f73af564d2e191c3af4c3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:50:13'),
('d16bc4f889332335882dadcfb4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:05:37'),
('d17ab6e887297d9147b914f267', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:53:07'),
('d17c2f99ef089dd462f709f490', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:44:59'),
('d1b60d57d7221d4ad085b1bae1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:48:25'),
('d1bf61ab23f596e195a22ba3f3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:46:58'),
('d1ff6fcab531d4f0c9a3795d2f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:20'),
('d20075a0db291152c6e09f002c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:48:45'),
('d219f6aab0135747f14223149d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:48'),
('d22daf1441601a48fa88816d35', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:55'),
('d28fd82634a1b6e59318cecc52', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:19:09'),
('d2a23625e6ea5a503c0daf0882', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:56:05'),
('d2ec9dc184bb6c3adedeec17de', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:53'),
('d37400d5dfc00ae46cdfb851c6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:21'),
('d3bafeb9ba612813feb637495c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 08:05:58'),
('d3d276929417100d68ea89cc8c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:17:19'),
('d3f74fc4c282264c09a4268340', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:22:36'),
('d40410ec33362e9e73ec7d57a1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:13:35'),
('d44bc4a226a38844df73c2b9ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:39:45'),
('d49becc728be4f27372900fe09', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:01:49'),
('d4b72c5b6edfeb8c31d912cd7d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:09'),
('d4c568f7c88531bfa8bfed1697', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:41:42'),
('d4cbba9914469efc2ac30007fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:37:38'),
('d4ead0c99868fb9e216f02f7ed', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:20'),
('d5051e577f588fbae4afc9e83a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:15:42'),
('d508448f912f9f58fdbfe2613c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:07'),
('d5514858517bef634cd06591f3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:37:39'),
('d558f2e9425ae2396c4831bd58', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:33:36'),
('d59d389b0922ba2b4ee199c210', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:20'),
('d5a685a89dde4932963b359cc5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:32:10'),
('d5b6833a8ddb7a4270ad6b1a18', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 10:02:32'),
('d6360ebc40d024cee87e1458da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:43:45'),
('d643a8a26b860f317edbf79a21', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:39:38'),
('d6d14ddbb812e89d330e798c54', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:01'),
('d6d87dd0ed5e43df884c669d63', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:19'),
('d72151d5b2dc0fac5502f55bd0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 07:05:16'),
('d7a6cf20b8dfad8f1c122aefe8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:35:24'),
('d7bf2bd5bbe5a51a8091d3f887', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:14'),
('d7e2dede934133a7e1bd6a1ae4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:00:03'),
('d7e5718d8fd0db8afc5242ff25', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:48'),
('d80b952257024d5c155b45ef30', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:19'),
('d8189c484dd147b402fc77a774', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:02:21'),
('d8309a67e143830dcb5c5c815f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:56:32'),
('d839a72e597698a0dee252e1f3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:11'),
('d84b3c8fa83f7963b584230c8c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:04'),
('d8877a521a86392bf8660b6f06', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:39:55'),
('d8910f283dfb9ce7a73accf6d1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 07:43:20'),
('d8a4ba92d384b2d8675c85c553', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:46:58'),
('d8b55e275318248110c291b01b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:34:33'),
('d902f1ee2a4edde8e9521033e7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:02:15'),
('d9504f587a387d55b1087abc58', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:40:25'),
('d96b7ad5f07554b35104e9f707', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:20:20'),
('d975c096ad5744ee0770e518a9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 10:28:05'),
('d9edd506b9e688f77c33782b57', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:32:29'),
('da11d91f88f262482bceb541cc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:43:16'),
('da485ccf090aa686c89bfd9e8e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:35:29'),
('dac9849000732844bcfa143d02', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:06'),
('db1a7c45383f759a11f6cf8cb7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:49'),
('db6eebe67e9f7bd7537128c772', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:09:52'),
('dc43ec4706f4d73300bfba3d59', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:17:19'),
('dc4ba2df724e07e7ee91576cf3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:40:45'),
('dc4c8340f237338704c08298b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:15:56'),
('dcd1d76276482aac0b13f6c802', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:34:56'),
('dcfe02aa2a99b40fcdae64d45f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:52'),
('dd240a5bfc4677845b14524033', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:39:28'),
('dd58d4468418cdbffa1373d663', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:15:22'),
('dd59898af62bcc935cca0ba246', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:20:07'),
('dd6b32574d281250678d70b3f0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:03:35'),
('dd907d230970949f6fbe95dc4c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:39'),
('dde519836c77832325afdacfb9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-20 08:37:39'),
('de43de4207de2703e79b7a05b6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:00:19'),
('de49e5a48d9cee7756495c6412', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:30:26'),
('de5751b236e63c489c5cd71a9d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 07:04:03'),
('de6f35e67db59bbdb9facd8598', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:39:58'),
('de79c94f251dcac3291fe7d166', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:38:56'),
('dea03854e8739e63c42afe0153', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:10:56'),
('decbae2013d3677829492505dd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:36:04'),
('df79f78f031ee13c346c25429d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:49:22'),
('df8f24416ba37076ab05f256bb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:37:51'),
('dfa3517169ffd1d1612f499290', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:32:09'),
('dfa85b4e1adb0f1df81bc25cc8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:28:30'),
('e00b69163ac8819008c0840082', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:18:22'),
('e01382d6415a5b00cd5e738518', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:33:33'),
('e03712e370b73a2d5912ff45aa', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 08:39:56');
INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('e03d385d6d2cbfe2d7d865f46d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:31:07'),
('e0465dcfb54abe3d3754934761', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:43:03'),
('e06ee6035c4155dc8946e9b9ba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:19:48'),
('e06fdf2955c57943959032f4e9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:43:08'),
('e07f555cb374f8cfbd39ca0db1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:25:20'),
('e0a216838fbe67372ad0d1ecfe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:50'),
('e0aa99de9d305318f85788d7e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:59:07'),
('e0acc9118058106559efd73616', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:58:58'),
('e0cfff293bda91127b3a0d2ea8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:41:03'),
('e0d14d01b2d75f4787e6a24ae2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:13:34'),
('e0f792ca5c7a311ff6d2c6e0c7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:16:40'),
('e1429b7978b73e1e82ac3ba2ec', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 09:48:44'),
('e155d0152b407e39c10a40fcfa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:43:33'),
('e189d8124bfc6f790fa8c22dfb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:07:58'),
('e1b42b9adae2caba7c983cf703', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:22'),
('e1d74d1baa740c01a012b64ebf', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 08:11:03'),
('e1fec04cb23dd0443a45bae6e7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:22:14'),
('e2299f6c904c71ae94211e8faa', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:22:56'),
('e24a5e0d6fd9a7021694a05da7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:38:36'),
('e267c396f0bd9e0ef27c16d0f4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:14'),
('e2bdf77fcc82567a6101607e6c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:28:18'),
('e2c0e17b5602ea1b13ec66bc1f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:22:56'),
('e2cdbcfcdc24acedbc552ebfbd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:01:23'),
('e2f38e6cc74d24638fbcfc0f43', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 09:48:28'),
('e343f161d97cdd5dfb4a9ec576', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:57:18'),
('e356eaa81b29601af22cf050d3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 10:40:32'),
('e3a873e8d80927e487b82be811', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:54:14'),
('e46da205c31e2757824c9f4800', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:52'),
('e4b79d37164265a35dcca0da50', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:38:13'),
('e4be67d72e3501a126cfb5bcd2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:36:12'),
('e4f26e62aa53b560f832d02981', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 07:44:55'),
('e54afb0a358e3086d513582ffe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:27:34'),
('e56306157f8a0217f0bbbdbaea', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:39:58'),
('e576f96852f80b5e1cbdfbaab7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:22:44'),
('e58fac16cca298741f3a242dc2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:22:15'),
('e592fdd93ea32070f17e4c4fdc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:40'),
('e5e1bf9c65f9c3515552365d81', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:44:57'),
('e60f348de873fe94cf86e0797e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:47'),
('e6146ff4961b4ee89bdf6b7b22', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:53:21'),
('e62568f2be29069c8a8bfddd8d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:19:37'),
('e6262d931145f96283e2512f50', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:44:15'),
('e65f5ba79695e5f9cfdf79b888', '{\"user_id\":\"1\",\"user_token\":\"iwAvoPUDO8qFIGwiCSXjBEdrpesKdTHa\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:03:18'),
('e6675bdebac77b83eba3b76c4e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:17:27'),
('e68ca8ca6d06483e052298a28a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:12:20'),
('e6ee0196a8b717cc17f6177d30', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:26:26'),
('e74975f6160d739b068e74cfa1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:58:24'),
('e75643f284c552a71fc1686af7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:15:23'),
('e76924ac5a92a082ad460bc33f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:39:03'),
('e76b11b3698a17a52f51ecf9c2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:04'),
('e76b8ab13ad255be41710d190b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:43:28'),
('e76e103e23fc34b5b5e2092851', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:02:03'),
('e76fdb0b4b78929b487436b2ff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:20:06'),
('e77453fa39769a5448bc73c2b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:00:46'),
('e774fe819e8be13524a1a44e1f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:15:53'),
('e77b073a8c8260bd630a6931da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:47:00'),
('e7a13d3e961b0200c20478eb01', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:01'),
('e7cac0cf132c1ca55fe49a7f8a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:50:31'),
('e7dfd07646236bbd4cdc96ec58', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:33:33'),
('e87fb3e1448cb33527b43c0b78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:05:40'),
('e8a4da4cc1cf84a4ab352165af', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:34'),
('e8b73991419d1118a2c833d075', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-08 08:47:44'),
('e8f1caf694a2b1eb06397e5b9b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 07:05:13'),
('e9175c78686f8b3e5b4e3d359f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-07 08:34:10'),
('e9293ddb9f5671232a50b89a1e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:24:54'),
('e9308820b3ec2a4c7913bcea1b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:02:53'),
('e936bb3d092bea09e7469c40e6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:21'),
('e9a6614d6cb6608f84196796ef', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:29:35'),
('e9cac6ea4637fd535e3800daaa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:29'),
('ea167185bcde2736a7cdd318de', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:06'),
('ea315c0c1b35f2d821afcfaa53', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:25:39'),
('ea706023d3df9742d9e9686d87', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:19:03'),
('ea9bf00489bfd03ede97c1f7b0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:24:05'),
('ead1a5dfe72a8d4cbb3a25b58d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:29:06'),
('eae117ab14e26bcad42e170513', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:38:35'),
('eafc3e5e868562781dae27f684', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:51:01'),
('eb52393211ea9b283e9a3124d5', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-20 07:31:58'),
('eb7bb1a3236a201605f3ce579c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 09:00:40'),
('eb8f2b9db801cec7240ade1764', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:40:20'),
('ebd8d384f91e79007156772e27', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:01:18'),
('ebfe3c95b5d0eaf67fbf0c66b2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:52:56'),
('ec2e1c6642562155c3b10e3572', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:31:53'),
('ec5c25ce65f539a6b49de36c12', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:53:23'),
('ec5c8038f3d4d9ffe7ee66d52e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:11:42'),
('ec68e048b3eb36a9aea5100bcc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 09:38:36'),
('ec7b303289e20f0ce0dd6f718e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('ec7ff154fce134015f4339d52c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:24:53'),
('ec8022521114f0804d19242faa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:19'),
('ed6d97c3aea308715b8b6b5561', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:11:25'),
('ed968d05be23e77acbc2eb20c9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 07:06:02'),
('eda14995523d1d2acbb761bfba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 06:01:54'),
('ede5244bc49b47e0e34fbe6bcf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:46:58'),
('ee0a9109ad636643a3224baa8b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:11:16'),
('ee23c45a6e46a8ac88afd862bd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:52:40'),
('ee6bee5fb2ac5628be7fb46953', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 06:32:48'),
('eef194a114ab71cf39979888f1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:40:36'),
('ef25d814fb141af4dc1d9b87b7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:00'),
('ef4ac7c8c31e731b9123614057', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:45:42'),
('ef4e466239e054dc036feaa5fb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:23'),
('ef5660a1f6a62b2ddf49188744', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:48:42'),
('ef60b9ab00662cd1a5479f2679', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:58:31'),
('ef7417b4f515b4c883d4b22954', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 05:54:51'),
('ef85c20efbaa4434ccd3683624', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-09-30 10:33:50'),
('efb0b8d16085809004de6f50ef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:28:14'),
('efc929d03a7b3dd814fc08e944', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:47:07'),
('f02d416f76f4767579e1938069', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:43:15'),
('f0998d29bc7a0ae1a6fc0012f4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:50:07'),
('f0b4b8d19781067d9dfa9ce915', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-05 09:49:28'),
('f0e3d14cc22ac9c6c771fd451f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:39'),
('f10b16988a31826b54fbaa703f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:36:54'),
('f1318c78119223c4951d3ed133', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:40:22'),
('f150d3327dde537b45566c26c2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:40'),
('f15ce6e003281f47a8a3724f0a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:23:05'),
('f1760dd216936c5d01c515e1d0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-01 11:42:17'),
('f17f4a33cb0380507fd479d83b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:28:44'),
('f1aa4536c6edac5d9fa84b45c2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-09-30 10:31:52'),
('f1de8820269cbceb4298ebe1cb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:38:39'),
('f1eaef4cce2ec292a97cae9dbe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:49:37'),
('f1f5fa2cd8b4184fdfb9841119', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:40:36'),
('f1f6d47469d33e57d2e3f99469', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:17:37'),
('f208074c093785572f6d6d062f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:36:12'),
('f216f13aa8b8e17d07aeffc69c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:31:57'),
('f22af8760089b7f24675f1bdbd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:59:22'),
('f29bde882a64932ea277d2bc59', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 05:59:43'),
('f2ae2ad7606576a30709088c42', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 10:00:49'),
('f310a9018a74f4174380292d43', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:50'),
('f315bc57ff670926ca4a3f5f83', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:45:47'),
('f337df85a676bf21bf9d216a15', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:50:42'),
('f34839ccf69b87e9a3615d8053', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:16:40'),
('f36df5274ef1b58861ce5df456', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:34:20'),
('f3c499d973548540dcc33de2ea', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:33:26'),
('f3d007151b7ca88ecd6bd8eafe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:19:28'),
('f3fabdeec86705099d2a4bdc69', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:29:35'),
('f410f25b3b2767c8b4c5e74171', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:53:01'),
('f442cee124a5ef2538d0627a8c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:37:33'),
('f444108a8907525e74583ad862', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:36:52'),
('f47dbf10279f884ed93cd9b00e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:41:57'),
('f4901b3efea0ac3a7dcd05151c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:53:51'),
('f4f0b2c92af2a70fcaec767d33', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:49:13'),
('f4fc3cd68c6e36698014720766', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 10:28:06'),
('f55dc14e00a3448399c8f65008', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:58:19'),
('f568f839453e6331d4d447e2ad', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:03:19'),
('f56de80c8c1f2c977da71a2e0f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:44:55'),
('f5760f282c1d83ed11b648cdd7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 09:30:32'),
('f5ac8e19f565464aaf3ec96435', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:43:21'),
('f63a07448d417d4e06c742400c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:49:38'),
('f6d1d41173ef87020d0edb991a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:45:47'),
('f71e51de672b61272e911503cd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-02 08:20:35'),
('f748a1e2646a39893b4762afa0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:20:04'),
('f74b4c832139f75143c258f91b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:50:32'),
('f7bab324964eb21ee19bc0753e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:55:51'),
('f7fd1a90ac3d55b355fc4480c5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 05:35:38'),
('f85168086b1db2b6105e78e27d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:25:37'),
('f8716e166483a2e6e0abd498b1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:48:23'),
('f88c368630856e6e87846966e3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:25:22'),
('f8973790063e96c152c4b87533', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:58:32'),
('f89e7f9394582a61840125ccf1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:20:10'),
('f8b8b86a4d05a481a77714ed87', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:36:01'),
('f8c99e2fd0a2c2a76bac7b6c14', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:21:59'),
('f8f9bdf6530965ab5777a981ef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:47:44'),
('f8fb882f27218e54da69d7f46d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:20:18'),
('f8ffcce6577d79297316a32d3b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 10:15:39'),
('f968062b159d87291236b87edd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:42'),
('f96c194671af107d7f2aadabed', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:43:46'),
('f987a45cf4e5ba75f100b3fa1e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:27:54'),
('f9d776df26848428deaf4961c6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 09:47:59'),
('fa23d3fd4fe00f8c944e91692e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:22'),
('fa7fe349e595a950f8839ddd63', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:51:37'),
('fad3289b9a6509f1fae9ab09f2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:10:56'),
('faee41058245cbcc8793e3cec9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:51:27'),
('fb1a12ec9d38e8cfb4c79c14e0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:19:37'),
('fb20c76c6d6a580e8bc5f3137c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 08:04:42'),
('fb76fccfd41dda28bc70bca495', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 10:19:09'),
('fb890ea682de451a75ecd94c78', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 11:00:40'),
('fbbc2ebcc808687faab4815e59', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:37:54'),
('fbc1baf06c1b1b37a3fba97e2e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:51:50'),
('fbd6aebe499410f880d12944d2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-30 06:58:31'),
('fbd88b20026eea8eebce2a2b7f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-20 07:32:04'),
('fc453cb92a3890b8108bce7228', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 03:45:57'),
('fc673ba3e3fda319351ef2c945', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-09 06:33:23'),
('fc7029bdf64c62bdcc26dabdc2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:24:52'),
('fcf3cc4bf14f9d42765dd97201', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-06 08:20:41'),
('fd1490f97941554a74f1912902', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 08:47:38'),
('fd24ec06e62f15ccb495147ec8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:09:50'),
('fd2c21cc363f0cd54d9a884001', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-03 06:05:15'),
('fd65e223bab2e56e970522f850', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 07:56:35'),
('fdb881899231b8c597b25d8a2e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 10:06:17'),
('fdd1d66f41adbd54bc06902945', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:34:32'),
('fe0eb95e5c7e235350c59b9c67', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 09:03:34'),
('fe492df9de4c9718a0d52d5f62', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 07:42:19'),
('fe60c12db362c314e1a8116531', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2020-10-01 11:40:21'),
('fe7599554e2ab8437cc5aa0de9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 09:26:43'),
('fe81d4d5af59d8d14062f7ba70', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-07 08:20:18'),
('fee4fad8886643ab95edab724b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:00:06'),
('fef0e766825863dd5b3f4c8174', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 10:28:18'),
('fef96f2938024b118acc4aad4d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:47:44'),
('ff02e482bf53fa9540d1728748', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 09:32:10'),
('ff184381ad766f8a774dbcd469', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-05 07:47:01'),
('ff268343c65f7a97ae36bb1a33', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:14:42'),
('ff34b5c31f6c1785d246297133', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:11:54'),
('ff59244f893268839b59092bd9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-08 08:18:11'),
('ff85acc1e031055193e828031a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-02 08:27:49'),
('ffac4f8c09df8b6aab4092e098', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-06 08:04:30'),
('ffc72e1a4d8f5b09de2e512822', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2020-10-03 07:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(2, 0, 'config', 'config_shared', '0', 0),
(3, 0, 'config', 'config_secure', '0', 0),
(4, 0, 'voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'total_voucher_status', '1', 0),
(6, 0, 'config', 'config_fraud_detection', '0', 0),
(7, 0, 'config', 'config_ftp_status', '0', 0),
(8, 0, 'config', 'config_ftp_root', '', 0),
(9, 0, 'config', 'config_ftp_password', '', 0),
(10, 0, 'config', 'config_ftp_username', '', 0),
(11, 0, 'config', 'config_ftp_port', '21', 0),
(12, 0, 'config', 'config_ftp_hostname', '', 0),
(13, 0, 'config', 'config_meta_title', 'Your Store', 0),
(14, 0, 'config', 'config_meta_description', 'My Store', 0),
(15, 0, 'config', 'config_meta_keyword', '', 0),
(16, 0, 'config', 'config_theme', 'default', 0),
(17, 0, 'config', 'config_layout_id', '4', 0),
(18, 0, 'config', 'config_country_id', '222', 0),
(19, 0, 'config', 'config_zone_id', '3563', 0),
(20, 0, 'config', 'config_language', 'en-gb', 0),
(21, 0, 'config', 'config_admin_language', 'en-gb', 0),
(22, 0, 'config', 'config_currency', 'USD', 0),
(23, 0, 'config', 'config_currency_auto', '1', 0),
(24, 0, 'config', 'config_length_class_id', '1', 0),
(25, 0, 'config', 'config_weight_class_id', '1', 0),
(26, 0, 'config', 'config_product_count', '1', 0),
(27, 0, 'config', 'config_limit_admin', '20', 0),
(28, 0, 'config', 'config_review_status', '1', 0),
(29, 0, 'config', 'config_review_guest', '1', 0),
(30, 0, 'config', 'config_voucher_min', '1', 0),
(31, 0, 'config', 'config_voucher_max', '1000', 0),
(32, 0, 'config', 'config_tax', '1', 0),
(33, 0, 'config', 'config_tax_default', 'shipping', 0),
(34, 0, 'config', 'config_tax_customer', 'shipping', 0),
(35, 0, 'config', 'config_customer_online', '0', 0),
(36, 0, 'config', 'config_customer_activity', '0', 0),
(37, 0, 'config', 'config_customer_search', '0', 0),
(38, 0, 'config', 'config_customer_group_id', '1', 0),
(39, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(40, 0, 'config', 'config_customer_price', '0', 0),
(41, 0, 'config', 'config_account_id', '3', 0),
(42, 0, 'config', 'config_invoice_prefix', 'INV-2020-00', 0),
(203, 0, 'config', 'config_api_id', '1', 0),
(44, 0, 'config', 'config_cart_weight', '1', 0),
(45, 0, 'config', 'config_checkout_guest', '1', 0),
(46, 0, 'config', 'config_checkout_id', '5', 0),
(47, 0, 'config', 'config_order_status_id', '1', 0),
(48, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(49, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(50, 0, 'config', 'config_stock_display', '0', 0),
(51, 0, 'config', 'config_stock_warning', '0', 0),
(52, 0, 'config', 'config_stock_checkout', '0', 0),
(53, 0, 'config', 'config_affiliate_approval', '0', 0),
(54, 0, 'config', 'config_affiliate_auto', '0', 0),
(55, 0, 'config', 'config_affiliate_commission', '5', 0),
(56, 0, 'config', 'config_affiliate_id', '4', 0),
(57, 0, 'config', 'config_return_id', '0', 0),
(58, 0, 'config', 'config_return_status_id', '2', 0),
(59, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(60, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(61, 0, 'config', 'config_comment', '', 0),
(62, 0, 'config', 'config_open', '', 0),
(63, 0, 'config', 'config_image', '', 0),
(64, 0, 'config', 'config_fax', '', 0),
(65, 0, 'config', 'config_telephone', '123456789', 0),
(201, 0, 'config', 'config_email', 'limlipjoo@gmail.com', 0),
(67, 0, 'config', 'config_geocode', '', 0),
(68, 0, 'config', 'config_owner', 'Your Name', 0),
(69, 0, 'config', 'config_address', 'Address 1', 0),
(70, 0, 'config', 'config_name', 'Your Store', 0),
(71, 0, 'config', 'config_seo_url', '0', 0),
(72, 0, 'config', 'config_file_max_size', '300000', 0),
(73, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(74, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(75, 0, 'config', 'config_maintenance', '0', 0),
(76, 0, 'config', 'config_password', '1', 0),
(202, 0, 'config', 'config_encryption', 'NAnwh32aAOehB7JwGVq11n3UnlfrLQspm4kS80rEPpRplcYD3ibtMZF3hZnLDp3YRVxY7bfuhkzEf8MKpWZwx2I1s4n4uRRDhIpW4OkYjBCywAcAJBVh1Vd6IthenFXCVxaQ5cetIwXscVrIxgG8Nnd1AJYwcuNBYLbISr7eK4LNrZNFCxDFA3TImSrBrrcv3WV4T8KcjYsgCdCkOKvWke2xd0kFxh27X7Sa7DqWZYBpbHZmFD0gXYUbLueHWMKcnxOl4xiTZ00fX3DrkyQqRaG3f9pGZgbkUt1vCtXIl8kzmuL7dhPAyEraA3r5aUduutsjuSzSa4PoaDXvcLRrpTXCoOk6ekMZl1n4VotUeWitv04YSue9efLIFiY4moagqCBX9RQMmSGxiXyb8iiDh6hV1wI4OJ8Bp5sCsqEflIeNToahee782QMWat0a1idgZOyycZJjlLxrVtlxSLBPdyvDU4NisnRv4NvLHgyo1qUF3Vu55IetkEmMAlw4KW7d5I5fO6HnigMrWRZ06nVVpg7UEajkW5rY9WnuGdY2m1lZ4bZEdBxOeJcHC0b0eyjHXRFSWaf9km6IV8SGKnGCHlNC4S12V5SHL7eZYeSUNvWHEcOrOC87LVFCbiBJGgDuFtZISeg6gOEOd4omx4id6icLZ26lSkGDXxAKmb96jSdiB8HO3io8USZVHtdUjK7ix86N9OZ4KsDd03uE0oE6SpkeJVDAGRjszmMHuy42d0td0Fkr6PQlENwhIPuZNTH1EUxHcLRn1HnmzMAQCyOT0PzuPqoUL9w1pXB2DhLo37S1TflcndIZLqH0KbycWoYsRf6pgYTH3XckjqSsv0NIYXhAeOVXdJcWgV1x438PY51NqPGaTieM6LAvzETy6KiU8qNbHW9Hm8q1DlxoD221sYSHdXBwbEDdiSJSZ8C5Xczu6mC70Vh43P6rC2K5GIGeYTumJVYOHrl5idsqb7Ja8HE21IqCmvRTgSNpQrsUjyqNPs70AfXifF5MCSFH5u2F', 0),
(78, 0, 'config', 'config_compression', '0', 0),
(79, 0, 'config', 'config_error_display', '1', 0),
(80, 0, 'config', 'config_error_log', '1', 0),
(81, 0, 'config', 'config_error_filename', 'error.log', 0),
(82, 0, 'config', 'config_google_analytics', '', 0),
(83, 0, 'config', 'config_mail_engine', 'mail', 0),
(84, 0, 'config', 'config_mail_parameter', '', 0),
(85, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(86, 0, 'config', 'config_mail_smtp_username', '', 0),
(87, 0, 'config', 'config_mail_smtp_password', '', 0),
(88, 0, 'config', 'config_mail_smtp_port', '25', 0),
(89, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(90, 0, 'config', 'config_mail_alert_email', '', 0),
(91, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(92, 0, 'config', 'config_captcha', 'basic', 0),
(93, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(94, 0, 'config', 'config_login_attempts', '5', 0),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(103, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(104, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(105, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(106, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(107, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'total_sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '1', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(123, 0, 'module_category', 'module_category_status', '1', 0),
(124, 0, 'module_account', 'module_account_status', '1', 0),
(125, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(126, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(127, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(128, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(129, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(130, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(131, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(132, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(133, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(134, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(135, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(136, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(137, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(138, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(139, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(140, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(141, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(142, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(143, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(144, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(145, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(146, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(147, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(148, 0, 'theme_default', 'theme_default_status', '1', 0),
(149, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(151, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(153, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(155, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(157, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(158, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(165, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(167, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(168, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(171, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(199, 0, 'developer', 'developer_theme', '1', 0),
(200, 0, 'developer', 'developer_sass', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_shipping_courier`
--

CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Table structure for table `oc_statistics`
--

CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '0.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'ee547ae32fd73c27935b95d3a5c1e0bbc3e40ed4', '6NN7BKaei', 'John', 'Doe', 'limlipjoo@gmail.com', '', '', '::1', 1, '2020-09-24 15:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/takeawayorder\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/takeawayorder\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark\'unik\'', 'GEG', 1),
(184, 11, 'Kotayk\'', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik\'', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots\' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Niederösterreich', 'NOS', 1),
(202, 14, 'Oberösterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-Württemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Thüringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'Kalimantan Utara', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord-Brabant', 'NB', 1),
(2336, 150, 'Noord-Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid-Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul\'yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust\'-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas\'ka Oblast\'', '71', 1),
(3481, 220, 'Chernihivs\'ka Oblast\'', '74', 1),
(3482, 220, 'Chernivets\'ka Oblast\'', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs\'ka Oblast\'', '12', 1),
(3485, 220, 'Donets\'ka Oblast\'', '14', 1),
(3486, 220, 'Ivano-Frankivs\'ka Oblast\'', '26', 1),
(3487, 220, 'Khersons\'ka Oblast\'', '65', 1),
(3488, 220, 'Khmel\'nyts\'ka Oblast\'', '68', 1),
(3489, 220, 'Kirovohrads\'ka Oblast\'', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs\'ka Oblast\'', '32', 1),
(3492, 220, 'Luhans\'ka Oblast\'', '09', 1),
(3493, 220, 'L\'vivs\'ka Oblast\'', '46', 1),
(3494, 220, 'Mykolayivs\'ka Oblast\'', '48', 1),
(3495, 220, 'Odes\'ka Oblast\'', '51', 1),
(3496, 220, 'Poltavs\'ka Oblast\'', '53', 1),
(3497, 220, 'Rivnens\'ka Oblast\'', '56', 1),
(3498, 220, 'Sevastopol\'', '40', 1),
(3499, 220, 'Sums\'ka Oblast\'', '59', 1),
(3500, 220, 'Ternopil\'s\'ka Oblast\'', '61', 1),
(3501, 220, 'Vinnyts\'ka Oblast\'', '05', 1),
(3502, 220, 'Volyns\'ka Oblast\'', '07', 1),
(3503, 220, 'Zakarpats\'ka Oblast\'', '21', 1),
(3504, 220, 'Zaporiz\'ka Oblast\'', '23', 1),
(3505, 220, 'Zhytomyrs\'ka oblast\'', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs\'ka Oblast\'', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Qinghai', 'QH', 1),
(4233, 100, 'Papua Barat', 'PB', 1),
(4234, 100, 'Sulawesi Barat', 'SR', 1),
(4235, 100, 'Kepulauan Riau', 'KR', 1),
(4236, 105, 'Barletta-Andria-Trani', 'BT', 1),
(4237, 105, 'Fermo', 'FM', 1),
(4238, 105, 'Monza Brianza', 'MB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_order`
--
ALTER TABLE `food_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `food_order_item`
--
ALTER TABLE `food_order_item`
  ADD PRIMARY KEY (`food_order_item_id`);

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Indexes for table `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Indexes for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_googleshopping_category`
--
ALTER TABLE `oc_googleshopping_category`
  ADD PRIMARY KEY (`google_product_category`,`store_id`),
  ADD KEY `category_id_store_id` (`category_id`,`store_id`);

--
-- Indexes for table `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  ADD PRIMARY KEY (`product_advertise_google_id`),
  ADD UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`);

--
-- Indexes for table `oc_googleshopping_product_status`
--
ALTER TABLE `oc_googleshopping_product_status`
  ADD PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`);

--
-- Indexes for table `oc_googleshopping_product_target`
--
ALTER TABLE `oc_googleshopping_product_target`
  ADD PRIMARY KEY (`product_id`,`advertise_google_target_id`);

--
-- Indexes for table `oc_googleshopping_target`
--
ALTER TABLE `oc_googleshopping_target`
  ADD PRIMARY KEY (`advertise_google_target_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Indexes for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_order`
--
ALTER TABLE `food_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `food_order_item`
--
ALTER TABLE `food_order_item`
  MODIFY `food_order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  MODIFY `product_advertise_google_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2352;

--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=844;

--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;

--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
