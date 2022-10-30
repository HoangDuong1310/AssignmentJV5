-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2022 at 08:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `fullname`, `email`, `photo`, `activated`, `admin`, `role`) VALUES
(2, 'TienNH24', '123456', 'Tien Nguyen', 'tiennh24@fpt.edu.vn', 'test.jpg', 0, 0, 0),
(3, 'admin', '1', 'admin', 'admin@gmail', 'admin', 0, 0, 0),
(4, 'user', '1', 'duongdtrai', 'user@gmail.com', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'sexy'),
(2, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `create_date`, `address`) VALUES
(1, 2, '2022-10-18', '98BG'),
(2, 3, NULL, 'dat dtrai'),
(3, 3, NULL, 'dat dtrai'),
(4, 3, NULL, 'dat dtrai so 1'),
(5, 3, NULL, 'số 52 ngõ 3 Nguyễn Văn Huyên'),
(6, 4, NULL, 'duong123'),
(7, 4, NULL, ''),
(8, 4, NULL, 'last test'),
(9, 3, NULL, 'abcdef'),
(10, 4, NULL, 'test phat cuoi cung');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 1, 1234, 1),
(2, 1, 1, 1234, 1),
(3, 3, 1, 1234, 3),
(4, 4, 1, 1234, 3),
(5, 4, 1, 1234, 1),
(6, 5, 2, 100000, 1),
(7, 5, 3, 100000, 1),
(8, 6, 1, 1234, 1),
(9, 6, 2, 100000, 1),
(10, 7, 1, 1234, 1),
(11, 8, 2, 100000, 1),
(12, 8, 18, 10000, 1),
(13, 8, 3, 100000, 1),
(14, 8, 8, 10000, 1),
(15, 9, 2, 100000, 1),
(16, 9, 3, 100000, 1),
(17, 10, 2, 100000, 2),
(18, 10, 3, 100000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `created_date` date NOT NULL DEFAULT current_timestamp(),
  `available` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `video`, `price`, `description`, `created_date`, `available`, `category_id`) VALUES
(1, 'abcd', 'abcd', NULL, 1234, '', '2022-10-12', 1, 1),
(2, 'Engage Kiss', 'engage-kiss-anime-key-visual-e1648271038542.jpg', 'https://www.youtube.com/embed/_xwq5xJB_KM', 100000, 'Thành phố Veyron — một đại đô thị nổi được tạo ra từ việc khám phá ra các nguồn năng lượng mới.Shuu, một thanh niên sở hữu và điều hành một doanh nghiệp nhỏ trong khu vực, có cuộc sống đạm bạc do thói tiêu xài hoang phí của mình. Kisara, một cô gái đến văn phòng và nhà của Shuu vì cô ấy thường xuyên quan tâm đến anh ấy. Cô làm việc khi đang học trung học ở thành phố Veyron, làm mọi việc từ công việc văn thư đến nội trợ. Ayano, bạn gái cũ của Shuu và là đồng nghiệp cấp cao tại tập đoàn mà anh từng làm việc trước đây, cũng lo lắng cho anh.Do đó, bắt đầu bộ phim hài lãng mạn hài hước của ba người trong một mối quan hệ hơi bất thường diễn ra trên một hòn đảo nhân tạo ở Thái Bình Dương.', '2022-10-25', 0, 1),
(3, 'Kinsou no Vermeil: Gakeppuchi Majutsushi wa Saikyou no Yakusai to Mahou Sekai wo Tsukisusumu', 'Kinsou-no-Vermeil-Gakeppuchi-Majutsushi-wa-Saikyou-no-Yakusai-to-Mahou-Sekai-wo-Tsukisusumu-Vermeil-in-Gold.jpg', 'https://www.youtube.com/embed/yfD9T7ymBoU', 100000, 'Học viện Phép thuật Hoàng gia Ortigia.Alto, đang trên bờ vực thất bại trong lớp học ma thuật triệu hồi và phải học lại năm đó, tình cờ gặp được một cuốn ma đạo thư và vẽ một vòng tròn ma thuật, triệu hồi con quỷ bị phong ấn Vermeil và biến cô trở thành Ma sứ của mình. Cô đã là một \"ác quỷ\" đáng sợ từ thời cổ đại và sở hữu sức mạnh khủng khiếp để gây ra những thảm họa.Vermeil, như Ma sứ quen thuộc, cần năng lượng ma thuật hàng ngày, mà cô ấy có được từ Alto thông qua những nụ hôn nồng cháy. Lilia, người bạn thời thơ ấu của Alto, trở nên ghen tị với mối quan hệ của họ, trong khi các học sinh cũng ngạc nhiên bởi sự quen thuộc chưa từng có. Câu chuyện tưởng tượng về con đường hoàng gia của một pháp sư trên bờ vực thất bại và một cô em gái quỷ không lành lặn bắt đầu!', '2022-10-25', 0, 1),
(5, 'Ma Vương Đi Làm', 'Hataraku-Maou-sama-2nd-Season-Ss2.jpg', 'https://www.youtube.com/embed/LxpTh8GKAL4', 0, 'Câu chuyện kể về cuộc sống tàn tạ, làm việc 24/7 của lão Quỷ Vương gian ác và thuộc hạ của lão sau khi bị các dũng sĩ đá đít tới một thế giới khác - Trái Đất Ừ thì đọc đến đó thôi là hết muốn coi chứ gì, còn nữa Được sống một cuộc sống ăn mày yên bình thì không nói gì, nhưng cái lũ từ bên thế giới cũ cứ lần lượt đến phá Trái đất, thế là biệt đội Quỷ Vương - Osin của Quỷ Vương - Tsundere Dũng Sĩ phải ngăn chúng lại.', '2022-10-25', 0, 1),
(7, 'testt', 'test.jpg', 'abcd', 100, 'test', '2022-10-25', 0, NULL),
(8, 'Kumichou Musume to Sewagakari, The Yakuza\'s Guide to Babysitting', 'image_750x500_61af0a87c828f.jpg', 'https://www.youtube.com/embed/LxpTh8GKAL4', 10000, 'NANNY CỦA BẠN LÀ AI?Tooru Kirishima là cánh tay phải của gia đình tội phạm Sakuragi. Đối với anh ta, công việc là một cái cớ hoàn hảo để cho bản năng bạo lực của anh ta bùng phát, khiến anh ta có biệt danh là \"Ác ma Sakuragi.\" Có vẻ như sẽ không có gì có thể cản đường bản chất xấu xa của anh ta. Nhưng rồi một ngày, anh ta nhận được một nhiệm vụ chưa từng có từ ông chủ — trông trẻ cho con gái của anh ta!Đây là câu chuyện cảm động (hay là vượt ngục?) Của một cô bé và người chăm sóc yakuza của cô ấy!', '2022-10-25', 0, 1),
(10, ' Rent-a-Girlfriend', 'animevsub-BjgKNpd9zX.jpg', 'https://www.youtube.com/embed/uIfxrlJg0Jw', 10000, 'Bị bạn gái vùi dập, sinh viên đại học Kazuya Kinoshita tan vỡ tình cảm cố gắng xoa dịu khoảng trống trong trái tim mình thông qua một cô bạn gái cho thuê từ một ứng dụng di động. Lúc đầu, Chizuru Mizuhara có vẻ là một cô gái hoàn hảo với tất cả những gì anh ấy có thể yêu cầu: ngoại hình tuyệt vời và tính cách dễ thương, chu đáo.Khi nhìn thấy những ý kiến ​​trái chiều trên trang cá nhân của cô ấy sau buổi hẹn hò đầu tiên và vẫn còn day dứt về mối quan hệ trước đó của mình, Kazuya tin rằng Chizuru chỉ đang đùa giỡn với trái tim của đàn ông và khiến cô ấy bị đánh giá tiêu cực. Tức giận vì sự thiếu tôn trọng của khách hàng đối với mình, Chizuru bộc lộ bản chất thật của mình: ngổ ngáo và nóng nảy, hoàn toàn trái ngược với ấn tượng đầu tiên của Kazuya. Đúng lúc đó, Kazuya nhận được tin bà mình suy sụp và buộc phải đưa Chizuru đến bệnh viện.Mặc dù mọi chuyện không có gì nghiêm trọng, nhưng bà của cậu ấy rất vui vì Kazuya cuối cùng đã tìm được một người bạn gái nghiêm túc, người luôn là mong ước của bà. Không thể nói cho cô ấy biết sự thật, Kazuya và Chizuru bị ép buộc vào một mối quan hệ giả - hành động như thể họ là người yêu thực sự.', '2022-10-25', 0, 1),
(12, 'Đảo Hải Tặc - One Piece', 'animevsub-NxQxhIAgug.jpg', 'https://www.youtube.com/embed/YAN45KAL5lg', 1000, 'Đảo Hải Tặc - One Piece là chuyện về cậu bé Monkey D. Luffy do ăn nhầm Trái Ác Quỷ, bị biến thành người cao su và sẽ không bao giờ biết bơi. 10 năm sau sự việc đó, cậu rời quê mình và kiếm đủ 10 thành viên để thành một băng hải tặc, biệt hiệu Hải tặc Mũ Rơm. Khi đó của phiêu lưu tìm kiếm kho báu One Piece bắt đầu. Trong cuộc phiêu lưu tìm kiếm One Piece, băng Hải tặc mũ rơm phải chiến đấu với nhiều băng hải tặc xấu khác cũng muốn độc chiếm One Piece và Hải quân của Chính phủ muốn diệt trừ hải tặc. Băng Hải tặc Mũ Rơm phải trải qua biết bao nhiêu khó khăn, không lùi bước với ước mơ \"Trở thành Vua Hải Tặc và chiếm được kho báu One Piece\".', '2022-10-25', 0, 1),
(14, 'Masamune-kun no Revenge R', 'animevsub-RbuyKKBUvw.jpg', 'https://www.youtube.com/embed/XmfXcVLA1d8', 10000, 'Makabe Masamune lúc nhỏ chỉ là một con heo vô dụng yếu đuối, nhưng từ khi tỏ tình thất bại với Adagaki, tuyệt vọng khi bị chế nhạo nên Makabe quyết tâm nỗ lực rèn luyện mình và vạch ra một kế hoạch hoàn hảo để trả thù Adagaki. Tám năm sau, cậu đã trở thành một anh chàng đẹp trai, thân hình đầy đặn với thành tích xuất sắc đậu vào trường của Adagaki đang học. Liệu cậu có thể trả thù hay không? Cùng nhau theo dõi câu chuyện nào...', '2022-10-25', 0, 1),
(16, 'Overlord', 'Overlord-Season-4-release-date-2022-anime.jpg', 'https://www.youtube.com/embed/3jE9moHQePI', 10000, 'Cốt truyện anime sẽ đưa khán giả đến năm 2138 trong tương lai, khi khoa học công nghệ phát triển vượt bậc và ngành game thực tế ảo đang nở rộ hơn bao giờ hết. Yggdrasil, một game online vô cùng phổ biến thời gian đó bỗng dưng bị đóng cửa đột ngột, nhưng nhân vật chính Momonga lại quyết định không thoát ra ngoài và khám phá những điều bí ẩn khi thế giới ảo quanh mình ngày một thay đổi.', '2022-10-25', 0, 1),
(18, 'Black Clover', 'animevsub-aOUyNcO702.jpg', 'https://www.youtube.com/embed/bEiQ-sMBwfQ', 10000, 'Asta và Yuno đã bị bỏ rơi cùng nhau tại cùng một nhà thờ và đã không thể tách rời kể từ đó. Khi còn trẻ, họ hứa sẽ cạnh tranh với nhau để xem ai sẽ trở thành Hoàng đế Magus tiếp theo. Tuy nhiên, khi chúng lớn lên, một số khác biệt giữa chúng trở nên đơn giản. Yuno là một thiên tài với ma thuật, với sức mạnh và khả năng kiểm soát tuyệt vời, trong khi Asta không thể sử dụng ma thuật chút nào, và cố gắng bù đắp cho sự thiếu hụt của mình bằng cách luyện tập thể chất. Khi họ nhận được Grimoa của họ ở tuổi 15, Yuno đã có một cuốn sách ngoạn mục với cỏ ba lá bốn lá (hầu hết mọi người đều có một cây cỏ ba lá), trong khi Asta không nhận được gì cả. Tuy nhiên, khi Yuno bị đe dọa, sự thật về sức mạnh của Asta đã được tiết lộ, anh đã nhận được một cây cỏ ba lá Grimoire, một cỏ ba lá đen! Bây giờ hai người bạn đang hướng tới trên thế giới, cả hai đều mong muốn cùng một mục tiêu!', '2022-10-25', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
