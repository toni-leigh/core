-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 24, 2014 at 09:49 PM
-- Server version: 5.1.73-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tastydev_core`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `user_id` int(11) unsigned DEFAULT NULL,
  `ip_address` char(23) NOT NULL,
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `access_type` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`user_id`, `ip_address`, `access_time`, `access_type`) VALUES
(10, '86.147.18.88', '2013-01-30 14:58:29', 'I'),
(10, '86.147.18.88', '2013-02-09 14:52:18', 'I'),
(10, '86.184.248.247', '2013-02-28 15:14:58', 'I');

-- --------------------------------------------------------

--
-- Table structure for table `admin_tag`
--

DROP TABLE IF EXISTS `admin_tag`;
CREATE TABLE IF NOT EXISTS `admin_tag` (
  `admin_tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`admin_tag_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `anon_basket`
--

DROP TABLE IF EXISTS `anon_basket`;
CREATE TABLE IF NOT EXISTS `anon_basket` (
  `basket_id` varchar(64) NOT NULL,
  `contents` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `node_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `author` text NOT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE IF NOT EXISTS `calendar` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `reload_url` varchar(255) NOT NULL,
  `until_date` date NOT NULL COMMENT 'if this is all 0''s means that no end date was set and the calendar terminates at the default',
  `granularity` varchar(8) NOT NULL,
  `high_detail` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'will output half hour chunks per day regardless of granularity',
  `add_multiple` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'sets the calendar build an onscreen basket for adding multiple',
  `gran_link_through` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'allows the calendar to link through to next gran down if +1 event',
  `sales_calendar` tinyint(1) NOT NULL DEFAULT '0',
  `longest_event` int(8) NOT NULL COMMENT 'longest event length in half hours',
  `event_json` mediumtext NOT NULL,
  `sd_large` varchar(512) NOT NULL DEFAULT '{"width":"960","height":"23","panel_full":"78","panel":"78","spacer":"0"}',
  `sd_small` varchar(512) NOT NULL DEFAULT '{"width":"960","height":"50","panel_full":"40","panel":"40","spacer":"0"}',
  `year_book_link` varchar(2048) NOT NULL DEFAULT 'book',
  `month_book_link` varchar(2048) NOT NULL DEFAULT '%_PRICE<br/>%_DUR_COUNT %_DUR_UNIT<br/>%_SPACES left',
  `day_book_link` varchar(2048) NOT NULL DEFAULT '<div class=''daytime_name''>%_NAME [ click to book ]</div><br/> <div class=''daytime_details''>     <span class=''daytime_duration''>%_DUR_COUNT %_DUR_UNIT</span>     <span class=''daytime_price''>for %_PRICE</span>     <span class=''daytime_spaces''>%_SPACES space%_PLUR left</span> </div>',
  `year_view_link` varchar(2048) NOT NULL,
  `month_view_link` varchar(2048) NOT NULL,
  `css_link` varchar(255) NOT NULL,
  `validation_hash` varchar(64) NOT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_undo`
--

DROP TABLE IF EXISTS `calendar_undo`;
CREATE TABLE IF NOT EXISTS `calendar_undo` (
  `calendar_id` int(11) unsigned NOT NULL,
  `step_sequence` int(11) NOT NULL,
  `description` text NOT NULL,
  `undo_string` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`node_id`, `node_views`, `node_html`, `node_list`) VALUES
(501, 'list', '<p>default category</p>', ''),
(502, 'list', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('e40dd7bd592f16afc3eeaaf75548e67b', '66.249.74.64', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1362064824, 'a:2:{s:9:"user_data";s:0:"";s:7:"message";s:54:"<span class=''fail message''>page not found - 404</span>";}'),
('34de1ab604e8fbabe5e83226807cff3c', '86.184.248.247', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.22 (K', 1362064468, 'a:86:{s:2:"id";s:2:"10";s:3:"url";s:16:"super-admin-user";s:4:"name";s:16:"Super Admin User";s:4:"tags";s:16:"super admin user";s:10:"short_desc";s:57:"This is the user with the most power and access all areas";s:4:"type";s:4:"user";s:10:"node_order";s:1:"0";s:11:"category_id";s:8:"["1077"]";s:5:"image";s:31:"/user_img/10/1355260958t300.jpg";s:9:"stream_id";s:2:"13";s:7:"user_id";s:2:"10";s:9:"user_name";s:16:"super-admin-user";s:10:"user_image";s:0:"";s:7:"created";s:19:"2012-05-24 10:52:04";s:9:"published";s:19:"2010-01-03 10:00:00";s:7:"updated";s:10:"1344252187";s:6:"cached";s:1:"0";s:8:"cachable";s:1:"1";s:7:"visible";s:1:"1";s:7:"removed";s:1:"0";s:9:"protected";s:1:"1";s:9:"show_tabs";s:1:"1";s:9:"show_edit";s:1:"0";s:15:"show_in_details";s:1:"1";s:13:"show_comments";s:1:"0";s:6:"social";s:1:"0";s:10:"restricted";s:1:"0";s:9:"anon_user";s:1:"1";s:13:"signedup_user";s:1:"1";s:13:"customer_user";s:1:"1";s:13:"supplier_user";s:1:"1";s:10:"admin_user";s:1:"1";s:11:"super_admin";s:1:"1";s:10:"javascript";s:1:"0";s:6:"jquery";s:1:"0";s:9:"jquery_ui";s:1:"0";s:11:"large_files";s:1:"0";s:9:"pinterest";s:1:"0";s:5:"video";s:1:"0";s:5:"audio";s:1:"0";s:19:"display_calendar_id";s:1:"0";s:3:"map";s:1:"0";s:8:"latitude";s:15:"55.547471551257";s:9:"longitude";s:17:"-2.00965600585937";s:6:"canvas";s:1:"0";s:5:"price";s:1:"0";s:10:"sale_price";s:8:"99999.99";s:10:"sale_start";s:10:"0000-00-00";s:8:"sale_end";s:10:"0000-00-00";s:10:"node_views";s:0:"";s:12:"redirect_url";s:0:"";s:9:"user_type";s:11:"super_admin";s:10:"subscribed";s:1:"0";s:7:"zcredit";s:1:"0";s:5:"email";s:28:"Toni Leigh@excitedstatedesign.com";s:8:"password";s:40:"7947e92e3c8e49d85a930b90886dfbfd756ad636";s:12:"display_name";s:16:"Super Admin User";s:15:"user_short_desc";s:57:"This is the user with the most power and access all areas";s:7:"blocked";s:0:"";s:10:"blocked_by";s:15:"["1405","1405"]";s:5:"clist";s:15:"["1405","1405"]";s:8:"cset_one";s:0:"";s:11:"cset_one_by";s:0:"";s:8:"cset_two";s:0:"";s:11:"cset_two_by";s:0:"";s:10:"media_sets";s:0:"";s:10:"newsletter";s:1:"0";s:11:"facebook_id";s:0:"";s:14:"facebook_email";s:0:"";s:13:"facebook_link";s:0:"";s:18:"facebook_firstname";s:0:"";s:17:"facebook_lastname";s:0:"";s:3:"dob";s:10:"2010-01-03";s:6:"gender";s:0:"";s:6:"locale";s:0:"";s:15:"pcalc_vtype_ref";s:1:"2";s:15:"price_vtype_ref";s:1:"1";s:15:"pquan_vtype_ref";s:1:"3";s:17:"postage_calc_type";s:6:"weight";s:17:"postage_threshold";s:5:"10000";s:6:"basket";s:183:"{"b206fac54bdcbdf8a4fdfa16bc602c08":{"rowid":"b206fac54bdcbdf8a4fdfa16bc602c08","id":"postage","qty":"1","class":"uk_first","price":".00","calc":"0.00","name":"postage","subtotal":0}}";s:13:"event_default";s:3439:"{\r\n    "name":"test",\r\n    "price":"49.99",\r\n    "spaces":"10",\r\n    "duration_value":"1",\r\n    "duration":"hours",\r\n    "from_date":"01-10-2012",\r\n    "until_date":"31-03-2013",\r\n    "daily":"daily",\r\n    "daily_0000":"",\r\n    "daily_0030":"",\r\n    "daily_0100":"",\r\n    "daily_0130":"",\r\n    "daily_0200":"",\r\n    "daily_0230":"",\r\n    "daily_0300":"",\r\n    "daily_0330":"",\r\n    "daily_0400":"",\r\n    "daily_0430":"",\r\n    "daily_0500":"",\r\n    "daily_0530":"",\r\n    "daily_0600":"",\r\n    "daily_0630":"",\r\n    "daily_0700":"",\r\n    "daily_0730":"",\r\n    "daily_0800":"",\r\n    "daily_0830":"",\r\n    "daily_0900":"on",\r\n    "daily_0930":"",\r\n    "daily_1000":"on",\r\n    "daily_1030":"",\r\n    "daily_1100":"on",\r\n    "daily_1130":"",\r\n    "daily_1200":"on",\r\n    "daily_1230":"",\r\n    "daily_1300":"on",\r\n    "daily_1330":"",\r\n    "daily_1400":"on",\r\n    "daily_1430":"",\r\n    "daily_1500":"on",\r\n    "daily_1530":"",\r\n    "daily_1600":"on",\r\n    "daily_1630":"",\r\n    "daily_1700":"on",\r\n    "daily_1730":"",\r\n    "daily_1800":"",\r\n    "daily_1830":"",\r\n    "daily_1900":"",\r\n    "daily_1930":"",\r\n    "daily_2000":"",\r\n    "daily_2030":"",\r\n    "daily_2100":"",\r\n    "daily_2130":"",\r\n    "daily_2200":"",\r\n    "daily_2230":"",\r\n    "daily_2300":"",\r\n    "daily_2330":"",\r\n    "exclusive":"",\r\n    "repeat":"on",\r\n    "repeat_type":"",\r\n    "weekly":"on",\r\n    "weekly_1":"on",\r\n    "weekly_2":"",\r\n    "weekly_3":"on",\r\n    "weekly_4":"",\r\n    "weekly_5":"on",\r\n    "weekly_6":"",\r\n    "weekly_7":"",\r\n    "fortnightly":"",\r\n    "fortnightly1_1":"",\r\n    "fortnightly1_2":"",\r\n    "fortnightly1_3":"",\r\n    "fortnightly1_4":"",\r\n    "fortnightly1_5":"",\r\n    "fortnightly1_6":"",\r\n    "fortnightly1_7":"",\r\n    "fortnightly2_1":"",\r\n    "fortnightly2_2":"",\r\n    "fortnightly2_3":"",\r\n    "fortnightly2_4":"",\r\n    "fortnightly2_5":"",\r\n    "fortnightly2_6":"",\r\n    "fortnightly2_7":"",\r\n    "monthly":"",\r\n    "monthly_on_this_day":"",\r\n    "monthly_at_this_position":"",\r\n    "colours":\r\n    [\r\n        {\r\n            "border":"#af3070",\r\n            "fill":"#ff80c0",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#70af30",\r\n            "fill":"#c0ff80",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#3070af",\r\n            "fill":"#80c0ff",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#af7030",\r\n            "fill":"#ffc080",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#7030af",\r\n            "fill":"#c080ff",\r\n            "text":"#181818",\r\n            "default":1\r\n        },\r\n        {\r\n            "border":"#30af70",\r\n            "fill":"#80ffc0",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#af0030",\r\n            "fill":"#ff4080",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#30af00",\r\n            "fill":"#80ff40",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#0030af",\r\n            "fill":"#4080ff",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#af3000",\r\n            "fill":"#ff8040",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#3000af",\r\n            "fill":"#8040ff",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#00af30",\r\n            "fill":"#40ff80",\r\n            "text":"#181818"\r\n        }\r\n    ]\r\n}";s:7:"message";s:0:"";s:15:"admin_last_page";s:4:"list";s:13:"cart_contents";a:3:{s:32:"b206fac54bdcbdf8a4fdfa16bc602c08";a:8:{s:5:"rowid";s:32:"b206fac54bdcbdf8a4fdfa16bc602c08";s:2:"id";s:7:"postage";s:3:"qty";s:1:"1";s:5:"class";s:8:"uk_first";s:5:"price";s:3:".00";s:4:"calc";s:4:"0.00";s:4:"name";s:7:"postage";s:8:"subtotal";d:0;}s:11:"total_items";i:1;s:10:"cart_total";d:0;}s:4:"post";a:0:{}}'),
('76173400b48d5c1bcff6744089f3caef', '66.249.73.134', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1362033265, ''),
('a6e178a584a0545b6f800efebf2d5b6c', '66.249.73.134', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1362031611, ''),
('2d1c35ed63f2bbeeb04ddf9115a236e4', '66.249.73.134', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1362028951, ''),
('ccf91a272782a6c9fbb8845df31188dc', '119.63.193.131', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 1362020254, ''),
('fa4d173864758148672cc2ce25295e33', '202.46.54.53', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 1362020214, ''),
('753ace3db2b9089a18cece062e82ac7a', '66.249.73.134', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1362018910, ''),
('623eeaa4f18aade1a8df5597ec366734', '66.249.73.134', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1362016462, ''),
('ac12f12318ed5fcdda4a7fdeb11352f1', '180.76.5.192', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://', 1362001766, ''),
('836f8f57f0aedddc65fac2d2ea669a71', '119.63.193.196', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)', 1361981081, ''),
('c832adb21a78666f02b737c0cdc70297', '66.249.73.134', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww', 1361991649, '');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(256) NOT NULL,
  `contact_phone` varchar(256) NOT NULL,
  `contact_email` varchar(256) NOT NULL,
  `contact_details` text NOT NULL,
  `message` text NOT NULL,
  `contact_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `responded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country_code`
--

DROP TABLE IF EXISTS `country_code`;
CREATE TABLE IF NOT EXISTS `country_code` (
  `country_id` int(12) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`),
  KEY `country_code` (`country_code`),
  KEY `country_name` (`country_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=238 ;

--
-- Dumping data for table `country_code`
--

INSERT INTO `country_code` (`country_id`, `country_code`, `country_name`) VALUES
(1, 'GB', 'United Kingdom'),
(2, 'AF', 'Afghanistan'),
(3, 'AX', 'Aland Islands'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'AS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua And Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia And Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British Indian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'CV', 'Cape Verde'),
(42, 'KY', 'Cayman Islands'),
(43, 'CF', 'Central African Republic'),
(44, 'TD', 'Chad'),
(45, 'CL', 'Chile'),
(46, 'CN', 'China'),
(47, 'CX', 'Christmas Island'),
(48, 'CC', 'Cocos (keeling) Islands'),
(49, 'CO', 'Colombia'),
(50, 'KM', 'Comoros'),
(51, 'CG', 'Congo'),
(52, 'CD', 'Congo, The Democratic Republic Of The'),
(53, 'CK', 'Cook Islands'),
(54, 'CR', 'Costa Rica'),
(55, 'HR', 'Croatia'),
(56, 'CU', 'Cuba'),
(57, 'CY', 'Cyprus'),
(58, 'CZ', 'Czech Republic'),
(59, 'DK', 'Denmark'),
(60, 'DJ', 'Djibouti'),
(61, 'DM', 'Dominica'),
(62, 'DO', 'Dominican Republic'),
(63, 'EC', 'Ecuador'),
(64, 'EG', 'Egypt'),
(65, 'SV', 'El Salvador'),
(66, 'GQ', 'Equatorial Guinea'),
(67, 'ER', 'Eritrea'),
(68, 'EE', 'Estonia'),
(69, 'ET', 'Ethiopia'),
(70, 'FK', 'Falkland Islands (malvinas)'),
(71, 'FO', 'Faroe Islands'),
(72, 'FJ', 'Fiji'),
(73, 'FI', 'Finland'),
(74, 'FR', 'France'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard Island And Mcdonald Islands'),
(95, 'VA', 'Holy See (vatican City State)'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran, Islamic Republic Of'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KR', 'Korea, Republic Of'),
(114, 'KW', 'Kuwait'),
(115, 'KG', 'Kyrgyzstan'),
(116, 'LV', 'Latvia'),
(117, 'LB', 'Lebanon'),
(118, 'LS', 'Lesotho'),
(119, 'LR', 'Liberia'),
(120, 'LY', 'Libyan Arab Jamahiriya'),
(121, 'LI', 'Liechtenstein'),
(122, 'LT', 'Lithuania'),
(123, 'LU', 'Luxembourg'),
(124, 'MO', 'Macao'),
(125, 'MK', 'Macedonia, The Former Yugoslav Republic Of'),
(126, 'MG', 'Madagascar'),
(127, 'MW', 'Malawi'),
(128, 'MY', 'Malaysia'),
(129, 'MV', 'Maldives'),
(130, 'ML', 'Mali'),
(131, 'MT', 'Malta'),
(132, 'MH', 'Marshall Islands'),
(133, 'MQ', 'Martinique'),
(134, 'MR', 'Mauritania'),
(135, 'MU', 'Mauritius'),
(136, 'YT', 'Mayotte'),
(137, 'MX', 'Mexico'),
(138, 'FM', 'Micronesia, Federated States Of'),
(139, 'MD', 'Moldova, Republic Of'),
(140, 'MC', 'Monaco'),
(141, 'MN', 'Mongolia'),
(142, 'MS', 'Montserrat'),
(143, 'MA', 'Morocco'),
(144, 'MZ', 'Mozambique'),
(145, 'MM', 'Myanmar'),
(146, 'NA', 'Namibia'),
(147, 'NR', 'Nauru'),
(148, 'NP', 'Nepal'),
(149, 'NL', 'Netherlands'),
(150, 'AN', 'Netherlands Antilles'),
(151, 'NC', 'New Caledonia'),
(152, 'NZ', 'New Zealand'),
(153, 'NI', 'Nicaragua'),
(154, 'NE', 'Niger'),
(155, 'NG', 'Nigeria'),
(156, 'NU', 'Niue'),
(157, 'NF', 'Norfolk Island'),
(158, 'MP', 'Northern Mariana Islands'),
(159, 'NO', 'Norway'),
(160, 'OM', 'Oman'),
(161, 'PK', 'Pakistan'),
(162, 'PW', 'Palau'),
(163, 'PS', 'Palestinian Territory, Occupied'),
(164, 'PA', 'Panama'),
(165, 'PG', 'Papua New Guinea'),
(166, 'PY', 'Paraguay'),
(167, 'PE', 'Peru'),
(168, 'PH', 'Philippines'),
(169, 'PN', 'Pitcairn'),
(170, 'PL', 'Poland'),
(171, 'PT', 'Portugal'),
(172, 'PR', 'Puerto Rico'),
(173, 'QA', 'Qatar'),
(174, 'RE', 'Reunion'),
(175, 'RO', 'Romania'),
(176, 'RU', 'Russian Federation'),
(177, 'RW', 'Rwanda'),
(178, 'SH', 'Saint Helena'),
(179, 'KN', 'Saint Kitts And Nevis'),
(180, 'LC', 'Saint Lucia'),
(181, 'PM', 'Saint Pierre And Miquelon'),
(182, 'VC', 'Saint Vincent And The Grenadines'),
(183, 'WS', 'Samoa'),
(184, 'SM', 'San Marino'),
(185, 'ST', 'Sao Tome And Principe'),
(186, 'SA', 'Saudi Arabia'),
(187, 'SN', 'Senegal'),
(188, 'CS', 'Serbia And Montenegro'),
(189, 'SC', 'Seychelles'),
(190, 'SL', 'Sierra Leone'),
(191, 'SG', 'Singapore'),
(192, 'SK', 'Slovakia'),
(193, 'SI', 'Slovenia'),
(194, 'SB', 'Solomon Islands'),
(195, 'SO', 'Somalia'),
(196, 'ZA', 'South Africa'),
(197, 'GS', 'South Georgia And The South Sandwich Islands'),
(198, 'ES', 'Spain'),
(199, 'LK', 'Sri Lanka'),
(200, 'SD', 'Sudan'),
(201, 'SR', 'Suriname'),
(202, 'SJ', 'Svalbard And Jan Mayen'),
(203, 'SZ', 'Swaziland'),
(204, 'SE', 'Sweden'),
(205, 'CH', 'Switzerland'),
(206, 'SY', 'Syrian Arab Republic'),
(207, 'TW', 'Taiwan, Province Of China'),
(208, 'TJ', 'Tajikistan'),
(209, 'TZ', 'Tanzania, United Republic Of'),
(210, 'TH', 'Thailand'),
(211, 'TL', 'Timor-leste'),
(212, 'TG', 'Togo'),
(213, 'TK', 'Tokelau'),
(214, 'TO', 'Tonga'),
(215, 'TT', 'Trinidad And Tobago'),
(216, 'TN', 'Tunisia'),
(217, 'TR', 'Turkey'),
(218, 'TM', 'Turkmenistan'),
(219, 'TC', 'Turks And Caicos Islands'),
(220, 'TV', 'Tuvalu'),
(221, 'UG', 'Uganda'),
(222, 'UA', 'Ukraine'),
(223, 'AE', 'United Arab Emirates'),
(224, 'US', 'United States'),
(225, 'UM', 'United States Minor Outlying Islands'),
(226, 'UY', 'Uruguay'),
(227, 'UZ', 'Uzbekistan'),
(228, 'VU', 'Vanuatu'),
(229, 'VE', 'Venezuela'),
(230, 'VN', 'Viet Nam'),
(231, 'VG', 'Virgin Islands, British'),
(232, 'VI', 'Virgin Islands, U.s.'),
(233, 'WF', 'Wallis And Futuna'),
(234, 'EH', 'Western Sahara'),
(235, 'YE', 'Yemen'),
(236, 'ZM', 'Zambia'),
(237, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `email_sent`
--

DROP TABLE IF EXISTS `email_sent`;
CREATE TABLE IF NOT EXISTS `email_sent` (
  `email_id` int(12) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(256) NOT NULL,
  `email_subject` varchar(512) NOT NULL,
  `email_body` text NOT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `sent_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `calendar_id` int(11) unsigned NOT NULL,
  `from_date` date NOT NULL,
  `until_date` date NOT NULL,
  `last_in_sequence` date NOT NULL,
  `price` double NOT NULL,
  `spaces` int(11) NOT NULL,
  `duration` varchar(20) NOT NULL DEFAULT '',
  `exclusive` tinyint(1) NOT NULL DEFAULT '0',
  `colour_choice` int(4) NOT NULL DEFAULT '0',
  `show_repeat` tinyint(1) NOT NULL DEFAULT '0',
  `repetition` text NOT NULL,
  PRIMARY KEY (`node_id`),
  KEY `calendar_id` (`calendar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hierarchy`
--

DROP TABLE IF EXISTS `hierarchy`;
CREATE TABLE IF NOT EXISTS `hierarchy` (
  `node_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rght` int(11) NOT NULL,
  PRIMARY KEY (`node_id`),
  KEY `parent_id` (`parent_id`,`lft`,`rght`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `image_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(11) unsigned DEFAULT NULL,
  `stream_id` int(11) unsigned NOT NULL,
  `image_name` char(140) NOT NULL,
  `image_filename` char(18) NOT NULL,
  `image_ext` char(6) NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT 'image creator',
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `in_gallery` tinyint(1) NOT NULL DEFAULT '0',
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `ratio` double NOT NULL DEFAULT '1' COMMENT 'the ratio between width and height of the none square images',
  `thumbnail_coordinates` varchar(128) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `node_id` (`node_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mass_undo`
--

DROP TABLE IF EXISTS `mass_undo`;
CREATE TABLE IF NOT EXISTS `mass_undo` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '10',
  `undo_array` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mass_undo`
--

INSERT INTO `mass_undo` (`user_id`, `undo_array`) VALUES
(10, '');

-- --------------------------------------------------------

--
-- Table structure for table `mediaset`
--

DROP TABLE IF EXISTS `mediaset`;
CREATE TABLE IF NOT EXISTS `mediaset` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '',
  `node_html` text NOT NULL,
  `comment_stream` text,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `email` varchar(255) NOT NULL,
  `sign_up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
CREATE TABLE IF NOT EXISTS `node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` char(255) NOT NULL DEFAULT '',
  `name` char(255) NOT NULL DEFAULT '',
  `tags` char(255) NOT NULL DEFAULT '',
  `short_desc` char(156) NOT NULL DEFAULT '',
  `type` char(12) NOT NULL DEFAULT '',
  `node_order` int(8) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '501',
  `image` char(50) NOT NULL DEFAULT '',
  `stream_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1' COMMENT 'creator id',
  `user_name` char(255) NOT NULL DEFAULT '' COMMENT 'creator name',
  `user_image` char(50) NOT NULL DEFAULT '' COMMENT 'creator image name',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published` datetime NOT NULL DEFAULT '2010-01-03 10:00:00',
  `updated` int(10) NOT NULL DEFAULT '0',
  `cached` int(10) NOT NULL DEFAULT '0' COMMENT 'when was this node last cached',
  `cachable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'can this node be cached',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `protected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'page protected - this page is required for the correct function of the site',
  `show_tabs` tinyint(1) NOT NULL DEFAULT '1',
  `show_edit` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_details` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'show the edit in place panel in the details view rather than in the specific view',
  `show_comments` tinyint(1) NOT NULL DEFAULT '0',
  `social` tinyint(1) NOT NULL DEFAULT '0',
  `restricted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for subscribed users',
  `anon_user` tinyint(1) NOT NULL DEFAULT '1',
  `signedup_user` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'CMS',
  `customer_user` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'e-commerce',
  `supplier_user` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'e-commerce / marketplace',
  `admin_user` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'CMS / ecommerce',
  `super_admin` tinyint(1) NOT NULL DEFAULT '1',
  `javascript` tinyint(1) NOT NULL DEFAULT '0',
  `jquery` tinyint(1) NOT NULL DEFAULT '0',
  `jquery_ui` tinyint(1) NOT NULL DEFAULT '0',
  `large_files` tinyint(1) NOT NULL DEFAULT '0',
  `pinterest` tinyint(1) NOT NULL DEFAULT '0',
  `video` tinyint(1) NOT NULL DEFAULT '0',
  `video_src` char(11) NOT NULL,
  `audio` tinyint(1) NOT NULL DEFAULT '0',
  `display_calendar_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'used to display a calendar on this node',
  `map` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '999',
  `longitude` double NOT NULL DEFAULT '999',
  `map_sprite` char(15) NOT NULL DEFAULT '[0,45]',
  `canvas` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'does this node use the canvas HTML5 tag',
  `price` double NOT NULL DEFAULT '0',
  `sale_price` double NOT NULL DEFAULT '99999.99',
  `sale_start` date NOT NULL DEFAULT '2010-01-03',
  `sale_end` date NOT NULL DEFAULT '2010-01-03',
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `type` (`type`),
  KEY `visible` (`visible`),
  KEY `category_id` (`category_id`),
  KEY `node_order` (`node_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED AUTO_INCREMENT=1448 ;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`id`, `url`, `name`, `tags`, `short_desc`, `type`, `node_order`, `category_id`, `image`, `stream_id`, `user_id`, `user_name`, `user_image`, `created`, `published`, `updated`, `cached`, `cachable`, `visible`, `removed`, `protected`, `show_tabs`, `show_edit`, `show_in_details`, `show_comments`, `social`, `restricted`, `anon_user`, `signedup_user`, `customer_user`, `supplier_user`, `admin_user`, `super_admin`, `javascript`, `jquery`, `jquery_ui`, `large_files`, `pinterest`, `video`, `video_src`, `audio`, `display_calendar_id`, `map`, `latitude`, `longitude`, `map_sprite`, `canvas`, `price`, `sale_price`, `sale_start`, `sale_end`) VALUES
(6, 'fresh-template', 'Fresh Template', 'this is the home page', 'This is the home page of the template', 'page', 0, 502, '', 4, 1, 'Super Admin User', '', '2012-05-20 15:26:07', '0000-00-00 00:00:00', 1355570986, 1338230719, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(351, 'ad_images', 'Manage Images', '', '', 'page', 0, 501, '', 5, 1, 'Super Admin User', '', '2012-05-21 08:21:19', '2010-01-03 10:00:00', 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(352, 'ad_thumbnail', 'Set Image Thumbnail', '', 'Allows for a thumbnail image to cropped form the main image', 'page', 0, 501, '', 6, 1, 'Super Admin User', '', '2012-05-22 12:08:05', '2010-01-03 10:00:00', 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(1, 'super-admin-user', 'Super Admin User', 'super admin user', 'This is the user with the most power and access all areas', 'user', 0, 501, '/user_img/10/1355260958t300.jpg', 13, 1, 'Super Admin User', '', '2012-05-24 09:52:04', '2010-01-03 10:00:00', 1344252187, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(7, 'contact-us', 'Contact Us', 'contact us', 'This is the contact us page', 'page', 0, 501, '', 14, 1, 'Super Admin User', '', '2012-05-24 15:08:49', '2010-01-03 10:00:00', 1340202661, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(102, 'create_page', 'Create / Edit Page', '', 'This page allows for pages to be created or edited', 'page', 0, 501, '', 15, 1, 'Super Admin User', '', '2012-05-29 06:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(172, 'create_user', 'Create / Edit User', '', 'This page allows for users to be created or edited', 'page', 0, 501, '', 17, 1, 'Super Admin User', '', '2012-05-29 06:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(202, 'create_product', 'Create / Edit Product', '', 'This page allows for products to be created or edited', 'page', 0, 501, '', 19, 1, 'Super Admin User', '', '2012-05-29 06:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(12, 'register', 'Register', 'user,register', 'the page on which the user registers', 'page', 0, 501, '', 29, 1, 'Super Admin User', '', '2012-06-19 13:06:07', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(132, 'create_group', 'Create / Edit Group', '', 'This page allows for groups to be created or edited', 'page', 0, 501, '', 38, 1, 'Super Admin User', '', '2012-05-29 06:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(161, 'list_category', 'Categories', '', '', 'page', 0, 501, '', 185, 1, 'Super Admin User', '', '2012-06-25 10:01:11', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(171, 'list_user', 'My Users', '', '', 'page', 0, 501, '', 185, 1, 'Super Admin User', '', '2012-06-25 10:01:11', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(201, 'list_product', 'Products', '', '', 'page', 0, 501, '', 186, 1, 'Super Admin User', '', '2012-06-25 10:01:11', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(131, 'list_group', 'Groups', '', '', 'page', 0, 501, '', 187, 1, 'Super Admin User', '', '2012-06-25 10:01:11', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(5, 'signed-up', 'Signed Up', '', '', 'user', 0, 501, '', 918, 5, 'Signed Up', '', '2013-04-14 05:51:07', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(101, 'list_page', 'My Pages', '', '', 'page', 0, 501, '', 189, 1, 'Super Admin User', '', '2012-06-25 10:01:11', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(3, 'supplier', 'Supplier', '', '', 'user', 0, 501, '', 869, 3, 'Customer', '', '2013-04-07 16:23:16', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(173, 'change-login-credentials', 'Change Email and Password', '', '', 'page', 0, 501, '', 223, 1, 'Super Admin User', '', '2012-06-26 12:39:42', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(100, '_man', 'Core Dev Manual', 'Man', 'Man', 'page', 0, 0, '', 940, 1, 'Super Admin User', '/user_img/10/1365779998s700.jpg', '2013-04-15 18:18:50', '2010-01-03 10:00:00', 1366053530, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(203, 'node_variations', 'Node Variations', '', '', 'page', 0, 501, '', 259, 1, 'Super Admin User', '', '2012-07-09 17:43:06', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(233, 'postage-calculation-definition', 'Postage Calculator', '', '', 'page', 0, 501, '', 268, 0, '', '', '2012-07-24 08:28:56', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(231, 'variation-types-definition', 'Product Variation Types', '', '', 'page', 0, 501, '', 269, 1, 'Super Admin User', '', '2012-07-24 08:28:56', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(31, 'search-display', 'Search Results', '', '', 'page', 0, 501, '', 0, 0, '', '', '2012-07-26 07:05:29', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(4, 'customer', 'Customer', '', '', 'user', 0, 501, '', 866, 4, 'Supplier', '', '2013-04-07 15:45:01', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(2, 'admin', 'Admin', '', '', 'user', 0, 501, '', 865, 2, 'Admin', '', '2013-04-07 15:30:56', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(112, 'create_blog', 'Create / Edit Blog', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-29 13:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(111, 'list_blog', 'My Blogs', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-29 13:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(162, 'create_category', 'Create / Edit Category', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-29 13:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(16, 'basket', 'My Basket', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-30 10:11:26', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(17, 'order-address', 'Order Address', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-08-08 11:44:20', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(18, 'order-success', 'Order Success', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-08-08 11:44:20', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(19, 'order-failed', 'Order Failed', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-08-08 11:44:20', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(271, 'order-list', 'All Orders', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-08-09 13:28:58', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(232, 'voucher-definition', 'Vouchers', 'Voucher Definition', 'Voucher Definition', 'page', 0, 501, '', 0, 1, 'Super Admin User', '/user_img/10/1343723919s700.jpg', '2012-08-20 06:51:01', '2010-01-03 10:00:00', 1345452661, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(361, 'newsletter-signups', 'Newsletter Signups', 'Newsletter Signups', 'Newsletter Signups', 'page', 0, 501, '', 437, 1, 'Super Admin User', '/user_img/10/1343723919s700.jpg', '2012-08-20 13:23:38', '2010-01-03 10:00:00', 1345476218, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(152, 'create_video', 'Create / Edit video', '', 'This page allows for videos to be created or edited', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-05-29 05:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(151, 'list_video', 'video', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-29 12:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(302, 'create_calendar', 'Create / Edit calendar', '', 'This page allows for calendars to be created or edited', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-05-29 05:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(301, 'list_calendar', 'edit calendars', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-29 12:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(501, 'default-category', 'default category', 'default category', 'default category', 'category', 0, 501, '', 305, 1, 'Super Admin User', '/img/default_image.png', '2012-10-01 13:27:10', '2010-01-03 10:00:00', 1349101630, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(314, 'calendar_events', 'Calendar Events', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-09 17:43:06', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(313, 'edit-event', 'Edit Event Sequence', '', '', 'page', 0, 501, '', 0, 1, '', '', '2012-10-30 11:53:25', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(311, 'list_event', 'events', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-07-29 12:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(502, 'top-level-nav-category', 'Top Level Nav Category', 'Top Level Nav Category', 'Top Level Nav Category', 'category', 0, 501, '', 305, 1, 'Super Admin User', '/img/default_image.png', '2012-10-01 13:27:10', '2010-01-03 10:00:00', 1349101630, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(312, 'create_event', 'Create / Edit event', '', 'This page allows for events to be created or edited', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2012-05-29 05:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(404, 'page_not_found', 'Page Not Found', '', '', 'page', 0, 501, '', 759, 1, 'Super Admin User', '', '2012-12-04 12:40:36', '2010-01-03 10:00:00', 1355261369, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(32, 'individual_image', 'Individual Image', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2013-01-21 17:33:37', '2010-01-03 10:00:00', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(362, 'miscellaneous-admin', 'Miscellaneous Admin', 'Miscellaneous Admin', 'Miscellaneous Admin', 'page', 11, 501, '', 864, 1, 'Super Admin User', '/img/default_image.png', '2013-04-07 14:57:59', '2010-01-03 10:00:00', 1365350279, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(11, 'login', 'Login', 'Login', 'Login', 'page', 0, 1074, '', 310, 1, 'Super Admin User', '/img/default_image.png', '2012-09-17 09:04:22', '2010-01-03 10:00:00', 1347876262, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(353, 'all-images', 'All Your Images', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2013-04-13 09:11:09', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(121, 'create_seoarticle', 'create or edit seoarticle', '', '', 'page', 0, 0, '', 0, 1, 'Super Admin User', '', '2012-05-29 06:42:30', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(122, 'list_seoarticle', 'seoarticles', '', '', 'page', 0, 0, '', 0, 1, 'Super Admin User', '', '2012-07-29 13:46:08', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '0000-00-00', '0000-00-00'),
(13, 'map', 'Map', 'Map', 'The Map Page', 'page', 88, 502, '', 800, 1, 'Super Admin User', '/img/default_image.png', '2013-05-18 15:23:21', '2010-01-03 10:00:00', 1368964034, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 1, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(14, 'gallery', 'Gallery', 'Gallery', 'Gallery', 'page', 187, 502, '', 867, 1, 'Super Admin User', '/img/default_image.png', '2013-05-27 10:15:01', '2010-01-03 10:00:00', 1369653301, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03'),
(363, 'contact-list', 'Contacts', '', '', 'page', 0, 501, '', 0, 1, 'Super Admin User', '', '2013-08-20 18:12:20', '2010-01-03 10:00:00', 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 999, 999, '[0,45]', 0, 0, 99999.99, '2010-01-03', '2010-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `node_group`
--

DROP TABLE IF EXISTS `node_group`;
CREATE TABLE IF NOT EXISTS `node_group` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL''',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `blocked` text NOT NULL,
  `clist` text NOT NULL,
  `media_sets` text NOT NULL,
  `open_group` tinyint(1) NOT NULL DEFAULT '0',
  `comment_stream` text NOT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='for grouping nodes, name is an alias of group';

-- --------------------------------------------------------

--
-- Table structure for table `nvar`
--

DROP TABLE IF EXISTS `nvar`;
CREATE TABLE IF NOT EXISTS `nvar` (
  `nvar_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(11) unsigned NOT NULL,
  `price` double NOT NULL,
  `sale_price` double NOT NULL DEFAULT '0',
  `sale_start` date NOT NULL DEFAULT '2010-01-03',
  `sale_end` date NOT NULL DEFAULT '2010-01-03',
  `post_calc` int(11) unsigned NOT NULL DEFAULT '0',
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `stock_level` int(11) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT '0',
  `stock_threshold` int(11) NOT NULL DEFAULT '0',
  `variation_display` tinyint(1) NOT NULL DEFAULT '1',
  `event_timestamp` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nvar_id`),
  KEY `node_id` (`node_id`),
  KEY `event_timestamp` (`event_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='details of the nodes variations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nvar_type`
--

DROP TABLE IF EXISTS `nvar_type`;
CREATE TABLE IF NOT EXISTS `nvar_type` (
  `node_id` int(11) unsigned NOT NULL,
  `var_type_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`node_id`,`var_type_id`),
  KEY `var_type_id` (`var_type_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='the ways in which this node varies';

-- --------------------------------------------------------

--
-- Table structure for table `nvar_value`
--

DROP TABLE IF EXISTS `nvar_value`;
CREATE TABLE IF NOT EXISTS `nvar_value` (
  `nvar_id` int(11) unsigned NOT NULL,
  `var_type_id` int(11) unsigned NOT NULL,
  `var_value_id` int(11) unsigned NOT NULL,
  `undefined_value` text NOT NULL,
  PRIMARY KEY (`nvar_id`,`var_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='the variation values of this node';

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `admin_page` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'admin pages sometimes behave differently',
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`node_id`, `node_views`, `node_html`, `node_list`, `admin_page`) VALUES
(6, 'pages/home', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '', 0),
(232, 'pages/protected/ad_voucher_definition', '', '', 1),
(361, 'pages/protected/ad_newsletter_signups', '', '', 1),
(7, 'pages/protected/contact', '<p>Welcome to the test build site</p>\n<p>Here you can use the form to contact us</p>\n<p>Alternatively you can <strong>phone us</strong> on:</p>\n<p><strong>07786 117 638sdfgdfg</strong></p>', '', 0),
(351, 'pages/protected/ad_images', '<p>This is the page for organising the images you have uploaded, either the loose ones not associated with an item on the site or those associated with a particular item. You can upload a new image using the form at the top of the page</p>\r\n<p>You can also set the main image which is the one used for small panels and anywhere other than the details page where all images will be shown or remove any or all of the images from the site. It is also possible to renameimages here too</p>', '', 1),
(102, 'pages/protected/ad_node_form', '<p>You can create a new page using this form. The page will be automatically hidden until you decide to show it, though you will still be able to visit it and check it is OK</p>', '', 1),
(172, 'pages/protected/ad_node_form', '<p>You can create a new user using this form. This is a very high level function and should only be available to site master admin</p>', '', 1),
(202, 'pages/protected/ad_node_form', '<p>You can create a new product using this form. The page will be automatically hidden until you decide to show it, though you will still be able to visit it and check it is OK</p>', '', 1),
(352, 'pages/protected/ad_image_thumbnail', 'Here you crop a thumbnail from the image you just uploaded so that it can be used on panels throughout the site</p>', '', 1),
(132, 'pages/protected/ad_node_form', '<p>You can create a new group using this form. The group will be automatically hidden until you decide to show it, though you will still be able to visit it and check it is OK</p>', '', 1),
(46, 'pages/protected/ad_node_form', '<p>You can create a new mediaset using this form. The mediaset will be automatically hidden until you decide to show it, though you will still be able to visit it and check it is OK</p>', '', 1),
(12, 'pages/protected/register', '<p>Please use the form below to register for an account on the site :-) x</p>', '', 0),
(171, 'pages/protected/ad_node_list', '', '', 1),
(201, 'pages/protected/ad_node_list', '', '', 1),
(131, 'pages/protected/ad_node_list', '', '', 1),
(71, 'pages/protected/ad_node_list', '', '', 1),
(101, 'pages/protected/ad_node_list', '', '', 1),
(78, 'pages/protected/ad_node_form', '', '', 1),
(173, 'pages/protected/ad_change_credentials', '', '', 1),
(100, 'pages/protected/manual', '<p>Man</p>', '', 1),
(203, 'pages/protected/ad_variations', '', '', 1),
(233, 'pages/protected/ad_post_calc_def', '', '', 1),
(231, 'pages/protected/ad_var_type_def', '', '', 1),
(18, 'pages/protected/order_success', '', '', 0),
(19, 'pages/protected/order_failed', '', '', 0),
(271, 'pages/protected/ad_order_list', '', '', 1),
(31, 'node_element/%_PANEL,template/right_hand_col', '<p>rr</p>', '', 0),
(115, 'pages/protected/ad_hierarchy', '', '', 1),
(116, 'pages/protected/ad_hierarchy', '', '', 1),
(112, 'pages/protected/ad_node_form', '', '', 1),
(111, 'pages/protected/ad_node_list', '', '', 1),
(162, 'pages/protected/ad_node_form', '', '', 1),
(17, 'pages/protected/order_address', '', '', 0),
(16, 'pages/protected/basket', '', '', 0),
(152, 'pages/protected/ad_node_form', '', '', 1),
(151, 'pages/protected/ad_node_list', '', '', 1),
(302, 'pages/protected/ad_node_form', '', '', 1),
(301, 'pages/protected/ad_node_list', '', '', 1),
(314, 'pages/protected/ad_events', '', '', 1),
(312, 'pages/protected/ad_node_form', '', '', 1),
(311, 'pages/protected/ad_node_list', '', '', 1),
(32, 'pages/protected/individual_image', '', '', 0),
(313, 'pages/protected/ad_event_sequence', '', '', 1),
(404, '%_PANEL', '<p>We''re sorry that we can''t find what you are looking for:</p>\n<p>Please try out <a href="/">home page to start</a>&nbsp;or perhaps the <a href="/contact-us">contact us page here</a></p>\n<p>Or you could try using the multi coloured navigation links in the header.</p>', '', 0),
(362, 'pages/protected/ad_misc', '<p>Miscellaneous Admin</p>', '', 1),
(11, 'pages/protected/login', '<p>Login</p>', '', 0),
(353, 'pages/protected/ad_all_images', '', '', 1),
(161, 'pages/protected/ad_node_list', '', '', 1),
(121, 'pages/protected/ad_node_form', '', '', 1),
(122, 'pages/protected/ad_node_list', '', '', 1),
(13, '%_PANEL', '', '', 0),
(14, '%_PANEL', '<p>Gallery</p>', '', 0),
(363, 'pages/protected/ad_contacts', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pending`
--

DROP TABLE IF EXISTS `pending`;
CREATE TABLE IF NOT EXISTS `pending` (
  `node_id` int(11) unsigned NOT NULL COMMENT 'the user who did the friending',
  `tnode_id` int(11) unsigned NOT NULL COMMENT 'the user who was friended',
  PRIMARY KEY (`node_id`,`tnode_id`),
  KEY `node_id` (`node_id`),
  KEY `tnode_id` (`tnode_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='holds pending relationships between nodes';

-- --------------------------------------------------------

--
-- Table structure for table `postage_charges`
--

DROP TABLE IF EXISTS `postage_charges`;
CREATE TABLE IF NOT EXISTS `postage_charges` (
  `postage_charge_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `postage_calc_type` varchar(6) NOT NULL,
  `min_value` int(11) NOT NULL,
  `max_value` int(11) NOT NULL,
  `uk_first` float NOT NULL,
  `uk_second` float NOT NULL,
  `international_first` float NOT NULL,
  `international_second` float NOT NULL,
  PRIMARY KEY (`postage_charge_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `postage_charges`
--

INSERT INTO `postage_charges` (`postage_charge_id`, `user_id`, `postage_calc_type`, `min_value`, `max_value`, `uk_first`, `uk_second`, `international_first`, `international_second`) VALUES
(140, 10, '', 1, -1, 3.5, 2.5, 7, 5.5);

-- --------------------------------------------------------

--
-- Table structure for table `postage_class`
--

DROP TABLE IF EXISTS `postage_class`;
CREATE TABLE IF NOT EXISTS `postage_class` (
  `pclass_id` int(11) NOT NULL AUTO_INCREMENT,
  `pclass_name` varchar(32) NOT NULL COMMENT 'corresponds to a column in the postage_charges table',
  `pclass_heading` varchar(32) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_order` int(2) NOT NULL,
  PRIMARY KEY (`pclass_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `postage_class`
--

INSERT INTO `postage_class` (`pclass_id`, `pclass_name`, `pclass_heading`, `user_id`, `display_order`) VALUES
(10, 'uk_first', 'UK 1st', 10, 10),
(20, 'uk_second', 'UK 2nd', 10, 26),
(30, 'international_first', 'Inter 1st', 10, 38),
(40, 'international_second', 'Inter 2nd', 10, 50);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `admin_tags` text NOT NULL,
  `sale_amount` int(11) unsigned NOT NULL DEFAULT '0',
  `sale_type` char(5) NOT NULL DEFAULT 'pound' COMMENT 'perc or pound',
  `nvar_json` text NOT NULL,
  `nvar_json_split` text NOT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE IF NOT EXISTS `search` (
  `search_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `search_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `search_terms` text NOT NULL,
  `result_count` int(11) NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `seoarticle`
--

DROP TABLE IF EXISTS `seoarticle`;
CREATE TABLE IF NOT EXISTS `seoarticle` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL,
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
CREATE TABLE IF NOT EXISTS `stream` (
  `stream_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `json` mediumtext NOT NULL,
  PRIMARY KEY (`stream_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=790 ;

--
-- Dumping data for table `stream`
--

INSERT INTO `stream` (`stream_id`, `json`) VALUES
(4, ''),
(5, ''),
(6, ''),
(13, ''),
(14, ''),
(15, ''),
(17, ''),
(19, ''),
(29, ''),
(38, ''),
(40, ''),
(185, ''),
(186, ''),
(187, ''),
(188, ''),
(189, ''),
(194, ''),
(223, ''),
(759, ''),
(760, ''),
(259, ''),
(268, ''),
(269, ''),
(242, ''),
(305, '');

-- --------------------------------------------------------

--
-- Table structure for table `template_fragment`
--

DROP TABLE IF EXISTS `template_fragment`;
CREATE TABLE IF NOT EXISTS `template_fragment` (
  `tf_id` int(11) NOT NULL AUTO_INCREMENT,
  `view` char(63) NOT NULL,
  `tf_order` int(5) NOT NULL,
  `tf_type` char(4) NOT NULL,
  PRIMARY KEY (`tf_id`),
  KEY `tf_type` (`tf_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `template_fragment`
--

INSERT INTO `template_fragment` (`tf_id`, `view`, `tf_order`, `tf_type`) VALUES
(1, 'template/head_open', 10, 'head'),
(2, 'template/head_close', 50, 'head'),
(3, 'template/page_open', 60, 'head'),
(4, 'template/header_open', 70, 'head'),
(5, 'template/header_close', 120, 'head'),
(7, 'template/content_open', 140, 'head'),
(8, 'template/content_close', 10, 'foot'),
(9, 'template/footer_open', 20, 'foot'),
(10, 'template/footer_close', 70, 'foot'),
(12, 'template/page_close', 90, 'foot'),
(20, 'template/map', 85, 'foot'),
(19, 'template/node_tabs', 170, 'head'),
(21, 'template/admin_nav', 65, 'head');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) unsigned NOT NULL COMMENT 'is the same as Node.id',
  `node_views` varchar(512) NOT NULL DEFAULT '%_PANEL',
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `user_name` varchar(255) NOT NULL COMMENT 'is the same as Node.url',
  `redirect_url` varchar(128) NOT NULL DEFAULT '',
  `user_type` varchar(20) NOT NULL DEFAULT 'signedup_user',
  `subscribed` tinyint(1) NOT NULL,
  `zcredit` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL DEFAULT 'password' COMMENT 'default stops empty password hack with fb connect',
  `display_name` varchar(255) NOT NULL COMMENT 'is the same as Node.name',
  `user_short_desc` varchar(140) NOT NULL COMMENT 'is the same as Node.short_desc',
  `blocked` text NOT NULL COMMENT 'this user has blocked the users contained in this field',
  `blocked_by` text NOT NULL COMMENT 'this user has been blocked by the users contained in this field',
  `clist` text NOT NULL COMMENT 'connection list, all this users friends',
  `cset_one` text NOT NULL COMMENT 'this user has added the users contained in this field to their second set of friends',
  `cset_one_by` text NOT NULL COMMENT 'this user has been added to the second friend sets of the users contained in this field',
  `cset_two` text NOT NULL COMMENT 'this user has added the users contained in this field to their third set of friends',
  `cset_two_by` text NOT NULL COMMENT 'this user has been added to the third friend sets of the users contained in this field',
  `media_sets` text NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `facebook_id` varchar(255) NOT NULL,
  `facebook_email` varchar(255) NOT NULL,
  `facebook_link` varchar(512) NOT NULL,
  `facebook_firstname` varchar(127) NOT NULL,
  `facebook_lastname` varchar(63) NOT NULL,
  `dob` date NOT NULL DEFAULT '2010-01-03',
  `gender` varchar(20) NOT NULL,
  `locale` varchar(30) NOT NULL,
  `pcalc_vtype_ref` int(11) unsigned NOT NULL,
  `price_vtype_ref` int(11) unsigned NOT NULL,
  `pquan_vtype_ref` int(11) unsigned NOT NULL,
  `postage_calc_type` varchar(6) NOT NULL,
  `postage_threshold` float NOT NULL DEFAULT '100000',
  `basket` text NOT NULL,
  `event_default` text NOT NULL,
  `stream_last_viewed` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Master user table';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `node_views`, `node_html`, `node_list`, `user_name`, `redirect_url`, `user_type`, `subscribed`, `zcredit`, `email`, `password`, `display_name`, `user_short_desc`, `blocked`, `blocked_by`, `clist`, `cset_one`, `cset_one_by`, `cset_two`, `cset_two_by`, `media_sets`, `newsletter`, `facebook_id`, `facebook_email`, `facebook_link`, `facebook_firstname`, `facebook_lastname`, `dob`, `gender`, `locale`, `pcalc_vtype_ref`, `price_vtype_ref`, `pquan_vtype_ref`, `postage_calc_type`, `postage_threshold`, `basket`, `event_default`, `stream_last_viewed`) VALUES
(1, '%_PANEL', '', '', 'super-admin-user', '', 'super_admin', 0, 0, 'super_admin@test.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Super Admin User', 'This is the user with the most power and access all areas', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '2010-01-03', '', '', 2, 1, 3, 'weight', 50000, '{"b206fac54bdcbdf8a4fdfa16bc602c08":{"rowid":"b206fac54bdcbdf8a4fdfa16bc602c08","id":"postage","qty":"1","class":"uk_first","price":".00","calc":"0.00","name":"postage","subtotal":0}}', '{\r\n    "name":"test",\r\n    "price":"49.99",\r\n    "spaces":"10",\r\n    "duration_value":"1",\r\n    "duration":"hours",\r\n    "from_date":"01-10-2012",\r\n    "until_date":"31-03-2013",\r\n    "daily":"daily",\r\n    "daily_0000":"",\r\n    "daily_0030":"",\r\n    "daily_0100":"",\r\n    "daily_0130":"",\r\n    "daily_0200":"",\r\n    "daily_0230":"",\r\n    "daily_0300":"",\r\n    "daily_0330":"",\r\n    "daily_0400":"",\r\n    "daily_0430":"",\r\n    "daily_0500":"",\r\n    "daily_0530":"",\r\n    "daily_0600":"",\r\n    "daily_0630":"",\r\n    "daily_0700":"",\r\n    "daily_0730":"",\r\n    "daily_0800":"",\r\n    "daily_0830":"",\r\n    "daily_0900":"on",\r\n    "daily_0930":"",\r\n    "daily_1000":"on",\r\n    "daily_1030":"",\r\n    "daily_1100":"on",\r\n    "daily_1130":"",\r\n    "daily_1200":"on",\r\n    "daily_1230":"",\r\n    "daily_1300":"on",\r\n    "daily_1330":"",\r\n    "daily_1400":"on",\r\n    "daily_1430":"",\r\n    "daily_1500":"on",\r\n    "daily_1530":"",\r\n    "daily_1600":"on",\r\n    "daily_1630":"",\r\n    "daily_1700":"on",\r\n    "daily_1730":"",\r\n    "daily_1800":"",\r\n    "daily_1830":"",\r\n    "daily_1900":"",\r\n    "daily_1930":"",\r\n    "daily_2000":"",\r\n    "daily_2030":"",\r\n    "daily_2100":"",\r\n    "daily_2130":"",\r\n    "daily_2200":"",\r\n    "daily_2230":"",\r\n    "daily_2300":"",\r\n    "daily_2330":"",\r\n    "exclusive":"",\r\n    "repeat":"on",\r\n    "repeat_type":"",\r\n    "weekly":"on",\r\n    "weekly_1":"on",\r\n    "weekly_2":"",\r\n    "weekly_3":"on",\r\n    "weekly_4":"",\r\n    "weekly_5":"on",\r\n    "weekly_6":"",\r\n    "weekly_7":"",\r\n    "fortnightly":"",\r\n    "fortnightly1_1":"",\r\n    "fortnightly1_2":"",\r\n    "fortnightly1_3":"",\r\n    "fortnightly1_4":"",\r\n    "fortnightly1_5":"",\r\n    "fortnightly1_6":"",\r\n    "fortnightly1_7":"",\r\n    "fortnightly2_1":"",\r\n    "fortnightly2_2":"",\r\n    "fortnightly2_3":"",\r\n    "fortnightly2_4":"",\r\n    "fortnightly2_5":"",\r\n    "fortnightly2_6":"",\r\n    "fortnightly2_7":"",\r\n    "monthly":"",\r\n    "monthly_on_this_day":"",\r\n    "monthly_at_this_position":"",\r\n    "colours":\r\n    [\r\n        {\r\n            "border":"#af3070",\r\n            "fill":"#ff80c0",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#70af30",\r\n            "fill":"#c0ff80",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#3070af",\r\n            "fill":"#80c0ff",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#af7030",\r\n            "fill":"#ffc080",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#7030af",\r\n            "fill":"#c080ff",\r\n            "text":"#181818",\r\n            "default":1\r\n        },\r\n        {\r\n            "border":"#30af70",\r\n            "fill":"#80ffc0",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#af0030",\r\n            "fill":"#ff4080",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#30af00",\r\n            "fill":"#80ff40",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#0030af",\r\n            "fill":"#4080ff",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#af3000",\r\n            "fill":"#ff8040",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#3000af",\r\n            "fill":"#8040ff",\r\n            "text":"#181818"\r\n        },\r\n        {\r\n            "border":"#00af30",\r\n            "fill":"#40ff80",\r\n            "text":"#181818"\r\n        }\r\n    ]\r\n}', '0000-00-00 00:00:00'),
(2, '%_PANEL', '', '', 'admin', '', 'admin_user', 0, 0, 'admin@test.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Admin', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '2010-01-03', '', '', 0, 0, 0, '', 100000, '{"6d9b79eddad1613ac3c9ca7ddc82d002":{"rowid":"6d9b79eddad1613ac3c9ca7ddc82d002","id":"214","qty":"1","price":"550","name":"Blue Thing","pcalc":"1000","options":{"pack_of":"1","size":"12","colour":"pink"},"type":"product","subtotal":550},"b206fac54bdcbdf8a4fdfa16bc602c08":{"rowid":"b206fac54bdcbdf8a4fdfa16bc602c08","id":"postage","qty":"1","class":"uk_first","price":"4.5","calc":1000,"name":"postage","subtotal":4.5}}', '', '0000-00-00 00:00:00'),
(3, '%_PANEL', '', '', 'supplier', '', 'supplier_user', 0, 0, 'toni@toni.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Supplier', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '2010-01-03', '', '', 0, 0, 0, '', 100000, '{"b206fac54bdcbdf8a4fdfa16bc602c08":{"rowid":"b206fac54bdcbdf8a4fdfa16bc602c08","id":"postage","qty":"1","class":"uk_first","price":".00","calc":"0.00","name":"postage","subtotal":0}}', '', '0000-00-00 00:00:00'),
(4, '%_PANEL', '', '', 'customer', '', 'customer_user', 0, 0, 'supplier@supplier.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Customer', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '2010-01-03', '', '', 0, 0, 0, '', 100000, '{"b206fac54bdcbdf8a4fdfa16bc602c08":{"rowid":"b206fac54bdcbdf8a4fdfa16bc602c08","id":"postage","qty":"1","class":"uk_first","price":".00","calc":"0.00","name":"postage","subtotal":0}}', '', '0000-00-00 00:00:00'),
(5, '%_PANEL', '', '', 'signedup', '', 'signedup_user', 0, 0, 'test@test.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Signed Up', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '2010-01-03', '', '', 0, 0, 0, '', 100000, '{"b206fac54bdcbdf8a4fdfa16bc602c08":{"rowid":"b206fac54bdcbdf8a4fdfa16bc602c08","id":"postage","qty":"1","class":"uk_first","price":".00","calc":"0.00","name":"postage","subtotal":0}}', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
CREATE TABLE IF NOT EXISTS `user_order` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_status` varchar(8) NOT NULL DEFAULT 'created',
  `user_id` int(11) unsigned NOT NULL,
  `supplier_id` int(11) unsigned NOT NULL DEFAULT '10',
  `order_total` double NOT NULL,
  `product_total` double NOT NULL,
  `postage_total` double NOT NULL,
  `voucher_total` double NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `voucher_id` varchar(10) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `dname` text NOT NULL,
  `dhouse` text NOT NULL,
  `daddress1` text NOT NULL,
  `daddress2` text NOT NULL,
  `dtown` text NOT NULL,
  `dpostcode` text NOT NULL,
  `dcountry` varchar(2) NOT NULL,
  `bname` text NOT NULL,
  `bhouse` text NOT NULL,
  `baddress1` text NOT NULL,
  `baddress2` text NOT NULL,
  `btown` text NOT NULL,
  `bpostcode` text NOT NULL,
  `bstate` varchar(2) NOT NULL,
  `bcountry` varchar(2) NOT NULL,
  `items` text NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `us_state_code`
--

DROP TABLE IF EXISTS `us_state_code`;
CREATE TABLE IF NOT EXISTS `us_state_code` (
  `state_code` varchar(2) NOT NULL,
  `state_name` varchar(30) NOT NULL,
  KEY `state_name` (`state_name`),
  KEY `state_code` (`state_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_state_code`
--

INSERT INTO `us_state_code` (`state_code`, `state_name`) VALUES
('AL', 'Alabama'),
('AK', 'Alaska'),
('AS', 'American Samoa'),
('AZ', 'Arizona'),
('AR', 'Arkansas'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Delaware'),
('DC', 'District of Columbia'),
('FM', 'Federated States of Micronesia'),
('FL', 'Florida'),
('GE', 'Gerogia'),
('GU', 'Guam'),
('HI', 'Hawaii'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('IA', 'Iowa'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('ME', 'Maine'),
('MH', 'Marshall Islands'),
('MD', 'Maryland'),
('MA', 'Massachusetts'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'),
('NE', 'Nebraska'),
('NV', 'Nevada'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('MP', 'Northern Mariana Islands'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PW', 'Palau'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VI', 'Virgin Islands'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'),
('WI', 'Wisconsin'),
('WY', 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `var_type`
--

DROP TABLE IF EXISTS `var_type`;
CREATE TABLE IF NOT EXISTS `var_type` (
  `var_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `var_type_name` text NOT NULL,
  PRIMARY KEY (`var_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='the types of variation that a user has created for products' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `var_type`
--

INSERT INTO `var_type` (`var_type_id`, `user_id`, `var_type_name`) VALUES
(1, 10, 'price'),
(2, 10, 'post calc'),
(3, 10, 'pack of');

-- --------------------------------------------------------

--
-- Table structure for table `var_value`
--

DROP TABLE IF EXISTS `var_value`;
CREATE TABLE IF NOT EXISTS `var_value` (
  `var_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `var_type_id` int(11) unsigned NOT NULL,
  `var_value` text NOT NULL,
  PRIMARY KEY (`var_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='the vals of var types the user has created' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `var_value`
--

INSERT INTO `var_value` (`var_value_id`, `var_type_id`, `var_value`) VALUES
(1, 3, '1'),
(3, 3, '2'),
(4, 3, '5'),
(5, 3, '10');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `node_id` int(11) unsigned NOT NULL,
  `node_views` varchar(512) NOT NULL,
  `node_html` text NOT NULL,
  `node_list` varchar(512) NOT NULL DEFAULT '',
  `video_path` varchar(255) NOT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` varchar(11) NOT NULL,
  `expires` date NOT NULL DEFAULT '0000-00-00',
  `voucher_type_id` int(11) NOT NULL,
  `spent` tinyint(1) NOT NULL DEFAULT '0',
  `single_shot` tinyint(1) NOT NULL DEFAULT '1',
  `voucher_user_id` int(11) unsigned NOT NULL DEFAULT '10',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_type`
--

DROP TABLE IF EXISTS `voucher_type`;
CREATE TABLE IF NOT EXISTS `voucher_type` (
  `voucher_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_type_name` text NOT NULL,
  `adjust_value` int(11) NOT NULL,
  `adjust_type` varchar(10) NOT NULL,
  `threshold` float NOT NULL,
  `adjust_focus` varchar(7) NOT NULL,
  PRIMARY KEY (`voucher_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wordcloud`
--

DROP TABLE IF EXISTS `wordcloud`;
CREATE TABLE IF NOT EXISTS `wordcloud` (
  `wordcloud_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wordcloud_html` text NOT NULL,
  PRIMARY KEY (`wordcloud_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
