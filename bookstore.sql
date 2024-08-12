-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2023 lúc 04:58 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `anhsach`
--

CREATE TABLE `anhsach` (
  `masach` varchar(100) NOT NULL,
  `tenanh` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `anhsach`
--

INSERT INTO `anhsach` (`masach`, `tenanh`) VALUES
('BL', 'su-khung-hoang-cua-hoi-giao.jpg'),
('DVD_TNNCNTC', 'trac-nghiem-nang-cao-non-tru-cau.jpg'),
('EO_OP_1', 'one-piece-dao-hai-tac.jpg'),
('GB_MT', 'my-thuat-ve-chan-dung.jpg'),
('HPHT', 'bi-quyet-ve-but-chi.jpg'),
('IAU_DTBQT', '360-dong-tu-bat-quy-tac-va-12-thi-co-ban-trong-tieng-anh.jpg'),
('IAU_HCNT', 'nhung-tran-hai-chien-noi-tieng-the-gioi.jpg'),
('IAU_NL1D', 'nghin-le-mot-dem.jpg'),
('IAU_TNVL9', '360-cau-hoi-trac-nghiem-vat-ly-9-co-dap-an.jpg'),
('LNM', 'lich-su-y-hoc.jpg'),
('LTT_BCCKV', 'buratino-va-chiec-chia-khoa-vang.jpg'),
('ML', 'lich-su-nghe-thuat-phuong-tay.jpg'),
('NATDS', 'horrible-science-vi-sinh-vat-vi-tinh.jpg'),
('NATDS_HH_VNAV', 'horrible-science-hoa-hoc-mot-vu-no-am-vang.jpg'),
('NNA_CT1VDTT', 'cho_toi_xin_mot_ve_di_tuoi_tho__nguyen_nhat_anh.jpg'),
('NNT_S', 'song-nguyen-ngoc-tu.jpg'),
('NTHB', 'tu-hoc-tieng-anh-hieu-qua.jpg'),
('PGTDS', 'horrible-science-vat-ly-cau-chuyen-cua-nhung-luc-bi-hiem.jpg'),
('PKN_PPGN_SH9', 'phuong-phap-giai-nhanh-cac-dang-bai-tap-sinh-hoc.jpg'),
('TBD_LSVN', 'lich-su-viet-nam-bang-tranh-tap-1-thoi-hung-vuong.jpg'),
('TBD_LSVN_TAP8', 'lich-su-viet-nam-bang-tranh-tap-8-thoi-le-so.jpg'),
('TE', 'tai-sao-mac-dung.jpg'),
('TL_KTDBB', 'ky-thuat-danh-bong-ban.jpg'),
('TT_NLNCS', 'nhin-len-nhung-chom-sao.jpg'),
('WJB', 'lich-su-giao-thuong-thuong-mai-dinh-hinh-the-gioi-nhu-the-nao.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `machitietdonhang` int(11) NOT NULL,
  `madonhang` varchar(100) NOT NULL,
  `masach` varchar(100) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`machitietdonhang`, `madonhang`, `masach`, `soluong`) VALUES
(1, 'DH_1', 'BL', 5),
(2, 'US_111_1', 'LNM', 5),
(3, 'US_111_2', 'NNA_CT1VDTT', 5),
(4, 'US_12_1', 'NNA_CT1VDTT', 6),
(5, 'US_12_1', 'NATDS_HH_VNAV', 6),
(6, 'US_12_2', 'LNM', 3),
(7, 'US_12_3', 'NNA_CT1VDTT', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `madonhang` varchar(100) NOT NULL,
  `makhachhang` varchar(100) NOT NULL,
  `ngaydathang` date NOT NULL,
  `tinhtrang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`madonhang`, `makhachhang`, `ngaydathang`, `tinhtrang`) VALUES
('DH_1', 'US_11111', '2023-12-07', 1),
('US_111_1', 'US_111', '2023-12-15', 1),
('US_111_2', 'US_111', '2023-12-15', 2),
('US_12_1', 'US_12', '2023-12-15', 1),
('US_12_2', 'US_12', '2023-12-15', 2),
('US_12_3', 'US_12', '2023-12-15', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `makhachhang` varchar(100) NOT NULL,
  `masach` varchar(100) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`makhachhang`, `masach`, `soluong`) VALUES
('US_111', 'ML', 15),
('US_111', 'HPHT', 1),
('US_111', 'BL', 1),
('US_12', 'NTHB', 3),
('US_12', 'BL', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `makhachhang` varchar(100) NOT NULL,
  `hoten` varchar(100) NOT NULL,
  `gioitinh` varchar(100) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `diachi` varchar(100) NOT NULL,
  `sdt` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `idtaikhoan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`makhachhang`, `hoten`, `gioitinh`, `ngaysinh`, `diachi`, `sdt`, `email`, `idtaikhoan`) VALUES
('AD_1', 'Hoàng Thị Hồng Thắm', 'Nữ', '2003-04-11', 'Phú Lộc, Huế', '0123123123', 'htht@gmail.com', 4),
('AD_11', 'ADMIN2', 'Nam', '2005-12-22', 'Huế', '09012312388', 'admin2@gmail.com', 2),
('US_11', 'Trần Thị Hồng Nhung', 'Nữ', '2014-12-10', 'Huế', '0123123123', 'hghg@gmail.com', 6),
('US_111', 'Nguyễn Phan Bảo Lộc', 'on', '2003-09-20', 'Huế', '0905721218', 'npbl.cntt@gmail.com', 7),
('US_12', 'USER1', 'Nữ', '2015-12-16', 'Nghệ An', '09332484333', 'user1@gmail.com', 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `masach` varchar(100) NOT NULL,
  `tensach` varchar(100) NOT NULL,
  `tacgia` varchar(100) NOT NULL,
  `nxb` varchar(100) NOT NULL,
  `idtheloai` int(11) NOT NULL,
  `giaban` float NOT NULL,
  `soluongtong` int(11) DEFAULT NULL,
  `soluongconlai` int(11) DEFAULT NULL,
  `giamgia` int(11) DEFAULT NULL,
  `mota` text NOT NULL,
  `soluongdaban` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`masach`, `tensach`, `tacgia`, `nxb`, `idtheloai`, `giaban`, `soluongtong`, `soluongconlai`, `giamgia`, `mota`, `soluongdaban`) VALUES
('BL', 'Sự Khủng Hoảng Của Hồi Giáo', 'David', 'NXB Tre', 8, 2222220, 12, 10, 10, 'Tổng thống Bush và các chính khách phương Tây đã khá chật vật để chỉ ra rằng cuộc chiến mà nước Mỹ đang tham gia là cuộc chiến chống lại chủ nghĩa khủng bố − chứ không phải là chống người Ả Rập, hoặc nói rộng hơn là chống lại người Hồi giáo, là những người được khuyến khích cùng chung sức với chúng ta trong cuộc chiến chống kẻ thù chung. Nhưng thông điệp của Usama bin Ladin thì khác hẳn. Đối với bin Ladin và những người theo ông ta đây là một cuộc chiến tôn giáo, một cuộc chiến của người Hồi giáo chống lại những kẻ vô đạo, và vì thế đương nhiên là chống lại nước Mỹ, cường quốc lớn nhất trong thế giới của những kẻ vô đạo.  Trong các tuyên bố của mình, bin Ladin luôn luôn dẫn chứng lịch sử. Một trong những dẫn chứng gây ấn tượng nhất được nêu trong cuốn băng video ngày 7 tháng Mười năm 2001, về “sự ô nhục và tủi hổ mà đạo Hồi đã phải gánh chịu trong hơn 80 năm qua”. Đối với bối cảnh Trung Đông, đa số các nhà quan sát người Mỹ − và đương nhiên, có người Âu − bối rối bắt đầu tìm hiểu cái gì đã xảy ra “trong hơn 80 năm trước” và cuối cùng đưa ra nhiều câu trả lời khác nhau. Chúng ta có thể tin phần nào là những đối tượng của bin Ladin hiểu rõ ngay ý nghĩa những lời nói bóng gió này', 5),
('DVD_TNNCNTC', 'Trắc Nghiệm Nâng Cao Nón – Trụ – Cầu', 'Đặng Việt Đông', 'NXB Trẻ', 3, 320000, 10, 10, 0, '“Trắc nghiệm nâng cao nón – trụ – cầu” của thầy Đặng Việt Đông sư tầm và tổng hợp bao gồm các bài toán trắc nghiệm được tuyển chọn từ các đề thi thử môn Toán, tài liệu thích hợp cho học sinh khá, giỏi ôn luyện điểm 8 – 9 – 10 trong kỳ thi THPT Quốc gia môn Toán.  Tài liệu gồm các chủ đề sau:  Chủ đề Mặt nón – khối nón Chủ đề Mặt trụ – khối trụ Chủ đề Mặt cầu – khối cầu Chủ đề Mặt tròn xoay – khối tròn xoay Chủ đề Ứng dụng thực tế', 0),
('EO_OP_1', 'One Piece – Đảo Hải Tặc - Tập 1', '', 'NXB Trẻ', 5, 75000, 25, 25, 12, 'One Piece là câu truyện kể về Luffy và các thuyền viên của mình. Khi còn nhỏ, Luffy ước mơ trở thành Vua Hải Tặc. Cuộc sống của cậu bé thay đổi khi cậu vô tình có được sức mạnh có thể co dãn như cao su, nhưng đổi lại, cậu không bao giờ có thể bơi được nữa. Giờ đây, Luffy cùng những người bạn hải tặc của mình ra khơi tìm kiếm kho báu One Piece, kho báu vĩ đại nhất trên thế giới.  Trong One Piece, mỗi nhân vật trong đều mang một nét cá tính đặc sắc kết hợp cùng các tình huống kịch tính, lối dẫn truyện hấp dẫn chứa đầy các bước ngoặt bất ngờ và cũng vô cùng hài hước đã biến One Piece trở thành một trong những bộ truyện nổi tiếng nhất không thể bỏ qua. Hãy đọc One Piece để hòa mình vào một thế giới của những hải tặc rộng lớn, đầy màu sắc, sống động và thú vị, cùng đắm chìm với những nhân vật yêu tự do, trên hành trình đi tìm ước mơ của mình.', 0),
('GB_MT', 'Mỹ Thuật Vẽ Chân Dung', 'Gia Bảo', 'NXB Trẻ', 7, 72000, 10, 10, 0, 'Quyển sách Mỹ Thuật Vẽ Chân Dung sẽ hướng dẫn người học cách cảm nhận về vẽ chân dung thông qua những bài học cụ thể:  I. Giải phẫu đầu và năm giác quan  II. Cấu tạo và hình thể đặc trưng của ngũ quan (năm giác quan)  III. Phân biệt tuổi và giới tính của cơ đầu  IV. Phương pháp quan sát để vẽ chân dung  V. Phương pháp vẽ chân dung  VI. Phác họa kết cấu và phác họa độ sáng tối  VII. Giải thích các bước tiến hành phác họa chân dung  VIII. Tiêu chuẩn đánh giá và yêu cầu cơ bản khi thi vẽ chân dung  IX. Phương án giải quyết và các vấn đề khác thường xuất hiện khi đánh giá và thi vẽ chân dung  X. Các yếu tố khác liên quan đến vấn đề thi vẽ chân dung  XI. Đánh giá tác phẩm  Đây là tài liệu tham khảo hữu ích dành cho các sinh viên đang theo học chuyên ngành mỹ thuật.', 5),
('HPHT', 'Bí Quyết Vẽ Bút Chì', 'Huỳnh Phạm Hương Trang', 'NXB Trẻ', 7, 72000, 10, 10, 0, 'Bài tập bắt đầu từ các bước cơ bản nhất: Sử dụng bút chì, tạo nên các sắc độ, tạo các hình khối và các nét cơ bản. Tiếp đến là các nguyên tắc của hình họa, phong cảnh, chân dung động vật…Cuốn sách này trình bày các bước rất chậm rãi, và bạn cũng cần như thế, từng bước một thực hiện các bước này.   Thông thường, người lực sĩ trước khi bước vào cuộc chơi phải bắt đầu từ bài tập hâm nóng cơ thể, người nghệ sĩ cũng vậy, luyện tập thật nhuần nhuyễn trước khi nhận lời thách thức với trang giấy trắng. Đó là nguyên tắc.', 0),
('IAU_DTBQT', '360 Động Từ Bất Quy Tắc Và 12 Thì Cơ Bản Trong Tiếng Anh', 'Nhiều tác giả', 'NXB Trẻ', 3, 220000, 10, 10, 5, 'Cuốn sách này như một người bạn luôn nhắc nhở bạn dùng chính xác các dạng nguyên thể, quá khứ và phân từ của động từ. Mỗi động từ chúng tôi có đưa ra ví dụ để bạn có thể hiểu đươc cách dùng của động từ đó.để nhớ và dùng các động từ bất quy tắc này một cách tốt nhất các bạn lên học thuộc các ví dụ, từ đó các bạn sẽ nhớ được tình huống và vận dụng các động từ này một cách hiệu quả nhất', 0),
('IAU_HCNT', 'Những Trận Hải Chiến Nổi Tiếng Thế Giới', 'Nhiều tác giả', 'NXB Trẻ', 8, 110000, 10, 10, 15, 'Cuốn sách không chỉ dừng lại ở việc mô tả chi tiết bối cảnh, kế hoạch, lực lượng tham chiến, diễn biến và kết quả 12 trận hải chiến nổi tiếng từ năm 480TCN đến 1982, mà còn đi sâu phân tích ý nghĩa, bài học kinh nghiệm để qua đó độc giả có thể hình dung một cách tương đối khái quát tiến trình phát triển của lực lượng hải quân trên thế giới.', 11),
('IAU_NL1D', 'Nghìn Lẻ Một Đêm', 'Nhiều tác giả', 'NXB Trẻ', 5, 55000, 7, 7, 10, 'Nghìn lẻ một đêm, tác phẩm vĩ đại bậc nhất của nền văn học A Rập, là một trong những công trình sáng tạo phong phú và hoàn mỹ của nền văn học thế giới.  Để tựa bản dịch tiếng Nga xuất bản năm 1929 ở Sankt Peterburg, Macxim Gorki viết: “Trong số các di tích tuyệt diệu của sáng tác truyền khẩu dân gian, các truyện cổ tích của nàng Sêhêrazát là di tích đồ sộ nhất.  Những truyện cổ tích này thể hiện với mức hoàn hảo kỳ diệu, xu hướng của nhân dân lao động muốn buông mình theo phép nhiệm màu của những ảo giác êm đẹp, theo sự kết hợp phóng khoáng của từ ngữ thể hiện sức mạnh vũ bão của trí tưởng tượng hoa mỹ của các dân tộc phương Đông – người A Rập, người Ba Tư, người Ấn Độ. Công trình dệt gấm bằng từ ngữ này xuất hiện từ thời tối cổ, những sợi tơ muôn màu của nó lan khắp bốn phương, phủ lên trái đất một tấm thảm từ ngữ đẹp lạ lùng.”  Truyện mở đầu tất cả các truyện, giải thích lý do ra đời của tất cả các truyện, cái khâu đầu tiên của sợi dây chuyền vàng xuyên qua mọi tình tiết, liên kết chúng lại thành một chuỗi ngọc tuyệt tác muôn vẻ muôn màu rồi vòng trở lại để làm thành đoạn kết thúc, là chuyện của một người con gái. Một người con gái tài sắc vẹn toàn, thông minh rất mực, đã không quản hiểm nguy dám hi sinh tấm thân ngà ngọc của mình để cứu các bạn gái khỏi cảnh ô nhục và cái chết bi thương….', 25),
('IAU_TNVL9', '360 Câu Hỏi Trắc Nghiệm Vật Lý 9 – Có Đáp Án', 'Nhiều tác giả', 'NXB Trẻ', 3, 172000, 10, 10, 0, 'Cuốn sách 360 câu hỏi trắc nghiệm vật lý 9 có đáp án giúp các em, rèn luyện, nắm vựng kiến thức để trả lời tốt các câu trắc nghiệm tương ứng với cac nội dung trong sách giáo khoa 9. Cuối mỗi chương có phần hướng dẫn trả lời và đáp án giúp các em học sinh có thể kiểm tra kết quả.', 0),
('LNM', 'Lịch Sử Y Học', 'Lois N.Magner', 'NXB Trẻ', 8, 110000, 10, 0, 0, 'Cuốn lịch sử Y học viết về sự phát triển của ngành nghề chăm sóc sức khỏe con người qua các thời đại và ở các nền văn hóa khác nhau. Khác một chút với việc đọc các bài viết về Lịch sử, hoặc lịch sử các ngành khoa học như Vật lý, Toán học hay Sinh học, là những việc nghiêng về sở thích riêng của từng người, việc đọc cuốn Lịch sử Y học, nên là nhu cầu của tất cả con người có khát khao sống khỏe mạnh và có ý nghĩa. Đọc cuốn sách này, bạn sẽ thôi cho rằng phó mặc hoàn toàn sức khỏe của bạn cho bác sĩ là một điều khôn ngoan. Bạn cũng sẽ hiểu rằng mặc dù có những tiến bộ vượt bậc và thần kỳ trong hiểu biết của con người về vấn đề sức khỏe trong hai thế kỷ qua, chúng ta vẫn đang thất bại trước những căn bệnh hoặc vấn đề từng là cơn đau đầu của những thầy thuốc thời cổ đại và cận đại, ví dụ như ung thư, các bệnh truyền nhiễm, các bệnh tâm thần và bệnh thoái hóa. Và cuối cùng, bạn sẽ nhận ra rằng cuộc đời mình cũng chỉ là một phần nhỏ trong lịch sử loài người, và rất có thể con cháu vài chục thế hệ sau của bạn khi được đọc về phần lịch sử Y học ở thế kỷ XXI cũng không thể không lắc đầu cười về những \"ấu trĩ\" của xã hội hiện hành.  Lịch sử Y học cũng là một món ăn tinh thần rất bổ ích cho các y bác sĩ đang ngày đêm làm công tác chăm sóc sức khỏe cho chúng ta. Giống như nhu cầu tìm hiểu về cuộc sống thời thơ ấu và quá khứ của người mình yêu thương, những hiểu biết tường tận hơn về quá trình phát triển của Y học như một ngành nghề hiện nay chắc chắn sẽ mang lại luồng sinh khí mới trong công việc, để yêu nghề hơn và để biết cần phải làm gì để tránh biến mình trở thành \"lịch sử\".', 20),
('LTT_BCCKV', 'Buratino Và Chiếc Chìa Khoá Vàng', 'Lep Tônxtoi', 'NXB Trẻ', 5, 99000, 7, 7, 0, 'Bác thợ mộc Giudéppơ tình cờ nhặt được một thanh củi biết nói, bác liền tặng thanh củi đó cho ông bạn già Cáclô. Bác Cáclô đem món quà kỳ lạ về nhà và gọt thành một con búp bê gỗ đặt tên là Buratinô. Một con búp bê trông giống hệt một cậu bé với cái mũi thật dài. Buratinô trong sáng, thông minh nhưng rất hiếu động và nghịch ngợm. Cũng chính vì tính hiếu động đó mà cậu bé đã gây nên cho mình không ít rắc rối. Trong một lần trốn học đi chơi, Buratino bị Mèo Madilio và Cáo Alixa lừa lấy mất tiền và bị bọn cướp tấn công. Lạc mất gia đình, cậu bé người gỗ bắt đầu bước vào những chuyến phiêu lưu đầy kỳ thú, bất ngờ nhưng cũng không ít nguy hiểm và sóng gió. Đặc biệt là cuộc hành trình khám bí mật về chiếc chìa khóa vàng mà Buratino được chú rùa Toóctila tặng cho…  Dựa trên câu chuyện cổ tích nổi tiếng về cậu bé Pinốckiô, bằng trí tuởng tượng phong phú và giọng văn miêu tả tuyệt vời của mình, nhà văn Alếc xây – Tôn xtôi đã kể lại một cách vô cùng mới mẻ, sinh động và hấp dẫn những chuyến phiêu lưu của chú bé người gỗ thông minh, tinh nghịch đáng yêu Buratinô. Alếc xây – Tôn xtôi đã khiến cho hình tượng chú bé người gỗ mũi dài vốn đã quen thuộc lại càng trở nên gần gũi và đáng yêu hơn trong lòng bạn đọc.  Cuốn sách được trình bày đẹp mắt với nhiều tranh vẽ minh họa sinh động và hấp dẫn là một món quà tặng tuyệt vời dành cho các bạn nhỏ.', 0),
('ML', 'Lịch Sử Nghệ Thuật Phương Tây', 'Michael Levey', 'NXB Trẻ', 7, 72000, 10, 9, 0, 'Nghệ thuật là phương tiện diễn đạt ý tưởng và cảm xúc bằng hình tượng. Từ thời mông muội, con người đã có bản năng hướng đến cái đẹp. Nhu cầu đó thúc đẩy không ngừng sự tiến hóa và sáng tạo của các bộ môn nghệ thuật. Nó không chỉ thể hiện năng lực tưởng tượng của con người mà còn phản ánh một phần thực tế cuộc sống.  Khác với âm nhạc, nghệ thuật tạo hình truyền cảm thức đến người thưởng ngoạn từ tốn hơn, không chỉ đòi hỏi sự đồng cảm, mà còn phải có kiến thức nhất định về tôn giáo, về lịch sử… Chúng ta chỉ có thể thưởng thức đầy đủ, rốt ráo hơn một tác phẩm nghệ thuật nếu hiểu thấu bối cảnh, mục đích nguyên thủy của nó cùng tiêu chí các trường phái sáng tác.  Với tất cả khát khao vượt qua những gì đã định hình trước đó, nghệ thuật mãi mãi không ngừng được tìm kiếm và sáng tạo.', 1),
('NATDS', 'Horrible Science – Vi Sinh Vật Vi Tính', 'Nick Arnold - Tony De Saulles', 'NXB Trẻ', 2, 179000, 10, 10, 0, 'Cuốn sách thuộc bộ Horrible Science, được trình bày bằng giọng văn và các minh họa hài hước quen thuộc của hai tác giả Nick Arnold và Tony De Saulles giúp bạn dễ dàng làm quen với kiến thức cơ bản nhất liên quan đến các loại vi khuẩn vi sinh.  Những hình vẽ và lời giản dị dễ hiểu – như những đoạn truyện tranh  hấp dẫn giúp bạn dễ tưởng tượng ra thế giới của những “động vật” tí hon, cùng với tên tuổi những nhà bác học trong ngành, những kết luận khoa học và nhất là những lời khuyên thực tế, hữu hiệu vô giá, những cảnh báo quan trọng cho lối sống hiện đại … Và nhờ thế mà cuốn sách được nhiều giải thưởng về sách khoa học dành cho thiếu nhi và được đông đảo bạn đọc từ trẻ em đến người lớn tìm đọc.', 33),
('NATDS_HH_VNAV', 'Horrible Science – Hóa Học – Một Vụ Nổ Ầm Vang', 'Nick Arnold - Tony De Saulles', 'NXB Trẻ', 2, 235000, 10, 4, 0, 'Hóa học chỉ là thứ bốc mùi nồng nặc? Nghe đến từ này là bạn thấy hiện lên trong đầu mình toàn những phân tử rối rắm và những lý thuyết khô cằn? Nếu thế thì rõ là bạn chưa biết đến những khía cạnh thật sự thu hút đến điên khùng của môn Hóa. Ví dụ: Những thí nghiệm thất bại đến mức không thể thất bại hơn, Những quả bom hôi thối nhất thế giới, Hoặc phương pháp đơn giản nhất để làm ra vàng  Những bức tranh minh họa độc đáo, những chùm câu đố đặc sắc, những thí nghiệm ma quái và những câu chuyện ngoài sức tưởng tượng sẽ chỉ cho các bạn thấy tất cả những bộ mặt thật sự thú vị của Hóa học. Một số thứ khó tin đến mức cả các thầy giáo của bạn cũng sẽ phải sững sờ? Lúc đó thì Hóa học sẽ trở thành một VỤ NỔ ẦM VANG.', 21),
('NNA_CT1VDTT', 'Cho tôi một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'NXB Trẻ', 1, 175000, 3, -11, 20, 'Truyện Cho tôi xin một vé đi tuổi thơ là tác phẩm mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời trang bé, tính cách thật thà, thẳng thắn một cách thông minh và hoang dại, những ước mơ tự do trong lòng… làm cuốn sách có thể làm các bậc phụ huynh lo lắng rồi tự khuyên. Không thích hợp cho người đọc trẻ, cuốn sách vẫn có hướng dẫn hấp dẫn và thực sự có ích cho người lớn trong quan hệ.', 107),
('NNT_S', 'Sông', 'Nguyễn Ngọc Tư', 'NXB Trẻ', 1, 202000, 5, 5, 0, 'Cuốn tiểu thuyết đầu tay của nhà văn Nguyễn Ngọc Tư mang đến một trải nghiệm đầy đổi mới và sáng tạo. Với sự kết hợp giữa cái đẹp và cái đạo lý, cuốn sách khám phá về sự trần tục và hư ảo trong cuộc sống. Kết thúc bằng một dấu chấm hỏi, tác phẩm đặt ra câu hỏi về số phận con người và để người đọc tự nuôi dưỡng ý nghĩa của nó.', 0),
('NTHB', 'Tự Học Tiếng Anh Hiệu Quả', 'Nguyễn Thị Hà Bắc', 'NXB Trẻ', 3, 157000, 10, 10, 0, 'Nếu  như bạn  mong  muốn  giao  tiếp  tiếng  Anh  thành  thạo,  chuyên nghiệp từ 3 tới 6 tháng thì cuốn sách này sẽ làm bạn thất vọng. Thực tế cho thấy chưa có ai mới bắt đầu học tiếng  Anh có thể giao tiếp được trôi chảy trong thời gian từ 3 – 6 tháng. Đó là ảo tưởng. Nhưng nếu như bạn đang tìm kiếm làm như thế nào có thể sử dụng tiếng Anh giao tiếp thành thạo, chuyên nghiệp trong 1 năm tới thì xin chúc mừng  bạn.  Tôi tin rằng  những  bí  mật  được tiết  lộ  trong  cuốn sách này sẽ làm bạn thỏa mãn với điều đó.   Có rất nhiều người học tiếng Anh lâu năm nhưng vẫn không giao tiếp được. Có những người học tiếng Anh tại các trung tâm khác nhau nhưng vẫn không giao tiếp được. Hầu hết chúng ta học ngoại ngữ gần 12 năm cũng không giao tiếp được. Phải chăng có điều gì đó mà những người chúng ta còn thiếu?     Cuốn sách này sẽ chỉ ra cho bạn thấy yếu tố then chốt để thành công với  tiếng Anh. Nó không phải là phương pháp học, nó cũng không phải là môi trường, cũng không phải là đối tác ..   Tuy nhiên trong bất kỳ cuộc thi hay cuộc chơi nào cũng vậy cả, thường chỉ có 5% là những người xuất sắc vượt trội và đạt được những thành tích đáng ngưỡng mộ. Chính vì vậy bạn có quyền lựa chọn, ở khu vực 95% hay 5% là do bạn quyết định. Rất nhiều người đọc cuốn sách này. Nhưng 95% mọi người không đọc hết nó và đó chính là cách mà những người đó đã thất bại. Bởi vì cách mà họ bỏ cuộc trong một cuộc thi nhỏ là đọc hết một cuốn sách này thì đó cũng chính là cách họ bỏ cuộc trong hành trình học tiếng anh.  Nhưng tôi tin, bạn sẽ lựa chọn đứng vào top 5% những người xuất sắc nhất, phải không nào?  Nếu như bạn đã sẵn sàng để sử dụng tiếng Anh trong 1 năm tới thì tôi  tin  chắc rằng  đây  chính  là  quyển  sách  quan trọng  nhất  mà  bạn cần  đọc.  Hãy  đọc,  tin tưởng  và  thực  hành.  Tôi tin  rằng  bạn  sẽ  đạt được kết quả kỳ diệu trong 1 năm tới.', 0),
('PGTDS', 'Horrible Science – Vật Lý, Câu Chuyện Của Những Lực Bí Hiểm', 'Phil Gates, Tony De Saulles', 'NXB Trẻ', 2, 217000, 10, 10, 0, 'Lực có thể mang lại những hậu quả nghiêm trọng. Ví dụ như khi bạn bị kẹt ngón tay vào khe cửa của lớp học, nguyên nhân không phải do ai đó khép cửa quá nhanh, mà thủ phạm ở đây là lực; lực còn có thể làm bạn bị té hay gây ra vụ nổ trong vũ trụ…  Qua những câu chuyện và tranh vẽ hài hước của cuốn sách này, bạn có thể đọc được rất nhiều điều thú vị về lực, về cách mà nó quyết định cuộc sống chúng ta… Tất cả đều có thật, rất có thể các loại lực rồi cũng sẽ tạo nên một lực hấp dẫn không thể cưỡng nổi đối với bạn', 21),
('PKN_PPGN_SH9', 'Phương Pháp Giải Nhanh Các Dạng Bài Tập Sinh Học', 'Phan Khắc Nghệ', 'NXB Trẻ', 3, 212000, 10, 10, 0, 'Cuốn sách “ Phương pháp giải nhanh các dạng bài tập Sinh học” được viết bám sát chương trình môn sinh học THPT theo hướng tăng cường rèn luyện các kĩ năng vận dụng trí thức, kĩ năng giải nhanh các dạng bài tập cho học sinh. Trong cuốn sách này chúng tôi đã đưa ra những cách giải độc đáo, ngắn gọn nhất, giúp học sinh dễ dàng hiểu được kiến thức trọng tâm và làm tốt các bài thi trong các kì thi tuyển sinh đại học, chọn lọc học sinh giỏi.  Nội dung của mỗi phần được trình bày theo 3 mục:  – Tóm tắc lý thuyết  – Các dạng bài tập và phương pháp giải  – Bài tập vận dụng và đáp án  Hi vọng, cuốn sách này không chỉ là một tài liệu tham khảo hữu ích giúp học sinh tự học mà còn là một tư liệu quý để giáo viên tham khảo sử dụng trong công tác bồi dưỡng và phụ đạo cho học sinh.', 0),
('TBD_LSVN', 'Lịch Sử Việt Nam Bằng Tranh (Tập 1) – Thời Hùng Vương', 'Trần Bạch Đằng', 'NXB Trẻ', 8, 174000, NULL, NULL, 0, 'Lịch Sử Việt Nam Bằng Tranh là nỗ lực đáng trân trọng của tác giả nhằm phản ánh đất nước và con người Việt Nam theo đúng tiến trình lịch sử với không gian, văn hóa, y phục, tính cách phù hợp với từng thời kỳ, triều đại cụ thể. Bộ sách gồm nhiều tập, mỗi tập viết về thời kỳ hay một nhân vật, một vấn đề tiêu biểu của thời kỳ đó.  Tập 1 giới thiệu về lịch sử nước ta thời Cổ đại xuyên suốt từ người Việt cổ đến thời Hùng Vương dựng nước.', 0),
('TBD_LSVN_TAP8', 'Lịch Sử Việt Nam Bằng Tranh (Tập 8) – Thời Lê Sơ', 'Trần Bạch Đằng', 'NXB Trẻ', 8, 110000, 10, 10, 7, 'Lịch Sử Việt Nam Bằng Tranh là nỗ lực đáng trân trọng của tác giả nhằm phản ánh đất nước và con người Việt Nam theo đúng tiến trình lịch sử với không gian, văn hóa, y phục, tính cách phù hợp với từng thời kỳ, triều đại cụ thể. Bộ sách gồm nhiều tập, mỗi tập viết về thời kỳ hay một nhân vật, một vấn đề tiêu biểu của thời kỳ đó.  Tập 8 giới thiệu về những diễn biến lịch sử và dấu ấn thời đại triều Lê sơ.', 0),
('TE', 'Tại Sao Mác Đúng?', 'Terry Eagleton', 'NXB Trẻ', 8, 110000, 10, 10, 0, 'Tại sao Mác đúng? là một tác phẩm có giá trị tham khảo tốt, mang lại cho chúng ta thêm một cách nhìn mới, một cơ sở mới để củng cố niềm tin vào chủ nghĩa Mác với vai trò là nền tảng tư tưởng của công cuộc cách mạng xây dựng phát triển đất nước theo con đường xã hội chủ nghĩa.', 0),
('TL_KTDBB', 'Kỹ Thuật Đánh Bóng Bàn', 'Thanh Long', 'NXB Trẻ', 7, 72000, 10, 9, 0, 'Cùng với sự phát triển của kỹ thuật môn bóng bàn, sự biến hóa về đường bóng, biến hóa về điểm rơi khi đánh bóng cũng ngày một phát triển không ngừng. Điều này đòi hỏi vận động viên bóng bàn cần phải di chuyển bước chân nhanh hơn để đảm bảo tính chính xác của động tác chi trên và phát huy sở trường kỹ chiến thuật cá nhân. Ngược lại, nếu như di chuyển bước không tốt thì không thể đảm bảo cho chi trên thực hiện động tác đánh bóng chính xác. Tính chuẩn xác của bước chân và chất lượng đánh bóng có ảnh hưởng trực tiếp tới hiệu quảcủa việc sử dụng kỹ thuật sở trường của vận động viên. Vì vậy để đánh bóng bàn được tốt, nhất định phải nắm vững kỹ thuật di chuyển bước.', 12),
('TT_NLNCS', 'Nhìn Lên Những Chòm Sao', 'Trần Thời', 'NXB Trẻ', 2, 119000, 10, 10, 2, 'Ở các nước có ngành khoa học không gian tiến bộ trên thế giới thì bộ môn Thiên Văn học được đưa vào chính khóa trong các trường phổ thông. Môn học này có sức lôi cuốn các em học sinh một cách đặc biệt, vì sự hấp dẫn của nó. Ở đây, các em còn được thực hành quan sát ở những kính thiên văn hiện đại cùng với những mô hình y như thật để dễ hình dung. Theo thống kê của các nhà nghiên cứu về tuổi thọ của loài người trên thế giới, thì các nhà Thiên Văn học thường có tuổi thọ cao hơn nhiều so với các ngành khoa học khác. Kết luận đó có lẽ cũng hoàn toàn thuyết phục, bởi vì, hình như một khi con người đêm đêm nhìn lên bầu trời đầy sao, thấy vũ trụ mênh mông vô tận, lòng người bình thản lại, không còn háo thắng đua tranh. Con người cảm nhận được sự nhỏ nhoi của mình, do đó gạt bỏ những mối ưu tư và sống lâu hơn.  Có một nhà hiền triết đã nói rằng, con người sở dĩ văn minh được là vì họ đã biết ngước nhìn lên bầu trời thăm thẳm.   Trong phạm vi hạn hẹp của quyển sách nhỏ này, chúng tôi chỉ đề cập đến sự hiện diện của các chòm sao trên bầu trời. Hầu qua đó, chúng ta sẽ được tự trang bị thêm cho kiến thức cuộc sống một hiểu biết sơ đẳng nhất về vũ trụ. Chắc chắn nó sẽ giúp ích ít nhiều cho các bạn trẻ thích tìm hiểu, thám hiểm…  Càng tìm tòi, chúng ta sẽ càng thấy say mê. Nào, bây giờ mời các bạn hãy mở sách ra. Chúng ta cùng xem nhé!', 22),
('WJB', 'Lịch Sử Giao Thương: Thương Mại Định Hình Thế Giới Như Thế Nào?', 'William J. Bernstein', 'NXB Trẻ', 8, 110000, 10, 10, 0, '“Toàn cầu hóa” hóa ra không phải là một hay thậm chí là một chuỗi sự kiện; mà đó là tiến trình diễn ra chậm rãi trong một thời gian rất, rất dài. Thế giới không đột nhiên trở nên “phẳng” với phát kiến về Internet, và thương mại không bất ngờ bị các tập đoàn lớn tầm cỡ toàn cầu chi phối vào cuối thế kỷ 20. Khởi đầu bằng hàng hóa giá trị cao được ghi nhận trong lịch sử, sau đó từ từ mở rộng sang các mặt hàng ít quý giá hơn, cồng kềnh và dễ hư hỏng hơn, những thị trường của Cựu Thế giới dần tiến đến hợp nhất. Với hành trình đầu tiên của người châu Âu tới Tân Thế giới, quá trình hội nhập toàn cầu diễn ra ngàycàng mạnh mẽ. Hôm nay, các tàu container đồ sộ, máy bay phản lực, Internet, cùng mạng lưới cung ứng và sản xuất ngày càng được toàn cầu hóa chỉ là những bước tiến xa hơn của một quá trình đã diễn ra suốt 5.000 năm qua. Nếu chúng ta muốn biết về những mô hình thương mại toàn cầu đang chuyển dịch nhanh chóng ngày nay, cách thực sự hữu ích là tìm hiểu những gì đã xảy ra trước đây.  Thông qua những câu chuyện và ý tưởng được chọn lọc kỹ càng, tác giả đã cung cấp thông tin và thách thức các nhận định ở cả hai góc độ tư tưởng lớn trong vấn đề tự do thương mại: “tự do thương mại tạo ra những sự khích lệ và cơ hội ngang bằng giúp nâng cao phúc lợi nói chung cho con người đồng thời làm gia tăng chênh lệch giàu nghèo với ảnh hưởng xấu về mặt xã hội.”', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

CREATE TABLE `tacgia` (
  `idtacgia` int(11) NOT NULL,
  `tentacgia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`idtacgia`, `tentacgia`) VALUES
(3, 'Bernard Lewis'),
(4, 'Đặng Việt Đông'),
(5, 'Eiichiro Oda'),
(6, 'Gia Bảo'),
(7, 'Huỳnh Phạm Hương Trang'),
(8, 'Lois N.Magner'),
(9, 'Lep Tônxtoi'),
(10, 'Michael Levey'),
(11, 'Nick Arnold - Tony De Saulles'),
(12, 'Nguyễn Nhật Ánh'),
(13, 'Nguyễn Ngọc Tư'),
(14, 'Nguyễn Thị Hà Bắc'),
(15, 'Phil Gates, Tony De Saulles'),
(16, 'Phan Khắc Nghệ'),
(17, 'Trần Bạch Đằng'),
(18, 'Terry Eagleton'),
(19, 'Thanh Long'),
(20, 'Trần Thời'),
(21, 'William J. Bernstein');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `idtaikhoan` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `quyen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`idtaikhoan`, `username`, `password`, `quyen`) VALUES
(1, 'admin1', '123', 'ADMIN'),
(2, 'admin2', '123', 'ADMIN'),
(4, 'tham', '123', 'ADMIN'),
(6, 'nhung', '123', 'USER'),
(7, 'loc', '123', 'USER'),
(12, 'user1', '123', 'USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `idtheloai` int(11) NOT NULL,
  `tentheloai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`idtheloai`, `tentheloai`) VALUES
(1, 'Tiểu thuyết'),
(2, 'Khoa học'),
(3, 'Học thuật'),
(4, 'Ngoại ngữ'),
(5, 'Thiếu nhi'),
(6, 'Du lịch'),
(7, 'Nghệ thuật'),
(8, 'Lịch sử');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `anhsach`
--
ALTER TABLE `anhsach`
  ADD PRIMARY KEY (`masach`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`machitietdonhang`),
  ADD KEY `masach` (`masach`),
  ADD KEY `madonhang` (`madonhang`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`madonhang`),
  ADD KEY `makhachhang` (`makhachhang`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD KEY `makhachhang` (`makhachhang`),
  ADD KEY `masach` (`masach`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makhachhang`),
  ADD KEY `idtaikhoan` (`idtaikhoan`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`masach`),
  ADD KEY `idtheloai` (`idtheloai`);

--
-- Chỉ mục cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  ADD PRIMARY KEY (`idtacgia`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`idtaikhoan`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`idtheloai`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `machitietdonhang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  MODIFY `idtacgia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `idtaikhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `theloai`
--
ALTER TABLE `theloai`
  MODIFY `idtheloai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `anhsach`
--
ALTER TABLE `anhsach`
  ADD CONSTRAINT `anhsach_ibfk_1` FOREIGN KEY (`masach`) REFERENCES `sach` (`masach`);

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`masach`) REFERENCES `sach` (`masach`),
  ADD CONSTRAINT `chitietdonhang_ibfk_3` FOREIGN KEY (`madonhang`) REFERENCES `donhang` (`madonhang`);

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`masach`) REFERENCES `sach` (`masach`);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`idtaikhoan`) REFERENCES `taikhoan` (`idtaikhoan`);

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`idtheloai`) REFERENCES `theloai` (`idtheloai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
