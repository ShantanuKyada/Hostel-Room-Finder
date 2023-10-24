-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 08:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--
CREATE DATABASE IF NOT EXISTS `ecommerceapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerceapp`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(5, 'Bruno', 'brunoadmin@gmail.com', '$2y$10$qZ0OoyX8bhAVxDFM/fx8leZSZwlyq15c1C/KTnaqDLSx6eCDJ0VpC', '0'),
(8, 'Harry Den', 'harryden@gmail.com', '$2y$10$YKSDtra7v2wH6ORYfry8Ue9t49pk1AvQvdJGuq4lDvFLEcx.kP6Mq', '0'),
(10, 'Darshil', 'darshil@lunagariya.com', '$2y$10$4ng4jhcIQLRL52OY9gNJ3.6Cik13Nh.9IgqSji4Vf9LukBEZbydbu', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Dell'),
(5, 'Rare Rabbit'),
(6, 'OnePlus+'),
(7, 'Google');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 4, '::1', 4, 1),
(4, 19, '::1', 7, 1),
(5, 7, '::1', 7, 1),
(15, 1, '::1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Electronics'),
(6, 'Clothings'),
(12, 'Mobiles');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `User_Name` varchar(25) NOT NULL,
  `User_Email` varchar(35) NOT NULL,
  `User_Message` varchar(75) NOT NULL,
  `User_Ratting` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`User_Name`, `User_Email`, `User_Message`, `User_Ratting`) VALUES
('Shantanu Kyada', 'shantanukyada07@gmail.com', 'qwertyuiolkjhgfdsazx bnm,', 5),
('Shantanu', 'shantanukyada7@gmail.com', 'asdfugikhj,gm', 2),
('darshil', 'darshil@gmail.com', 'qwertyuiop;l,kmjhgfdsazxc vbnm', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed'),
(5, 2, 20, 1, '0ZT9165245323443N', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 2, 'Samsung Galaxy Z Fold 2', 249999, 5, 'Last yearâ€™s Galaxy Fold was a sort of experiment in the field of foldable phones. The idea was an innovative one but the phone faced a lot of durability issues. Its launch was postponed multiple times because of Samsungâ€™s inability to solve all the problems. Samsung will likely avoid those situations with its successor.', '1616500092_sm-zfold.jpg', 'samsung, mobile, galaxy fold'),
(2, 12, 3, 'Iphone 12 Pro Max', 187000, 7, '5G goes Pro. A14 Bionic rockets past every other smartphone chip. The Pro camera system takes low-light photography to the next level â€” with an even bigger jump on iPhone 12 Pro Max. And Ceramic Shield delivers four times better drop performance.', '1616499931_iph12pm.jpg', 'apple, iphone'),
(3, 12, 6, 'Oneplus Nord2 5G', 30000, 10, 'It\'s the affordable smartphone ', '1648903332_Oneplus Nord2.jpg', 'Mobile'),
(4, 12, 2, 'Samsung Galaxy S21 Ultra', 155000, 10, 'This is a demo', '1616492395_Samsung-Galaxy-S21-Ultra-1608287647-0-0.jpg', 'samsung, s21, s21 ultra'),
(5, 12, 6, 'OnePlus 8T', 86000, 13, 'On spec-sheet, the OnePlus 8T boasts plenty of improvements from its predecessor i.e. the OnePlus 8. For instance, its 6.55-inch 1080p OLED display now comes with a faster 120Hz refresh rate. In comparison, the OnePlus 8 had a 90Hz refresh rate. This upgrade seems huge. However, users will agree that you canâ€™t really find much of a difference between 90Hz to 120Hz on a smartphone screen.', '1616500410_OnePlus-8T-5G-Lunar-Silver-8GB-RAM-128GB-Storage-image-4.jpg', 'one plus, oneplus8'),
(6, 12, 3, 'Iphone 13 pro Max', 125000, 5, 'It\'s the latest iPhone available today.\r\nIt has 1TB storage space. ', '1648903688_Iphone 13 pro max.jpg', 'Iphone'),
(7, 2, 1, 'Hp_Envy series', 100000, 4, 'It has the latest processor core i7.  ', '1648894142_Hp_envy laptop.jpg', 'Laptop'),
(8, 2, 1, 'hp spectre x360', 150000, 4, 'It has got the best user experience in windows laptops. ', '1648905321_HP spectre1.jpg', 'Laptop'),
(9, 2, 4, 'Dell XPS', 70000, 1, 'It\'s has got a slick design though has got the latest processors. ', '1648905620_Dell lapy.jpg', 'Dell Laptop'),
(10, 2, 4, 'Dell inspiron', 75000, 5, 'It has got the latest spec and outperforms most the other laptops. ', '1648905964_Dell inspiron.jpg', 'Dell laptop'),
(11, 6, 3, 'Apple T-shirt', 2000, 25, 'This is for the fans of the apple brand. ', '1648989518_Apple_t-shirt.jpg', 'T-shirt'),
(20, 2, 3, 'MacBook Pro', 119999, 4, 'Top spec laptop. ', '1645077046_MacBook M1-pro_2021.jpeg', 'Laptop'),
(25, 6, 5, 'Rare Rabbit cardigan', 5000, 10, 'It has the best and most comfortable material. ', '1648990121_Rare rabbit_jacket.jpg', 'cardigan'),
(26, 6, 5, 'Rare Rabbit sweatshirt', 3500, 14, 'One can wear it at any period of the day. ', '1648990279_Rare rabit_sweatshirt.jpg', 'sweatshirt'),
(27, 6, 7, 'Google T-shirt', 2099, 30, 'It is merchandise for google fans. ', '1648990755_Screenshot (144).png', 'T-shirt');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Darshil', 'Luna', 'darshil@lunagariya.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 'qwertyuiop', 'asdfghjkl'),
(2, 'Shantanu', 'Kyada', 'shantanukyada07@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '9104839400', '54,kailash kevlum greenland bh. vrundavan society, kalavad road', 'qwertyuiop');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
--
-- Database: `event_db`
--
CREATE DATABASE IF NOT EXISTS `event_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `event_db`;

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `event_id` int(30) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= pending, 1 =Paid',
  `attendance_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1= present',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = for verification,  1 = confirmed,2= declined',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`id`, `name`, `contact`, `email`, `address`, `event_id`, `payment_status`, `attendance_status`, `status`, `date_created`) VALUES
(2, 'George Wilson', '+18456-5455-55', 'gwilson@sample.com', 'Sample', 1, 1, 0, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `event` text NOT NULL,
  `description` text NOT NULL,
  `schedule` datetime NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Public, 2-Private',
  `audience_capacity` int(30) NOT NULL,
  `payment_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Free,payable',
  `amount` double NOT NULL DEFAULT 0,
  `banner` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `event`, `description`, `schedule`, `type`, `audience_capacity`, `payment_type`, `amount`, `banner`, `date_created`) VALUES
(1, 1, 'Sample Only', '&lt;p&gt;&lt;/p&gt;&lt;h2 style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;&lt;b style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Sample Header&lt;/b&gt;&lt;/h2&gt;&lt;p style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;&lt;b style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non diam phasellus vestibulum lorem. Vel elit scelerisque mauris pellentesque pulvinar pellentesque. Fames ac turpis egestas integer eget. Nam at lectus urna duis convallis convallis tellus. Turpis tincidunt id aliquet risus. Turpis tincidunt id aliquet risus feugiat in ante metus. Ut porttitor leo a diam sollicitudin tempor id eu nisl. Sit amet tellus cras adipiscing enim eu turpis. Ultricies mi eget mauris pharetra et ultrices neque.&lt;/b&gt;&lt;/p&gt;&lt;h3 style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;&lt;b style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Headere 3&lt;/b&gt;&lt;/h3&gt;&lt;p style=&quot;text-align: center; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Magna etiam tempor orci eu lobortis elementum nibh. Quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis. Gravida cum sociis natoque penatibus et magnis. Mi ipsum faucibus vitae aliquet nec ullamcorper sit. Malesuada bibendum arcu vitae elementum curabitur vitae nunc sed velit. Tincidunt id aliquet risus feugiat in ante. Elementum facilisis leo vel fringilla est ullamcorper eget. Id semper risus in hendrerit gravida rutrum. Aliquam vestibulum morbi blandit cursus risus at ultrices mi. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Ultrices eros in cursus turpis massa tincidunt dui ut ornare. Pretium vulputate sapien nec sagittis. Lectus sit amet est placerat in egestas erat imperdiet sed. Auctor elit sed vulputate mi. Eget est lorem ipsum dolor sit amet consectetur. Tristique magna sit amet purus gravida quis. In arcu cursus euismod quis viverra nibh cras pulvinar mattis.&lt;/p&gt;&lt;p style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Luctus accumsan tortor posuere ac ut. Fames ac turpis egestas maecenas pharetra convallis posuere morbi. Arcu felis bibendum ut tristique et egestas. Mauris in aliquam sem fringilla ut morbi. Lobortis elementum nibh tellus molestie nunc non blandit massa. Curabitur gravida arcu ac tortor dignissim convallis aenean. Libero enim sed faucibus turpis in eu mi bibendum. Neque egestas congue quisque egestas diam in arcu cursus. Diam phasellus vestibulum lorem sed risus ultricies. Semper feugiat nibh sed pulvinar proin gravida hendrerit lectus a. Volutpat lacus laoreet non curabitur gravida arcu ac. Elementum tempus egestas sed sed risus pretium quam. Diam maecenas ultricies mi eget mauris pharetra et. Venenatis cras sed felis eget velit aliquet sagittis. Arcu dictum varius duis at consectetur lorem donec massa sapien. Ullamcorper velit sed ullamcorper morbi tincidunt ornare.&lt;/p&gt;&lt;p style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Tempus iaculis urna id volutpat lacus laoreet. Auctor neque vitae tempus quam pellentesque nec nam. Eget nunc lobortis mattis aliquam faucibus purus. Amet nisl suscipit adipiscing bibendum est ultricies integer quis. Donec ac odio tempor orci dapibus ultrices in. Varius sit amet mattis vulputate. Ornare massa eget egestas purus. Pellentesque dignissim enim sit amet venenatis. Blandit massa enim nec dui nunc mattis enim ut tellus. Habitant morbi tristique senectus et netus et. Blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque. Facilisis magna etiam tempor orci eu lobortis elementum nibh. Feugiat nibh sed pulvinar proin gravida hendrerit lectus a. Euismod elementum nisi quis eleifend quam. Convallis convallis tellus id interdum velit laoreet id. Pulvinar mattis nunc sed blandit libero volutpat sed cras ornare.&lt;/p&gt;&lt;p style=&quot;-webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 1.5em; margin-bottom: 1.5em; line-height: 1.5; animation: 1000ms linear 0s 1 normal none running fadeInLorem;&quot;&gt;Neque gravida in fermentum et. Amet nulla facilisi morbi tempus iaculis urna id volutpat. Id diam vel quam elementum pulvinar etiam non quam lacus. Mauris commodo quis imperdiet massa. Pulvinar mattis nunc sed blandit libero volutpat. Suspendisse faucibus interdum posuere lorem. Nunc pulvinar sapien et ligula ullamcorper malesuada proin libero. Blandit cursus risus at ultrices mi tempus imperdiet nulla. Eget velit aliquet sagittis id consectetur purus. Quis lectus nulla at volutpat diam ut venenatis tellus. Nunc mattis enim ut tellus elementum.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', '2020-10-20 05:00:00', 1, 500, 2, 500, '1602647100_JSAV-multiscreen_3ddbdd40-38d9-4b64-9cf2-5d0ef356f29c.jpg', '0000-00-00 00:00:00'),
(2, 2, 'Event 2', '&lt;p&gt;Lorem ipsum dolor sit amet, viris eleifend convenire mei te, ei mea probo cotidieque? Pri gloriatur disputationi vituperatoribus ex, dolorum disputationi quo te! Cibo reque postea te his, mea quis oportere ei. Qui ut vide idque minimum, aeterno laoreet consetetur mei in. Mel stet audiam omittantur cu!&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Dictas meliore eos ea, iusto libris volumus mel ut. Sea id exerci ignota expetenda, cum ei nostro eirmod apeirian. Est luptatum liberavisse cu, cu quo stet veniam. Mei causae honestatis ad, esse fugit laudem qui ex, eu duo choro quaestio. Scripta appetere cu vim, agam nulla percipit duo ei.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Per in sanctus instructior. No prompta instructior duo, per no mucius deterruisset, sumo munere delenit vix ut? Mea ut idque lorem assum, eum et idque dissentias. Choro tempor per ex, at duo fuisset maiestatis! Has in voluptaria vituperata, at erat vituperata est, autem prompta appetere in per!&lt;/p&gt;', '2020-10-23 18:00:00', 1, 500, 1, 0, '1602652920_pngtree-purple-hd-business-banner-image_5493.jpg', '0000-00-00 00:00:00'),
(3, 2, 'Sample Private', 'Wedding', '2020-10-28 17:00:00', 2, 300, 1, 0, '1602660960_images4.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Event Management System', 'info@sample.comm', '+6948 8542 623', '1602641160_JSAV-multiscreen_3ddbdd40-38d9-4b64-9cf2-5d0ef356f29c.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(30) NOT NULL,
  `venue` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue`, `address`, `description`, `rate`) VALUES
(1, 'Sample Venue', 'Sample Address', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 300),
(2, 'Venue 2', 'Sample', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 250),
(3, 'Sample Venue 2', 'Sample Address', 'Lorem ipsum dolor sit amet, id has nostro vivendo, id per alii volutpat inciderint? Graece ornatus gubergren te quo, qui at oblique accusamus, id pro eros etiam conceptam! Ullum clita.', 280),
(4, 'Sample Venue 3', 'Sample only', 'Lorem ipsum dolor sit amet, id has nostro vivendo, id per alii volutpat inciderint? Graece ornatus gubergren te quo, qui at oblique accusamus, id pro eros etiam conceptam! Ullum clita.', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `venue_booking`
--

CREATE TABLE `venue_booking` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-for verification,1=confirmed,2=canceled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_booking`
--

INSERT INTO `venue_booking` (`id`, `name`, `address`, `email`, `contact`, `venue_id`, `duration`, `datetime`, `status`) VALUES
(1, 'John Smith', 'Sample', 'asdasd@gmail.com', '+18456-5455-55', 2, '1 night', '2020-10-14 17:00:00', 1),
(2, 'Foram thubmer ', 'yagnik road', 'test@gmail.com', '1234567890', 2, 'aergtqaet4hrndene', '2022-04-30 14:00:00', 1),
(3, 'Shantanu Kyada', '54,kailash kevlum greenland bh. vrundavan society, kalavad road', 'shantanukyada07@gmail.com', '09104839400', 2, 'aergtqaet4hrndene', '2022-04-30 18:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue_booking`
--
ALTER TABLE `venue_booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audience`
--
ALTER TABLE `audience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `venue_booking`
--
ALTER TABLE `venue_booking`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `hostel_room_finder`
--
CREATE DATABASE IF NOT EXISTS `hostel_room_finder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_room_finder`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(12) NOT NULL,
  `admin_name` varchar(12) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `admin_contactno` int(10) NOT NULL,
  `admin_email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_admin_table`
--

CREATE TABLE `hostel_admin_table` (
  `h_admin_id` int(12) NOT NULL,
  `h_admin_first_name` varchar(12) NOT NULL,
  `h_admin_last_name` varchar(12) NOT NULL,
  `h_admin_password` varchar(30) NOT NULL,
  `h_admin_contactno` int(10) NOT NULL,
  `h_admin_email` varchar(30) NOT NULL,
  `h_admin_city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_table`
--

CREATE TABLE `hostel_table` (
  `h_id` int(12) NOT NULL,
  `h_name` varchar(12) NOT NULL,
  `h_contactno` int(10) NOT NULL,
  `h_address` varchar(50) NOT NULL,
  `h_city` varchar(20) NOT NULL,
  `h_email` varchar(30) NOT NULL,
  `np.of_rooms` int(5) NOT NULL,
  `no.of_rooms_occupied` int(5) NOT NULL,
  `no.of_rooms_available` int(5) NOT NULL,
  `price_per_year` int(5) NOT NULL,
  `price_per_month` int(5) NOT NULL,
  `food` varchar(5) NOT NULL,
  `laundry` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hr_table`
--

CREATE TABLE `hr_table` (
  `HR_ID` int(10) NOT NULL,
  `HR_NAME` varchar(20) NOT NULL,
  `HR_CONTACT_NUMBER` int(10) NOT NULL,
  `HR_ADDRESS` varchar(100) NOT NULL,
  `HR_CITY` varchar(25) NOT NULL,
  `HR_EMAIL` varchar(25) NOT NULL,
  `HR_TOTAL_BEDS` int(100) NOT NULL,
  `HR_BEDS_AVAIL` int(100) NOT NULL,
  `HR_BEDS_OCCUP` int(100) NOT NULL,
  `HR_PRICE_PER_YEAR` int(50) NOT NULL,
  `HR_LAUNDRY` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_table`
--

INSERT INTO `hr_table` (`HR_ID`, `HR_NAME`, `HR_CONTACT_NUMBER`, `HR_ADDRESS`, `HR_CITY`, `HR_EMAIL`, `HR_TOTAL_BEDS`, `HR_BEDS_AVAIL`, `HR_BEDS_OCCUP`, `HR_PRICE_PER_YEAR`, `HR_LAUNDRY`) VALUES
(1, 'Ravi', 5678, 'dfghj', 'fghj', 'a@gmail.com', 456, 45, 4, 4, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `room_admin_table`
--

CREATE TABLE `room_admin_table` (
  `r_admin_id` int(12) NOT NULL,
  `r_admin_first_name` varchar(20) NOT NULL,
  `r_admin_last_name` varchar(20) NOT NULL,
  `r_admin_password` varchar(30) NOT NULL,
  `r_admin_contactno` int(10) NOT NULL,
  `r_admin_email` varchar(30) NOT NULL,
  `r_admin_city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_table`
--

CREATE TABLE `room_table` (
  `r_id` int(12) NOT NULL,
  `r_name` varchar(12) NOT NULL,
  `r_contactno` int(10) NOT NULL,
  `r_address` varchar(30) NOT NULL,
  `r_city` varchar(20) NOT NULL,
  `r_email` varchar(30) NOT NULL,
  `no.of_rooms` int(5) NOT NULL,
  `no.of_rooms_occupied` int(5) NOT NULL,
  `no.of_room_available` int(5) NOT NULL,
  `price_per_year` int(5) NOT NULL,
  `price_per_month` int(5) NOT NULL,
  `food` varchar(5) NOT NULL,
  `laundary` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(12) NOT NULL,
  `user_first_name` varchar(12) NOT NULL,
  `user_last_name` varchar(12) NOT NULL,
  `user_password` varchar(25) NOT NULL,
  `user_occupation` varchar(15) NOT NULL,
  `user_contactno` int(10) NOT NULL,
  `user_gender` varchar(12) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_city` varchar(20) NOT NULL,
  `user_guardian_number` int(10) NOT NULL,
  `user_guardian_number2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_first_name`, `user_last_name`, `user_password`, `user_occupation`, `user_contactno`, `user_gender`, `user_email`, `user_city`, `user_guardian_number`, `user_guardian_number2`) VALUES
(7, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(8, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(9, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(10, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(12, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(13, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(14, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(15, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(16, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(17, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(18, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(19, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(20, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(21, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(22, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(23, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(24, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(25, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(26, 'poiuytr', '', '', '', 0, 'Female', '', '', 0, 0),
(27, 'qwe', 'uiol', 'huio', 'uio', 67890, 'Female', 'abcd@gmail.com', 'fghjkl', 5567890, 67890);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `hostel_admin_table`
--
ALTER TABLE `hostel_admin_table`
  ADD PRIMARY KEY (`h_admin_id`);

--
-- Indexes for table `hostel_table`
--
ALTER TABLE `hostel_table`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `hr_table`
--
ALTER TABLE `hr_table`
  ADD PRIMARY KEY (`HR_ID`);

--
-- Indexes for table `room_admin_table`
--
ALTER TABLE `room_admin_table`
  ADD PRIMARY KEY (`r_admin_id`);

--
-- Indexes for table `room_table`
--
ALTER TABLE `room_table`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hr_table`
--
ALTER TABLE `hr_table`
  MODIFY `HR_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Database: `house_rental`
--
CREATE DATABASE IF NOT EXISTS `house_rental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `house_rental`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `t_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `agreement` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`t_id`, `h_id`, `booking_date`, `period`, `price`, `agreement`) VALUES
(2, 1, '2019-11-10', 10, 5000, 0x41475245454d454e54204245545745454e204f574e455220414e4420434f4e54524143544f520d0a666f7220757365207768656e20612073746970756c6174656420707269636520666f726d73207468650d0a6261736973206f66207061796d656e7420616e6420746f2062652075736564206f6e6c790d0a77697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163740d0a0d0a544849532041475245454d454e54206d616465206f6e20746865202020202020202020202020646179206f66202020202020202020202020202020202020696e2074686520796561722074776f2074686f7573616e6420616e64202020202020202020202020202020202020202e200d0a0d0a425920414e44204245545745454e0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c65642074686520224f776e6572220d0a0d0a414e440d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c6564207468652022436f6e74726163746f72220d0a0d0a0d0a5749544e4553534554483a20207468617420746865204f776e657220616e6420436f6e74726163746f7220756e64657274616b6520616e6420616772656520617320666f6c6c6f77733a0d0a0d0a0d0a41525449434c4520412d312054484520574f524b0d0a0d0a54686520436f6e74726163746f72207368616c6c3a0d0a0d0a28612909706572666f726d20616c6c2074686520576f726b2072657175697265642062792074686520436f6e747261637420446f63756d656e747320666f7220205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f2e20285365652054656e64657220466f726d20666f72204465736372697074696f6e292077686963682068617665206265656e207369676e656420696e20747269706c696361746520627920626f74682074686520706172746965732c0d0a0d0a28622909646f20616e642066756c66696c2065766572797468696e6720696e6469636174656420627920746869732041677265656d656e742c20616e640d0a0d0a28632909636f6d6d656e63652074686520576f726b206279207468652020202020202020202020202020646179206f66202020202020202020202020202020202020202020202020202c20323020202020202020616e64207375627374616e7469616c6c7920706572666f726d2074686520576f726b206f66207468697320436f6e7472616374206173206365727469666965642062792074686520456e67696e6565722f41726368697465637420627920746865205f5f5f5f5f5f5f20646179206f66205f5f5f5f5f5f5f5f5f203230202020202e0d0a0d0a286429095468652022456e67696e6565722f417263686974656374222069732074686520706572736f6e2064657369676e6174656420617320737563682066726f6d2074696d6520746f2074696d6520627920746865204f776e65722e0d0a0d0a0d0a0d0a41525449434c4520412d3220434f4e545241435420444f43554d454e54530d0a0d0a54686520666f6c6c6f77696e6720697320616e206578616374206c697374206f662074686520436f6e747261637420446f63756d656e747320726566657272656420746f20696e2041727469636c6520412d313a2028534545205441424c45204f4620434f4e54454e545320464f52204c495354204f4620444f43554d454e545320414e442044524157494e4753292e2020205365652041747461636865640d0a0d0a0d0a0d0a41525449434c4520412d3320434f4e54524143542050524943450d0a0d0a54484520434f4e5452414354205052494345204953202024205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f202848535420494e434c55444544292043616e616469616e2066756e6473207768696368207072696365207368616c6c206265207375626a65637420746f2061646a7573746d656e7473206173206d617920626520726571756972656420696e206163636f7264616e63652077697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742e200d0a0d0a0d0a0d0a41525449434c4520412d34205041594d454e540d0a0d0a286129095375626a65637420746f206170706c696361626c65206c656769736c6174696f6e20616e642c2077686572652073756368206c656769736c6174696f6e20646f6573206e6f74206578697374206f72206170706c792c20696e206163636f7264616e636520776974682073756368207072657363726962656420726567756c6174696f6e73206f7220696e6475737472792070726163746963652072657370656374696e6720686f6c646261636b2070657263656e746167657320616e6420696e206163636f7264616e63652077697468207468652070726f766973696f6e73206f66207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742c20746865204f776e6572207368616c6c3a0d0a0d0a28312920206d616b65206d6f6e74686c79207061796d656e747320746f2074686520436f6e74726163746f72206f6e206163636f756e74206f662074686520436f6e74726163742050726963652e202054686520616d6f756e7473206f662073756368207061796d656e7473207368616c6c206265206173206365727469666965642062792074686520456e67696e6565722f4172636869746563743b20616e64200d0a283229202075706f6e205375627374616e7469616c20506572666f726d616e6365206f662074686520776f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f6620686f6c646261636b206d6f6e696573207468656e206475653b20616e64200d0a283329202075706f6e20546f74616c20506572666f726d616e6365206f662074686520576f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f662074686520436f6e7472616374205072696365207468656e206475652e0d0a0d0a28622909496620746865204f776e6572206661696c7320746f206d616b65207061796d656e747320746f2074686520436f6e74726163746f722061732074686579206265636f6d652064756520756e64657220746865207465726d73206f66207468697320436f6e7472616374206f7220696e20616e79206177617264206279206120636f7572742c20696e74657265737420617420746865207261746520616e6420696e20746865206d616e6e65722073706563696669656420696e20474332312d43657274696669636174657320616e64205061796d656e74732c207368616c6c206265636f6d652064756520616e642070617961626c6520756e74696c207061796d656e742e20205375636820696e746572657374207368616c6c2062652063616c63756c6174656420616e6420616464656420746f20616e7920756e7061696420616d6f756e7473206d6f6e74686c792e0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a),
(2, 5, '2019-12-20', 6, 5000, 0x41475245454d454e54204245545745454e204f574e455220414e4420434f4e54524143544f520d0a666f7220757365207768656e20612073746970756c6174656420707269636520666f726d73207468650d0a6261736973206f66207061796d656e7420616e6420746f2062652075736564206f6e6c790d0a77697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163740d0a0d0a544849532041475245454d454e54206d616465206f6e20746865202020202020202020202020646179206f66202020202020202020202020202020202020696e2074686520796561722074776f2074686f7573616e6420616e64202020202020202020202020202020202020202e200d0a0d0a425920414e44204245545745454e0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c65642074686520224f776e6572220d0a0d0a414e440d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c6564207468652022436f6e74726163746f72220d0a0d0a0d0a5749544e4553534554483a20207468617420746865204f776e657220616e6420436f6e74726163746f7220756e64657274616b6520616e6420616772656520617320666f6c6c6f77733a0d0a0d0a0d0a41525449434c4520412d312054484520574f524b0d0a0d0a54686520436f6e74726163746f72207368616c6c3a0d0a0d0a28612909706572666f726d20616c6c2074686520576f726b2072657175697265642062792074686520436f6e747261637420446f63756d656e747320666f7220205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f2e20285365652054656e64657220466f726d20666f72204465736372697074696f6e292077686963682068617665206265656e207369676e656420696e20747269706c696361746520627920626f74682074686520706172746965732c0d0a0d0a28622909646f20616e642066756c66696c2065766572797468696e6720696e6469636174656420627920746869732041677265656d656e742c20616e640d0a0d0a28632909636f6d6d656e63652074686520576f726b206279207468652020202020202020202020202020646179206f66202020202020202020202020202020202020202020202020202c20323020202020202020616e64207375627374616e7469616c6c7920706572666f726d2074686520576f726b206f66207468697320436f6e7472616374206173206365727469666965642062792074686520456e67696e6565722f41726368697465637420627920746865205f5f5f5f5f5f5f20646179206f66205f5f5f5f5f5f5f5f5f203230202020202e0d0a0d0a286429095468652022456e67696e6565722f417263686974656374222069732074686520706572736f6e2064657369676e6174656420617320737563682066726f6d2074696d6520746f2074696d6520627920746865204f776e65722e0d0a0d0a0d0a0d0a41525449434c4520412d3220434f4e545241435420444f43554d454e54530d0a0d0a54686520666f6c6c6f77696e6720697320616e206578616374206c697374206f662074686520436f6e747261637420446f63756d656e747320726566657272656420746f20696e2041727469636c6520412d313a2028534545205441424c45204f4620434f4e54454e545320464f52204c495354204f4620444f43554d454e545320414e442044524157494e4753292e2020205365652041747461636865640d0a0d0a0d0a0d0a41525449434c4520412d3320434f4e54524143542050524943450d0a0d0a54484520434f4e5452414354205052494345204953202024205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f202848535420494e434c55444544292043616e616469616e2066756e6473207768696368207072696365207368616c6c206265207375626a65637420746f2061646a7573746d656e7473206173206d617920626520726571756972656420696e206163636f7264616e63652077697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742e200d0a0d0a0d0a0d0a41525449434c4520412d34205041594d454e540d0a0d0a286129095375626a65637420746f206170706c696361626c65206c656769736c6174696f6e20616e642c2077686572652073756368206c656769736c6174696f6e20646f6573206e6f74206578697374206f72206170706c792c20696e206163636f7264616e636520776974682073756368207072657363726962656420726567756c6174696f6e73206f7220696e6475737472792070726163746963652072657370656374696e6720686f6c646261636b2070657263656e746167657320616e6420696e206163636f7264616e63652077697468207468652070726f766973696f6e73206f66207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742c20746865204f776e6572207368616c6c3a0d0a0d0a28312920206d616b65206d6f6e74686c79207061796d656e747320746f2074686520436f6e74726163746f72206f6e206163636f756e74206f662074686520436f6e74726163742050726963652e202054686520616d6f756e7473206f662073756368207061796d656e7473207368616c6c206265206173206365727469666965642062792074686520456e67696e6565722f4172636869746563743b20616e64200d0a283229202075706f6e205375627374616e7469616c20506572666f726d616e6365206f662074686520776f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f6620686f6c646261636b206d6f6e696573207468656e206475653b20616e64200d0a283329202075706f6e20546f74616c20506572666f726d616e6365206f662074686520576f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f662074686520436f6e7472616374205072696365207468656e206475652e0d0a0d0a28622909496620746865204f776e6572206661696c7320746f206d616b65207061796d656e747320746f2074686520436f6e74726163746f722061732074686579206265636f6d652064756520756e64657220746865207465726d73206f66207468697320436f6e7472616374206f7220696e20616e79206177617264206279206120636f7572742c20696e74657265737420617420746865207261746520616e6420696e20746865206d616e6e65722073706563696669656420696e20474332312d43657274696669636174657320616e64205061796d656e74732c207368616c6c206265636f6d652064756520616e642070617961626c6520756e74696c207061796d656e742e20205375636820696e746572657374207368616c6c2062652063616c63756c6174656420616e6420616464656420746f20616e7920756e7061696420616d6f756e7473206d6f6e74686c792e0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a),
(3, 2, '2020-01-23', 5, 8000, 0x41475245454d454e54204245545745454e204f574e455220414e4420434f4e54524143544f520d0a666f7220757365207768656e20612073746970756c6174656420707269636520666f726d73207468650d0a6261736973206f66207061796d656e7420616e6420746f2062652075736564206f6e6c790d0a77697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163740d0a0d0a544849532041475245454d454e54206d616465206f6e20746865202020202020202020202020646179206f66202020202020202020202020202020202020696e2074686520796561722074776f2074686f7573616e6420616e64202020202020202020202020202020202020202e200d0a0d0a425920414e44204245545745454e0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c65642074686520224f776e6572220d0a0d0a414e440d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c6564207468652022436f6e74726163746f72220d0a0d0a0d0a5749544e4553534554483a20207468617420746865204f776e657220616e6420436f6e74726163746f7220756e64657274616b6520616e6420616772656520617320666f6c6c6f77733a0d0a0d0a0d0a41525449434c4520412d312054484520574f524b0d0a0d0a54686520436f6e74726163746f72207368616c6c3a0d0a0d0a28612909706572666f726d20616c6c2074686520576f726b2072657175697265642062792074686520436f6e747261637420446f63756d656e747320666f7220205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f2e20285365652054656e64657220466f726d20666f72204465736372697074696f6e292077686963682068617665206265656e207369676e656420696e20747269706c696361746520627920626f74682074686520706172746965732c0d0a0d0a28622909646f20616e642066756c66696c2065766572797468696e6720696e6469636174656420627920746869732041677265656d656e742c20616e640d0a0d0a28632909636f6d6d656e63652074686520576f726b206279207468652020202020202020202020202020646179206f66202020202020202020202020202020202020202020202020202c20323020202020202020616e64207375627374616e7469616c6c7920706572666f726d2074686520576f726b206f66207468697320436f6e7472616374206173206365727469666965642062792074686520456e67696e6565722f41726368697465637420627920746865205f5f5f5f5f5f5f20646179206f66205f5f5f5f5f5f5f5f5f203230202020202e0d0a0d0a286429095468652022456e67696e6565722f417263686974656374222069732074686520706572736f6e2064657369676e6174656420617320737563682066726f6d2074696d6520746f2074696d6520627920746865204f776e65722e0d0a0d0a0d0a0d0a41525449434c4520412d3220434f4e545241435420444f43554d454e54530d0a0d0a54686520666f6c6c6f77696e6720697320616e206578616374206c697374206f662074686520436f6e747261637420446f63756d656e747320726566657272656420746f20696e2041727469636c6520412d313a2028534545205441424c45204f4620434f4e54454e545320464f52204c495354204f4620444f43554d454e545320414e442044524157494e4753292e2020205365652041747461636865640d0a0d0a0d0a0d0a41525449434c4520412d3320434f4e54524143542050524943450d0a0d0a54484520434f4e5452414354205052494345204953202024205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f202848535420494e434c55444544292043616e616469616e2066756e6473207768696368207072696365207368616c6c206265207375626a65637420746f2061646a7573746d656e7473206173206d617920626520726571756972656420696e206163636f7264616e63652077697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742e200d0a0d0a0d0a0d0a41525449434c4520412d34205041594d454e540d0a0d0a286129095375626a65637420746f206170706c696361626c65206c656769736c6174696f6e20616e642c2077686572652073756368206c656769736c6174696f6e20646f6573206e6f74206578697374206f72206170706c792c20696e206163636f7264616e636520776974682073756368207072657363726962656420726567756c6174696f6e73206f7220696e6475737472792070726163746963652072657370656374696e6720686f6c646261636b2070657263656e746167657320616e6420696e206163636f7264616e63652077697468207468652070726f766973696f6e73206f66207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742c20746865204f776e6572207368616c6c3a0d0a0d0a28312920206d616b65206d6f6e74686c79207061796d656e747320746f2074686520436f6e74726163746f72206f6e206163636f756e74206f662074686520436f6e74726163742050726963652e202054686520616d6f756e7473206f662073756368207061796d656e7473207368616c6c206265206173206365727469666965642062792074686520456e67696e6565722f4172636869746563743b20616e64200d0a283229202075706f6e205375627374616e7469616c20506572666f726d616e6365206f662074686520776f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f6620686f6c646261636b206d6f6e696573207468656e206475653b20616e64200d0a283329202075706f6e20546f74616c20506572666f726d616e6365206f662074686520576f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f662074686520436f6e7472616374205072696365207468656e206475652e0d0a0d0a28622909496620746865204f776e6572206661696c7320746f206d616b65207061796d656e747320746f2074686520436f6e74726163746f722061732074686579206265636f6d652064756520756e64657220746865207465726d73206f66207468697320436f6e7472616374206f7220696e20616e79206177617264206279206120636f7572742c20696e74657265737420617420746865207261746520616e6420696e20746865206d616e6e65722073706563696669656420696e20474332312d43657274696669636174657320616e64205061796d656e74732c207368616c6c206265636f6d652064756520616e642070617961626c6520756e74696c207061796d656e742e20205375636820696e746572657374207368616c6c2062652063616c63756c6174656420616e6420616464656420746f20616e7920756e7061696420616d6f756e7473206d6f6e74686c792e0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a),
(4, 4, '2019-07-08', 12, 6000, 0x417072696c2031332c20323031390d0a0d0a3c4e616d65200d0a204465736372697074696f6e200d0a41626f75742074686520737065616b65723e0d0a0d0a44656172203c4e616d653e2c0d0a0d0a4f6e20626568616c66206f662074686520436f6d707574657220536369656e6365206465706172746d656e74206f66204163686172796120496e73746974757465206f6620746563686e6f6c6f677928414954292c204920776f756c64206c696b6520746f20636f726469616c6c7920696e7669746520796f7520746f2043726573656e646f2d546563686e6963616c2053796d706f7369756d2061732061206b65796e6f746520737065616b657220746f20737065616b206f6e203c546f7069633e20696e20746865204163686172796120496e73746974757465732e2043726573656e646f2d546563686e6963616c2053796d706f7369756d20697320746865206465706172746d656e742066657374206f6620436f6d707574657220536369656e6365202620456e67696e656572696e672c204163686172796120496e73746974757465204f6620546563686e6f6c6f67792068656c6420657665727920796561722e0d0a0d0a546865206f6666696369616c206f70656e696e6720636572656d6f6e792077696c6c2074616b6520706c616365206f6e204d6179203420617420746865204163686172796120496e73746974757465204f6620546563686e6f6c6f67792e204920776f756c6420626520677261746566756c20696620796f7520746f6f6b207061727420696e2074686520636572656d6f6e7920616e642073686172656420796f757220657870657274697365206f6e2074686520746f7069632077697468206f7572207061727469636970616e74732e20596f7572206b6e6f776c6564676520776f756c6420626520616e20657863656c6c656e74206164646974696f6e20746f206f75722070726f6772616d2e0d0a0d0a4920776f756c6420626520686f6e6f7572656420696620796f752064656369646520746f2074616b65207061727420696e2074686520636572656d6f6e792e20506c656173652c20646f206e6f7420686573697461746520746f20636f6e74616374206d6520696620796f75206861766520616e79207175657374696f6e732e204c6f6f6b696e6720666f727761726420746f2068656172696e67206261636b2066726f6d20796f752e0d0a0d0a0d0a53696e636572656c792c0d0a3c596f7572206e616d650d0a4465736372697074696f6e0d0a436f6e746163743e0d0a),
(5, 2, '2017-05-02', 10, 10000, 0x41475245454d454e54204245545745454e204f574e455220414e4420434f4e54524143544f520d0a666f7220757365207768656e20612073746970756c6174656420707269636520666f726d73207468650d0a6261736973206f66207061796d656e7420616e6420746f2062652075736564206f6e6c790d0a77697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163740d0a0d0a544849532041475245454d454e54206d616465206f6e20746865202020202020202020202020646179206f66202020202020202020202020202020202020696e2074686520796561722074776f2074686f7573616e6420616e64202020202020202020202020202020202020202e200d0a0d0a425920414e44204245545745454e0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c65642074686520224f776e6572220d0a0d0a414e440d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c6564207468652022436f6e74726163746f72220d0a0d0a0d0a5749544e4553534554483a20207468617420746865204f776e657220616e6420436f6e74726163746f7220756e64657274616b6520616e6420616772656520617320666f6c6c6f77733a0d0a0d0a0d0a41525449434c4520412d312054484520574f524b0d0a0d0a54686520436f6e74726163746f72207368616c6c3a0d0a0d0a28612909706572666f726d20616c6c2074686520576f726b2072657175697265642062792074686520436f6e747261637420446f63756d656e747320666f7220205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f2e20285365652054656e64657220466f726d20666f72204465736372697074696f6e292077686963682068617665206265656e207369676e656420696e20747269706c696361746520627920626f74682074686520706172746965732c0d0a0d0a28622909646f20616e642066756c66696c2065766572797468696e6720696e6469636174656420627920746869732041677265656d656e742c20616e640d0a0d0a28632909636f6d6d656e63652074686520576f726b206279207468652020202020202020202020202020646179206f66202020202020202020202020202020202020202020202020202c20323020202020202020616e64207375627374616e7469616c6c7920706572666f726d2074686520576f726b206f66207468697320436f6e7472616374206173206365727469666965642062792074686520456e67696e6565722f41726368697465637420627920746865205f5f5f5f5f5f5f20646179206f66205f5f5f5f5f5f5f5f5f203230202020202e0d0a0d0a286429095468652022456e67696e6565722f417263686974656374222069732074686520706572736f6e2064657369676e6174656420617320737563682066726f6d2074696d6520746f2074696d6520627920746865204f776e65722e0d0a0d0a0d0a0d0a41525449434c4520412d3220434f4e545241435420444f43554d454e54530d0a0d0a54686520666f6c6c6f77696e6720697320616e206578616374206c697374206f662074686520436f6e747261637420446f63756d656e747320726566657272656420746f20696e2041727469636c6520412d313a2028534545205441424c45204f4620434f4e54454e545320464f52204c495354204f4620444f43554d454e545320414e442044524157494e4753292e2020205365652041747461636865640d0a0d0a0d0a0d0a41525449434c4520412d3320434f4e54524143542050524943450d0a0d0a54484520434f4e5452414354205052494345204953202024205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f202848535420494e434c55444544292043616e616469616e2066756e6473207768696368207072696365207368616c6c206265207375626a65637420746f2061646a7573746d656e7473206173206d617920626520726571756972656420696e206163636f7264616e63652077697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742e200d0a0d0a0d0a0d0a41525449434c4520412d34205041594d454e540d0a0d0a286129095375626a65637420746f206170706c696361626c65206c656769736c6174696f6e20616e642c2077686572652073756368206c656769736c6174696f6e20646f6573206e6f74206578697374206f72206170706c792c20696e206163636f7264616e636520776974682073756368207072657363726962656420726567756c6174696f6e73206f7220696e6475737472792070726163746963652072657370656374696e6720686f6c646261636b2070657263656e746167657320616e6420696e206163636f7264616e63652077697468207468652070726f766973696f6e73206f66207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742c20746865204f776e6572207368616c6c3a0d0a0d0a28312920206d616b65206d6f6e74686c79207061796d656e747320746f2074686520436f6e74726163746f72206f6e206163636f756e74206f662074686520436f6e74726163742050726963652e202054686520616d6f756e7473206f662073756368207061796d656e7473207368616c6c206265206173206365727469666965642062792074686520456e67696e6565722f4172636869746563743b20616e64200d0a283229202075706f6e205375627374616e7469616c20506572666f726d616e6365206f662074686520776f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f6620686f6c646261636b206d6f6e696573207468656e206475653b20616e64200d0a283329202075706f6e20546f74616c20506572666f726d616e6365206f662074686520576f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f662074686520436f6e7472616374205072696365207468656e206475652e0d0a0d0a28622909496620746865204f776e6572206661696c7320746f206d616b65207061796d656e747320746f2074686520436f6e74726163746f722061732074686579206265636f6d652064756520756e64657220746865207465726d73206f66207468697320436f6e7472616374206f7220696e20616e79206177617264206279206120636f7572742c20696e74657265737420617420746865207261746520616e6420696e20746865206d616e6e65722073706563696669656420696e20474332312d43657274696669636174657320616e64205061796d656e74732c207368616c6c206265636f6d652064756520616e642070617961626c6520756e74696c207061796d656e742e20205375636820696e746572657374207368616c6c2062652063616c63756c6174656420616e6420616464656420746f20616e7920756e7061696420616d6f756e7473206d6f6e74686c792e0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a),
(5, 5, '2019-12-25', 10, 1000, 0x41475245454d454e54204245545745454e204f574e455220414e4420434f4e54524143544f520d0a666f7220757365207768656e20612073746970756c6174656420707269636520666f726d73207468650d0a6261736973206f66207061796d656e7420616e6420746f2062652075736564206f6e6c790d0a77697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163740d0a0d0a544849532041475245454d454e54206d616465206f6e20746865202020202020202020202020646179206f66202020202020202020202020202020202020696e2074686520796561722074776f2074686f7573616e6420616e64202020202020202020202020202020202020202e200d0a0d0a425920414e44204245545745454e0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c65642074686520224f776e6572220d0a0d0a414e440d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a0d0a68657265696e61667465722063616c6c6564207468652022436f6e74726163746f72220d0a0d0a0d0a5749544e4553534554483a20207468617420746865204f776e657220616e6420436f6e74726163746f7220756e64657274616b6520616e6420616772656520617320666f6c6c6f77733a0d0a0d0a0d0a41525449434c4520412d312054484520574f524b0d0a0d0a54686520436f6e74726163746f72207368616c6c3a0d0a0d0a28612909706572666f726d20616c6c2074686520576f726b2072657175697265642062792074686520436f6e747261637420446f63756d656e747320666f7220205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f2e20285365652054656e64657220466f726d20666f72204465736372697074696f6e292077686963682068617665206265656e207369676e656420696e20747269706c696361746520627920626f74682074686520706172746965732c0d0a0d0a28622909646f20616e642066756c66696c2065766572797468696e6720696e6469636174656420627920746869732041677265656d656e742c20616e640d0a0d0a28632909636f6d6d656e63652074686520576f726b206279207468652020202020202020202020202020646179206f66202020202020202020202020202020202020202020202020202c20323020202020202020616e64207375627374616e7469616c6c7920706572666f726d2074686520576f726b206f66207468697320436f6e7472616374206173206365727469666965642062792074686520456e67696e6565722f41726368697465637420627920746865205f5f5f5f5f5f5f20646179206f66205f5f5f5f5f5f5f5f5f203230202020202e0d0a0d0a286429095468652022456e67696e6565722f417263686974656374222069732074686520706572736f6e2064657369676e6174656420617320737563682066726f6d2074696d6520746f2074696d6520627920746865204f776e65722e0d0a0d0a0d0a0d0a41525449434c4520412d3220434f4e545241435420444f43554d454e54530d0a0d0a54686520666f6c6c6f77696e6720697320616e206578616374206c697374206f662074686520436f6e747261637420446f63756d656e747320726566657272656420746f20696e2041727469636c6520412d313a2028534545205441424c45204f4620434f4e54454e545320464f52204c495354204f4620444f43554d454e545320414e442044524157494e4753292e2020205365652041747461636865640d0a0d0a0d0a0d0a41525449434c4520412d3320434f4e54524143542050524943450d0a0d0a54484520434f4e5452414354205052494345204953202024205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f0d0a5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f202848535420494e434c55444544292043616e616469616e2066756e6473207768696368207072696365207368616c6c206265207375626a65637420746f2061646a7573746d656e7473206173206d617920626520726571756972656420696e206163636f7264616e63652077697468207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742e200d0a0d0a0d0a0d0a41525449434c4520412d34205041594d454e540d0a0d0a286129095375626a65637420746f206170706c696361626c65206c656769736c6174696f6e20616e642c2077686572652073756368206c656769736c6174696f6e20646f6573206e6f74206578697374206f72206170706c792c20696e206163636f7264616e636520776974682073756368207072657363726962656420726567756c6174696f6e73206f7220696e6475737472792070726163746963652072657370656374696e6720686f6c646261636b2070657263656e746167657320616e6420696e206163636f7264616e63652077697468207468652070726f766973696f6e73206f66207468652047656e6572616c20436f6e646974696f6e73206f662074686520436f6e74726163742c20746865204f776e6572207368616c6c3a0d0a0d0a28312920206d616b65206d6f6e74686c79207061796d656e747320746f2074686520436f6e74726163746f72206f6e206163636f756e74206f662074686520436f6e74726163742050726963652e202054686520616d6f756e7473206f662073756368207061796d656e7473207368616c6c206265206173206365727469666965642062792074686520456e67696e6565722f4172636869746563743b20616e64200d0a283229202075706f6e205375627374616e7469616c20506572666f726d616e6365206f662074686520776f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f6620686f6c646261636b206d6f6e696573207468656e206475653b20616e64200d0a283329202075706f6e20546f74616c20506572666f726d616e6365206f662074686520576f726b206173206365727469666965642062792074686520456e67696e6565722f4172636869746563742070617920746f2074686520636f6e74726163746f7220616e7920756e706169642062616c616e6365206f662074686520436f6e7472616374205072696365207468656e206475652e0d0a0d0a28622909496620746865204f776e6572206661696c7320746f206d616b65207061796d656e747320746f2074686520436f6e74726163746f722061732074686579206265636f6d652064756520756e64657220746865207465726d73206f66207468697320436f6e7472616374206f7220696e20616e79206177617264206279206120636f7572742c20696e74657265737420617420746865207261746520616e6420696e20746865206d616e6e65722073706563696669656420696e20474332312d43657274696669636174657320616e64205061796d656e74732c207368616c6c206265636f6d652064756520616e642070617961626c6520756e74696c207061796d656e742e20205375636820696e746572657374207368616c6c2062652063616c63756c6174656420616e6420616464656420746f20616e7920756e7061696420616d6f756e7473206d6f6e74686c792e0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a);

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `pics` blob DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`id`, `owner_id`, `no_of_rooms`, `rate`, `pics`, `country`, `state`, `city`, `address`, `description`) VALUES
(1, 1, 3, 10000, 0xffd8ffe000104a46494600010100000100010000ffdb00840009060713131215131212161515171818181818181718181a18181817181818171817181f28221d1a251b181821312125292b2e2f2e171f3338332d37282d2e2b010a0a0a0e0d0e1b10101b35251f252d2d2d2d2d2d2d2e2d2f2d2d2d2d2b2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110800b7011303012200021101031101ffc4001b00000202030100000000000000000000000506030400020701ffc4004810000103020403050308060709010100000102031100210405123106415113226171813291a114425292b1c1d1f0071523336272538293a2b2e1f1162443637383a3c2d25434ffc4001a010003010101010000000000000000000001020300040506ffc4002e11000202010303020504020300000000000001021103041221133141145122326171815291a1f005b1152342ffda000c03010002110311003f000a9c5d5963143ad566f02a3caad2329575afb27189f2b09e4f08c0f19eb5730ee24ef5ab796902a646008a47b4e8829f944a102a8e20ded579184557aac21e94aa90f28b7d903b59ad5cc41145d0cf54d577b05abe6d3271be4494275c306a31b5718c5561c98cd10c3e51004d09bc66c4b35f268c2e6b5741a228cbc0a93e4950dc8e8d9203027a57a1641bd112800ed503b8704ced4e9a62d347897091512cd5a659e86b1587a5e114e5a07b93cab4527ad143863cb6ac7b036b51dc847160558ad4228a7c866bd39753ee426d903d09a9c14d5838281d4d7872e550b41a6bc15b5f4b0adc2ab66f06b9daac3581341d062d95c3a2a54bb52af015ea707e34adc46a91aa0cd6d152f615a299a40d3215383ad0cc5bc0ed44d6da40da87621d02ab05c92c975c943b5bed53f6fe155dc50a8862055dc6ce68cf6be59696e78554789debc56603602ff9e75a77d5b0a111f2b4d5149dc52a4d8fbd1f7aabcac716b048d0ab782bf0aca83cb1bf982b14abe51e59681ab486286e1f11441ac4519268ec84a2c9d2cd4c866a243d5321da93b2e92254b152270e3a578dbb561a72fb549b687514689c28e9533797cf2a9bb59e55221c3527391458d117eadf2a8be4d56d6f9a894f0a1172f21708908c3d7a70f358a7eb64bc69be2176a29398613b5555e1af44d57a896cd5632a27382292181c854a8c38ab4da00ad82ab39327b480b5155d42761579499ac437028291a8a8d61677a9be4a22ac255d6bd0ba0e4c2a28a48c391caa52cf855a915b022839b0a8228fc9ebdec288048af7b3a5ea0dd306298ad0b1454b7512914779ba60d535143f1224d302db104d0ac72111737aae395b1670a402c53dca685bea9de8a62128e57adb0d80d46e2073aef8ed8ab670ce129ba00a9d1c84d577c100a883604fba989fecd1314171b8ad4081d0fd94dbad3691cd2c69492931699cc25d0a0d98f8d81f0f1f853660de0a48527622d4a1824438913d7fc269c306a4a1b4a964253a45c900578ba3cadca57f73ddd661518c2bc71f8272a1e3ee35958314c1b8751f5c7e3595ddb97b9c1b5fb0b233c58d801e77fc2adb1c44e0dc24fbc7df4217848ddc6c7f315367ff002a535b37807089480bfe45257fe026b87d5ca5ff00a3d08e931c15288c8c7147d2411e4a07ed8a2986e2268eea293e293f74d2338cad1ed2549fe6491f6d7a1db9836a75a8907a103a4e1f366d5b38927a0509f76f57462cf5ae589726c6a66716b48eea949fe5511f0069fac9f742f45f8674ff0096a86d5b8cc575ce9acf1f1f3e7c0807e313f1abf87e2650f6900f918f819a653c6c570ca87a4e2946b74393b9a51678991cd2a1ee3f7cfc2aeb39fb47e7c79829fb69be17d988dcd77431a62bd33ca8227396e40ed11276ef0bd5f4632b6d60ea16f5115062b300828b7b4a099e920907de23d6b438c149fc61881da20c90a02c4122083631b73a4cb7186e29836e49a8fdc790fd6c14284e1df302f561b7893090547a013efe9eb54945455b39a2dc9d208f695a2dd3ca2aa03274c95ab6286cd86dedbbb27706077ba0354df0e364a96c96c7d3609700dff78d2a09d8779173d0571bd4c13a3b16932356f80a6a51e9588708e55470f8e94ea042d02c56df7803d149f6927c083567e5482241d43a835d119c65d884b1ca3dc8b1b98149400992a504ef116249f402a742d5d691b8d5c0b79b1f3741201ebaa09f1b453830f88036814232b94a35da8a382508cafbd851a59a992f11ca8527157dea4c4e74d3401714133b4ee7d05e3c684a3f4345d848baae951a8289b5507b8a30e912a79b8dec751f7264d0fc6f1ab08023528a84f740b024813a8820c0988913534daf057685deed05a28662f06b5193bd00c5f1d93ec351e2a54fc001f6d07c4f17e295b2d28fe548f777f555a393693962b1ad596abafbaa27d9d23f68ea5039952827ed348989cdde5fb4f2cf86b207b818aa06f7ebced4ef55227e990e988c7e051edbc167f875287f741141b159fe1e141b69c5588074a40b8f155020904c449e9bd4df265c7b0a03a911f135396aa75dccb498eee8a29c4a810426226e483b88dbd6bcd47e728a88ea67c39d4ce204dd6d8feba7ec4926b1bc30518d44ff002b6e2bff00515c0b647c9daf7c887b4acab670247cd7bfb348f815cd656eac7dcdd299d6f03c3ed06fbeb792ad46dde581bda55ab9f2116f7d23f1334a69cd2a4b4e24c9016d36620c183a663637337e7bd74cc0e31050987133ae7dbe51eeae6fc664fcadd124a411a6f22348f64d79916ef93bda05339844434123fe538f35f04ae3e145b2968e297a1297018bc969d1ff0091ad5f1a03d98a6bfd1e3918929e4a499b9994ed0479d3ee68db515b35c9fb0d3db252018b96563a9176dd1bdefa62c7a50e1866146cb40f27548f83acff00ed4e9fa4176196922fa81b95131a4a4da7d6de35cf0a27fd29a19a75dc578a3ec124e53abd85123f84b4bff03a4fc2a2732e527731fcc8711f15a027e3548b3d6ba3e499734700852502742c95768428a93120a62f0646fe510299ea671074227397d5a005296d80660f68820c58c69249f415333862b1a8294a07e8b38829f83755c33af1401595a02d612644909d5a20a8c49b6f624de8fe58c37f2dd2b1624694933de5251624022c49e5029bd54ae80b4ea81430cab01ab78fdce200de2e4b502ada1e79b0a01d890077945b8832212f698e9b6d4d9c7980692d3674250bd6a09d2b52c9d2a2140c810003f6558e1cc1a3e47abbfaa57a885c469e506e0445c75acb5934ac0f4f16272b33c52124fb491f38a4292078a9047db54be54ee2d7a7b301498bea01307992adb6da68aa58429d971530b5212b4a412a024c1d293292249f2abe8c3e19b734a5486c954848ec91726d08ecc4fdf5a7fe49b5b241c7fe39464b241161fceb0ac775c782951ecb7a94040d96ea418f2489a958e2fc0910b7c84ff46865e4a7af78e8951f3b785116de41714d0c4a35a4a8286966414900c8ecfc4559c623b3b9c4011b8219498f568d24f5f193f8d8d8f46e0aa28aad71c65e9012970802c0065d000f208af57c7381fe955fd8bbff00c5481efdaadaf9400a444c9641b807d90cf88f7d4f8d6d4812711ca7bc1a4dbacf65b78d07acc4b81bd2cd8bd8de22cb96ad61d710e72710dbc9579484dc78191541ce28602bbca2e7fcc6da5b6e5be924a742ff00bb4c783c4768da5c4bf62a29996a2444c10d5e09ab788c3942751c45a26486c08e641ecf6acf5908bee6f4d37c311b3a653880979979b5a40292951ec9cde6e8722ff0aaa8e26c428e943612afa3a4a88037320f972144b36e22429e4321e2a41500a57ec8244a499bb7700c57b98e58d7645d0e833170d0efdc0092b4a40299a6ff0091d8efcb26b44b22af1103bb98629660bba7c02d083ee042ab46700e2e54545447f0bca545bf80cee3e3d0d1fe11c2256b5ebd4e695404a4a5220290248b403a8de26de754f13866538c5255fba0e004125511329262e01b6d1547ac9b156961128feab59e4a3ff65fff00e2a96270ba0c76890afa2e05b44f929d4a53f1ae9bfa40cb99461c92d21042b4a74952afa411ba446dbf89a45cd923e4292241926750851ed08d306f2137e969a4f5731d618b408561563da29492247792ab1d88ecf5568bd294f782d467648d023aea707dd47380708975e525c25cd2994a14e14db4a94a3373ba53efb44d6bfa44c032971210da52a2805412a2a064083a88124dfdd47d5cdba07a78d0313d98e6d03e25e77fc0940f8d1bc9b20731025a0624094b2da77569065c2a206ab5fc6260d2fb49dbc85755fd1fa3b5c2aac7f66a6c4256b0080a049294d89b9f2a13cd24bb99638af0739cdd87185a9a712e48eaf2803e3a5b4a6839de7b2681eba0a8fbd6a34cbc66eeac53b6809514817d81279de649a5d57956526c2e2904b87d953aee952c84812425207309f9824dcf2bda9b735c8590d38aecde569526ea0122e11ed4c28193d3689a4fe1f54621b3780a1276b0ea7a53ee799ab4b69e01f4495a21173aa0363505136f64fbaa3372dc921e096d615c270eb6109030292205cb8904db780607957b5ab5c5f810900bc99007cdf0acae5719fe97fc94dcbdce4670ce2774b89f30a4fe15138eab9b8ab6c0a898f7d757c2e4d87d95da23c50e280faa0fdf423385b0c3a96cfca8a5510bed171266dde5dffcebd3cb97a6fe389c98f1bc9f2b39e8d5c967dc93f7510cb73279956b6d402b69d20ffa53521ec3296944bf2a30250daee7610751ab58ec91a6d214e15241980b6590a91020a7b291b88f3a8faac2fc157a6cc9d0ab98f10621f484ba50b099d3620a6778831ca87fca15f447bcfe14feae186bb3ed14a6d29fe268cdfc1b23f2286e3326c3b6254e343fed6253f6b911596a34ecdd2ce29271079a3dc47de0537655c6a86b0c18530e180e5c14fcfb9b0572aaff00a9f0e44875a8de43853cbf882aa5470a6a8d3041e61f4c7afec6deb59cb4f2f21db9977425b58f421d06fdc702ae2240548eb134718cd41c40c46930161404fd109813d2df1a2188e090a2132351d825d42898e9005567f869387043988ec88055a4f67300493a75f4e8297fea6f866dd912e5027883885789c6a551a53ac40d44fb4533b9e71ca9eb27ced0d61d6c90aef6bbc5815a427af84ed5c89b59d49580092798d88db9993f8574acb5a5bad85b6c7689db52439722c6daaa5b57642e195dd99c3c47ca5a01481a4b8495dd30a011ab492279dbc6ae665c3a06254b4e9290eea9d684fce93dc2647952ce639bab0cfb4ea5b006ad0a07514c1dc722156ebe9478f1525c041607781ef4ab983792a3f61a49624dee675473b8da45259d39c297234a9c5a664419495419f18f514f99cba5e65406954b6009527da8de49ae4eee64a0b4a909016260dee44a7ac6a224cf5a74778a5681a57855a41fe25049f2ef4136de8c611977238b23f017cbb2e3fac9f75413a16124190a3210d0f6019e47951ee2b4a5d616101255a549136bc100ea5585ed48a9e2d52964b7873a8f42a2790f9aa1d3a54d88e217c24ebc32827992171ea75dbd69e5860dbfa8fd49da7ec5fe13c1965840774f754e93de4900a94929320c6d573880b8f20dedd910124a000bd0b06f3bc94cf2b0a5e4f159d3a5387066fba88e5ca6790e7533dc40f91a8e1481b5d2e1f58d63df14b930c18d1c924ec427f2d536ad4b83a567e70bda607953ebcd86b2ec4a74a4294524110607ecf750d8f74da96334c62420ca6660de6c4c02a8f1b7c7ca8b6758c71dc3250db453da2d015a76ecd31ab798b54b6c65cbf04b1e469491a709e66861c7570a56b8802d6d4153734378b9e30eba8b1528aeff00c4ad446e7a9a2fc3f97297ec31ab4c032576b73850bda87fe904e86d2d96802a253099b11cbbca356e2c69ba8b31fe30562f0696dc49d41c52b5ea9927a8e42fcb90a159ae6e938543044142cabacc9572feb6fe140f22741d485a8a458fcd17f1276e54d09e0731daab56831de2f3691788f987a8a75b12e592c7394a3c207f0ae7e30cfa9decdc5f74a60694ee920c92a1152714670ac5ac381a293a12982b1f36c0f3a67c3f02002548244c7ef906f31b040a389e12c1349d4eb2b3ccc2d463a9b2c5653c09db616b2be28e5a8c41e4d9f5291f64d14c1712e2d9414324368decadcf53ddf0ae91966032959296d92a204dc39b4c4f79557cf0de17e6e19236dda077e6241aa3cd845d9951c631b8f7dc515ab46a3b98249f1241126a82dd739ad23c923ef26bbce2f86584a643691e4da07952c639969b70b67b5907e6aa078456f538bd80b0649f9396a5a755b2d47c923ee156b07855a15a96dad69d88505c79da04d74ccb7244bc14a5a1d6c0362e3c44f8e989a26d70ce5ed9d4b4ebf05991ee8bfa835684dcfb4094e0a1de4720731b06061d93e307d771d6b2bba1cfd84d928102c2c76f7d653f4327d49f517d00584c33c436a4e252b4b8400a2d0112952ae02a604013fc42876639e96d7d93884380807d980649e454472adb20ce5a79c4a1020c482e79a44000dfda8f226bdceb85dc75e2a0e23602faa6de40fdb5c8b3ea6e9f6fb23b561c1fd60a38ac229c4af42db2157008524f8418299fc83471dc72558464e804a8bba0428d839204916902f31b507c6708a92b428beda1455cb512ab490069dede14a997e66ef6cce182ca743a4255a418d5ed2bf885e6f5178dcaed51a79a516b9b474663386d787010865a10120c94c10e12524aa001009eb35b666d3789d3dbe21a800001bd24909f1ff2349f85c02d60a52e85a2201d2aef2f51701000906fa64da49bdea6e1fcabb6414f6fde4a75c14a8c89f9da7d9249da27eca5c78545fc51bfc94ebdf09d0d897300c80896ee34f792564824260c83d403e7573098fc2dc36a807f857a6c7912293730c9961105d41852246972d0b13328e447c2aae759d3980c394a141c71c221441d2948224428024c81e55d929464a9e322d38b72ea3630f133dda62d9702501012b04a620129204a4df97314bb9ee1d4ea9b70a4286a095048d0930a22204e99b89f1a10d3c7b26b10ebc01545b42c92546e042639f5ab586ce7baa56aee4f78e98dae44447337f5bd79f3c2e32b8a2d973c5e3dbdc0b9937a5b4f743612542129bf7a483ab9eca1fd5914ff00c0987d58504c1b8b79c6de02b99e6af12b5a53ec295a84c882028446c3da3cabb37066190db0d4c825b1a800a3266c79de045a36daadb64e3c1cf8a51dc21e6b95a5d75942dcd28324fb464881000b499807ce88e628d0dce86c0820c21215749d95120d31bbc24a52d0b0fa53a42811d9bd7d5e48eb156f30e0f2ac28487125d2e240243880527748d56980a3247850719bb28e50a7ee736c30415c9311046e6f034816f0f8d75bce72542304a3ad474b7f46f64de66c3fcab9a6458551c56956a096d72a81a8d96010045fcf96f5d633cc625dc2b8849d05c42c02ab44a5704f48deb9f635cb362934b8397f03e585189fda958286e173df5257ab4a93deb01b0b5bc4d744cd70054cacb4e282c36540f74c4fa9fc2b9e708b6f12e80a0eaca442811ded2ea3510a540237bd38ab0f8c1b30b94b11a484c92028759f6a28ca1272ba3aa2e3b7875f403f06e56578a53cb2509d1a7b89b158035e84f2f9a6df48c1dc062e22ca50861c73b45d84dd245e4089e4684703e6a8496d2f1d2f28295a0985402413a06deeb81e546f3acf5b7b09884a52a90dea1aa21409984c1b901249f3159c1c9d7923bda5f0f638e678f8240d52408240dfa6fcec0cf81a37907193ab1d8bad35a10931a1bd2a316b99b93d7ade81e5b967ca1c4926076a841998d2492adaf3ecec46e7a53de73fa330d3abecb1210830128ec1d5e91001efea3aa609f5aaac4f651cb8f86ec33fa3d3df70f82794f35733b522fe963bd884a82a21d58f0ba8904cdb953f64181f93eb21cd44a40bb6b4890641bef4b5c6194a1f546a8ee051010b20a89519906db6d4f1c73b65a6e2d1ce71a5c3a8a87cf29db624851000a7acc319feeb874a568500a40b84a0c8dc951361688f0e7411fcbd6add3d9202e4a616482a37bc58980226d6ab18acb12941429d29292a5c682a23a00906e46955e4edcaa73c52935c0d8322c6d9d7b0388ed50164b4a48094808d0988db528993e400abcde3d09594b91a880427c277037deb8de2b8b5fc1a99651a56d28216ad4002a95ab68274d8f39d8f9536e1b11db62d0e6950d2d349023e8adce7b0daab0728469417ee2b8c673f983a3078242caf0ef210a50234294950b907d92750d87e152e619c7c95c82a5aa520800b7277e44c84f2060dfad27e5f9210e025c545ff00e191f1262b7e20cf02de2214dc3607684a8141419d5120949252241dc7856c98e4d711afc8d714f99587dce31406310a75c8d2a484829ba41b140034a951e408914baf715438549610a26fa8aa0dc4806d331b807f1a44cc737760bca20adc3dee53a848506f9414d95b4f599adf2e97d0a3252b1a132a92922f6d4058ee40bfa51c709c6e9f247a9172aae07ac1f1fa61457874031dd83a81f78b1a6167336de61978a12da5e5142a01eec6b8274d8dd1e935cf97c3c91ff155b807f62adcff005a85711621d421b692eacb690ec24256909db559449b859933ccd34967fd434fa518dd0631fc7b886dd5b694a8a50a5241d4ddc02403df6f55fc6f59490d6152b014ac4a124ee145720f8dab2a8b7d77389cbe83d65d9e6070ea0e250a04c1eea8902140dfa9b0b0e950665c6af3a7f6417a083a6e4999baa40f311caf6b9a4b754a4a8e9109e57248039dff003bd15e1f476ef36da889513722f6493ca3a526f6f866536df03161f895e4e92eb2568109055a81064ca81904dad16160683e3742315f2942b580b0a2df784ceab026f02dbdfca9d311c02a43a86816d523513a4981b137fb3d2ad3fc09866c80a7d44c5c25080527acc1f77855238e72ec3b6d3e4e74f67af94ab4b4d84a845906608009def200e5cb950cc3e68eb60f644851226d3613cf7e7f98aeb186fd1ee0946cebea578a80fb122ad3bfa344de312e8e901323d77a32c5913e49b6ce6038b31a410bef2622edcc419b40b0ad73fc7b989090e25b4e99bc86e46e252a333d62d5d3701950c1953416a5890a2a5c1249b721e15754e20ee127cc0abad349c7991b7ba39df0f64af62d047672db5a40502d816b58ee7d26ade13849e50d18243788f9cb2bfd9e924db49594c8dac49f85740c33a90469207808147179721848561d50a7152b4eb48806550248800da3c684b1422a9f7f7193670ccff29c76056d9c530d14ab529b480140944483d919b6a98d57f7d10678fde84a7b208123bc1bd6a09956a0028c4dc107aa6f336e95c778bc23e1a0e2a14d28a80414ac9244104209b7a8a476f0b83f9acabcd4a58fee83f69ae57249770db05e2f8c716b4a746ad4907bc50944993a640b47b2622e66e28e60bf48d8a99719b088402909b4c749331737bda2af65f9361ddeea1952ba99540f526054d98f06e0909efad5a86e945c79294a9bf844f406a35d4f86999297716866ed38b2ead01a5924e909d4049bc9920cc7c6ae1cdb0fa2352a44eed8820dc8326403b56acf0d30e2b436e38a502652992444820f73d3d2aca7845b6c29c712e6844ead5ad29116b94806d57e9be22d955924b9409c95c6b0e5b52310e05251a480d24a1531a890ab9981ce8b0e255f7b5631f56ae7a112049302527ad7b82ca704e186c0511730a74da40bdfd3d68bb3c2ac282a192204924bd60398934ce338f0d8232b5c50a8bc634312d3b2548433d9994275295aa759e5c8580e556b1f9c32b80994a4408d3c8458106db7c68cb392611c50421b0b501300ba4c01fcd5431bc18da52b5abb6091324a6c9f7a7c452ec9c6576ac2b236a972851c7672fa54e270cd96d0a283a9246b94a60a8127bb24ab61c854e78e731421294952b482353a80b594f29545c8937abe8cb70808500b5a0101453098906f3a0d3635c23827500b41571a805ad6157132082011f0f1a59e39c79689b6e4ece7989e39c72d4494a42790ecc181e6122fcec00b6d557fdabc4769aca26c401d9d803d2676fbcd3dbfc2f8641873ba7e8952c123ac18f78ad5ce1bc1949b0f4528fc0991efa48e64f8ba03dc21607895f4a7404b53bdd10a1e47a73fbe89e5d897b16e244a0ba152129482a55a0aa06fbdfd28b61b8613da2832ee134aa21388d26f23e9a0cedf1a2381c4398478a4e5cd1526ddb30c210149317439a00d3f1b55f6fd4649b5dc138ee0ac53aea54a4425280b52c94b480249d2a8b8f38dfcab739d3e1d59c3b69709084240285275052fba93dd24c2a67c76d803f9ae74d6213a5cc1e202621412e84854081306e04d86c0de2688e4bc4685bf86c2a30eb6599d3a6404ec4824a77b8f79def478f0e82e12f073f5e7998619e0ac433d9ccc828b44c909ef0127699e750667c76e3834869a168328066fb5d54ddfa5ac1369692f20283aa74254a49529446870911a85a427f26b972330712616562c635481b5ac684dc976ec49b920b3afadf6ca5c421126c440816b04ccc6e003d4f59a31c32f68d4da508891ad4e04770c00084971274c9049ea794dd450e1317dae629bf25e175e274293a60a654b57cdef481fcd63b5ec7954e2e4e40529165fe224a14b25095a8286c85766a48d235a6f732566350f6626e2a9febac3baef7fb8885a42920ca8389015ad209083291eccd587b8354db9a5dc60291b86d2ad46decf7bba9b5f9f9506e25ca99c3f752f5c6c928027cc88fb2ba3a7992b680e4df91bd8e04c3a9295052d40a41d5a819902f681595cfb0bc41894242118952522c12390e95951debd8aac91f63a831c3b83544b29facafc6e3c2a6c670936d462306c82f22e11ad494aa44137b4c13636adf08f451a6b16009260789af5f2e38b77473c15762b3799e72a1fff00361516dd4e9fb1014799e75264d99ba42be56cb25e0b5057724088d3126e208327afa562f88526c9257fca2df5b6f8d5620384a8332a544c89d840f8015058d22ae5ee18fd62019436d24f2296c03f7d4ebce8247ed089e5789f202e7d293316f36dfb4a00fd14dcfb93b7ad0ac4676aff0086d1f3547f841fb4d6c93c315cb1373f609f1161558977b4480400009eeec493ed2556bf4a108c9efdf5b73f4528d645f6d4b16f3b552c4e60fabda5103a5bdd0207db54dbc5282aea8ea4c981e404d70e4d427f22fdc156c3472f7be8b69036d6a2b237162418f28aba8c2ba81aa589ea499f794d4b936170af08ed710eac6e50d9420799524c7a9a26ac970e8ef1d76df52cc7ac45734b0e6cbf3345947d80f87c6631c51437de8dca48d23cc9b0f5a62c260c240f95bbda13b213eccf416951f28aa2bced03b8d94a1204c91000dbba91b9a18ee6c153a57a13b15288ed15ebf353e02bab0e823de88e5d463c5c376fd860ccf8852d80da61b1b042484c7f311ecf926fe2292719c40a5c4a48bc8304445e00d85fce681661892a22f241b7e7ceb77f10e2930ad56117d568f3af4a381478470cb5529ab7f84367e8ff00311f2855f4929dc8d424933611bcd745e204a3e4eea0907524922372abdba58d70bcb718b69695a49047c474a79ccb8c5c750a4a52bef0824f4e500571e7d14e5954a3d8ecc1af8470b8e4eebf9087082194625496c437a0c1509b6b3ed0eb6a77ccdf421a51053252795c8e83a0b5725c871eb617ab4a940882083e7bd34b9c47a936695b7314751a4c8f226b942e9b5f8562a970f9e2829c378cc3ebdc257049b0d8811f1abf9ce6210d2c85a482951829de3fd291b06fa83bdae932444728a38f6600a0ca3973a5cda596f4d034faec6b1494957716313c6ca4ed866142c6e9e627c3cfdf54713c7efd90586835321291041e64285c1f114c983c1b0ab948a28fe4b865a654d823caba2708af070e9f55369b04e53c448c4a4b6b01e8ddb723b44f23a4ecbf310aa831dc369582ac23b07fa359363d3511239d943d68861f25c2a5d59ec26403626c7526e236341f39e2864b8a4964b4a49290a4a8ea816064f96c6d507894a5491e9ad42d8a5314f3565d6550f21483c89163e44183f1af7019c38d996dc523c94533e63634dad67016821cd2f347750131ff0051b3b798aacff0a34e8d7867344dc0dd33e7723e3492d3b5d86eeae2cd72ae32710aefa9467729714857991ab4934759cf0acfecb17a49360e2dc4289f8a49fad4839964ef61ff0078081c95ba4fa8b0fb6a821e50dafe03f026a7497cc89b9c8e89c58bc5067532656140d9214a2883a859002ae7a4d2861788f10910e368581b871b45bcf526d69a8f2ecc710dc766540741aa2ffc06d4770bc6841d2fb2857a6957ba083f0ae88658254b8fe42a5ee80a788f0e77c160547c99fc28961788ce9d08c361da489809734264efdd6c1bf98a3acf11e0dcf9ada4f45a00fef0b7c692b33e1159529c654169512a80a16924c020455a169ee8f3f6a1f7c5aa0fe159f9424a5c7d96ae4cea4ba79f8a4f4dc73f0a50ccf227d4b2a2d83b5d2e23a09dd679d42e6518a4dfb37223a8246f22dbfa4d562c623fa37bdcafc28e49467f3a7fdfc1970b8afefe4f4f0ebdfd19faed7e35951f62ff00d07beaabf0aca96cc3fa59be2f743c3eb28125cecc755eb3f0d71f1a81ecf900001ced0f8a0c0faebfb01a4e79c2b3254493ccdcfbf9d7aceb1c93eaa3f6454e5ab6fe5136b1c70fc48e83b2074b1fbcc56f88cf1e5fb6e123a4e94fd5103d6294be54a0397a4fc2a1c4632c77fcfe7e35c7394e7f330d5075fce2242226ff007f2a18fe66b56eb3b6db44748fc283a3116e77178fc6b475d361e16ff5a558d2f01a09af3051b4fbcd6ed6294448277e44fe3d3950841eb33e9b54a1d3e9e9f75352051d3f86f8cdb2d869d296c81dd2130950f14a363ee06acbd9b61d575e290a3f35241091e699bfad72753c527ba236fcf951ac1e5cf3c92b683653cc95c116e73b0abe39bec958fbe55430e394dbaad4acc133b775b3b72000558569f25c3111f2d498dc942bff00aa0f9570d625f1a929444913abda8e63a8f1f3a64c3fe8fb11dd2420f51a80f740abfaac915d8e77a5849db44581c16152e21c38a42824ce9ecc89236bea346733c5e1dded021f4b617b0d25513ee9a91ae1352569476282a509fde030073322c2af7fb2ef724343d6df0ae67aecae56a05960518edae051fd4acdbfdf07f64afb7551f6718c250103102c9099d2795a6af627879e4a4ad486612370a23e1173b79d573c378a5a6cd220dc1d427dc76a6f5f99ba71123a68c7948f7039b30958529e4a87d12950bed57b15c4b84285252a4249e706db6d614095c238b260b4dfd74c7baa87fb32fa9d5349436568009ef0800edebb6dcab3d44db4dc478c2a34906519c309ddf4abe156715c4d87523425c6d2637b1331bff95003c1b8cfe85afed07d9142737e19c4b49d6b693120775c1b9d89b01154f5137cb889d14955068660d0bfcad1ee3f8de8a278a980829ed91ab92af03d39d28a783f191fba4ff689fb8d78be10c57f468fae2a92cf39f7891c5a4c78af62ee3461f895227fdeda33c8a36fef505cd70e8c428a958e6efc826c3c86ba1b96f0e3ee15696d24a490a05690411e06feb4719e157c0fdda07f5c54fd4cfba89558155780561f27420ca7304a48d88411ff00bdc518c229b4778635295f3294694abcd1aa2aa3f943edac05a1090ab05150d33d098b7ac56677942d96b5b8db606ddd50249f0005e83d5e4f31291c7b7b17f3ae304b68d28525c5117541d3731ec1993eb14949c6a944c5b9d872f048b7a0a1d8c57ce51bf38b4f513f9daa3f94a6de93c8790fc889a8e4c8f23b616828ac491ba8eb3370770260e99dc9b578bc5922ea0af33c88f1f7fc3950c5193f3a2201dcf3e96af5c766e676224440bc9b0f0a9d028b7f29936ee9f1da7a7e6d5ee1b1e52ab1524f504a7ec8a15daf8edb7847fa9adda7fa0bfe77a64da0388cadf11be9f9fa878804fbe89617899a548703a83fc212b1fe1047c68061f277969d494a143fea22db7436dc548e70ee2e7f75ee5a67edaea865cabb0bb466fd64c9b8c4a40f10dcfacac7d9594a4ac9f120c1695fdf3f1488af69fd464f6ff61d9f404a3111b5bc77b7bbad61c69f3f3aa817bf3f3ad49ae2a2bb513ab14488311eeaf14b98b9fcf5a8d0d13cbf3e5561387eb03dfcbf22876070445440debd4b9f755a1854f5dfa5676291e3f9dbdd5acc5556c6f7f1e958daa7620558730e0888e5eb5488d26b202e4b495448e9d3634c1c3ee85a3b25bc96da9929900a944881e5f80a566adb55ec3a647dbf853465b5d9aa8ec391e1b6d38b903900d401d04276fc28be3b15d9a757cad6a29b040ec7bc4ec0f76b8a618941916045e2df0a6ae08cbd0eafb47400d2360a206a574dee9163f0eb4cf239ba4bf91a2c78c364afac768bc4bad2d573a340b5a01d493d361f7518c3e05605f12e9f121af7fb142d6ee0560ca9a3a641ef6c79cdeb03d8024a25ad42046aea0473bf2a74a971fec76edd91e78f2db0db087d4e2dc581dfecc90245fba94f3dbcaafbd9795f7138f7d303d942980408ff00a73b521a5dc22f1cbed3b36d944a5292468594da74ec7e719f014cb84672a577928c3ced3dd07fd292114db909765c7f24d6027f58e2a51d1c641feb4373efa1397294318f27e52b29081fb49689511d98ef776246db72ab6e60f2c26c9c3c9e85326945787c3231eb6f4b3d869f64c69f6418136dc9a76b95f7337438e64cca752b1cfa13b4a56ca47bfb3de84e71971536a4ab1ef2869f656a660c5c6a8403122aaf6b9591a47c9e37821313ea2bc630997392108c3aadc8276ab6d4d78fdc5b35e1f5971bd6716f3652341482d84803680a41e517de8c32c40938d748ea54cc7bfb3a4bc561f0ed6334a92da995810084a820ed69b0b8f0b2a8f2709828fdd61c8fe5456c7caaf28089739c31655f2a65e528ece91a0a8a2d74c26240ea0f2e95361f3964dc660f5845fb3f8feca2686e298c20101b60738d28f7c52d6359432bd6da816d5c810424ef103973149960e0b746837c9d19b2d2d052bc6a96955885164cff00e3a4ce2e5f6684b41fed5b9940907484da08dfe31e155d0ea0890409e713e26683f1128f7762003b0ebb8ae08e794e54d514be016b5f51b1e7bc73a8cb86d716e82db7fad445448b813cbedfcf9d685676b7c3955a852c07ca7bc0dfc79edcc7d95a85fadbcfc0d6e8403b9f0f3a912c246dfe7405b45306397e456074f38ff4abe70c98fcc7db6a88e19311e9e344368f5bc672ff0029ab0de62410a0a214040bedbda7d76f3aa0e618f2fcf9540a491b88a146a1859e227d20252f181b4c13ef226bca5e3594dba5ee0da6c98a9db4017e63ad7a966a5187b6dbf952d8c7a857948b56e92795ef6b795ab42d5784f5e742853d2af31d6a25627cfc3f3e55b140ea6f50e21358c6e1d51e66a2c41bc57add46f2ba515dc29727893575b518802a9241ab2ca492129924ed7e7f853a8d8f41bc832d5e25cecc0802eb549b0fb24ed15d458ca30a94a53d835dd112a4a4931d49de907018108481adc0773a565209eb02a55e56970c175d3beee13bf9d5e386497615b48707b27c2c7ee1a83fc29fc28071137866195291876b51ee8ee26c4fcedb9554ff00679303f6aedbf8cdbca96f316007832870aae002a32655bc7e79569da8f280d8e9c2194b6a602df690a2bef0900f74edefdfd6989bcab07fd0b53fca9a4f5e4a08492fbd6000efd80e8206d5123859b3b38e7d7ff2a649a549068784e5b842252c347c909a4cc461dbfd66a6c368d11ec8488fdd856d11bd633c3084ece3c3c9c8fb05070ce9c7767ad6520c6ad6755db07dadf9c52caf8b5e4cd0ea72fc26dd9340f4d29fb2b45e5586fe81bfa89fc283e2786da592ad4e151e6564fc6b4564c3fa67bfb43f85596ef640a3ce28ca5b0d1534da505373a404ca76331eff004ad32565871a4a8b0dcec7b89dc58f2f5f5af5cc97fe7bdf5c1f811e2697706ce8794d29c5a04c0d2a893ca6dcc454dfc33b6bb986f5657863ff0005bfa89fc2a07b2560ecd204f44807de286fea5493abb67a7aea1f856ebcacff00fa1ffae3ff009aa73fa4c05ccc39865e921441ba4ec08db9789da876231aa58bcc4d36bd96ea46953ce2a36d452403f56693f1a141452ab1168fc2b8e58e9dd0ea8acb5d78837af163ad6a0d299a270bebb57a1f8daa326b42680b45b0bf1b54a556b137e5543554c95c73a02b458527a1f3e5e551ad122bced7c2b7d4236ac622ec7cab2a22e1e9594462d8b6ff000af4ba9f135959400617078546e3a7ac8af2b2b1bc9ea576f5a8de557b5958c788fc6b66b0f373cae7cac3efacaca78a1e28d9503955ccab18d340a8c959e8361d04d7b594ca4e2ed1a44eae223c91f1acc3712287b499f2af6b28f567ee2517c716098d2adbad05c1e6094bbdaac151b911d49b9f74d65652bc926f9006d5c528fa2af856ecf14360490a07a7f9d79594eb348d67abe314c5906817eb497fb5223bd26bcaca47372ee119dbe2a662e55f54d78be27679127faa6b2b2a9d7902c84f14347e90f4a039ce310eac2d133ce6db6c7f3d05656524b2ca4a99834de78de904933d20d8c56233e6898923d0d7b5955eb4b831abd9f3693173e314373271b786a4fb607948898f4acaca1d472b4c20602b55b7595952286a555a9359594a03749af0aabdaca029a95548e2ab2b2b048e45656565131fffd9, 'india', 'karnataka', 'bangalore', 'jalahalli', 'good house'),
(2, 1, 3, 20000, 0xffd8ffe000104a46494600010100000100010000ffdb0043000b090907090907090909090b0909090909090b090b0b0c0b0b0b0c0d100c110e0d0e0c121912251a1d251d191f1c292916253735361a2a323e2d2930193b2113ffdb0043010708080b090b150b0b152c1d191d2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2cffc000110800a0010d03012200021101031101ffc4001b00000105010100000000000000000000000200030405060107ffc40040100002010303020403050408060301000001020300041105122113310641516114227123328191a11542b1f0162443526272c1d13382a2b2e1f1345492c2ffc4001a010003010101010000000000000000000000010302040506ffc4002b110002020201040006020203000000000000010211031221041331411422325191a10542d1e161b1c1ffda000c03010002110311003f00db1ce4f7ae734e11c9ae115ef267834073eb5ce7d4d1e29629d99a039ae73eb478a58a762a039a5cd1e05731458501cd2e68f15cc53b3340f3eb5ce7d68f14b1458501cfbd2e68f15cc516140734b9f5a3c57314ec00e7d6973eb478a58a2c401cd739a3c52c51b001cd2e7de8b029628b003e6a5cd1629628b0079ae73eb47814b028b0a039f534b9f5347814b028b1d01cd2e7d68b14b028b0a079f5a5cfad16052c52b0a079f7a5cfbd163eb4b14581388e4d73069c2393f5ae60d73ec5e86f15cc53b8ae629ec14378a58a3c52c51b0a80c57314e629629d886f14b14781e94b03d28d806f14b1478a58a7b080c5731478a58a360a0314b1478a58a36150de2963da8f6d2c7b53b0a1bf5a54e115cc51b0a80c52c7b51e2b98346c140629628f14b14b60a0315cc51e296051b050dedaee28f14a8b1d0dedae6da7296da5b05018a58a3c577146c3a0314b1478aee28d809a472687029c2393438ae6d8e8a0715cc0a3c52c53d854063da963da8b1ef4b146c2a031ed4b1458a8f79770585b9bab8127c3a48892bc63718f7e42b15f4ce07e3439d72c351dc52c544b1d46def9536603b4227299c95566e33c7a6d27eb8f2a9b83429a92b40e35e40c1a58a3c1ae60d3d835071ed4b1ed47834b14f616a063dab98f6a73069628d8351bc52c51e29629ec1a8dedf6a58f6a702962000493d80ee6b2daaf899a194c1a4a4371d26227b8983b42ec383141b08ce3cdb38e3033de84edd216a6931ed4b158c4f186a592b259d96f51965613a37d7890f15217c60ffda69d19f5e9dc3afe8c868769d1aedb3558f6a58acbff004df4943b67b59a36032409e36383e782a2a5daf8b342ba0aca2ed232e63eabc4ad10618272c8c4f1c6700d1cf90d197b8a58aea3472a24913abc6e328f1b06461ecc38a2c52d8cea378a5b68f06bb8346c1a8de3da963da8f14b14b60a031ed4b1ed46452c51b0e80fc0d7715dc5742b601c1c1ec7068d835336de22be5920d3a196de5b98a536b35cbe584927c41892662bfb9b4ab938e706ad6c75db4bb8a5bb91960d377986d2f2e8c704774c8769281db7127bf0b819c649526bcbc4f0c85ee612eaf7082dee36e08dbb5906d1df380c3f1f6ab9d22e23d25be2afeea786e9632b6d1c900b9992173b961d3e3954a279f51883c1c0ec73e2e2ea5b93523d29607568f4e52acaacac19580656520820f20822bb598b4f14413db3ed0ef3b175b70cd1197e5018ac8912200c01c8f939edef4c0f1a5acccd15a2c667923b548567251229e45679da42d81b220091ebebe9dbde473bc6cd762962b177de379a3581b4fd344d1baa0eb4cecf217201dc208b036fafcc7bf979c583c7da846d1c5a86956fd46196114e639100072eebf381938c0c7f1e08e68c9d2078daf26f1b70562a172013f39dabc7272d8381ef8ac6eb77136a5d3b5e9496b3445a0bf5625966b497122bc1221e9ba12a0a9eeacbe618e23cbe38b8bc2d676ba5c5fd6629203d69dcf0ea55dd8a05c2819fe78a60dc4db228d5b11c3124312f2c1514630bbf271e7f8d752c526fe7f04a4d2f1e49a8f736eac74f90c370ca81c210bf10139009c7de1e5ebf5ef0ff00a47afa93fd6d8e09077c509230718394cd366494f791fe80e3f8529a15bc059485bc1e6785b9c0ec7fc7efe7f5e4ea7892e60531644fe59923fa55ae00475212de5be084a9ff00f2a0feb44be2fd6067747644703e684aed6f472ae383e46b3e411952082a4860782a41a1232720e1bc8e3208f423d2a2753c71fb1a61e31d407deb4b338203713291ec7ed3f23da9ff00e99e065ad20e3ef7cd3ae3d73dff008d63fb7a8da3b77283dbd53f851c7d2596279608a78d195dede52e619547203042094ce0e33e5e6382c5da8fd8db47e289e4b46bf5d22492cc482237114cdd12feccd1f3f5ede59cd717c5f64465aca6c7f8265247e0505468fc6afd3e8b585808d53a4635de22098c6d080e36e3cb1f8566eee4b79a7925b5852dd1f0dd04766407cf61639da7cbd3f4a946726f9543782146cd7c55a630e2dee39ec7a911ff006a23e27d37a7234505c4928526388b431891bfbbd42c40fae2b00091929dfcd4e39a715f3eb91dc798fad6db667b100b59f17f88af8dcd9aafc040774535bdb2b098a9ee92ccdf6873e78c03e95996f8c7c03f12c07033d5c01ed9e2b51be1976adc46240aa551bb3a03e87d3d8fe94d59d9c4857a885dfa6bba5691e48d9828ce032800e79ffd55e39bd246258b529ac23b8479caa29731c880492c710dca164c17908033c62b51a7e962e6c35abb999ba96d6e27b38e0246728cc165120e4f1e58a6a7b6b63d0063420adc03951c8fb23cd68b4f045b78855720fc31c609520ed971c8e6a1d46596b7f6ff0025314139182b8b3b8b931836f72b86c168e3dcdb73f3051ebe95a837ba1fecd8b4e8f4cd4e08e053f0ec610ccb279bb1e33bbf7bff00157ba3db24bfb544d02c9d2bf29175075f6274233b55dd738ce4fe34dea7670c26478e28e3204071d485463e222473d12bdb071ef9cfd3827d54a6f56bc7fc9d51c0a0bcf932b65ac6a7a648c6dcdc2a31f9d1e17785fdd918633ee306b4b69e34b160ab7f6f2424e0196dc33c7f531b7cdf91353d2ced1aeaf226d391628e4410c8a9b430d9bbc88cf3c71541aadb8b7bb83a0ee40982c91ee468c248f6f9dc320e70c46793f95523d636eb5fdffa232e913e6cd85bea5a5dda6fb5bcb79879849177aff990e1c7e54e35ddaa1c34d129e3ef48abdfb77ac3ea7aaa693a95e5ad9daa016acd1ac8cb1b3891b0491230662b8c6d19e39f2aa6fdaf701de4da4b3e77f51cb07ff30239af4b1e394e2a55e4e09c546547a79bdb51fda467e8c0d01bf83c8e47faf9579edbea8cfd460ab19520f4959994a7aaef39faf3e74fc9a8cb30516d32464e0488f107604739f98823be3f0a6f1b4e9a04a2cd95d6b367689d4b8923893195ea1f9dbfc883e63f80a8371e28d3e084ccbbe73805638570482320b3498007e7f4aa5d4b47d3eeeded75185de09a78a392ea367123313f29740d8cf3dc0c63be0f9428b4f486d64794cf70aad848ed5a1eaaa90492cb2ae36fe3c73eb59eee271d914585a74c9775e38be75db676b0c048c19253d771fe4042a7e60d67a7d5b56b991a59efae9ddbb93338fc0052001f414fae9b6f396787e2d226c322cdf0fbc2b0079d991512f608ac65489a3b890bc624dcb2c4000599718d9ed5d11cb852b42edb239b98616ba55448fa643eee5b3201b5804e3cf239faf9d3097a15b7dd47d494f4db72cc236f30074c63f2dc06071e9515659c5f40f3c6a18dc2c92ee193ca6dc927cb1cf6ab1bcd2f54be8d4afc222e7ecd417dbb1864beed99c9e3e9f8d7cfe2e917347a7932417b1c5d561910c7d1e9954c095d49daca7218b2e1b23c8927bd4fb4b0826926637b6f04b35ac5218d0b318f7b947076fcdd8761fde03cf887a6e9575a71324f1e9778d3c4c3a5713ddc7d15076862e89839e78f2fc6a73daea71c9733c567a6a102d944097133c112040a0fdcea65bbd37d3cd7d28cc72637f531dbeb04b3fb792ea436ed85445bab7370c76630f1c458f1e99c0f3f7a0550a02207625bcc967763c01f5f202b431e0dbb4f7763034e8b2b14b74936954248540e3764fd3ce9bb6bed3a737020b28f7c0036df90124c8c9c1c718c135eaf498238636fcb38b3e5ddbd17087ac2cc59c64be0dcca075981c851dc44a7d0799f33ec054bcd35712bc11c6ea91b2b248c4bb30c143d8edf2a391996377509b818787ddb40760a7b11dabadbb6713fb859aee69b462c91b1db92093b3217b9ed924feb459a42252591d5a4088c91ddaa16695c1e9c88a00cc9b413b8791c73fad3ff00d14d47ff00b363eff34ddfdbe4a7b4138bd90f9fc2cc7f2c1ad22cd374ed995623d4ba489f7ec1f21383b3711cfe75e47559670cba44f5fa68ed8b6664cf84f5238c5d58ab03c3069b23dc7d9d458340966875361710f5ed2681228e26658e4672e18a191410c78c0eddf3df35a9bad4af20b79e55f872c8a0a830291b895efcfb9a8babb62e442a88803c72b6c0aa5de44c6e623cea71c991fd45271495a31e2cef9240a2ce591f25888e1661e9b8100e0fa8a2f82bb7412476b73827217a320fc57e5eff00cfd6f6fa7d56c6ce49da3b66549e2861f9a462cacac72e011cf14fe9d2cf26a52473aa2c76f1473a32862c58a07e431c71cf957429464b8649b92f465c5b4c4fcf0dc039386313a8f9782391dfd4518b1b97dad1c7267008f95b907dc8a24f19f8c1d5899ac32348fdaa07c241c800b1046df6edfad3969e30f17dcdd6936e67b00b7d68b72ccb676f95ccb2c7c657b7cbcf07eb5179265690fda6877d791f5619ac4004ab24d33c52a30ee0ab27f02454b8fc39ad4472b269e73c11f147047be52b5f66d73d13d79baf2839ea490c084fb05891463d3f8d3b2c8e9c0641f6857ee2e58610800e3eb505d44a5e0db825e4c16a5a4f88208649e38ac5e3815dd889d8948a408a78dbf3364718c71dea25a6b1e20b75bd0b05a06ba0aa5c2ca19305b253e6efcfe15bbbd9205b3bf5b82a81ace4dc718c3302a001db39231c561de39a0e975536f513a89f323065dc5720a123b83f955f0e4ef5c664a70edf2893631eb7aa40196f4d94cb7325b2aacd33fc448abb9942492771e441ed5611e89e2f898bc7ac3f38ff00896fd4071ea24722a144d9f0c78bdd0959a17bb96174e248d86c21a361f303e5c579fbdf6b9d7c1bbd4fe40cedf6f7385441f33105bb722a5284b76935f837192a567ab747c5ea4c12ea562ed3248aa92d8c6b23a6dc315d8ea78cd574de19d6a693a8f25986e9c50e23b79130b1050187da1e781557a2ab4da6f89da6966965834e32dbcb2c923cb149d2b9f9a3762581e07e556fa7db40d6f0875663f1d2c79791dd8a9d25a50a598e700f23df9a83da0da55f829c497250ea7a41b4926eade5bfc41e9ff55891cb0e0a92cc320631c8f7fcab45a39fed147fcae7fd2afb5565f84f0d1c9dcda5425b20e5995994b163dcff00b7bd5606ed5e9e0ea72460959c9930c1c9b198ada589964595094f9882af861e6a78f3ed5a37f0fcea6296d675fb455251e291c283ce0b019aa50f90c3d5481f956a2fafb4f934b509703a82d6ebee2ca18318005c10bebef5b975196538c6fc935860a2db43122cc3e06d0ac7d582011958ddb0e9bd886c4c076f3f9abada5dee7724455bfc32c407fdf4d8d4b475bfd31eea78d637b3d920923958160b9da70a7359d8bc4ba8edb556d66e4b95b4463d598ee62b6c1870bea1ff003f7ae4eecd3d628e8ed45ab669974fd4de4549a05da5942bc732f5b39edb23249f5fc0f1ea573e185b9903dc48a1d50201ba55c004b76d9ef54926ba915a5ec3797b33dd4915ab5ab5c348ee046559f61f227047966af2c3c4ba0c561a70b9d423ebfc3a090364b6e00024d67264ca95a351c58ee8f32960b89998bc8aa5998970983cf1c28c015aab5bab56b7b70b710e560883032c6186140f986ea16b5b56fec63fca9a6d3b4f6fbd6d09c9c9057f5a9e2eba30f471ca329fd44f69136a00c85b6160a194b6dc9e7039c53afcb64ae7e55ee3d8553b697a7127ecb1db1b6491718e0763e55c3a6c23063b8bc8f68c0db3b9da31e5bb3575fc8e3f6893c2cb95d81d0e002197cb9ef52e79eda105a4786257711ab10a819d8f0a303b9acf449710b230bf9dc280024ca197839e7001cfe34c5ec335f48b2497e014fbaa91008a739c81bbbd57e3f17940b13f0cb9919258a150e81d0cc18306e37e3182051bb801812369db9040c36dc11c30fcab38b6ba845b99354918e01c31e377f788dd55ef6ba9c61d51d191a412e3ab22a8901c87dbdb3555d7e36b817657dcda0618038c0e000001ebe55ddc2b231dfeb5167746ce32301655ddf892314e8d5751e37c376a491c208dff000cd57e2a0ccf61fa68dee893c705e3c921f956de7c81dd8800ed5f7357775784c3612adb47b7ad0dc0124e430198d800100e7eb9ff007f301a9df1826204e4c96d346b195549033a1553c0cf0706af6cb588a782d127b8844fb2306390aa912ed04804800e315178e19f26f6754672c30d4d0dd3fc4dbb5aa294770a9d4ea2e0655b2dc0cd4fbe8e2959584b8c1b6c6e4dedf247b796dc3f1aa48ee5f031b0aee07eea91c1cf954ab4d6b4ad4b51bbd3a08aeccb6a8d23cac02c2c519508500eef318c8e7f0e7793a7d29fa1473ee58dcdbc5756f05bbcc14c57114a488d48631938272dfeb4c3086daf92657666984706d608883b60ee24fe58f3ae6a329b0b6bcb9e99716f6eb3852f20dc4eee0fb7a56027f14dc5e8b52cb1dbcb1dda9697323393d31b026f7eddc9cfb571f635f9916eeb6aa8d2e9fe1dd3a649d64172a52d9b4a1d224b7c394da460b11e679eff0095585bf84b4585ec2e617bd12d840d6f6ec5a36c45be47dac082a7963e543a05cc0d1ca6631f4dba321dc4207c13bf18f3e06715aa80787a45014d9824ef28ee339fbb9fb5359cd82519706f165525c9c4d8abf36e05943e180cfbf6aec8a8c109dd92cac42e002428f519c508bed28349ba4b08e344254493db29383eedde983e21f0e21c35f69608e3ff009969907f06ac430b5e8d3c89fb1bbdb3b4be565b96959583168e398c68fb4ee01d6303201c7e5550965a2c8f05b5c473b98202b14ad25cf4f6ef27a7b97cf249ed5732f8a3c251824eb5a5aba6400b2b480e719ff82a7fd6b313f8c196faf597c416b3d8bbcdf0f047677c5961e9b74d331dbe73bb6ee39ed9f5a718b4ed21b95aa603fc1c71eaba7c36ecb15d34b148a1d98eeddb4901f279c0c8cd53c9a341225c05bf63d5b36b78cddabcd24459b710085c633db18efed526d75282eaea0c468669239a695fe06f218dae3ecf05249401824c98ce39db4db7ed08557af02a10819bed97e871dead278dcaa4f92718cd2b48b5d3f4c4b6b7d5618aeadcc3aa5b7c2c4dd398749424a8ce559b71397f51532d2d5ad228e2ebc4dd09d2524c320e4591b2c1f9cf97cdf85662e6f2f1d6dc2c96b14696c54eebc0373750b92428f703f0a80d35ae332ea30a16e4f4ae738e07706bcdcbdddde9e0ac7224a9c2d977aec321b6d0a2b69a373676af672330fbc010eaf85ce3393c7b77aa168efd700c96dff336dffb85366e74332c71beb126181cb242d22a918e18ef0306ad61d1d26824bb86ec4b6e322191594aca3b64a852c3f9fa54e79e58125924919d72e56dc21fb2b835fab038b6651fdd9a219fccd4669fc44914d1a8b4915f2a83ab16f0872001dbcaac2eed6d2cfa43a7a85c970c730c6a8a9b4804169557f9fad47057682ba5de1c8ce66ba8541f7014e6baf1e49cd29268938e48ba68a5bcb9d7a4307561910c21950c51e460e077518fd6a02b5c33c6a630a570464141b94e43124e2b506e523525acf4f8cfcbcdcea186c95ce36af7f7fca9a1aa42015693465271c20ba99b19390081b7f5aadc8d2bf6564f16b324a0cb6971204b70b0b085c60aa965c1427b1cf9f353acb47b8bab749ae6e9ade562c0c325a1de9b58a8c9623b8c11c5595a6ab696fd656d434d8032075486c4b6095662f8c91ef8e7f4a088dddda09a0bdeac64b289122d8ac54e0e0119adc25b369a3196528a4d3b2c484cf663f563d8d73e41c639efc9cfeb9a96afe1b03325eba2e48dccc9cf98c6d4a6cde787230066591ce0ae1e423078e76e2be73691d7f099bc71f91827fc23f5f3a596e300f99c0f3f7a77f68e8e84edb2965ca06198a661f7777218f6a25d4ad4989a2d14b1937364c31943f3630858938fad172f26fe0b27b6bf631bd870781f51fad2dec41e41e71e479a942fef76660d2973b880c1611d80206d0a4fe344b7de212c9b6d2de36dabb72ea09f9b8278068d99af8197b97e885d391ffb02dc7946c4fe6ab4274ebb93ee59dd72091b6193071c9232054c377ad13959ece11b98163210a1c6771f98fd295c5ddf66169f59b3da0ca76c6aedb1481f2e10377fa79d523ddfea9987d143c4e7ff005fe4ab9749d453bc322e7fbf8520fa609a21a06b4db4ec8c063805e7800cf1dc863fc29f9ae1dbeeea2ffb9f2c119455c63904a0fe14c4f25918d11eef59988249e8ed51c8f2dd229fd2bae31ea78f95fe08be93a55fdff688e749bb180d25baee2c07dae41c770700d01d2961567f8fb78f722ee6b7662c11891c918a88d1d964ff0055d41f624d2b1b89b62911a1931f2e47963f1a956fa7432428cf6690472c51119964919d88dc431703d40e2bbe1832caabc909430439b7f9ff00472de2b6b46761afb2edec17a671ce78f9c7e54f4377a3db4d35caea930b99fe5966b72559c79e7631e381c5147a5dbc7bb305a052adda06ceef2fdeedebc54eb0d1efd2fe65beb3b4fd9cb0b18e78d910bc995dbc6edf9ef91815d12c39a3f5308e4c2ddc515ffb574d65659a5bb9577891c0ea3b6f91446705d4fa0c7f39645d6987aa069f792e70176c380bb582e4e715a6b9d374f8e29a3b18e186e3a08b0b190b3a485d9770dc49c8ac7cba76b90471b5c5d48ed713c48218e695246523e53c8008cfebf5e13c6fdb34b2ae5244f1a9c903ab5b69b7316e600977da00f42a5b6fbf6aafd57c43e20692266967b6c6ed9b5936b28ec7604dbffbad56876b6f28952eb7009d157de5cba33361c30507271deb52d61e1a91559e2ba98a004386b847f323018ad6e4d62e1cd998bee72a2788daca3aa9d5844916e264db082d8392790b9fd7f8548964d44c8c6da278a00074f6c0b12818f5719fd6bd4a2f07782d9da4f83bc78df25639eee7039239fb393fd6a745e1ef07dbaa18b42b03f74ff580d31e549fed4b573ec9cad32fcd551e28ef785c75263d4cfde699723ea43714edb7c4999313ca483f335bb4b2480799528adcd7b7247a640ac6db4dd360da1d8fc35adba36429e72e31c7bfa55635e88ba3f17ad66de58670d009f7076df80d9b5f218ed81dff0037b27c0ab8b317630a5c4d0c025d6700334b25f0991362946250f6cf6007be73c005db9b7b3b80a0c0c140ce249e590ee3dce58d5e24d1ddfedf9e096531e9cb34f1132ca124608f32e1180206000463cbdeb1b77adde2c966214b74530a875d81fa8efcef2ce09c8ce060f956962c7b5d728cbcb91ad7d32fec742d26748cb471ab2c52cf385843b2dba1653212dcf7040c64fb7999f69a3e8930468232d1bcb6514471d3e6e519d0b1ce4e40e78e3f1a89e19b9bbb993514b958c3ae8f32811c6a9c3492373b3eb53741b846b4b57664555bef0f212cca07c914b19249c7f26b9f247e67cb2909fcab82b75682c62b3d22e2d600bf10f70e19d5199442fd3c1ce792726ab1aeefa4003dcdc32ff77aae17f2071563a9488da47875836edefaaaa10ca576a5c93c0fc6a9d493818fe155c7894a29b564f24dd87b4b302cf2360e7e691cff001352a3d091ed0cf3413c9d76dc24904a4a020b008410307e86a3ae4e386fc8d6ce1ea1d1f4e5dcd1a74e17690c7b82af4b67259940efc735569465155c185ca6d1e7973a3a95d2d6d6297ab72884858e5666628a7e55e4d41fd9b7a325619c94dc5b29b402a66cf24ff81bf2af4177e849a37c3cead1d8c1b04a4ab316082353b50edcf9e33e552ccde1e806ef85491d94ee2f106decdbd989599d873b9bcbcfd3b65ddf8e0daa6b96626e3489a4766b2b5cfc3c1335de766117ad347bfbe78c63cfb53f6be18d66e608a584ac68c0fcaa8ef8393e6302b5cfa9c042a47609126e0c1e4748c1cb6fff008712063cf24138e4faf321fc42c3685b766efc99481f804007e9597dc7e23fb43bc7ed98f8f5d45b868ac746b72c1f281e467964562005508b8dc476c67fdd893c4b7b1492c4f63691e2403a6eae2740091b5f27b8ff002556b32ac8dc46ea1a2556542a19412323201c7a76ad2e973cb15a432d8456a89d47422f56d6492e27206f58279d4e1f1ced7619c8da71c543174f8dc9aaff00d3593aac895d9063d7ef242c22b6911845c9d9074c159392ecd19e00c0c0f3f3c7153cea4e5f0f7f7114af6bf16d1c3123156c7284c7c124658631e9f5b38c49aa2cf9b4982c2ebd4b678e1b78a6006e02ea4831188c7de6440ccd8e49c8db5a9e1ed762bb5d5223d4bc8d62bf119088a5c4c4fc31078cb4654fe62bb574c972a2bf08e49750df993fc83752c91470dc0be6bab572bba58c4aa22727223994b1c13e59183e59c517c75a4d9db22e4f1f393df8ad3d9e87a3c4d25c476ff65751fcd6d708ac2357f9fa7c8ce067007f2335e20f0d25b4904da5abb2dcbca9f0832cc8d1c6663d162790403b5739e38cf61e863c74adaa391e4d9d590e70a61840287e6bb7c1c658055fbb44398d98e4148e22477fbc557cf1eb4c8e93c71f0248f6e14c883771f29041e41f222ba769564c108ca8b843b70108200efe82b7e198a1d60576e483919e3eb8a1cd06400ab97380797209e4e71c014b343f3c095fb2cb49812eafa281feec91cc0f98fbbc641e315a096c268ed6da122d98446de1122b3a3c8dc463e528d8ce73f7aa8b406c6a968477db28ff00a6b5d02dc2c402f4d641730c84c8c9808a46e61b81e78e31eb5e57539650cc92f07a9d3e38cb136ca0962740d335acb94da5997a2c04719627b306f5f2a9d7b346a96ed348a9235b5ac9b1c191b0cb8f94aa91c1edc8a7ae74f9e74ba8cdcdb4692c72460ed9a471bd5941da368e33ebe5559aa082e2431dac924f73651dac570a887ee2e10b273d81c6ef734bbfbb5c9a789453e0b0b8b9b3b2b396f1bab8531ee6445323ee906177311c73507e32d353b9b48151c3b476d708ce627c13f3e0a60ff1aa99aded8f596e6fb6493aaa491bdc463688c82362b76edfcf93b610436d796d731912222ac63610db804d8bf36ec56e1825f53e49bc8be918b5f11e9b653b8951dfe24dd492ed2bf62f0b4aaa33b4e49da3cbf787f7797bfa660c70186cd4961299fa8d2ed40afb571b1579239393fc325997c3691bcb2dd6aba4db0692594abce647552ec46115413dfd6ba6cbc2b06deb788a6949201165645c01e792c48fa545eb27745a371546cf4abfb7d463964b6749047f2148f3ba36c0215831ce454c9fe212de555c4604790ce558aaa46c4e09079ce0f7fc6b03f19e098586db3d5ae8e0ee79668e2edc00a23da7f1fd29e83c41651ee167a1c31aecd91bdc5d5ccbc302a4c80f0de75258669da36f246b935f3dcac515fdcc876ac36975285385184de407de40c9e3f935e5d1dedb903e6c76cf6ff4ab7d5b51b9d50466e020884d1158172620c2371bb6b67ff14e68ba76977379b67b2b5955ac8b62485186efb3e791dfbd5f1c1e14e4c8cb22cad2439a05c45243e21892488f5fa31b976c74e278591e40b824edf4c7fb81fe8ff85cc90a5c6a33cd247129409d1843018008254024f90dd52746b6d2dafaeb6e9f04216c6c27453146adbe4690336158f0703bd586a661b689e3822b58d9edee0a2adb48cfcc2e80858001827819f3e7cab9726472c8f9ab3a2304a1e2c8b15868d112d6769a949d4d90dc0dd2013c63fb26dff770793c2e7d4d04d79a3e9ca9b74489573be3dd07ce514b296c49b486e0e011f8f35292fe08e6b37975485215d3ed626b64944f275c00cca6288336719c9ff6aa7d77504bb79208d4944312b493078c047590ef2b2ecfef7033e5ce335382de54f934deaad7016a936a5796f294d2eee3b7962059e08d2389d1195a3dea559f8c646080739e7cb2fb1c7ee30fc0d6f34bd6e3bb582de3b5b8658e18a232c644aa0c6a233d5da3a601ee3123714771a1d84d3f5d7ecf392f1850636627ef6de3f2afa0e960a38d6a78d9f33ee35230b046eed9f9c20c1620b0c8ed8523ccd58c9f18e23ebb1e901b6287e7281547a7dd0056b63d22c5583c86595c00019180000f20a80002a5c56d631e710c7d8e0b0de738e396cd5dc24fd1159628a3b40a742170d05cce629eebe192d53702cf81bce3f7571e43bf1ee2aed6e6e6477923d3de54018052970d21c1fbced1608f603ff7b55da808518049200e00fa01da8b7fb9ac43a6514efd9a9754f8a5e0f369afb74cec9696d0b28daca125dfdfbb991cbe7f1a037d29c6638bf3947ffdd7a15dd8e9d7eb8bbb78e53e4e46d947d245c3feb548fe12d399d9a3bbb944272a8cb1bedf60dc1fceb6b0c570907c427cb32f25adc5b5c2c77cb88a0668e68f197dc8233367c890188efdc55f681a64b6b3dd421c35ca6e3247703e234bbc83b2c8506195883946c9e1b81deb4a2cad02049144ae2596732b802432cae6476cae3b9a9004698daa8b850836a81851ced18f2a8e2e8f495b09f52e4a87a2cc71a21589481cac0bb2307bfcab445fde98df5cdf5dca3471b63fbfde85f64810380c12449533fbb221cab0f71e54cefae6fa7a8ac85ab69b05dc534b0c68b760994b0f94cc42e087c773c0c1ac79e0907230707eb5bddf59ed674f4329bb8cb289580980e7121fdec7bfd7bfd6a73837ca2b8e74e99459a59a27b79d7b6d61cf20e0fe47fde81e486d399577dce1592061f247e61a7e73f45fe1e7cefe5f27425b3e09b65751e9b35bdf4fbb03718a14c756552369619ec3dcd584be3219021d394019e67b97666fa84503f2ac9492cb33b49239676e4b1efe800f61e429a2e320640fae3247b66b8b26386496d2477e36f1c7546926f17eb6dbc462ca2dc001d3b70db076ce642c7350135ed4d0ea8e65065bfb75b69250046d18ea2c85a311606e38c7e3eb55d15b5e4fb7a36f3c9b8e074e372093c7dec63f5ab18341d74b248b1085e3647467951191d4ee564da49c8ef4e3817f588a5952f2c8f6ba7ead7996b5b1b9997862c90b91dfb924015cbbb3bdb19123bb89a199977f45b025453db7a03919f2cd6f6c6fbc551dadc4379776935cb0c5b5dc8ad2cb093819740aa8c47719f3ef9ed551fd1eb5964926bdbcbaba9e56679a42c23691db92ccc32d9fc6a90c199be552252ea314570ecc7f73c609f61c0a35566200e58e063cf278ed5b78747d1a0fbb6a8e7006672d2f6f66e3f4a991c76f0aed8618a35ce711a2a8cfaf02ba574b27e5907d64578460eeed2fac624926b39c9913a80bc6c618d73fda943907d8e3fd2aa56e2712750bb16f5dc707fe5ed5eaa5c1c83820f7040208f7078ac9eb1a147197bab3803c4cf992da38cb3445bbbc417e62a4f9638f2e3eea9f4b4ad0b1f55b7122812f6e6401014c892320b06c7ef0e76e78f5ad4f85a6ea5ec4a5d1985acb1e549c36d68c6eda79c1fa550db691a93bee8ac278c6460cdf66be7cb1908fd01ab4b4d135985bad1dd456936d68cb46eed274ce0901e2c707d33e55cd2e9a538b491d0b3420edb2bbf6acf682e85b0921573b14c722c0e02927e76b74566ee7bb559da593ea36a2fee350b45b7da5a52216ba9e0e9f38df76ee41f6cf39f7a7d7c31a7b6d37371712b0625b66d891867b700b7fd5532df45d26d4b74925e9b906486595a482465ced2e8f9ce39c537fc7c9ae3862f8d8fbe4a2b6b1d575262609665b6dec44d3318a3c31e59122c027d7031ef57d67e1cd26df63ce0dd48a73f6c00873cf68871f993565bc0000ec00000ec00f20296faf431f4d081c1933ce6c90852355445544418554015547a0038aeeff007a8dbeb9bfdeafa9ce49dfef4b7fbd46dfef4b7fbd14324eff007a5bfdea36ff007a5bfde8d4093bfde96ff7a8dbfde96ea2864b2fc9a12f4c9639343b8d6f501fdf5cdf4c6e35cdc7de8d407f7d737d31bbd8d7371f4a28091be85caba3a30caba95607cc1a67757379a280ae7d36ebe7586689012424ae199d173dd50606ef7cff00e2345e1bb7deed757534dbb27118e99dc4e49662589ab9de6bbbea6f0424ed9459a51548831e87a246b836cd271c996591b3f50081fa54d86decadb3f0f6d6f164004c71aa9207604819a5bcfa57379f4adac515e1187393f2c91d43fc9ae6fa60b1ae6e3ef5ba303fbe96fa8fb8d7371a74048df43be982c696ea2807f7d737d305ab9ba8a10fefae6fa677d7379a2863fbeb9be98de6b9bcd1403fbe96fa6379ae6f34501237d2df51b79a5b8fbd2a19237d2df51f71f7a4189a28091be96fa6326b9bcd14048df4b7d46de6b9b8d1407fffd9, 'india', 'karnataka', 'bangalore', 'jalahalli west', 'beautiful house');
INSERT INTO `house` (`id`, `owner_id`, `no_of_rooms`, `rate`, `pics`, `country`, `state`, `city`, `address`, `description`) VALUES
(3, 1, 5, 15000, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607131312151313131616151718151b151718161a1a1a181a18181817181a191a1a1f2820181a251b181821312225292b2e2e2e17203338332d37282d2e2b010a0a0a0e0d0e1a10101b2d251f252d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110800b7011303012200021101031101ffc4001b00000203010101000000000000000000000405020306000107ffc40045100001020403050505040902060301000001021100032131041241052251617106138191a13242b1c1f01452d1e123334353627292a2f182b215168393c2d224c3f207ffc400190101010101010100000000000000000000010002030405ffc4002611010100020201040202030100000000000001021112213103134151619104224281f014ffda000c03010002110311003f00b664d5cb50ef525cd3be940e950168bf16f6c13c09020995b4db2052d2b4d732e8ec19f326c0b821a9c18d5984c90160850704737f3b88572706bde5660268510a58352c00485208ca414652ce3da2c4131968e646242d4e0eea3cc955b33d458d0d6c7583e6630943317a1143eea82aa6da5631d851310b214196c59284900dc9c80e64a8873ba59b7ae77a34b84c6a6600cf5047b243e872bdc7476a4086624710f29432ac17dd62e2b74dcd742d6a985987c4956696a398bad0e4905c3e555281c3100070fc1897123154068c6fca9f08538dc38ef1600cf99292943b170e374d1c8614278588ac96851709246f00438f69f316d32ad24176a905d8d5bb0f2025432cb605ecc93c68496524f81bda802d90998a4b004a0b801618a4bd810ee9142280eede0cc162887499594b5c6500be9a6ba711a3b091d242b5f97e2626151093125a214264cd869829d58401c411267b429a83511142042d978f611e2b6873859345a434559c5840c673a333d358104e62e224eda389268208fb4654081cadc8a5c88a31931dc0b080bc335deb154bc33ef3eb03cb492690cf018652cb3909178918e1d44a474829168e972c00c348913082bdaf8f5201128665b1a312dc0968f9f63a41585cd529b5add4a2402ce6df4d1f53291c2333da8d9c94c850968254a20061999d41db851c08e9865a633c76f9e059d2252e6905c163c61d7fc097280330514924ff000de9d585e21b476709692a50caa511952f56d69a477e52b8f1b02ab6acccaa4b9215c4c57dd12c4b00ad1eac3e1ac545a2ec4cc2a6a5830e9ce1d0d889db449376481ba9b0146a7843dec8214a9c56ba04a283f98fe5f08cdc8944a096d40f8c6abb3b294b42520eea4fe92ac59dd23eb9c6339ac5bc2eeb54898fa538c627b63869414a5d4ad452d5a060c5a3438fda9412e550af304a99c023f2723f94f88a7b3685ac19e5530a80b9600a7da0c34668e38dd5dd75b371f3d5b27294d37d199b5cc7207e3553f183f65e2f2cb4924860809615248005fc2365b630b2928289529399012a48018150566487d2a9fee80305b3e59c9319d2c9c8e285e814dc1adc9ceb1bbeacbf0cfb750563d64ba73b68c9fc23a3488994a253c2dc291d18e73e9ae358f428718171a0a485a7a28710012cda9625b9803de30524176503c6e48a7afa459325a5432966234ab70239822393a289727bc494aaa5e8e08a03434aa6a0b1bbd4456f9494a8a871a0a9d154b29dc386de00fbc98b767cccc94855c3872f429394dea2a3e1e166d1c32b2b8a9a10430f783836a1147e21274812786c4a6816c0b00154d1a85ac6b63f182676182d8d411621c7c2f0284a5690b42813452b986d19989068785ecd160da6942124ef2c80c848624901cb5728e76aea690a45328480a52d5bae4fb2dab8008b9366003d1b999809e89a90b4b86a106e0f03f971e7192dafb496b2594330f7bdc97c923de573ff00004ecced4988202d4ea0582954ce1e8899ff008abf3061b7d1018e2a114489c169cc9e841ba4ea0f38ad6b30a11366881d73a2952cc40a4c6b436244f88aa7c0a551e66840c18a367a41127110b5317cb5416134925883162803d211e1f69a54a52126a9f23a1ca756343041c49834767186676b4311365cb0c0c67e4cd212f00cdc42a2d06aced34fca2e4200df2a7f81f08c7c9429c055a345889c9dc0289a448cd1341b474c960dc6a0f88b44a5281008b6915cf9a5209670387ac489769629610a5b0705920f256bc342ef18fdb38f54e21c59abcc8defae51bc4a84f0e147291ecd883c4f18027f67124d2cd4adbcf9c75c32c67973ce5be1831214ced4e3124ca31b495d967704e56b101f35f4a3690c30db124c90e467535d41c780d3ade3adf5718e53d3c98dd95b266cd395029a93448ea6347b0765ad01485af292d6d6efc9ff00cc1ebc7a5032240091a0a080fbf2a760fd0b74bd8db8c72cfd4b93ae1e9c872b952d0960914f3f315785a90f390c5637260014695282185c51274a72d6bc2cd7402a3bd5cdd41657802e3c226ac500cafdd9ccafe56215e4924f3ca2393a889786014b24d9b4d19c75abc0fb2f061396511ec8cc3a280cbe44cc48e4883f1aa6133f8a52ff00b7ff00dfa443153c267a0fde42d27aa4a549f4cf02018ec4a10b293302486a116700f1e71d09264f97394a98a29de2a23741dd7392b987bb9748e8b55ade3f421383e5e6e624249177878248296178127e1ceb0067f09272e7615cc5e97a027e2edf8c1c990e1acf70dd01bf28ba5c8659bb2988eacc6b7146f330bf686d1a11289ca1f34c15a6a11ffb79684520b4ba6e2bbb95dda2ab485a5c9dd404929198bb12c016e6e59d8e74ab30cc14a1a673554ca689b253f54b4593b1597dd5096544e5dda1249cdbca0f6a8b0bf17848ee8aaa6602e5b323d9d4fb2aa51cd2ef0855bc58280616092187339aafce2d383d5203f4041e458d443196b91fbd57554b9a3e4d172932ac67cae8a501fee4c3d076c6da2a4900de837bdee0851e37caafcc1d861e526627324d351a83a83c0c6315800aaa17295a516820f11430cf65e3572d402bda3c4d1607ba48a671a1d7e213d383e11e4cc2d209953c29399363e60ea08d0c7a56f1ada2a5c88ac48867ddd6246500093402e4d845b45c9910ab69e343103d9f22bf1f751cee7a5cadab8d0c4593c0ebc0ab80e09b9d79222854c2e5feb52c7d2c21003058b5a66152d44a7338600197a05245773420ddeb7aed301fa51a660ce0588365278a4fe5081585a6bebf818b366e20ca50ab00686f909b83c65abd2f70f19f05ac9f852c2948ad385b3083f0f8b0b4b80c4514381f98e075f48b70cca2dac45627060805ab146d2c3155043c42000c23b20e11005b3e5ac24055001e70513132600c6ed0420b3bab515a790f4864d8b74b9094a5c8603589e1a666de16d3a308c86d8da05442954be54a41cca01b406a017af3e2408d8e1109084849052c188b11c7c6f0e58e84cb6b16b02f0b71b35ed13c64d730b96a8cb40d72492e6268dd8f310428311480d2959514826c0824798e7a579c29d2f10a0b98c1d867a9a14901d3e6851ff50e261fcfc4224049200ccc0bea490075a96a423998553a5c56c08342ec321374850d4d0109b968608485c8095ad9b28593c010f9bab31e6e39c5528c6e2b3ca002ab2ca904bdd252c90fc540a0755f2853da19eb9889297a4c5a0821c1292839c3680a0a87427ac59966ca7565ef2890a1552837eae6941f689d6e5d200b12734ada6262a439500998b050a74e54a65ce21360a01285a0703d0c6b1c7b195e96ccd83327133121252a3ba492e529dd49dd60c400cc2cd1d03cac44c5019973c280caa0897ba0a37080e0bb14b13a97223a3beabcf6cfbafaf8c281a989f70198c0bf6a544a5626b5d63cda7a360f6a6c5ef10a48510ff4c47bc936239f8c6097b4572d625ae4b02a097048672058fc23ea895387851da3c12152fbc23790cc78824063c455f91119bbf82f98e225bcc51caf5a501a68057415f13109181cc33212aa51c24dc07ca403c0d29677148673b0a33a8e57df3c38903e5e51ee3e52518606a879a97cb42370b3b5eb1ad0da99381162850240fbde94afd5a08fb271cfe2fd3842c958c77409d312755778ba6b404b127d29046331d3c2b2a26a934455c1ba125f781e3141c97ccc182188715354a7567bf48067ecd037824352c900d083429e90d760e2a72ccc4cd999c094a354a4568340343eb164c9008d3fb62b89945cb9aa08065cc4f7995398120e62def0d15ce074f68265c09646858b1e842ab18ded6ecfc5fdaa67732b3cb6975ce977c897604d2b0de54a5048025cc0000c149ab52859ebf42282b4727b40b703ba0a3c0123caff0040c5bb5718b32f3101243321f3007896033ab9587a9c3f6827ad2874a269524a480942c925ddc101865bbbbb81e07764f1b37112662a6199bb3129099854e3749765f17f48be74bb3142946e94aaa4874ac1eae167e117f7a3f748229fb458d39a0c1584c285280700329e89360ff2f58f513649fda287fd299f210e96c389b2e9fa33e0b41ff704c74c4ca2016981df442b5208212bada0c57762f3502c77b30bf5888928524a90a42c020129524b3f1a41a5b0fb37199141209fe02a052e1fd8538b3d8e87946d36300a758e8da822e08e318c32908cca57b294951143ecd6834d60bd9bda50a257292a1a12a6c87c8b923935ef046b6dde7bb691ea4c6730bda31ef4aea527e47af1828edf9643b94f220b9f271eb12d9862a42891948142e758cce3b1484ab24bfd34d26e7d81c49aef7c3ada29da5b6a64e3dda280d328d6fed1e1cadd5a049ad29265a0bacfb6bad3f841865acd90bb684e5255965af32dc198bfbc45909fba91c0534eba5ecfedbdc03dd2588fdda8e9fc8ad0e87c590890006f9fe222a4accb56615d1628cb4eb6fad60bd351af4e273ad69a3a480405026a906a07b35cc2bf74c152e486ac636549698954bcfbee53302920866742dc3a88a96ab84d5c873ab98b5264a6a54a2054b392451c000449eae4a5fe5119531240522b94d8549492c7ce8dcc0849df2b2ccce54084b83a870be3f5781702932e56b9e8815672c9aded515a520d969a62c024900a54050b59acda83f38cd6dac5774a2525e5cd5212c4f108243356a53aeab26c4c5abc49ef145dc27749354a8b82a52787b69b5cbea2ab31aafb4fe8a5ae844c399ec721cae41d3bc29caf114f1d8c52095660a514ab300f5dd05bfb9c7423de24239d215f6ac3a81df20cb582cc168485176a2a630059d89cba312c3153c2d52c15a6505d564d100a0a544a49cb758208b960e2b04cfc3938bc3aca15fb5ca9140afd1d175600b2abef3253a90fadb3a1783d8a3201de203382192aa8241254a00924b9248b931d0da52800067420ea9eedd8dcd5c3b9abb6b1d1af72b1edc3e09e51ccd048c39e2238e18c1b3a411388ff00114edc983b85ff00a3fde98255863a1851da0c5cb968c8a56f129702a400429c8d2deb0165d48054a7fbcafbbc4f1859db09a656073000b4e450d0170dee986871f29cef9b93ec9b3ff2d22adaf2656270fdd09a9492b0a75249a00d60079c21f3ac26de7a2932c7f51b3e857c61eed4dabddcf50ca3d997576a9968a7d728e97d8648b626493ab8527eab5863b53b37decc52c4f90ca4a00066db2a425c06e3ce0ed74b7b17b444d54d6490d295abea3ca342053f33f31093b29b17eccb9a553a4282904272cc04bd097b7a43cefa5b7eb11fd5f9c6a02fdbd83599d35426282532d2b604b51201005b47f1857224ce042812082c52a482a048a8203ef004d039a46be7a4aa62d492027201de3b01cc1f788a72e7a42cda38feed27b90ea39bf48b0e49353911a55b40282918ba8d16e1f67e25490a4ac33b10529041e0a1707f183b6115aa4acac927bc0dd00234e6f11d93b5ca80efa8aa0ef00e15026a45c73ff30cf0b2bbb414299ca81490d954378ba4f436bf5158b15566091bde0ae3f74f185e8c6491fb440eaa03e261be0d3bde07e079c27461c331575630e41252e52bde4d4023785880c4728236761d294cdcba9967c5d7ce16e3702e01068cd50f67105f67f0e5289d401fbab06f7a60ad2283e57e2b0e954a9a958252654c0a009048ca5d8bd0b46770b8b932d21216b0058285ad4644b019dcf898d564195638cb99fed3c8467a7611012e40000726cde90ea953ff001cc3bb77cc58de8ec1daace4b506a5a0b959944000926c35e5d3e03d613e0766a57344c082f696922bd7803f01e31ab09ee4644d669f6942c81f753cedf4c0491ce992e900a965f3ad2501aad953988b1fad0552cca0016981dfdd493435f6545eb1d2e43559f9547ac1c700a1eeff00703f189050b97f7963acb9a3e462a9c6591fae406e259bfa93059c07f02bc8375a456bc290fed01ad08b3fe26025b2a725072e64aa5a99f22c2b2a859496248219ff00c4389fb619225161300494170133068a4925b853476e04a6c5e0c5cb91c5892398fc23c9680b4f72b2c41794ad01e078a15f5a119fc137a66988258912c9cce0172a7493a11c9eac6ba81859a40249629334aabbc0a545f8d7bbf9f2813093552d56aa480a4aaac4680dc000966a3560ac24d419a9a3266297de02daa82c568e0e5cacc2fad22b14a6580c29426512965125246890b4e6634a6f6448239085f8d065133123f5a0292ff793318280fe435e413a88d3ed49e04a53556cc1af989dd61fccd53c613f684a54b92848243b066ca971dd8ae832acbda0b5a85fb0f072e6e7492e8c880bad545598b9a39565084d754d6b7f70f3877f8619877884e23bc069648ab1f646f03c9cbc69311344b612b7e684970180525dd5989b1772fa1269bcc73f8ac1255899137303984e2ba161902ae9b86b14923d900c1b3a193306a59cc0900b7b489854583396e2cfe31e47a30ea3692a58d14a9e50540501caf4f8b4745b46ea54bba26287278b2562162d30f8d628998095744cf031ecbc2b6beb1d9cc26d8db3884a84b4eee62005b36625a8920538558c66973428b95249d5c9af5711b8121c14934208fcc738cc4ed8690541484ba5ea1ebc0b3d1eeda466efe16becb3b906ca4f9d7cf489270d6aa4ff00a8428db7b3e7482005a08294aab28935482451438c2456d3524b15ca1ff4563ff38c7b95ae11b44e0c9fbb5bd536e55f4b478bc11bba6ff785bce31a9db847ed25ff0042c7ce269ed1ab45a3faa60f945ee2f6daa9b865e81dc8f7934e77f5f286981d952903329a6afeed909d5cbdfab70a08c5e0bb41316b4273062a482d3a63b120160d78d5edbc4ab072d253fa42b531ef96a666268cf57d235cf638686e2310a59bbb5a872a7f946a7998ad3857a97279bc6655db59c1453f6205b54ad2c7a3ac1f48b076da6eb805f82d1ffbc52e2b8d3e9d8106a287ac7984c42a5ee101493741343cd27dd3093fe7850be0277f50f9131627b60858ae0e6578cc403e448305b0ea9e4e44c03bd91316a48ba5ce741e05fda0c7af58164eda9aa669aeec342fc68444e54e332477e8796005928512a3b8faa4804d39c24ff99f8a55fd2a3f05c3cf5e59e27a9da73aaeb173ee234bfbbf5ce3c3b526b1aa6a013b890e1f76a0713eba423ff9a80d0ffd9987e063c3dae97abffd8983e2930f383853899b4e6005c86208b1f7831d687eab0a70689934b1cc46664a5ee78f3f954c413da292b21212092680a59cf8a0738b558f54a5a005f73308530ca4a14c6a4e505bda486208a0348ae70f1ad54bc1fd9e5821bbc55337dd1c9f5fae514c991e27c2082b985281314e72a4abd91bc5dec22613f5bb1a0af2726f0fc0c79b525113497352834e8d5ac5b9397a0fc62e3895ea7fb7f0871cb4c678f281244b577c4b9ca2629c3d19dacf687188c380e41a10b0de100fdad5cbfa151e9c6ab827c95165774e18f12f54b0741fdbf8c2fc461746fe5fc2f686fe3ebf9455365022adfdb18b1b85d36519c9a7eb903c662469fce9d1ef5e2480a59e1e0c0f124867bd7d5b8c3756d39325490a4ad4b6493950ec144804aadee9d7481368cd94a567979c1355020000fde77a134b73b178a2a89c72c20b3a88629d4ee970e2c6d7bf566850bdaea014127793340963ef77492dc28141742e0926d9441f99a869cd9f46ab701ce06c66ce4ad49582029d88360092544d1dc07eb5f032c4e397d9a49daf3120a120a96a4b3b5d4af44a456b6f121d64dc7a95313354012520304966072e67f794c1ddb41c01827ece64af2a567311558037c0722da54f4215524e62bb0ffac432431ef32862e0a6890a00d4e6af039aac016c3a0a4ede9dfba5aff8821c56ac085014b585a3a1dc80b094b4c9490c37559f302d57caa6777f9d63a1e8762656d2213de196a08a350b924b0486b934b7381f6d6d225294a4281775116616622e38f48bc63d02634ecc0dc1a1410d9732483524528388e2e4264271725d49caa04e5624b10695bb18dcae7633b23153745ab96f10ed5f8469366a8ae40512e4a4b9bea78c22c06c899def75de04b663505fdd6000202aea26cc0259dcb68f67cb6920392c155219ea6ace5a14cd6d49454139aa5941ef40a205f9010a7149ee641985214cb09625bda6ebac69b172e88d28ab863ed1eb4e7a8630abb428ff00e22aadfa5457ca39d9db5be99656d479811dc277850e617ad086fa78ab178d4a48070e92e90ad35243553ca33f8ac5aca1596720d52504ac52d983eb41046d4c4281c31331291f67964ef2189fd20702859daa0b5233a3bad26ce4a4cd963b8425d6862c97d0b8dd8d476f25e79529abfa4f92a321d99da2153e44b4e45025d4acc97243964a4289d054bc6ffb492775034ef1c7882fe0f68dc9d5677df6f91768c2d189584cbcf726acc1212e6dce07d9c66cd0e651972cfed4540506dd2e9606a2f1aeed76140c4a8b5f30a7f1048d7cfc2112308809425c85007331ba561019832b8ead5eb1cb7de9d7fc76498bda0b4958ee49082415662356a8cb478d20c11326516fbdf0440b8ed9e9299843d4d1cd48f6abc4d236f86c10ee2586d57f04c58dd8cba32d85280d9a41b649effdf1804e1b0a55940a966dfbb966f6aefa47d2f092db02b03ee4ef82a3e63b2f65a7bf4ad6dfad4e563775248d78c74ca751cf6a310bc1a6a4ac5ed98dba03036264cb284ae49514a8aaa49f74b1a100dfe11e6dad9ec545201073d5f56eb0eb66e0c7d924d359dfef8c68ca07b37867c44826b4997e93637bda4c10fb4c82dee4eff74a8cfec4c334f93d17ff00d91b1ed0cb7c449fe49df1951a93a56f66db46684ad00a82731480ed5727e4f1199390090575058bcb5e94bb562bdb7842b5a188f76e01f78e85ab02cad86b4ce5af3218aa7101e638ce90003bcd71a01c9a3ab028e225fef11e2950f8c44e2257ef64f9b40b84d8735289c9cc975a109432e69629490e4a8b8aea2be3158d893c4bcbde0cdde85bf7b37d9c8c439adf4b6b7890efb4cafdec8ffb8047a2620d9728f49a200c76c7c419729285ef265ac2cf7cb4ba880124ab292babd4d4738bc6cd9bf680a2ddd3db39b776dec656f6f9f3e5121803db29e93047a659676f25030b25ec99b9559921d8656524fed097aa036e37c39c1981c0197296e067216e431719c947b207badf558891f692501350bef1493ddb10124d02d7ab8d5e9d20394a97fbc3fd2007e2c55c87d58c460f109329202ccb620ff081dee5aa56922a258b2afcdc47092710a90a54c96b1342a5e54b2838225e7a09ca76257ef06cbab3a8ed74ad1325fef29a1d01a91e3f5ac4913d2ed9d041b172eef471c2dc7c22c972e7154a065ad94139c90a1949ef1eae5bd9450bfb778f76961148c840a04aca9824b80a1576764804d78f46374ea25dc25f31550103da219f7857a02dd6b0b7684c6284d0041a8f74834512007a9c805680728166ed4450296183b070e38eb154fc6215ba14e54094b58f8f5bc62d7498e925e17bc256c0bf14a9e9bad450b335b48e89231d937544387775205cbd8d63a05d97e3f6e2d08de283767401f0b457b0bb5b353992f501dd254286ac72b39a8bf08c9ed8c525531ee00614748356a58d3e2203c1630a560964b1e35afc7e11c25be55bdbe983b58b5290552d4a5b801a62b33e81357778fa16cb2a5484929ca4853870a62e433a68f1f2bd9865aa6495a450ae5904294fed0b56f1b0185607f4939200fbe5ae7827947a30b7c8ce4379c4a92825fdf1ad82c816e40428ed29030a53ef19892055cb33b03d47988f64664150ceba28deac03d2a9a5a33db7716aefc675a580a3b06058877b935b708b3cb8c5861cae9f35c3e116cc58333870fc38d0f586fb6f67e61860e1c6165f0d14baf9c7d3f62cb33c6eae5b350e44d8302092ee7338f085b3f68252a9895ce405a4912d19402a648f01bc4f083735b5c6ef519cec3e03bbc4c9ccc1d4427996269cd9fc047d536f23751fcdf23182d91b512996a9c160e496aa0649cf43949a949a75a183bb3db6573d137bc5ac2d0ea01cb14dacce482f5e638c587a93c5f95ea61aa876ca48389a9019cd5aa40490cfaf08c6264f7b3403bae8ca54a514a465530a0a3eeddc5fc2347dac9c7bd43a9cf12ae0daeb09e5a9c021496ca9fda3681e839bc72ceff675c71de2b71440484d0b03516a259c728dbe3f093578696992beed598ef7264b8a5bf28f9e632717201144d589bb7adbd6377859abee81ce583ea90dbc459b8011af4be58f561fecac3cc1812959cebcb3412d72416f8811f3dd9b394b5cb010004ad0e73bfbc0b8ddac3fed16d8fb3cb404296662853794c024072c141cd6c210e1b6e0ef14a529490ac9ee8aa9980198163425aa635967394c59c71ea91f6836827bb9882e1f30482c2b61ad7c6343b1e6a0e164a1f79e696e455d21a141384efcaeaec4644bdf2bd474a36919c5cd4b257de54125c0357a9674e5d7a43965ad1c70976d1ecc97fa691d15f15c6a36ee1c99d25924eece16d7f4645f903e518cecdcc52e61de51f658381ada8dc4f9c6932e6989a9a8586ccaf79046a5b58d4ac58d34eaa90454326a19bda3179153d4c66932014820aaa05a62f501cdfad2341820c848e5c5fd4d4c74976cd8b5a3c68947421168f1a3c44a65295f799fc0344e048b446627755d0c4e03da690501ed9ba6862aa2c4a3753d0ffb8c4b2c25973a54839e62c212680ad659c87605459d81f230df28514a9ececd62e1a28aa79629c561c29252a0e9289808e20d0c5ef09f69b098f5b0b288f4060c8e2518cd8987ca94994e9aaa80305310e7ab342dc4ecd972a5bca052f949146726e29476106edac5ad294e5a0ca8bd89734fafc6131c42d528926d92fad7ebeab1c67877ac96d6c3133a61399f3ab5e74f48e8331fb410998b0b4ab36657b2010c4b86f068f238ddedda4c7441b4e42d2b39e5996581214e035402a3a38059c686cd174ed84d513921494675a14f2949701453bcf9881536e950e66d3dad38aa5ae4e7212545202494d50509254c0856f2b4d456823a52a64c4a95365a8acb3fe88e624330054804501a66219de3526a3cf6435d90a227992bf6a51965d05c1a8503519bd90ed4316aff00fe8e813549cae8cca0159dcb662016297f07e109266c754c21a514a48af7a4392c1fd95aa9402c2d17c9d91312acd9912def902abc4934249a1bc333c719e45d568368f6e65c92682666248214934ff526915ecfed54a9c852f790411982a60be5a3108a967a42646c70159b39bfba3cdab73ce978b11b2d018fe914456aad4500d053eb462faf8ed9ff006b36376fd4898e51b849054e4a539d42aa50167e9016d7ed005cd52112bbc4950399eca70c50a4a4141045dde0f978397fbb7a358135bd627f6541fd8a5b9a53f168cffe89ad2e8b3138c95324a723a2604a010a22a025805108014a1c7af131e6c0da4a92b54c56e82950a804970e18722937e10f25ca47eed238513c8522c7d404fa72e1f8462fab37bd35b13b3f1bdfa8b29616c68cc084901dc52e7d60ff00b2afef4daff19fc60197895a402e46aec2cdce09c3ed698d450e741e7e5f08ed8ff271d7718be7a5a30930862669ff0059f9c0b8e99324a4272ac8538094b172cec7c1e1849db4ad4050e86bd34d60a4ed5497cd2cf06d3f28dfbde9df91db21da09d327896acab0a4a4829296d5def7ddb3f0a715e25afbb2c324c369849dd04a7358d29ab6bac6fbed123f76aadd801e6c79448a64a8d12a1e3f0d5fc239cb37b9637cbf0c06131b8944899214b4281ca5398a8b281a90457872e5781f072a6f77302f22945b229d5baf42ecc351c63e84a448a0ccb1c2807cbe1c222d23f7acdc525fe5c62e57ee7ed4b3e98ad96ac44944ccaa9656aca10b24b822a5c74622f686dd97dad884cc0ac4a92b405039d2ab51c695492dcebc018d1230d249fd6a6bc52af8bc48e16593fad41ff49f992d172bff0053b9f4aa476925848dd500728219d88caee50e38db998d0617b4f21920e77d770b0f136f1e108158294efdea3cb4f38f53b3a5fef07f49fc6353d4ca7d7ec5e35a956df92cfbc7a2737c098126f6c30a92c56a0781417843f6147df07fd27d1e917ca08032998a6e1a7c2373d5fbd7ed9d4351db0c35778b69baa7f26a471ed761f8abfa17ff00ac2c548c228550827884b1f3481014fd9185362b41d18923c73027d637ee63f63478aed8e1f89f250ffc606c676ba4a92c0905c1b66a6b47119f9db1e8f2e7a55c94929fc7e500ccc0cd1ee671fc0caf4497f4879637e57815da4c6a7152d32c2b280b0a3b8d4cab4e8abef7a43b3db2666961b83f95ad1920520b14949e163e460a961275f38d45e4fa676d55a4a1e24c2ec7768d73559b265a00c08350f5a81e4fa5e2a4ca1c8f844fb84fddf28ac94cba2e9988c4ad3954b494d05648b0b544d78f64f7a1204c520a5203321614483477247ac301293cc7d7588624326fc3e318b8c91ae56b3f88ecccb5ad4b52892a528b858172480c78061e11ec690295cbd23c8bdb87dca5b9c9d1bebc23c24ff83e77821090357fe9631e99838352e1b5a56af1f2b634a123c7fd5f5f0e112fb39356d383fe713cc9a8fc1ebaf2eb16cb526ac4120d5eac45db87488c8a4c93c0fa5a2d4ca7d3e89147891c4e81b99623588cd99c41f027f368169df67b670e78662d17fd90303a9eadf940f23148b3b3f03f36a45c9c41b90d76753fc3a5842925494da878d0803c4c4bb9200034e54fae7150c438771f43afc23d4cf22c40e34d7a6b06cbd9d8549627c811a78c425c8ab32ba0e058f9f9da3d5acdf37801f93357d22933f3382496d29e0dac5b15ece565234fe62c43d3837ac5d2e4a454338e17f17114e2a6d0356d7d3536e5c39c40629ddaa1c9702a4d017376e516d0b5af500002ec7e5f5ac589590cc6fc3f3a40889798b3fabfaf8c449ab390c431e5cc1f2b690ca8c90b71edf2b9f37168f0814153c0937e17afc6059330bb28789b8ea1d8da2d552a0f500834e2479c692c0c2e5b42eda7f9b45332607b7c7c794541799c324be81c8d6ce1bca2443fe16e0d06cbd5a922c45accfe662d4cfa694e04fced0329659cdf80afc0c71ab1cdd01707a540f3eb0ec2f5cf7005c9e808f215b08899dfc429763f9408bcc752d40d5e561ad1f489ae416172788671c1ed5836562a717a5b57d3c6d15af10babf83b91f8454a905fe2e0b9d46b4a3c586407bb9e01b8df8ebeb06d2952944555d2f488252520a84c2fa38b5b51a414b9415722bab31d743cb8b4789c026b7a5c7af0faa46b7624063710cd4581a1650f253de913fb4cb21d78702d596a29bf20e3fb623324e5b0d3cb4b7d5cc54ba86cafc687e846a7ab94f93ad894f705b2cd5a1f45233ff720d07841787c0cd50796a44c1fc0b0fe214c4426461daa013e74ea2eece2dac5b2e582410e2d5048d74e3a476c7f9597cb3c61a4c4cd47b6850ea92de7681f11381029a882307b4e620869aa1c8b9f305fd22eda98b2b402a972ddd27bc430268686efc5de3b63fc89974a62a12471f58e82fecd862c4f7e0b0701208b5c163437f18e8e9eee1f6cf1a46673b6f066d1439bd4a6dcbf08afed01c8ce9000621b88a9ab3369d2af14a8246849e0ff001616f03a45624a85c91d052d60e0350fd6bf2b6d8d42d3f7aa35a8fa17a478670d7c0d407f50e1f4e50100a09a124ff11039f4b08f640cc7dab5492a61cc59f57f3836844fdc5314d5e84aafd0f8db9c52bc6a5c05312d521dddc52c5f4e715ceca4b02aa5c05248fe62e0103cfc1e38600d6b9b905274b8a6ba7ca35a0bf03b490a7cd952012cf57615dd24917bb0bc4a64fabab21451b2b972da861cbca2afb158a8b16d589f13a5394749465d1833dcd07576b39d1bd62b7e941533121400420b8d6b5b5c330d6cdabbde3c5a96403509a51c69e376ad20798b3ad439a94135e47ded79d60e54b00056573945482fe0e29f5483c9410092686da313536aff0088b25cbcba1a934be9cad68f27ce0ce4105d9ca5b816ccec4026bf93c4666232d5b2bd8937d1c1663472c4f187885b3929526a097ab55fc751115482fa316a38f1ae915267a99814bf2b17e85b8f9f288f764f1a5ce5dd17672ed67a3c162129552a69a1a93c19cde9cc5a2a9b8157b4560826d43fe2a6212a42b93b87f1a10c146248494a48a9e4069cc03667f3864499e0e0ea1a9c7a88f7be27287516340c28fc0defccebc62b4ba5258801983e9e16158f65a9774daf46d78b7879886a5c140b000f9518d18bd394414a639775b9316606e08ac54b42854d38681850ea3a35be11689b4a82534241b7b37624fd3c0961c45ec0d03f1b0af3b79c4654c0a51605243d08ca1d868f51e5e31419e5a9402971d2ed6894d96a7292c08636045438f6587a98b657f78c59e82d5b8d682fadfce28528380e438eb416d5b84452ba543f4bd85ab6f1f011e02416ab33b10a2f6abe97e1c62422561cb392eda331f90f289ca235eb7f3680c4eb8a383c98f427c0d47e77f7a58bbdf9bf50f5bb4485bb5bc5d8bbbd0d1a23242802a12f74d3369c487ab40c673e8a3ad4115e64d2b7bfc20b94480c090f42c4d58ea1f5fc4c4542d66ae9a73fce3d0a49f74b543b0f1ab7d3c5aa506e0a1a53cf56af2689ca215a598540e8073fca14125e108b016e6c46babf189f7395d81a598bf57e3fe609992c7b2451b4eb414b7d52001854920b332aae4d5b5275d0730f73486692f130b819038e21c7a80469e51463260cb4480e43b78f87d7383660748a07774d8f0d49a5203da4b2121f88f2adb88778e9e9cfed0d13f6a22816a03a7e71ec0a4ab827fa95f24c7b19b8f636a552c314e6f748a26b4a578c06a964381a10da2bea87ce3a3a3950b14c1d2583d016b806d671a4482b74a92006bf2e346ac791d1241330a8b10143570921c758e2859660917f7433863ec86b005ba6b1d1d12538b66005cbb9003b3a6cf400707f58b70f31690024a94e01a84b356ee470b0f58e8e871f2cba46214490ee5240a860dc1c13572d66a78c49694bef29414966377078d8862d4b1af211ec741e09b7d8a6195de960850624555c029409019d85cded0bd61f7d9040a02ea003301bad52fc5f46a4747475ce49a9f818d192e49524cc144a13572c9018d18574f48a9443673ba586535372e1c391a7ac7b1d19d75b693521920d1f4078a4d74357d5e299d3ca0be51cdb8804ead4a3fca3a3a3315538899ec8525d343400b68e5cd19ae06a29c3c4a949f64d0976513adcebe4dd39f4746be93d42d44b660efc0d48a30e15f8c45682d56de2199faeaf6f9474745277a4af10939c304b87ccfc838adf9eb7148f654c22dd08d6a3cbe378e8e8c7c84973086ccdbd466a17701ebab5ad78ae4cb49acb2a156bdaad47760e741c63d8e8d179ddaf28cc4292ed72087a529cfc2252ec545da947714a288d78dc4747433b3aed6a27a5492ae6ef63c2ac3c358b513880598827c4bfa368d1d1d194ad73169acc2c92d648a1a8b24d7cf48b65e2733241de51a52f47b540f3f9c74746e40066e2a7a4d52154b82ca01cb8caa2472f6a904c99f32ca0c431a90775c836177044747475e30e3d8856294002e0035e80d9865d6a6b14e3a72548dd208ad8115e6e070e958e8e8e98e125db77c2d4870e01f322d43af18e8e8e8e171ecc8fffd9, 'india', 'bihar', 'patna', 'patna garden', 'beautiful house');
INSERT INTO `house` (`id`, `owner_id`, `no_of_rooms`, `rate`, `pics`, `country`, `state`, `city`, `address`, `description`) VALUES
(4, 2, 3, 5000, 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071413121513131316161517181f18181818191d1e20181e1d211a1b201a1e1f1e1f28211a22251b201d213121252a2b2e2e2e1a1f3338332d372a2d2e2b010a0a0a0e0d0e1b10101b322520252d2f2d2d2f2d2d2d2d2d2d2f2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2b2d2d2f2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2dffc000110800b7011303012200021101031101ffc4001b00000202030100000000000000000000000405030600020701ffc40049100002010204040304060609010705000001021103210004123105415161132271063281914252a1b1c1d114234362e1f007153353728292d2f19316243483b2c2e244456373a2ffc4001a010003010101010000000000000000000001020300040506ffc4002c110002020103030303040301000000000000010211210312311341510422f06181a114327191b1d1f105ffda000c03010002110311003f00aed5a5d3efc466a102fbf73b8fcfd3069a20ee31a3d2803901dbf098bfa75c7bd3d2ee8f1e1a9d981956279820da001db4b75b72f88ea0da75bca6d7e6a660f291d08fac36ee0c1d548895d307e8cc03df69f9632c40533e8088b7d561b1ed68dc473e777159f9fe8baa9707af4091a96f1c88f4de398dba585ef801b5b0ba90a0cec5898f4bc72b75db993ce59802693b4fd478e77d27cb2013b4edb8c7b96cc4a29617612ba875fa2639832081d396274d5a7c76e07c3cae7bf2454aa98327cab172a469d5247212264cc08d4074c4198a04b0dcc518907e9128008e7702dca306f105029b314d76bc4c85de7ac820345e74f206d15240180952a4401170589602626210fe7cb0ae5b56d7c76fbb5f390a8dbdcbeffd335c9d4b95d3a9cc7a5e493b6d24ef7b733bceb534170d1220ac0926ec48224982b3b48074fc37748dacc2f044cfde209fe10631055ac117c4610e6486224eea34ea5b904ec0dfcc604df0fa91a714fe50212b4da21cc562ceab04449b6e3eaf6bcee6c2076c699e62acab0000c354749209264cf9677eb3183b8689a6da84316248e9f56e0fd5039ed18138ba17525480c74aab77948047332db5fed38138fb7779c9a0f3b7c1b5016f7b4eaf3318f891dac40bcef6db07d0a61401cb7fcef80aad15441bb6c01277dedd075f9e25af599c37862040058f2b83611731f862b096d6fc8935b9209b58f38d8733fcdbd4e05cd5603546e44db9c41b7a7e5bf22332453024cdafde77db9c91b74f923a999d55400444c027688bb1e924469fdd1c8895d5d56925dc3a7a69b6c654c0b8da4c93d141b0f52d303d70650d813d04765371f1ebe9ce27107e8ca892a008899bdcee3f78cfde7d301f12ae151bce159ac39d80209df95c5fa45c9070ce6e14050530f6ca5f55ec49d33cb6f8c0e5ce3120ae1ce81cc5fd310ae609108840005c88da6d7e7fc395f19964d2ece604c03dc9d9efeb13dcf41868c92e3ee2b8b7cfd890114e9f998795803dc02222ff00574fcfbe03e2bc345604b8b016804b19e605a04080378079e1a2521ac8bc921e099b0000f43aa0ff003703da3c9165f22beb224b2804796e244cfd969f999e53be102386ab96512a70e52e29a860d27dee6044401b48bdfa8de70b2bd228ccac362444f4c1b98acf60c0ab0926c44b7331c8c46d1b634cfe6fc560cc02f5d3f7dff3c7952daf83d08d931e1e342b22933172645849b72f53fc7036672ba48204eaf77bf29b77c114b3ac83c3a6201993b922d171b411302c79e08cd6b7fd600a153ca59545d77b8e76e4790c16a2d60c9b4074b2249bac7a738e53703b9e53f0c6bc4ece52080bc8e9913162458fae0ea4cd98f219102562c224024c9f872bc6f80b334011ae6092657eac6c2c22e01c06956029e72054c49b6fcb13ae5cfd2bf611fc8f5c13c3f21ada20ceff000b8d8f7fbb173c87b1d4c4f98b02603000127b58803bfac61b4f4653e013d58c7929f90c8077b29d20f3dcee7f0c333c04c86730099d200040331266dca45f738b80e0ba08a4802c8d5a8fac1ec2cdd0db09f3f544e8a2bab4b1f11c8236221408b6c267afc71d3d0515921d6727800e1c692bea61215ad6247793a4fd1e7f2c3fcef13a00b077a6194da988b111bc6a00da39fc2f85ebc31a9ab543457511eeb000c411bc82a64cdb9c5c0b629fc42a8d6da9049bd9be262245ff008e04e6f4e3418c54d977a5ed1d351152a53461ba80e40ec21ba7a7c3198a09cd0e483fd47f3c6639ff0053329d089d57463609823c3c7a29e3dfb3c605fd1c6fa47cb1e0cb5e67ec1f8ce0df0f1ef8781486b62daf44c46a683ea63d34907f0c055d9e92dd657517d56b5a5fcb73300b589bebe670e6bd336bc5f7e9dff9eb8d2a51d4b04cda674ec45c303b588076c72eae8a927b70ce8d3d46aaf288abb480e3ce37b7d21d411cf9f78c0f9445d35994ca82909707495a81936f74411bf975188b621a15879d274b2120e93e5274ea0544d87eeda2c24c5f4a94c9aafe5bba379944195d263a5d24ee7dd3bdb1cbab353a75fcff00867469c5c6d5fce495f384052bad89d8e99d40ec6079a0db918dbb6226e229e3a53240d3cd7dd6651a60584d8eb3ce63b602a7c3dd6a68f10e93241b9d2b62da576064a4136bc912304e5f86a3934c2ae81fb48b9074dcb4f98933711b6f62b847394a5f81d42297e46ef49754ac05a820916b9d8fc6e3afbb85b58abd401fca69b789b91700208833ef5fbc01d84b532268a914dda22423cb0b58e9bea0410b7bfd18e985f9167aa0d56651262543402a506b999d3624c446b820cce29ababed49890d3cda37660e236449d57f79f51023b08693171f099db882ff66b3e56f32a83aa073240ec7e582a8e59a8862c16a542c4215dc930488e5d604c007d30cf2b96d20218d52599bab5b51ef7d8748f4c087f39ee19ff0018120a752bcb69289372d624098d201b5ccc91f304e24e1f9257410a4113131046a60490089dc8e77bdf0df3c475d9493ca40b93e82c2dd70124b504d720b2a92c370cd02da76893f3e737d2a725f932b49afe8d6ae4499200402c0adafb1e5b4dbe771b91b2994550522e6f0482d57989e883bef1e932e6949200682b03de6512600f2837b4b1e8230c29f0eb5b4823650a02822c223efb91db14daa52a4b812dc55b6049409dc16826772b336eb223969e9df130cb861efab4ef6bdc18dc98ec36ed891aa55035797710757bd30a091a7eb77b77c699a9a68cec09d08590a5e620050089b9b73f7b7c3aa5d84cbee7b96ae9e2317280a1d12601917661276263e470bfda7e3ad4195053de18393e5dc5ac264ede870eb2f9329420b80c44d46004162496239ee4eff85ab9c7d298d35158e82030505c59813ac061a49ea00e82c70272928062a2e453f8b7156af59aa10a2d103636826fb93d77f4c2981d230e1b8437be9ad927ded2b23782406240ef1bd872c2a34da4d898f8c63cc9eebb67746aa918ad7b5bb7a62c196e1f52a23ea01402249226f62c07a45fa4ed7c03c338606866200e6089906f022f27b6dbf6c1fc428d1a435217462bb11602396abf322089e738782a56c593bc235cfad3a640a3a83c000fc3a5c093060edb753801696a85b42e90029f7f605848be36cad135d816f2802ed0608025ba2881cb9cf39c1dc3a839d7a0378a6029e6a16e5b6e62df1ed835b9dd60d7b50565917c634d37b2cda2262276d8813ca0cc62d953da8a541910de7caff590c80279117330795a7158c8e42bd3a034300e60c13b2997f87985f682083be2bd99c9d504d42850489622002790b475b0c5ba92d38e112d8a6f2ce9bc533d46a51667a84237949a66e144803add89e9327b628b47890a67508009db51636e5a7604f23b5b09e85461aa188917e8c3a7af7fbb1b5145d3e5275917d8449dba1f85f1397a872a63c74547032ce71e7a8ac1e208b93b9f402c4f39fc315f2061b3d2a28835c33cb02a1a6e369e824ec2f6c2b8ff008c43524dbc95824b822c6624087a7d98cc4c73b80a58f452c1be0e3d14b1f45b8f136817878f7c3c1be1623ad4c01271b7076823ac6e2d884794c6e0ec7bc6df18c115730b06fda42965f8f6f58f5c015281746f05d75c583292b6bc88827d67d7a094a7dd148c3c8a4522fe2b84474f119587d5d215454b0faead223620cdb1e57e18afe1e9661e74fda319153c8080c0c7bc79c6f82781e52b2d2d2400ea74124f95ac0f2bab5e049b933ce30af3394f055f5536155416586ded768623cf009d22410ad06c463cd9c9d5d793ba095d5f81fe5f29495c9d375088a6e4c31aa58b133fdd8b9de4624a940ea1720ea5507a862a2f1bf2bfc3d63e11981987ad545d2a329563e5950245b97999ad7b833de7cfe54a233eb274a92a26c4892001cef2227bdb9594b7e9b68935b669322cc64018284232b4dc9b89988f48f84e00e0f958156915623c4604f32ba50c13f4ae5ec3eb7738b5d3a62e46c79f51bce11655f4b6634db595d07f79804161fbd1f2ee70fa8a3ed6fe60583965234e0a8ac54c93a56260092c6ed602634efd7e58685880447981016044cc4758bda7b138f72b9655a950a80beedba088b7c00f5dfd36cdd19ab4c068d32c473faa2df13bf63845ed83f2c67ee9fd10bf37c3c22ea2e4b03a8b1d8c79a02eca2d681302fd70766d0caa080d379bc4037ef063b4c75c4864a991aef7111a8151612772bd4c4f4e43b3b57a845360116cf50105ae24aa47ba493763b4000132568a93c7711db593ca590424589084e9b9f336c49e4624dafe69e6b82bc1d240937b47499bfcfefc1ab402ac0020088ec3f8615f165aa89ad46a1cd4dd9660cccf9a081cc45ef1b56dc32c9feec1a64e34a16bfd5039b1504fadc93f94498f3d40354a28fb83e2903a53d30bff005190f723b4e00ca3e6102f9909b4988244000932428fa220b49bda0c1797c9bbd4fd24bfea948a497505df579f4cdedab496007bad7b5e12d74964b474b3805f69b374929b78eba6e190800eaea04c43479779e7b62ad9314b3048d6802303494f893a498f310399d2bc84b4e2d5edf65a8a51647701c90503b96900cf964ef169b74983279952a87cc688d2196196755a264ea17da7d768e50f51a8ed53c16d182ac8d73395cba92a15b5100904b5a6e4e90a088da2e0c48ef5d648246ddae3bf31f0f5c58385e791eaa8ccd90820374b594900db603ac8f88f9fc9217f129cb2a905cdb4af2026c7911b498c24e3b95a0c5d3a64bc3b2551911879975691cc8b49014fbdfc6791c35c8fb3ab520129a60c852094026ecc2c4f698b017dc93c0bd9eacd4ea3a905cea02a0300cf20790b1923adc5b13f0754ca659ea96350b11613208b806dcccee6d1b8b9c5a1a7c5a2729f8328fb37fab0b269a16004926c39c18e64816b971b0be01cf550895fcccc58c6b5372244907e42ddfe363ccf170a05498a629f9d041d6e44886dc49225802062a1c3dbc5aecf5479802155842c9bcc8804dec3b8dc0c34e9610b1b7964f9ae20b4e9e5aaac93e11f2824c3729123544fbc6490fd860ba39aa39e2c6aaf871040d6408036000226379dfb5b0c78afb28b54d1a3421aa127c4aa0888592401f584ef172a36be2b19df67b3140d40c8caabe6d6f017ac8eb3681da230adc93cab432516b0f27bc7f8010ad515d1692821141e9b8f5fc462b2bd77c139b0dae2a12db75f909123d239ed8819e0d847e18e39cadf07445523c659b9f58c7961f975c6cb276c7ab97241822d7c20c442b1eb8cc6eaca2c45fd3198c13bdd1ce29026d3f7ec6dd018bf7c4a2ba4c0b9fe7e27149a79dd2d4f4cf98920b1bfdf00ee6fbdb05b67cf88086b86998bc11dec796df6e047ff0047563699ccfd3c1f05cd541daf1bf6e7f0c63261165738560eb91a779bdc0b091cb69ebbe1dd075742ed655dc968008df6da3d2f8eef4deb7a8f6be496a686d568db4601cff86410ea4c5c10a491dc45faed8669921cd8b03df9763bfdb8d864107d05ebb0f9f7c766eb23b68a965693eb21559d4add833ac9b0065aec401127a4de710f12e02b5cf8d4d9933084024961a4aec086612a7a99906462e552891ee016e5b4e01cdd4a6575d6a650ade5809022e54a926073836dcdaf894a0aa9945277828fecb52ac75aaa056151693a14056913a98380b04ac99064880bc82c59f308c699670608640134c131054ea6041dd6d2247712ab3f9b8aa6ad3a8c9593f5752af86c16bd2f2b6b042c6b59b100f33ee9521df0ff0001da9d76456a7514b2315b3011e4eb679b1598d062d18e07370b82783b36a9d49a00e1bc4b54f8f4810a21c8673a0aefe253b14910640300f4be026cfa53a95759d48a945d22f2524b6d24b788ca003cc8c39e21540a6e68a3a92fa82091a575ede61e56d36e77f29b629597435eb53a8350a5488402992dac0352a399365650bae04c9651cc0c24a72eec78c5762d9c338bb3163532d512ab9574410eae0ac05d54c42c692f07cc6640205e6a598cc2d526a5311ad69a8a64218790469633014292755e098df4d8f8cf02a1e028666a74e8aea2f234b46925de773e59d5d76c2ac864d9d466d3c6f035ea5a553cecd464feb0163a95a1d88525bcbe5804e19ca5e4549003f132ceff00aba9ab5854173a9a42a8e8258a5fa699230670ee13fa34ac132c598c6ec7de6ef2dccde200802313e438687e2359a8b1a9454059985d6548653a400da351360c65c49055712e7f22c8ff00aa4d213e9b3aaac8dbdd24c7789f4df074a724ecda918b491a66f32aa2e7e00124f500012d1cedcf119cc3d420535d37b122589da02ec3d4cff871e07552ccce6b3479d9434c8e44f98c7301446f6e786fc0f890a6f229588f7c8223e724492072df6117ea7ea54567939968b6f1c10bf07fd0f2f52a343d408582b0d50c05977001260081170361858fc2969d308f5148555a63c5d350b91bc6a00a9264c2de4938b07b45c4e930a74cab4d4aaa485249d34c8a8c79c8f2858eac073c17432f4d943b54009e4002101fa2081bf32c224f680393a89bc9d1b5a5839b7b51c36a55ca9a094898f77de6000dcf9c6a91700c98960373352f66fd8fcdd4f182d282a016665baceab0305813b74de7963bae638600a3c32a4985bc6d1cfa9edfc71150a6cac4213df49b4c91cbd0fcb0cd465c1a2dc7938cf01f674d2a8dfa4d365588020952274c6e0cc991b8361cf170e13ecbd2a6ad4c01516b4aea6830361b797de048020004c742fb379e2d50d2a20bb5f5b2180b1034b541014def04b81b0e613e6bd9dac080d986a62242d11e5b917f3ea0c41004c2fa0c5e125c4511927cb636cc265f2f44d30c026921a09902224b0bc9dbac99e47150cf65324d47c3a5569533a8b4f88a25ae222f7f37492077c30fea6aa8d0ca2bf98b0770d5083c8e804e923685520c0369383323990ce61692340f7a15a3788b807791322d205a68e5e44af0501f86d55362c823cc60a8602d0354d89e6d626e2c71ae7bc25a0998f306b95a264accd9bde1024fbc2c6fd31d0b3f9aa7a1b5cbab1d2da7542d899662140b4d85ba9e62b15f8378c5aa68f26caab04002d3617f53894da5c6478a7dcaff0008f68b305c124728811a2092a40ec4edea399c5a7fa46f68a8d6c9535f3f8ce48d093a5196275726170579c329ed8415324b4aa4c4728e980f8d556420cfead84db93004071d184983dce21d492b4ca6c5ca2ae1828102049bf5fcb10da4c4c77c1b9de1ed4d952a2942c011a8458d81bf2c0f572ac9cc1d8c820ffc19c48a9e45bb7f3f3c49a98d924c88f2cfdb38d29520d20efbee00f99efc877c38c96429b842f5c9041f285034002635b9d262d68e9b4e325666c5ad90ac7f6153fe9b63dc1f572f4818f398b48322395c2c131bf79c7b86da02cce04056de6412677dfb73373f3e5825f321515dd002ebe537f344ed3cc7ce312ad28323cb698be9b01000d977e77b0c0bc4c3a56a6a7fb22bb01ced20c18d36077b5ed69c7161a761ca61433da0280eb2fe620c31b58ed3b19120731bce0dcf54f193c392ba97d56643037bef0797c315dccdc1312699d33e60604c5c0902e66f3633cb06f0b692543b1b03656e5b11da48e56c4a69a49a630664f8dd6cb229579a40f9811324902c48982662ff00449e78e8bc3b32b5a9ad45d984c1e5db147e05c0f31598452765224354f70c800dcc0de6c6fd31d13d9af661b2e8455aa1d8dca20845300589b9db9018f43d2ebce3897047534d496392334b00710cbcd891137959f2fc4c1822662df2c581f26c0283721403fbd00099e44f43d77181ab52b1047c0f2fcc77c77c755491cf2d3712a9c5782f98547a858c445a0efbcefd30878ad5a9933e2b4f8152a3ea522cb53cc16e54ca3824951b903699c5ab891d05417441244335a04ec48b6e00d85c002700fb5b42954cb3a35560ba093a9458a824137b69600c76c736aed6e8be95a5656f8e07a8a9532e04d4fd5d208c749f1085008361009881a810a260402d28d0ca6668d1525168d3355cbe9f33432312413ef1602c39c6c011be42ba364b2d514787e155a14ab29dbc45aaa64c0dc805a7bf52702f1ba5e266f31583394a55a8d155b79b7d69c8c28766e7753db1cecbd0d32996a674ae7b38f5572e5628a27eacc2828580d45a3a4fbcac7d1e67bda65a8b529658b6b1bba2ce85b2d81ddcecaa46e41220362adc4f3cbfab54d07ce03a2b4f90ea12d160a846a2da96349e5388335c53f4747d14e95466ace08a951520a04450d4e54b027c4224c6e2e4ce1d4924256467c138e941fa2d21e1aa48928d2dfe6300b0905a4dcb5ef383abb8003d7a8ab23f6ac2d3f55010a3d3cd847ed2f160f469b53614f55413a2a01a08a7e752e0c730b13d6d26d55a2a89fb4421c7bc43693171063ca7612445a7a633d46b08ca09e4ec3c1b87f88c4a666a21559d48d0089faa2148e7d31bf1576cbff69c40026203d304c1d88014923f7bedc22f62bda34a597ac75a37874ce897003026cbb9b83e581b9e97c5238bf19ab9ba9a926a1b0771211547d104cfc4dc993ccce15c8648b6d1e3549dea57a8f9663ee207572d529a735a6a274962cdb199598d372a8f1cf1087a5403da3cacca2c091218065f41d795e69e1cd0447a90c41f3103712446e6676f808c135722a09d0752ead639cac309efcbe7d3136ec6a2cb9fcf66d87fe11e8adb53b307899d906e018372b31f206ba391152be634fd214e9055a9b5984b3308fa3a882206d84399a6d4d892643432498290de6009bb8d3a6e3a1e72707e4b3b53c44a5e2b69a91a623ca6c013209b899ee0586f82a4ac0d6097379bcc058a39bd01560074d1a40da005f5dfb616e638b7106610c184c828e1a090018133cb98b60cf69f881a1574d2726a8b3bbf9b4ec40008d33720d8c76338523da1acdefad17ff1525fc2315de93136b634a55ebbdaad6a97b6936edcf0455e18afa65dac0037bc4933d644ef8594f36c409cb5200fd52c9f73e0dc965d2aa1755a8ae86e9e213d0589f51d3638aad48cb04dc651c99fd5fe5d3b2fd51db6931a9a3a9271155c905f74907a8fe670fa08f77de831eb063edc25cbd6cf30a0b532eaccd4ea9ab17d2c81ca010c441017aef8671404d8b3375aa93e672ffe2bfda6703676bd2455f119222e08320ef11b6ddbd26c30e1a9eba74ddd3c3674d4c84469326d102312d0a14a90562a8ee7513aa9a0224069d64498320474e5618e6d592865958e4a3e67860f3d6f119d140000575622d046b502c2d13cb6db08eb513a359d5a7558dbe644effc7171e35c71a916f22cef10446dbc1891cc0eb8514f8ab55a8a95541563056018f9cc44f59b602698df41764f863554d4b4d885372bbc761ce0f4c6e722c922a2b2f40eac37ecc0729fe766bed170e5a6d4dd40d1554b42fd1219948249bc80a67f7b09eaf1224aa877082261cc103946d7c64c2d518fc442922018c66081432cd721e7fc6a36b4c63303782ce9342915f317606f71226e4ff0bff0c0399f67b3198a80d02c4a82489255f9f98b18064c5ec7acc00c32399b4336a91009eb024f4311d7ed386dc333f5516a53a5534d421749d208400f6b99befb49c7169ebc162451ac60d383ff004735cb17ccd755d6b0c94812676f78c28b7ee937df173e0fecbe572c07854848fa4de63d2d365ff2818a6bf16e22bef561f0a4b7ff00fac6878ee779d69ffca5ff00763be318f29116cbc6778cb53a85201222f71be23ffb40e76558db9fe78e795f39996258d6327a524ff7621399ccf2acdff4d3fdd8ea528570c8fbaf93a2afb4150ee17e580b3dc4aa36c40f455fcb14419acd7f7cdff4d3fdd8c39bcd7f7cdff493fdd86528277407bbc8cb33c292b04aa183872d70035d6c66db86f4208db13717aaa505108b519d7ccacc547bba543100d89b6922e3574c21a35b308e5d6ab4b11ad7c34d2f16b8d5bc5b50bc73c495332c4b317149a0e84a9a7433459454b15b904ea1f1b9c24e4a5fbbe7fa1a2abf69a65f31e1670d2aaba93321518aede3530a56ac35a750123695070d38c53a41c04a7a3ccb51bf79dc96968b48d5cb6d44f3b52f2873353374d7314eaa69780554adae1995b6b88f30318bc7b494f46604820114e277b42dcf3db13518efc146dedc940e11c1cd7a8a8a56eac599cc7965892073dee37316df1a710a170c093209f51a881279fe782780e7592a278614b30f0d4936562541d405c8d87cf7c4e9986a653c4456903506445b063206959598991f238935c8f61743878d545169cf9ab866542cd0a69b03d4905cc5a472da30eeaf0267f08565d3e5dcb2ab3340d96752cb126fd799b191f3ced0888295176a85904192a2995666dc92496e5f6607af9ba34e7c47453cc1226fd46f83d36f20df5836c8fb2141bf4867a43c44556e621b52c98e463f1c331c3229c001410156614723126001df6c49c0a952cc2566f10d45a74c00aae74adcd9b4c1611b2bc800580c485005d20580000e806c319c2cdb84598cbadd4a8a9a402eaa0b5a6d25647c66dea31997ca962a1ce94105547be66f73b28802577bf491870c831a52a4358f8fdc70bd26cdbca6ad467cbe62a0a5543a95d219989224288b03b7738d72596757e1ec038bf9ac45f50bb743eb89b21c11864f334fc17058a42f36badc758fc30551e1957c4e1c7c368a701edee994dfe3382a1f403911fb4f92d75ab82489a8d7ff0037e56c2da7950b03a08c5a38ed2fd7d5ff001b7df84cf4ef86940ca42ee35472fe3658d66a81f4a6808041bda6475efb62d9c35343568e82ff00e75fcfeec553da9e1f51eb64d9293b284592aa481e606e40b5b173cb0bd68e9ffbd4fe1868469824f01b987d28ac2f696f5bfd9ca4f338a770e5a8a99410e229d79b11721889efce0f4c159ae2417c4a4483796f35ee242959da2fdc91611388b8270eaa132a4ab695a55960ac692424198bebbc7603adebcb2639c853069507ab212e189deccc63d606db9131cb14ff00697345ab1641d5ccc59409b4ed6e9f2c596a65ea78148224944b82602cc4b31e5173de31cf4e6497aa58cb1a4fc881014dae27ee89f94b5629e078304ce6799da4dcf5276fe460ee1d995a70cabe6904331e63b0e5d70a056036dfa6e23e3ce79fe58c5cd89da074fe7f9b623581ac75c5b3cd55535582ead264cc5a64f2e56b9924f3c286cb089131d6d73dbaec7f9818d2ad7821bde13304488efd41e9e98d4d6f2f28e8397f3182960367a326c6e0123198d0331b836ee719839059d0b85ab69112580660444db9753d3e38b970b405d620853a4cf2204991eb16bf2c22f66a810475d3a829df71336f372bf5022372ff002f54052698065e019001d42754f5de47333eb8f075e5efc14ba43cf6878ad3a800a61428e804cf73f862b8d52f8566b79d8c9224dcee7b9c4e9571f490e11cf20d24630c60435f1a9af8b226c24b5b1116c41e36226ad87159396c07c6c039773170b5083cc1d0b70791c78d5f03f14cc7ea2a7f82a7fe85c67c19329b96aed50323c90a6545ec09336db78be1a52e395051456a9269b048624b1504b003ad8e9eb0a70972049a84ee749e7bdd7bf6c439c63ad939120c7e1f77cb1c69d3c1d5568ba7b2592a6b44e69c4b3e6d68d204c45b533c0224c5872ec70af8be62a6a72b55974968893304c0ed86ded166a9d0e1993441a6b3378e9000d3000667b0077d23b83c8629f45fc4725c282c4927b993f69c68c951a4b25d973354e4b2d503c31ab535150248b8d3711cbecc57788921a760598f9fcc6c79924927acf3918312b0ab96a593a5a8544a85fcb370dab98b089137c07fd535d84ea6226648077e7f191bef8ce71e2c58978fe88eb8f0f881b1228a9da3fbde58b050cc022e17e5ff00184dfd18e59e9d0e240c13fa398b45c2d4df0bb29c62b0b1cb923aab7f0fc70d16972195be0b6330e8bf2ff9c44e4ef007f947fb715a7f6a2a0db2a4c757ff00e27039f692b1fd8a2fab03fedc36e8894cb33d423a7fa57fdb8d72d509a89b7bebc97a8c53aa7b4598e5e10f407f073f7623c97b4757c4a6c5fc82a2ead201901848f77a77e783be20dacb771eaa456a907e91e4308df34d3bfd985bed567ea3e62a32d53a18ca8102d027783bcef8474ddc9966a9117f391f81fbb02535c052ee5ce966dbeb7d8310e7fda8fd1c34c9675f29016c645fbe2995b37524c3b28deed33cb78180f3158110496f5e5b4edb627d4f01a2c06a6a6352a2f895194151239090c34104def137ee316b5e3c3c004a666459890fa5560dce8205cfc3cbcae71cd0e6cca9537f911d04fe3860d9ea9a344aef040ac0120f3dfe11cef68230bbe48346dc67da3a9551914b146624ea636f76dbc6eb379dfe48a9b99249fa27ee2230c3f45a10c1aa3cc7974ada7a99371da0606ad93a5c9d8fa88fc31b7db0a42ad58f517e5834e48743eb8cfd071ac20857bf6fe7e18d5137ed8397232606febfc7138e0e4eec8a7a35403f1b7c6301c92309e4f5c661bff527ff009a87facffb71981bd18e99c3d995c80a6501b741e63018e92d302546c670cc70fab5eb20a007909310da6d0a58b080244efd763693bd96e0cd5515eb1f2e908053bb116898274ec0f9a4f58c7bed2fb694f2c872d925018599f929e71beb7eac7edc71e9fa74e574335e4a9fb414ab656a68a82917372a8f3a7a4f96de985c9c4ea1fa03e67f2c095199896632c4c924c927a93cf1ea63d2564da41a73f53f73edfcf11be7aaf55f82fe671103eb8db4fae1d362348f4e66afd723d157f2c44f52a7f78df67e031368c785276c1b66a027573fb47ff51c079bc996b9669889926dd2f86d528c0b83dac493e839e01ade29fd95544e6de1b4fdd03092947bb0a4c4d455d1c5a20127b8b09f99db16ae01ecbd3ce0a6e5dc54f1343288f7605c48b10083b9c079eca3851a50907760a587c486b7ac62d1fd1779854049bba8172370368db95fd3139aa29076563dbcb671d23525244a2a446ca8a5af113ad98fc715c621842db9db163f6eaaf85c43349109ac4408dd5315ccce629fc7eeed313ff384a03bb19f0ae1f556a516520b330b03079fe5b771db0e6af1871e2fea8ac32aa812a4b1f120013162002041041126d08b81bd449cc20944207589245b9883cf9cf732deb71d72ea02bfeb126a692615c6a0a2c0c1044904882483178934ef8b3173f61bdad70ec2bd4a9a55059a4c06d262fa9a761f3c1fed4fb5aa5582512caa635321dfafbc204cef1b1b639c7b35c5aa369a25816769d24c19510a0026c4898e5b76c58cd37cc52ab4e96eeba609008d2daee003a606a17f941c096a34f80808ce56fd6cd2505801a869859f300b132488e7371d630ab315dd0282c8649208dc11683b476f438b7e7b2559436847f32a1d50d04a6f06c08300c7227e18abd5f6633550ea65bc96f3381bc12205ad3811d5ef2740a14fe9312c58933373d7efc4797cf8520aa8b5e0f3bff3f2c59387fb09559d454063f7584fdcc7ecc3ba9ec3e59000e8c09ea4c8f8328f5db025af05f50ed673eafc44b926e6795cc4fe1d3110350926e07d9e98e8a3d8da336620774527e0630553f66a829880dfe417f9617f5300a81cc464ddb913e831b3f0dd3ef183d0eab7c8463a754e1193074c2ff84332cfdbf64636a392ca8b2e5d0b0bf9c6afb5a4e37eabe81da72e4a0b368fbbef8c4ffa1f71f0bfdd6fb71d468701a159ad970cdd029dbd3737e983578065a913396558179a707d6e0e03f55f461da7215a17f2c37c27ecc154b81660dd685520f314da3e60463b092aa2c8aaa39c691e9b74c0ff00d61bc059039dcfa0da7fe308fd54bb20ec398d0f63f36fb5161ea5547da460affb0b9bfa8a7af9d71d01f36cc4862d1e8403f123132e6044a811c8eff87da0e24fd5ea7846da8e7b47d82cc358e85f571f861d643d85a3484d628fdc96d23e0184fc7167a79c69fa02dde62fcafdfe58c7a9ac1f39bf48fcb01ebce4b26da8549ec76563ff000c87beaaa3ecd6719891bc40603d3239128098ee631984df3f26a41fed46733b5e686532d59290b172a69ebecb310bf7fdf58a5ec0e78fec00f57a7feec3ca5ede5123ff001b9b53fbd4281ffd2a71957dbd03dccecff8f29f8ad45fbb1ec2b42ba62ca7fd1de73ea27c6a2fe786991fe8e6a7ed58af64d27ed2c3eec62fb7d9ab68a495c755a3553ff7b0c1d4bdb6cdb7ff006cae7b8f13eef087df86b91aa21543fa3da03de6a87d6a281f6533f7e0ea1ec6e4d7ff00a7463fbd55cfe1185ebed3670985e1b5e7b82bf6b5b10d7cf7137b2e4aa01deb5113dbdc047c08381723544b251e159743e5cae581f404fda9f8e26abc55292b79a982a27420927b050d3276c551a8f13642a325414911a9aa2b91f12e708f8dff0059229a428e56905f33b1666d462de50ce490b71b0b8c24db4aec381df13e2d9aaa58a134c836240b0de0210eff00749c44d56f35ab30313625239dcf2bf7c5672dece56aba457ce6618b1f768014d44fa72920cf48f4c1343d8ecaea3ae8eb2209351dd8dfd7cbcfe3f3c7049ae6ff00016c63ed1fb57429e5dc354f15e34a21a9a9d89b4dcc802649e98a5ff4739ed199500cee63a91613d01277fdd3d3173a1ece652fa72d4841825a9a749b16eb38341a28208a7abf740378e5171f0c3c75b6aaab0643ebae5dc9aad428962d0cc69a9768f28258893616ed1895785e40895a54e999bf9410deaa60612d4e2724692a072371eb626d6045fb621af9d244062488df4fd8398fe3b4e17ab3b3164cb64b222c72f96d5cc95907bc106719c4781e519816a196a8b6314d5754f58f372e827151a7501218b4911300cdc8b883173dfae2d1c26bd70a3c22483bc027975322c6db1fb70cb524f0c282f2fc0b235410b4b2eb06e2fa847c574c76b0c4c3254a9552d41e9b39bb2f86ac5a39ea45d5368dfa63321c432ac4bd452b54588ab25adca3f0807b609ab569d5feca8b12b60e08a607e27b4a918af2b1c80db339d31a6b934c1dbf56083ebab57dd85cb5e8d032129561d44eaf9415db908c27e3199a949a2a82cdcb52eb91d77e439f7b8c0353880fa2eb3d1d08d277e7067f9e7884b525ff004348b9d1e214ea93029d32399d53ebe50b1f3c6d5f35a9742d62f3beb54d27d4b098f9e2914deacc122369136b7cf6ebf7636320892c076d873daf7e9e87a5b75641da5d056cbd1f7d28f49521e074bdc0edb601cbf1a4aac4515a34a0c067700fa845b0f9e2b3573422cc4dafa948dad783bcc7cfd3037e9c424d888b183279755dbe3f96eabf183347417c80aaa0e655ab0ec1597e4006fbf7c435b3395a2a7c376a7fba920ced756fc631cfff00aef4fbcc07d93fe9122e311bcd41e515083712c63d2ed6f974b619eb52c2168bafe9fe24ea7a2a370d550161de57caa7f3c32e1b48e91abf5e3aad40e07a0f2dbe78e7c32ec6ccef31305f9efdac41227f8e06a3952af34d9fb00ec237b58cfc7f3c24357bc8d4752f1d10182e903dd97047a2b023e56c26cf56350e93962ab16ad529a18ea6536e7cb9e292d5aa0f2f8a667ebd5d5f1f389dc5af7fb667e339ba6069a8de6e459ade92e6ff000e986eb5e1e11b82ebc168d2021053af16f2d40debe531f6cfc306d5a79759d54de993ce1e3e7054639754e23986bd4567e72cd7f50627f9f9ea9ed2baa68a952ba89db5122c4794826d61cb194d254a3fe0099d0337c5f2e5c52a7a2abcc056a637becd0a4f591eb389a87b3f52433a2b0dfc3572bf320191d81e9738a2e573aad04d46dbf7beee666fcef82fc70b03c7aa245f43b2cf3e4b22d84eaa6fdc86592fdfa3d3e79283ff0095fefc663999c8d2625bf4aa973f5a89fb4a4fcf1987eb47c7cfe8d474aa590a0beed0a63d117f0189bc05171469cfa2fe58df4419f37fa88fb2631edcfd1f9938ebb1a89919f9c7c31b973810c8e4077c66b6e4447ace31a82f51c7aa700ad463b30f9624149ba8c13078c73de399877ab56002359dfa2dadf0036fcce2e80bf55c72ee31534d5aaa5afe2d4b193b3188bda4447a0c47572901e0272d992cd6a856cb2ba0f436b5a04ef31df13e5d01683a8f301c89e5b81b7483d3e4972b9b6d07ccdce44053026ebaac0f33e87b6344a2b24bb44183aaa46c36106f1be39f682c6d9bcb28f2f90c6d6d47acc6ade2395e3b6074c9ea62be26dcc28b44183b833f9e16d3a28acada145d45a4c9ed7bdc8f9ec2304e606a83e2042806d27a5a00eb1d44f2c35042e8707d45cb3358c816fb2008e47a7cf04264e92dd9f9da4993e963f31ff2370ea8f499457974b9fa6862f043189989efda09c5c3309967a16a49a0895a80a82b68d41984ec62fe870f1d272036903704c8383ae9d04a81859aa0d2474209124458d8cc6f87157259971e6cc2533c853591da4b1923e53db149e15ed454cb553481a75a9f214db56fcd60183cc8bf49e786f9af6c332aa5ce53428ea65bd4ac481d645b15d38d468561b9766a0fab31451d9bf68a26fdb558db959a3ae01f6838a65d4eaa752b53a863fb25241b8b329023be9e86662310f0cf68e8565f12bb566658255830506e4690a2f6e91222d8aaf1ee38ed5a324b54d2d32c181dc926d3cae0cb2f499c0a697d3f26b433a799a8e091e30b81208132637502db820ffccb4a9234067a860735b01e91b6e3e2396ea2867b39508229059d8b1047426c3cb107f9378d28668b41750d178bda7b5898e9b6fcb1cee2321baa52a6de563727de277103481168ec31153ae9b356a8351b80446f637de222fd3e7e52a356d3529c6f7d4b00760d36befd4c0e7812ae4ab4485cb916261181b7727cdd7adf0b57dc219469536274d713c8965931363e5106f13ea3d729d70a20d5a77e897d9b720d8db78dc8c2b6a3584c2d011ba802667d20fa4c89db03be800ea4a60dd5a4806d69b8dfe3d6f8db003d5cbd8120120c113037310483224112201937b4621a99b1460850184c8d408b4cfd191f772db0929ba83f4c0370069200de791f973182e97192b03f59044590ac73160b0604de7a5b0760701cdc69a4a5428c2d0a350f980a27cbf65f127f5bb3794d21a4decc54f5d5b8ee76e63a62bf9be24a4fed0888821bbf3b11f77ae0555a4c67cc4cc402e4fada3ef1b1b73c374d720b2d4f9a65b0237fa5554ccde6c477bcf3f8603cc67f30ad2b455e39eb536076b5ec3713ca7086a6404cdc0fded4756e06e277f5dec631bd6ca95f27874e3fc245c0dee677efcafd31ba71358f7fadea3d8e58adae641063b91fcdf021cea7ed28a80058f2f974edebe81554a2856fa4c766e7cb68f81b5b7c44a88274de08fd99bcf73dbaf41be0f4a3d81659538851fee2911c9bc45b089dac4de2c3f8e3d3c690795b420dce9aca047a13b5b9c6f8afe568a9d47c3661f4a1048da6c0190277f9608cbf07a350ea34dc83b808a2fbf2dbd3b603d38ae4d6397e3a9376bfff00b297e2d38cc571f85e5818341a7b971f645b1ee074e1e1fcfb86d8c9fdb7ce1fdb91e817f2c627b699b1fb76f8c7fc62ac98332b979df1ea5444b63aafed6e6da26bb7c207dc31352f6973c45aa18ea40fbc8c0d4aaf8435222cfd62093817399fad57798f48c0a4fb06df91fd0f6d7334c5ea873fbcb3f737e18f57db9ce9d9d7d05307efc55a8e42a36c3059c93201217fd4b3f2071b6c4db9969cb7b5b9d07533a91f55820fc27159f683da0aaf99aa75d340da4c005b92cc74322710a7283f29c22f68045453b92b07e07f22309382681b87794e214dacf52b188b98ee2e1889266d7c1d9f397a2a84f886cc5562244cfd29fa4c498fca76f639699a21e103cb063ccdcc19df68c67b69495a86a2eb2841126e79103e178e7a460fe996dbb13abeeaa1cfb3d99cb55a61d91c8332a18083b106c67e11cb16ae1bc57274bdccb693d7727e3b9c716e05c70d02caaa5f56ca379eb1b9911f218378a71bce0203cd20c24000491ebbcfcb71868c34d46e856e77c9d7f8ff001ac9d4a5e7ab4e9309d0cc0d89895db630263a03b818a6f0fe2d97a9581ad272e45ca92aa84c6e27acfbb06e4f2c2df65f81656ad2f1eb396616a86a990a7bf5077124cce18f15cc70c11e187775104d348523f8722279fa896a69afdc52327c1d2b2b4a9a0fd422053cd3661c8c8df12d5a82982ee69a28bc923fe4e395f0bf6caa535094d2509257580227780090237891cf6e4af89fb5f5b530d084b4cefdc1bc9d439dcc6dd230bbdf09069172e319aa2f5a69311001893a18cda20797d399e40c92a51e9027caa34dc902fa873ea39104dfae28d538cd663abca09dd8449f51f3c4f96cd55d425a76b01dcf45bdc7c7d712969be46b2e5529291b81cba45b55832dbd00efeba53554901c8d42c08208e7b891f7c033689c28c9f8b5148082d00811b8b69e5ccfdd7c174e9e6342f9e985077f59f7a2237ec413cf13dbf51ac6ab599b5412cd3e52c22f3101a266637bdfd703d1ca3309d2d13ee9dc09d8852241b1bf7b62334ebe9866a733120089da20f2858bfa5f1ba2d65f7ab2ac6ec0c79748bc036ee2dd794607f0104cef0b3062931bdc34e9e7b41df6e82fced89d7876990a1558f20010246f26604cdef03e38873d9c6a6b2d99526048076236223bf33f8194d53da4d04c2abc5a56c0de6e23e1b6c796d8650935814714d2a0261ad713a45b4f39bcf73cade98933f94a8a1ffef17fab202c40d80e445c587e6828fb662fff007750a6cf049045809e911bed6c16bed221b2e559c47d2899dc99893cc7cba9c6709aec6b41ab4d411acabcc41defbf35ed669b99df10d2a69ab9c4c8604020ed68ba9fe3180ea66aa34b2e58408b3b5ba5b6ebe96e57c6952be6350094692b6fb8693bed113b7c009b6328480585b3f497c84316dee4458ac95de39b5a2312d52df45c3428210c1048b1d3ab63f1b411d314ff00eb1cc33689a4a6262d71ef589e5cf7e7dce37a99aaea08a99885064aaac9db9f2833133d40c6e8d1acb4d6cf1805fc42adefac340040dfcb1ef4ec791d89c2de280056f098899dfcdcca959b4588dc1f74f23841438850305b315c5f65e4373d3b6c3a74c2de219aa0492ad55cec4b91bf5ea371bced878e953c9ac9f39c5ab8306a098fa204ced24c5cc5a77c05538ed7fef98c6d27f99bf3c6d96e1c2a7bb569299b02d1e9722e7d31e1e1b4c10ad582b73101bed90262f723a6f8b25114de9fb4f9b0205773ea4fe78cc44d97cb8b788e7be8ff00e43eec7b83edf1f835b1865f4cf9898ec30cd33b494795189e4491f9633198bd02c972d42b566ebf1030dd7d97a912cc17e249fcb1ee3312949a192b16e7722a920d524fa7c700011798c6633148f02b335f7385fc7147909ee3ee3f9e3319832e00b922e0b5730c1a95121755c9d88d86fcbe030eb29eca8241ad51aa374e5f126e7ecc66330fa714e36c94db4f059787f0fa74879102fa0dfd4ee7e380fda1ca8ad48c7bcb75fc47c47db1d31ee3315925544d3cd948a151fe893713bf21bfe3f6e1852cd9549d8804193331116db78f9633198f3d9d60cf9b79bb58c98137dfbe064c93d46b4ccc6e3b47df8cc6637007c8d1b84bd34d4c001d66490434ed6b69276c1494eb0560146923704022d323988e9df198cc4b7368210b5b30194a8504a8da39980474324c5f96f8228fe90f00d4313ca00044013d6f1b74dc6331980c65c9ad4a0e249a8c62e7ced71b103a7acfcf6c69478207066a1822c2098b8eff000f958df1ee3309b9a0f7a06cb7b3f4d9bc31fda8b79bf789506d6da49dfeec10dc328a112a0802f1221b63683fcf5e7ee3305c9d81a256a945090030d1ee99e51b93049324db6b73db137e9b585d489bc340b499137bf50609138f31986aee14b245a1591e6ac545365d2405800c183d74804729b4e007e394a9392a3a796260c09066db804111ced307198cc34629ba0301a9ed63d476f2a2879d56307bc6c0c017026c3d713f0fe10d51d6b864a97d51e604e9e8580d881bc76edee330d2f6f00e496a55a63c466cadc1d73e258c999000e7a874b5a372443c4a825850562aa299966802433002373246aec31e6330e999822e768f98fe86a6d258d46dda796d137811b72db037e9f97b0fd14ee093e2b495904013b13b13dcc44db319864007ad99a049232f03a1a8c63e38cc66330407ffd9, 'India', 'Bengal', 'kolkata', 'kolkata', 'good'),
(5, 2, 3, 20000, 0xffd8ffe000104a46494600010100000100010000ffdb008400090607080706090807080a0a090b0d160f0d0c0c0d1b14151016201d2222201d1f1f2428342c242631271f1f2d3d2d3135373a3a3a232b3f443f384334393a37010a0a0a0d0c0d1a0f0f1a37251f253737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737ffc0001108008200b103012200021101031101ffc4001c0000010501010100000000000000000000000104050607030208ffc40046100002010302030504070504080700000001020300041105120621311322415161718191b107142332a1c1d115163342726282a2c2255253637392e1f01724344383a3f1ffc4001a010002030101000000000000000000000000040203050106ffc400291100020201030205040300000000000000000102031104122131410513225161233281a1143343ffda000c03010002110311003f00dc68a28a0028a28a0028a28a002a3b56d4d6c044a2269a695b6a449f78f99f60a737b75159dac97133611064fafa551e4d6d61e22b2b79c91aaea2c4b46bcfeab088d9947f512066a2de094564b8699ac5a6a3b9607c4c83bf0bf275f7797ad3f07359569b7b6bc71099ed4b699c436a80ee46c197c372f9f30797eb521a37d204fa7dd3699c570b472a36c176b1901bd587e94291d943068d4571b5b986ee149eda58e589c655d1b20fbebb54880514514005145140051451400515e2495231ba47551e6c7151f3ebda642486bd88b0fe543b8fe15cca3b86c737d75f548c486279149c1dbd45388c9645623048ce0f854245c45a7dfcb2dac2ec2411efef8dbd08f3f6d4e2d753c9c6b02d1451400514514005145140052138a5a80d7f50cb3d9452f651ac664bcb807f8318f0fea3fad71825921f8af5e82dada6d4e7ef5ad9b6cb68b77fea67ce338f10bf31540e084bad578c1759d418bcced236e0b804946e9e82baea9c5fa3eaf770ff00a050c302ec89af27731a0f48d3a93ea6bbc7c617302edd26d228100c2fd56cc281ef22979cd647a9a9ed7c0c34ee1dd42f6c6de6b3b4bb8eee21ba29d11815209c1dd5769b4e6e21d3161e2882cacb54c848184ebf6e71cb0339dd54d5d4388ef6202e9e791fc5a79c8527fa4721eea6373a2df5dba3cef6f14a872ad1a9dc3dfd6aa8d8a2f918b2995893ee3b86eb88381350318931193cd1b2637e7e47c6b4be16e3cd2f5c0b0cce2d2f4e3314ac0063fd93e3ecaaa69fadc3aea4ba0f163c305d6d0b6d76bdd1373c053fdafd7d2ab1c45c3b75a048f1bc4ad1961d9cecc772fc300ffdf95331999f3ada787d4df4baaf5207b69acdaa5841fc5bc814f917158be81adb488b697d2bb4993d9bcafb81f4e79c7a54db4aca39bf663da17fccb43b1fb02a93ee6813f12e9b10c89249079a4648f8f4a8e9b8ca1ef0b7b47723cdc1fc1726aa08379de17731f1c64fb73b7f3a0ed7e4e770f057239fb98b7caa0ec91255c4b05c7175f9fb89043ed1923e247caa3ae35ad566197bb995475dbb941f805f9d3208ebd030f0ee8651f86daf2aa85bf90bfb5777e018fe351dcc9ed5ec234cf3b6e694cad9e9bb71fc379f957370541129ee7882718ff9987caba12586486c0e5de0e47f88a8ae40a1c88769f30847f914fceb8745e1bba8edf8c6c8fd9947ca8230473e5e000ea456ba2b016bb78f8849058340e98c93f99cf956f56d2acf6f14c872b220607d08cd5f5f417b57275a28a2ac2b0a28a2800a28a4271d050032d56f4da5be225ed2e643b218ff00d66fd0753ecac7f8d7586b997f777479da6cbeebe9949067973cc67c87c3955c38cef6e74ad1eef509e6116ad38ec6dd761658509e6aa718248e64d5278774a1696cb71306133af88fba33f3a5afb36a1dd251bde47161a6db59c0a8b123480779c80493eda76a19dc244accfe000af6ebbb3b0e2ad36faa5fc96aaf6f676b6fb911f006fc6e5c8f15f0a4a11958cd1bee5425845761d32fe63ddb49b3e7b3029bba32bbc4df7d090c3c88eb56a47d667041be310ff75120ea7d413e355394309e55259983b02de26a5656e0b923a6d43b9b5ec36bfb28af2dda3917991c8e3983e953ba6ebba4a70f0b0e32bb8a49118a407b262ed180307903cea2f19c7214df51d396fa15899c27783676e4f4f2a2ab5c5965fa78dabe4accf6cc649a6b12b776aac4ab439deab9e5b90f3a9bd0b594bd8c5bc928ed07490311bbd0e0839aabda2b41aa298f7964908ee1c16f0a7f7f710b5f4897f011246d85b987bb20e59e7e0dd69bce5198eb7196117138190ecbbbc89527fcc6bac41ba0ed07b0301f8051557b7e2365416c6ead258d3a4cf3491b63c99029e7eb5ee5d761656ffce418ea7658c921f8b915cc1ce49f3246b37f2ee03c7603f3635db7b15fbce41e983211f8002a3e187529a31225cea251941ee470c231f89a677f14ff005792516d3dcb263224bf9093cc0e8a17cebb8389e5e112ac0a007b3542dcb25517e649a6d3ea1651122ef50814f4d864673ecda302abfd9ea527f0f44b45f106488b9f8bb1a6d7d2eb7a598a6959618d9c28114512ed38f251f3a8a71cf52c75cd2ce0e7da93ad4e472dcccbd31d3a7cab77e0bba179c3966f9e68bd99f4c74fc315f3f19de4bafac4a732349bd8e31939e75b27d165d6fb1bbb4279c6e1c7bc63e4055b5be4ab511e132f5451455c2a1451450014514500547e916d63bbd2ed6291880b701f979807f5aa9363049c9cf9d5cf8ef3f52b703fda1f955371e39cf8731599aafbcdcd02c527166c93c89abde8bd8c3a65abcf242a3b188e5d867f862a8ce48e79000a9bd4971a642b8ffdab7c9ffe3a9e93b94f8974896b7d574f1cbebb0f74e48439c73c7ceb3b9941ba9ffe2bfaf8d3eb3b795525ee13b9148dbcff00997ca9acf85b89ce3a48e3a7a9a96afa221e1bd6473206323f0a5504641e9eda5c9c679e7d7957b5ef0ce29246b37c1418d55b582b2461d3b620a1279f3e9cabaebc81755ba0a300952067c368af0ee20d5a49080c1272704673cfcabd6af70b777af3af22e17206703000f1f653e9f06735ebc8df416b587882d1efedcdc5af6c3b4897ab03cbdfe1cbc6af176ba5dedc497361a5adb40c088d5e301880319c7873f0acfa362974ae3f9581cfb0d6878663924107af3f3aaee9349165104e4e45a2d23091db22da5c491b45110cab9072a33d3df5036305f07d485d687756b6e96ee52e676c862186300f3e629a713eb53e9c34a89279515ace06d88e57272473c7f4d43f0f492fefb6a3149348cacb76803b13e048f95312c389991589fe49bce31b7f0f1a88e2480dd59411e083dbae3db52a3bc4f78fb33eda6dab0516c8cb93b278c9f4ef0159f07892372d59832880f2ad6fe8a6ce42ad7f1161098fb293711cdf0a797e1f1aca254db2bae3a3115af7d0bb1fdddbc43fcb78c7e2abff005ad287532351f617ff0071f8d15ea8ab8442928cd56f88f5a304a6d6062ad8ef30aaaeba35477489462db2c46445fbcea3da6b8fd7ed075b9887a97159bdc6adb5a425a479090114b0cbb63a0f878d32fda33aa969a4689f21046a55cb12718cf4ce0671eb9acd7e253ed0fd96796bdcb9f1c3abdb5b1560cbb8f439aa811e5f3a60fc43705c0b68e77620fd9b1c127c86473f7797a516fadc7712c8970548071be3180a7fb40d5365f29cb2e383434ba88571d8c91b75cccaad11954f540705b974cf854ffed0d4d542476112aa8039dcb72c0c0e917e75cec56c6d57747324b230fbc39d3d37311daabda103ae23639fc29ea61b5156a6e564b8e836faf6b4df7520407a16799bfccb50b7f05d24c64b931ee932730a944f7024e3e3565133392445707cb10b7e951b7f7b6fdafd4af20b952e4042606e45b90c1c72e67c6a56437448e9edf2e7921082073a55c67cb27f1a93934ac4840766c79444d20d302a93ba52473c0840f9b522cd5f3a18332bf006a3723a7dab7ceb88196eb527abd8ecd52ec06907dab7de8cf9ff006734c163c485721b1d76d3f5ace042db36a6d096f612ddce914582d230555f3cd68cda64b15bc01c6595156400ee3903048f3a8fe09b28618e4bfb928b213b220de1e67f2ab41b8b66eeb4b1919cf36a95b08cb815aaf9c5e7247cda8682d1c71dce8d3de18a35883cd6e85b6a9247571e24f857a4d634949a49edb87045349bb74c228518eeebde193f8d75bb82da48f799e21e4c1c647a75e751ed632e7bbd991cf077a8f99aa273b21c761baaba2ce5b791acaeacecd1208d49eea673b479669a6b24fecbb860077406e9e473527f53947de68c72cff153a7c69bea1a7c9269d769db419ec5b20cb9f0a562fd487e5386c69328d7cbb6f6e07fbd6f9d697f42920169aa41e22547c7b411f9566fa8abfd65e465215f077787302aeff431295d6754873c9edd1c7b988fceb521f71937f359ae51499a2af10118e149aca752b8b8b9d4e60b09c679ca1d589c8ce00f8f335ab9e9593712335b5fdd45233db22c8515fc1cb0f20377c2b33c4137b4b2b6369aea73ce2c4891bec7da555c9c67001cfa788ea7d6a0eea47b6964ece796ea64770cfc891c8641cf2c646338e5d79e6bccf7881adad764d6d2c8c5cb3318f1cc60b673d48e791cea3e5d5e09ae26ec25791f6b0ed9949dede0769e43eef5c78f4a5210649b1fb5d4769145b2ddfb60a088080768e58c01fa67ad30df227693ed58a42fde5df86c8e59c115c564bb819ee4ba10c3bafd01f0e5cb1b80f0a6d24f16c6683222c80439c92c4f5c0e43ad4943b06e2f7c3ba8ea52acb0c9af0b78e143b6267707f85bb3c8f404fc0558c5c46bc3d25f4dc461c2dc2c6d76acfb101c72209e67f5aace8b6968f757827bb313947071016db98403e3cf973f7e2a527d3f4bff00c3ebeb61ac15b53788cf75f5463b0f7796cce4fb7d6b4a1ec889e8ea9a5f6b681f8b5584c06d0b0b9ed7be579774e3a63dd4d38fa1fa95f91033a44b2c0d8dc4ff0031ce7cfa0aae8d338714e8cffbd2c4267b3ff46bfdafdbb9f3e5cc91eecd5c7e916cdaeee76a9c6f9506e3e18193f315d92f4f25b4e7cc581a1393cc93edaf385271804d278f2f773a503d399f5accc9e852f828fab1ecf56ba2a4afda1e871e54eedf55d4b4ed2e79acee6446691003c9b977fcff00a6996b9cb55b90724769f90a7971aaa5fe99736f1d92c16b06d2ae3c1b9edcf4cf43e7d69d8b78584655df763e492978bf5eb7e1ed3ef23bd94bca6ebb5ceddae63c11818e5c8d323f483c451e4497d1023ce156c7f86bcc51b4bc27a6ab01b7eb17c83da6253fad55efc7da823c510fc514d5c96452784f08bfe95c51abead67762f2e23609246a365ba6086008f0cf88f8d4868ba85d4da3da485b6931918540064122a2381e36fd917db573bbea4c7ffac575e1b663a688c9c18e774f91fcea9be3e919d134df24dbdfdc29406693bddd041f427afbabccb757451d7b79b9a91ce43e551baa6aa2ca4589ec1de2908292960a18fa93d3a9f8d3a85e39903a3021bc478f5a507ab9424dc5a29f2dc3c6d1e541061427c0fdd1e23ad5a7e8b2e507190558f6196ce40d8f1c329f0fd2aa37c08687fe1edf83b0fcaa6be8e65ecb8d74fe7cd8ba75f3535a1178919d6afa6cde7979d14b45346787b6ab1c5fc2c75b315d58dd0b6be87ee975dc8e3c987e62a4788b546d32d1644c02cc016237607b32326aa09c6d63240bd9ead2b48a72e1b0ac32327963a0c6294beead7a64b24d45f5283c49c3bc41a222adedbdbdd10db84b1e1cb9f55ea47b7c6ababa66b120cbe9f32e58f41b7a8ce3cbddeb5a66a9ab0d4fb49123c074ddbd8e49cf4ebd390e950a6e865019032315fb3cfdd38f0f7d67c6e4f3845eaa4d72ca54f63ad24204ba6dff00609d0189b6a83d7f1a62269a4bd82170c9999148e84f7875abfcb78f94db98d09c96573b8b67e555596fa38f5b6bb96de39823b774000be7d7d395314cb2f944655ede85e6c95d2ef516eca4da3b5230a79fd88a76e932fd1b6a69d8ca1cdea281b707f939d46687c7705a3bcada7dd81183b824e3383e448a9d4fa56d30fdfb0d587f4bc47e645369c511db2f633ebab699df87cac4502a10558f88b87e75ab71a67b7195381719dde07ba3f4a609f4a1a1b63741aca7b6280fe75cb50e28d3f54d5adad634ba916768cabca881704e3c0fb6a364e3b1a4cb2a525626d0d49c72239d00f3c6d1566b8d2acfb470611d7c1881f0cd72fd9567d3637fce6b29b8a783656a13464dc418fdb1760631b87c8576d0ca182ed258639a3213723123a13e23d6a438934f897882f238d18e0ae06e3fea2d4b699a570fdb44b3c5ab5dc6d3202ea6db23cf1cd6b4aa92c26ccebecea7ad6a24874bd3e0b6b08adade3d4654c4658e59adc927249ffb02b3b8ee6d675433c126e08a094979725033d3d2b53d6750b392dade33a835d62e038492d4273d879e401cf15599b4ab1b98d42c51a00df780dac3cfdbefa9f9d5c5f2c4e5b9f2892fa37905cdbead0c30ed0b043b43b648d8c31edffa52e9882180a8e44cb216f6eec7e54e385238f45b1d423b6b5965b8993ed25ed571b3070307d727e1531c39a49b8d2e2b9b8588b3b17ca6e503273e2739c934a6b7535c5751cd17d3e6632bad05efac21911419d091b5b2323df51ba75bcf6467b698a9eca66542be593f9935707b2ba7c8eda450e33b84ac09f51cf972ae5fb2ed573da4333be4b6e625893924fad65af13adc76c972370b529659956aa36b2fa492aff8f3f9d76e119bb1e2fd15f381f5c407df91f9d4b7115a44b7aa5ecd6052ec546ee6dd32d8cf2a8fb7586defac664450d1ddc2d9fef8adaaac52516852c798b3e87c515e778f3a29dc99b8330fa45d6adaff00535d2840aff56382ee7c48f01e9d7db54a96d523b698452efb9914848873ea790f1f2fc6be8268227fbd121f6a8ae274db23d6d2df9f2fe18a52cd2b94b764b14f0b07cfd059ea90b35cdc5d40d332664b70c792f9f2e59f1a6f793a5b957ed89c9520abe0639e7957d00740d2b24fd461ef75e5d6b8b70a682c493a4da649c93d98ae2d34f3cb44a3624b0601aa5e4922edb7898640fb40411e951f6fa5de48ca045ccf4e7d6be8c8b847428b7763a7451eeebb32335e8f0be97fcb0b2fb1aa32aaf8f15a40e79660d69a16a4323b13df183861d3caa413872eb0372a03edad8a4e10b0639124ebe81e9bb704da1ce2eee003e070697957ae7d9125760c9cf0f4e3f957e352ba168d2cdab5bb5f4c904168aa55f70cb6d390a3cfdb57f6e088b398ef5c1c639c62b8b70449c82deae3fa0feb50d9ad5d619fc93f3c6dabebb636ba8456e1da4693259930563eb8c9f5a71693096d91cb02c73923a75a4fdccb904e2f10ff00748af3fb9d7a0776ea3f89aae55ea1ff009fecb23a849148d7dd575eba922da642c9907a0c002a35eee28208cbb65b6a823a7315a19e0bbb2db98db3367393ff00e5368b822fbb254923b46c78939cd7766a31fd6ca652cb33ff00da91c932aa920c6724b0e9e14afac5baa92f329c8c02a73cbcf157bb8e03bd754d90da1dae09079023c7e75d22fa3e979192dac55bfb2a0fe552d9734be9b219f921782b5082fee26b75c6546edcc0731d3156db9bf7b5566ba531c69cd64424a9f6e072f85161c217166e1e196de261feaa03f954dc5a3cbb712dc0feead12d07f217d48b4cb55aa2b1929e38aad5b31dbddc5da0076c6ec3be738e67c3c797b29535ab7ba849fafaa480e24292602b0f0f5f1ab25d70568b78e5eead63763f78f66a33f852daf03f0ddaa6c8b49b72b9070cbbb98f6d54fc113e8ceff2228ce38a1e4d42eed62b48de690ee50a06e738f4eb8f53e94ff47fa38d4ef5565d4e65b24c8608a373e41047a0ad42cf4eb3b10459dac3083d7b340b9a755ada6d2aa2b51eb8299dce5d0e1d837fb46f8514e28a6b0559128a28a900b494515c47028a28ae300a2968a004a28a28ec7043d69075a28aef603d5278d14543b9d6257aa28a91c418a28a28ee750b4828a2ba014b4515c40145145740ffd9, 'india', 'goa', 'goa', 'goa', 'seaview');

--
-- Triggers `house`
--
DELIMITER $$
CREATE TRIGGER `deletelog` BEFORE DELETE ON `house` FOR EACH ROW INSERT INTO logs VALUES(null,old.id,"deleted",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertlog` AFTER INSERT ON `house` FOR EACH ROW INSERT INTO logs VALUES(null,new.id,"inserted",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateLog` AFTER UPDATE ON `house` FOR EACH ROW INSERT INTO logs VALUES(null,new.id,"updated",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `house_id`, `action`, `date`) VALUES
(1, 6, 'deleted', '2019-11-30'),
(2, 7, 'inserted', '2019-11-30'),
(3, 2, 'updated', '2019-11-30'),
(4, 2, 'updated', '2019-11-30'),
(5, 8, 'inserted', '2019-11-30'),
(6, 9, 'inserted', '2019-12-01'),
(7, 8, 'deleted', '2019-12-01'),
(8, 9, 'deleted', '2019-12-01'),
(9, 7, 'deleted', '2019-12-01'),
(10, 10, 'inserted', '2019-12-01'),
(11, 11, 'inserted', '2019-12-01'),
(12, 5, 'updated', '2019-12-01'),
(13, 11, 'deleted', '2019-12-01'),
(14, 5, 'updated', '2019-12-01'),
(15, 12, 'inserted', '2019-12-01'),
(16, 12, 'deleted', '2019-12-01'),
(17, 6, 'inserted', '2019-12-02'),
(18, 6, 'updated', '2019-12-02'),
(19, 6, 'deleted', '2019-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `t_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `relationship` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`t_id`, `fname`, `lname`, `occupation`, `gender`, `dob`, `relationship`) VALUES
(1, 'Raksha', 'Sarkar', 'Student', 'female', '2009-11-10', 'sister'),
(3, 'Amrutha', 'GP', 'student', 'female', '2009-12-10', 'sister'),
(3, 'Shourya', 'Mishra', 'student', 'male', '2019-11-05', 'friend'),
(3, 'Umang', 'Shrivastava', 'student', 'male', '2019-12-04', 'friend'),
(4, 'Aditya', 'Singh', 'engineer', 'male', '2019-05-06', 'brother');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `o_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `no_of_houses` int(11) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`o_id`, `name`, `email`, `pwd`, `mobile_no`, `occupation`, `no_of_houses`, `country`, `state`, `city`, `address`) VALUES
(1, 'Megha', 'megha@gmail.com', 'ppppp', 8660826138, 'software developer', 3, 'india', 'karnataka', 'bangalore', 'vrpura'),
(2, 'Khushi', 'khushi@gmail.com', 'kkkkk', 4444555556, 'Doctor', 2, 'India', 'Karnataka', 'Bangalore', 'Bel Circle'),
(3, 'Nisha', 'nisha@gmail.com', 'nnnnn', 6764387428, 'Teacher', 0, 'india', 'kerela', 'tiruvanthapuram', 'tiruvanthapuram'),
(4, 'Yash ', 'yash@gmail.com', 'yyyyy', 8797879798, 'IAS', 0, 'india', 'jharkhand', 'ranchi', 'ranchi'),
(5, 'Ravi', 'ravi@gmail.com', 'papa', 9898989898, 'Pilot', 0, 'india', 'punjab', 'jalandhar', 'jalandhar');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `t_id`, `rating`, `comment`) VALUES
(1, 1, 5, 'good'),
(2, 5, 5, 'cool'),
(3, 1, 5, 'good'),
(4, 4, 3, 'ok ok'),
(5, 2, 2, 'bad');

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `t_id` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`t_id`, `fname`, `lname`, `email`, `pwd`, `mobile_no`, `occupation`) VALUES
(1, 'Sameeksha', 'Sen', 'sen@gmail.com', 'sen123', 8888888888, 'student'),
(2, 'Sunetra', 'Sarkar', 'sunetra@gmail.com', 'qqqqq', 1234567890, 'Student'),
(3, 'Shwetha', 'GP', 'shwetha@gmail.com', 'sssss', 9796858463, 'Student'),
(4, 'Vinuta', 'Bhat', 'vinuta@gmail.com', 'vvvvv', 7654387697, 'Doctor'),
(5, 'Mehul', 'Jain', 'mehul@gmail.com', 'mmmmm', 8888855555, 'Poet');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vacanthouses`
-- (See below for the actual view)
--
CREATE TABLE `vacanthouses` (
`id` int(11)
,`owner_id` int(11)
,`no_of_rooms` int(11)
,`rate` int(11)
,`pics` blob
,`country` varchar(20)
,`state` varchar(20)
,`city` varchar(30)
,`address` varchar(50)
,`description` varchar(300)
);

-- --------------------------------------------------------

--
-- Structure for view `vacanthouses`
--
DROP TABLE IF EXISTS `vacanthouses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vacanthouses`  AS SELECT `house`.`id` AS `id`, `house`.`owner_id` AS `owner_id`, `house`.`no_of_rooms` AS `no_of_rooms`, `house`.`rate` AS `rate`, `house`.`pics` AS `pics`, `house`.`country` AS `country`, `house`.`state` AS `state`, `house`.`city` AS `city`, `house`.`address` AS `address`, `house`.`description` AS `description` FROM `house` WHERE !(`house`.`id` in (select `booking`.`h_id` from `booking`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`t_id`,`h_id`),
  ADD KEY `h_id` (`h_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`t_id`,`fname`,`lname`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`,`t_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`h_id`) REFERENCES `house` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE;

--
-- Constraints for table `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`o_id`) ON DELETE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`id`) REFERENCES `house` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_ibfk_4` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE;
--
-- Database: `hr`
--
CREATE DATABASE IF NOT EXISTS `hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hr`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `no_of_beds` int(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookings_history`
--

CREATE TABLE `bookings_history` (
  `booking_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `no_of_beds` int(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancellations`
--

CREATE TABLE `cancellations` (
  `booking_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `no_of_beds` int(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checked_in`
--

CREATE TABLE `checked_in` (
  `booking_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `no_of_beds` int(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checked_in_history`
--

CREATE TABLE `checked_in_history` (
  `booking_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `no_of_beds` int(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `confirmations`
--

CREATE TABLE `confirmations` (
  `booking_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `no_of_beds` int(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hr_admin`
--

CREATE TABLE `hr_admin` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_admin`
--

INSERT INTO `hr_admin` (`id`, `username`, `password`, `fname`, `lname`, `number`, `email`, `city`, `gender`) VALUES
(1, 'Meet Bhalodiya', '1234567890', 'Meet', 'Bhalodiya ', '9874560123', 'meet@gmail.com', 'Rajkot', 'male'),
(2, 'Urvi', '1234567890', 'Urvi', 'Jodhani', '9756771230', 'urvi@gmail.com', 'Gondal', 'female'),
(4, 'Jeet joshi', '1234567890', 'Jeet ', 'Joshi', '9081234676', 'jkjoshi@gmail.com', 'Junagadh', 'male'),
(5, 'Darshil Lunagariya', '1234567890', 'Darshil', 'Lunagariya', '6590871234', 'darshil@lunagariya.com', 'Ahmedabad', 'male'),
(6, 'Phileman Pius', '1234567890', 'Phileman ', 'Pius', '9105789233', 'pprooms@gmail.com', 'Jamnagar', 'male'),
(7, 'Jignesh patel', '1234567890', 'Jignesh', 'patel', '9789903344', 'jignesh99@gmail.com', 'Gandhinagar', 'others');

-- --------------------------------------------------------

--
-- Table structure for table `hr_feedback`
--

CREATE TABLE `hr_feedback` (
  `id` int(255) NOT NULL,
  `booking_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL,
  `spam` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hr_table`
--

CREATE TABLE `hr_table` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `hr_admin_name` varchar(255) NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_type` varchar(255) NOT NULL,
  `hr_address` varchar(255) NOT NULL,
  `hr_city` varchar(255) NOT NULL,
  `hr_number` int(10) NOT NULL,
  `hr_email` varchar(255) NOT NULL,
  `hr_laundry` varchar(255) NOT NULL,
  `hr_food_type` varchar(255) NOT NULL,
  `hr_bg` varchar(255) NOT NULL,
  `hr_total_beds` int(255) NOT NULL,
  `hr_beds_avail` int(255) NOT NULL,
  `hr_beds_occup` int(255) NOT NULL,
  `hr_price_per_year` int(255) NOT NULL,
  `hr_price_per_month` int(255) NOT NULL,
  `hr_price_per_day` int(255) NOT NULL,
  `hr_build_img` varchar(255) NOT NULL,
  `hr_reception_img` varchar(255) NOT NULL,
  `hr_room_img01` varchar(255) NOT NULL,
  `hr_room_img02` varchar(255) NOT NULL,
  `hr_restroom01_img` varchar(255) NOT NULL,
  `hr_restroom02_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_table`
--

INSERT INTO `hr_table` (`id`, `username`, `hr_admin_name`, `hr_name`, `hr_type`, `hr_address`, `hr_city`, `hr_number`, `hr_email`, `hr_laundry`, `hr_food_type`, `hr_bg`, `hr_total_beds`, `hr_beds_avail`, `hr_beds_occup`, `hr_price_per_year`, `hr_price_per_month`, `hr_price_per_day`, `hr_build_img`, `hr_reception_img`, `hr_room_img01`, `hr_room_img02`, `hr_restroom01_img`, `hr_restroom02_img`) VALUES
(1, 'Meet ', 'Meet Bhalodiya', 'Meet Rooms', 'Room', 'shiv shakti colony University road ', 'Rajkot', 2147483647, 'meetrooms@gmail.com', 'Not-Available', 'Non-Veg', 'Boys', 5, 3, 2, 18000, 1500, 50, '../uploads/images (1).jfif', '../uploads/images (2).jfif', '../uploads/images (23).jfif', '../uploads/download (3).jfif', '../uploads/images (22).jfif', '../uploads/images (26).jfif'),
(2, 'Urvi', 'Urvi', 'UV Hostel ', 'Hostel', 'near swami mandir', 'Gondal', 2147483647, 'UVhostels@gmail.com', 'Available', 'Veg', 'Girls', 15, 12, 3, 80000, 6700, 225, '../uploads/images (10).jfif', '../uploads/download (6).jfif', '../uploads/images (11).jfif', '../uploads/images (1).jfif', '../uploads/download (6).jfif', '../uploads/images (8).jfif'),
(4, 'Jeet', 'Jeet joshi', 'JK hostel', 'Hostel', 'Talav Gate Road ', 'Junagadh', 2147483647, 'JKhostels@gmail.com', 'Available', 'Veg', 'Boys', 20, 11, 9, 90000, 7500, 250, '../uploads/badhostels.jpg', '../uploads/download (2).jfif', '../uploads/download.jfif', '../uploads/download (4).jfif', '../uploads/images (27).jfif', '../uploads/images (24).jfif'),
(5, 'Darshil', 'Darshil Lunagariya', 'Khodal hostel', 'Hostel', 'Ranchod nagar', 'Ahmedabad', 2147483647, 'khodal@gmail.com', 'Available', 'Veg', 'Boys', 25, 10, 15, 100000, 8400, 280, '../uploads/download.jfif', '../uploads/badhostels.jpg', '../uploads/images (28).jfif', '../uploads/images (4).jfif', '../uploads/images (6).jfif', '../uploads/images (10).jfif'),
(6, 'Phileman ', 'Phileman Pius', 'Pp Rooms', 'Room', 'Satyanarayan Mandir Road', 'Jamnagar', 2147483647, 'pprooms@gmail.com', 'Not-Available', 'Non-Veg', 'Boys', 8, 5, 3, 20000, 1700, 60, '../uploads/images (1).jfif', '../uploads/images (26).jfif', '../uploads/images (8).jfif', '../uploads/images (2).jfif', '../uploads/images (11).jfif', '../uploads/images (1).jfif');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `g_num01` varchar(10) NOT NULL,
  `g_num02` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `username`, `password`, `fname`, `lname`, `number`, `email`, `city`, `gender`, `g_num01`, `g_num02`) VALUES
(1, 'Parth jain', '1234567890', 'Parth', 'Jain', '9080765498', 'jainparth@gmail.com', 'Rajkot', 'Male', '9876981234', '9087123432');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings_history`
--
ALTER TABLE `bookings_history`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `hr_admin`
--
ALTER TABLE `hr_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `hr_feedback`
--
ALTER TABLE `hr_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_table`
--
ALTER TABLE `hr_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings_history`
--
ALTER TABLE `bookings_history`
  MODIFY `booking_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_admin`
--
ALTER TABLE `hr_admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hr_feedback`
--
ALTER TABLE `hr_feedback`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_table`
--
ALTER TABLE `hr_table`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `hr_finder`
--
CREATE DATABASE IF NOT EXISTS `hr_finder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hr_finder`;

-- --------------------------------------------------------

--
-- Table structure for table `hr_table`
--

CREATE TABLE `hr_table` (
  `hr_id` int(255) NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `hr_type` varchar(255) NOT NULL,
  `hr_address` varchar(255) NOT NULL,
  `hr_city` varchar(255) NOT NULL,
  `hr_number` int(10) NOT NULL,
  `hr_email` varchar(255) NOT NULL,
  `hr_laundry` varchar(255) NOT NULL,
  `hr_food_type` varchar(255) NOT NULL,
  `hr_bg` varchar(255) NOT NULL,
  `hr_total_beds` int(255) NOT NULL,
  `hr_beds_avail` int(255) NOT NULL,
  `hr_beds_occup` int(255) NOT NULL,
  `hr_price_per_year` int(255) NOT NULL,
  `hr_price_per_month` int(255) NOT NULL,
  `hr_price_per_day` int(255) NOT NULL,
  `hr_build_img` varchar(255) NOT NULL,
  `hr_reception_img` varchar(255) NOT NULL,
  `hr_room_img01` varchar(255) NOT NULL,
  `hr_room_img02` varchar(255) NOT NULL,
  `hr_restroom01_img` varchar(255) NOT NULL,
  `hr_restroom02_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hr_table`
--

INSERT INTO `hr_table` (`hr_id`, `hr_name`, `hr_type`, `hr_address`, `hr_city`, `hr_number`, `hr_email`, `hr_laundry`, `hr_food_type`, `hr_bg`, `hr_total_beds`, `hr_beds_avail`, `hr_beds_occup`, `hr_price_per_year`, `hr_price_per_month`, `hr_price_per_day`, `hr_build_img`, `hr_reception_img`, `hr_room_img01`, `hr_room_img02`, `hr_restroom01_img`, `hr_restroom02_img`) VALUES
(1, 'Ravi', 'hostel', 'Ameen Marg Road, Opp Of Vishal Apartment', 'Rajkot', 1234509876, 'ravi@gmail.com', 'yes', 'veg', 'boys', 10, 5, 5, 85000, 5000, 300, 'uploads/underwater08.jpg', 'uploads/screen02-wallpaper.jpg', 'uploads/snowMountain.jpg', 'uploads/shipSmoke.jpg', 'uploads/screen03-wallpaper.jpg', 'uploads/Grass06.jpg'),
(2, 'Lounge Hostel', 'hostel', 'Near Sankirtan Templ, OPP of St. Mary School, KKV HALL', 'Rajkot', 2147483647, 'lounge@gmail.com', 'yes', 'veg', 'boys', 10, 5, 5, 108000, 9000, 400, 'uploads/MountainSky.jpg', 'uploads/Grass03.jpg', 'uploads/justSomething.jpg', 'uploads/kerala-nature-wallpaper.jpg', 'uploads/trunk.jpg', 'uploads/wallpaperflare.com_wallpaper (6).jpg'),
(3, 'Ravi Rooms', 'room', 'MunjkaGao', 'Rajkot', 2147483647, 'ravi@gmail.com', 'room', 'veg', 'boys', 20, 10, 10, 70000, 4000, 200, 'uploads/underwater08.jpg', 'uploads/eva-wallpaper.jpg', 'uploads/astra-alone-wallpaper.jpg', 'uploads/Anchor.jpg', 'uploads/boat01.jpg', 'uploads/MountainSky.jpg'),
(4, 'Vrundavan', 'hostel', 'MunjkaGao', 'Rajkot', 2147483647, 'vrundavan@gmail.com', 'room', 'veg', 'boys', 50, 25, 25, 75000, 4000, 300, 'uploads/plainLand.jpg', 'uploads/deadTree.jpg', 'uploads/plant.jpg', 'uploads/market-wallpaper.jpg', 'uploads/screen-wallpaper.jpg', 'uploads/AnglerFishCRFdarkINSTA.png'),
(5, 'abc', 'room', 'University ROAD', 'Rajkot', 2147483647, 'abc@gmail.com', 'room', 'veg', 'boys', 4, 3, 1, 70000, 2000, 300, 'uploads/AnglerFishINSTA01.png', 'uploads/justSomething.jpg', 'uploads/daredevil-wallpaper.jpg', 'uploads/Grass03.jpg', 'uploads/astra-alone-wallpaper.jpg', 'uploads/OldCar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_number` int(10) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `GNumber01` int(10) NOT NULL,
  `GNumber02` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_password`, `user_number`, `user_email`, `user_city`, `gender`, `GNumber01`, `GNumber02`) VALUES
(1, 'Hari', 'abcd', 1234567891, 'hari@gmail.com', 'Rajkot', 'male', 1234598761, 2147483647),
(2, 'Mahesh', 'qwert', 1234567891, 'mahesh@gmail.com', 'Surat', 'male', 1234598761, 2147483647),
(3, 'dilip', 'dilip', 2147483647, 'dilip@gmail.com', 'Surat', 'male', 2147483647, 971462314);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hr_table`
--
ALTER TABLE `hr_table`
  ADD PRIMARY KEY (`hr_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hr_table`
--
ALTER TABLE `hr_table`
  MODIFY `hr_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"crime_portal\",\"table\":\"police\"},{\"db\":\"crime_portal\",\"table\":\"head\"},{\"db\":\"crime_portal\",\"table\":\"update_case\"},{\"db\":\"crime_portal\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-02-16 17:10:53', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
