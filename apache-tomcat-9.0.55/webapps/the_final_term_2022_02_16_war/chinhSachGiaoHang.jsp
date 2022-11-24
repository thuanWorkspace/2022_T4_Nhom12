<%@ page import="com.example.the_final_term20220216.functions.Blog" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>chính sách giao hàng</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/slick.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/main-color.css">
</head>
<body class="biolife-body">

    <!-- Preloader -->
    <div id="biof-loading">
        <div class="biof-loading-center">
            <div class="biof-loading-center-absolute">
                <div class="dot dot-one"></div>
                <div class="dot dot-two"></div>
                <div class="dot dot-three"></div>
            </div>
        </div>
    </div>

    <!-- HEADER -->
    <header id="header" class="header-area style-01 layout-03">
        <div class="header-top bg-main hidden-xs">
            <div class="container">
                <div class="top-bar left">
                    <ul class="horizontal-menu">
                        <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>Organic@company.com</a></li>
                        <li><a href="#">Giao hàng miễn phí cho tất cả đơn hàng từ 200K</a></li>
                    </ul>
                </div>
                <div class="top-bar right">
                    <ul class="social-list">
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                    </ul>
                    <ul class="horizontal-menu">
                        <!--                        <li class="horz-menu-item currency">-->
                        <!--                            <select name="currency">-->
                        <!--                                <option value="eur">€ EUR (Euro)</option>-->
                        <!--                                <option value="usd" selected>$ USD (Dollar)</option>-->
                        <!--                                <option value="usd">£ GBP (Pound)</option>-->
                        <!--                                <option value="usd">¥ JPY (Yen)</option>-->
                        <!--                                <option value="usd">đ VND (VND)</option>-->
                        <!--                            </select>-->
                        <!--                        </li>-->
                        <!--                        <li class="horz-menu-item lang">-->
                        <!--                            <select name="language">-->
                        <!--                                <option value="fr">French (EUR)</option>-->
                        <!--                                <option value="en" selected>English (USD)</option>-->
                        <!--                                <option value="ger">Germany (GBP)</option>-->
                        <!--                                <option value="jp">Japan (JPY)</option>-->
                        <!--                                <option value="jp">Việt Nam (VND)</option>-->
                        <!--                            </select>-->
                        <!--                        </li>-->
                        <li><a href="dangNhap.jsp" class="login-link"><i class="biolife-icon icon-login"></i>Đăng nhập/ <a href=" dangKy.jsp"> Đăng ký</a></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header-middle biolife-sticky-object ">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-md-6 col-xs-6">
                        <a href="TrangChu" class="biolife-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                    </div>
                    <div class="col-lg-7 col-md-7 hidden-sm hidden-xs">
                        <div class="primary-menu">
                            <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                                <li class="menu-item"><a href="TrangChu">Trang chủ</a></li>
                                <li class="menu-item"><a href="khuyenMai.jsp"> khuyễn mãi</a></li>
                                <li class="menu-item"><a href="banChay.jsp">Sản phẩm HOT</a></li>
                                <li class="menu-item"><a href="ChinhSachGIaoHang" style="color:red;">Chính sách </a></li>
                                <li class="menu-item"><a href="danhsachBlog.jsp">Blog</a></li>
                                <li class="menu-item"><a href=" lienHe.jsp">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-md-6 col-xs-8">
                        <div class="biolife-cart-info">
                            <div class="mobile-search">
                                <a href="javascript:void(0)" class="open-searchbox"><i class="biolife-icon icon-search"></i></a>
                                <div class="mobile-search-content">
                                    <form action="#" class="form-search" name="mobile-seacrh" method="get">
                                        <a href="#" class="btn-close"><span class="biolife-icon icon-close-menu"></span></a>
                                        <input type="text" name="s" class="input-text" value="" placeholder="Search here...">
                                        <button type="submit" class="btn-submit">go</button>
                                    </form>
                                </div>
                            </div>
                            <div class="wishlist-block hidden-sm hidden-xs">
                                <a href="#" class="link-to">
                                    <!--                                    <span class="icon-qty-combine">-->
                                    <!--                                        <i class="icon-heart-bold biolife-icon"></i>-->
                                    <!--                                        &lt;!&ndash;                                    <span class="qty">4</span>&ndash;&gt;-->
                                    <!--                                    </span>-->
                                </a>
                            </div>
                            <div class="minicart-block">
                                <div class="minicart-contain">
                                    <!--                                    <a href="javascript:void(0)" class="link-to">-->
                                    <a href="gioHangCuaBan.jsp" class="link-to">
                                            <span class="icon-qty-combine">
                                                <i class="icon-cart-mini biolife-icon"><i style="color:#b9b6b6;"></i></i>
                                                <!--                                            <span class="qty">8</span>-->
                                            </span>
                                        <span class="title">Giỏ hàng của bạn</span>

                                    </a>
                                    <div class="cart-content">
                                        <div class="cart-inner">
                                            <p class="btn-control">
                                                <a href="gioHangCuaBan.jsp" class="btn view-cart">Xem giỏ hàng </a>
                                                <a href="thanhToan.jsp" class="btn">Thanh toán</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mobile-menu-toggle">
                                <a class="btn-toggle" data-object="open-mobile-menu" href="javascript:void(0)">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom hidden-sm hidden-xs">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4">
                        <div class="vertical-menu vertical-category-block">
                            <div class="block-title">
                                <span class="menu-icon">
                                    <span class="line-1"></span>
                                    <span class="line-2"></span>
                                    <span class="line-3"></span>
                                </span>
                                <span class="menu-title">Danh sách sản phẩm</span>
                                <span class="angle" data-tgleclass="fa fa-caret-down"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                            </div>
                            <div class="wrap-menu">
                                <ul class="menu clone-main-menu">
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="khuyenMai.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top sản phẩm khuyến mãi</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="banChay.jsp.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top sản phẩm bán chạy</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Trái cây</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau củ</a>
                                    </li>
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fresh Berries"><i class="biolife-icon icon-grape"></i>Qủa mọng</a>-->
                                    <!--                                    </li>-->
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau củ quả gia vị</a>-->
                                    <!--                                    </li>-->
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Các loại quả nhập khẩu</a>-->
                                    <!--                                    </li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 padding-top-2px">
                        <div class="header-search-bar layout-01">
                            <form action="#" class="form-search" name="desktop-seacrh" method="get">
                                <input type="text" name="s" class="input-text" value="" placeholder="Tìm kiếm sản phẩm...">
                                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>
                            </form>
                        </div>
                        <div class="live-info">
                            <p class="telephone"><i class="fa fa-phone" aria-hidden="true"></i><b class="phone-number">(+900) 123 456 7891</b></p>
                            <p class="working-time">Thứ 2-6: 8:30am-7:30pm; Thứ 7-CN: 9:30am-4:30pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <!--Hero Section-->
    <div class="hero-section hero-background style-02">
        <h1 class="page-title">CHÍNH SÁCH GIAO HÀNG</h1>
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
                <li class="nav-item"><span class="current-page">Các Blog</span></li>
            </ul>
        </nav>
    </div>

    <!-- Page Contain -->
    <div class="page-contain blog-page left-sidebar">
        <div class="container">
            <div class="row">

                <!-- Main content -->
                <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                    <!--Single Post Contain-->
                    <div class="single-post-contain">

                        <div class="post-head">
                            <div class="thumbnail">
                                <figure><img src="assets/images/blogpost/chinhSachGiaoHang.jpg" width="470" height="335" alt=""></figure>
                            </div>
                            <h2 class="post-name"></h2>
                        </div>

                        <div class="post-content">
                            <h1 style="font-size: 30px ;color: black">GIAO HÀNG TẠI RAU SẠCH THỰC PHẨM MIỀN TÂY</h1>
                            <p>Nhằm đáp ứng nhu cầu rất cao về sử dụng rau củ quả an toàn, tập trung các loại rau củ quả tốt cho sức khỏe cho người tiêu dùng.</p>
                            <p>CÔNG TY TNHH MTV THỰC PHẨM MIỀN TÂY kinh doanh theo tiêu chí “ tất cả vì lợi ích của khách hàng”. Chúng tôi chuyên cung cấp rau củ quả sạch cho các nhà hàng, khách sạn, bếp ăn công ty, trường học ... trên địa bàn thành phố Hồ Chí Minh và các tỉnh lân cận do vậy quý doanh nghiệp nào có nhu cầu hợp tác vui lòng liên hệ với chúng tối theo số: 0935 976 226 - 0906 305 212</p>
                            <h1  style="font-size: 24px ;color: black">HÌNH THỨC GIAO HÀNG LINH HOẠT, NHANH CHÓNG:</h1>
                            <p>- Chốt đơn hàng trước chiều hôm nay, giao hàng trong sáng hôm sau theo giờ quy định của khách hàng.</p>
                            <p >- Miễn phí giao hàng cho tổng đơn hàng trị giá trên 500,000 đồng.</p>
                            <p >- Nhận đổi trả hàng nếu hàng không đạt yêu cầu.</p>
                            <p >Cam kết luôn duy trì giá với mức theo sát giá thị trường, giá ngang bằng với các điểm chợ sỉ.</p>
                            <p >RAU CỦ QUẢ luôn được đóng gói sạch sẽ trước khi giao hàng.</p>
                            <p ><em><strong>Mọi chi tiết xin liên hệ:</strong></em></p>
                            <p>Địa chỉ: 861/72/11 Trần Xuân Soạn, P. Tân Hưng, Quận 7, TP. HCM</p>
                            <p>Điện thoại:&nbsp;0909 632 112 - 0906 305 212</p>
                            <p>Email:&nbsp;mekongfreshfood@gmail.com</p>
                            <p>Website: rausachgiasi.com</p>

                        </div>

                    </div>

                </div>

                <!-- Sidebar -->
                <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">

                    <div class="biolife-mobile-panels">
                        <span class="biolife-current-panel-title">Sidebar</span>
                        <a class="biolife-close-btn" href="#" data-object="open-mobile-filter">&times;</a>
                    </div>

                    <div class="sidebar-contain">



                        <!--Categories Widget-->
                        <div class="widget biolife-filter">
                            <h4 class="wgt-title">Các loại chính</h4>
                            <div class="wgt-content">
                                <ul class="cat-list">
                                    <li class="cat-list-item"><a href="#" class="cat-link">Các sản phẩm khuyễn mãi</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">các sản phẩm bán chạy</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">Trái cây</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">rau,củ,quả</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--Posts Widget-->
                        <div class="widget posts-widget">
                            <h4 class="wgt-title">Bài viết gần đây</h4>
                            <div class="wgt-content">
                                <ul class="posts">
                                    <%
                                        for (Blog b:(List<Blog>)request.getAttribute("relateBlogs")
                                             ) {
                                            String link = "ChiTietBlog?id_blog="+b.getId_blog();

                                    %>
                                    <li>
                                        <div class="wgt-post-item">
                                            <div class="thumb">
                                                <a href=<%=link%>>><img src=<%=b.getImg_url()%>> width="80" height="58" alt=""></a>
                                            </div>
                                            <div class="detail">
                                                <h4 class="post-name"><a style="font-size: 13px" href=<%=link%>><%=b.getName()%>></a></h4>
                                                <p class="post-archive"><%=b.getDate_post().toString()%>><span class="comment"><%=b.getNumberComment()%>> Bình luận</span></p>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href=""><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <footer id="footer" class="footer layout-03">
        <div class="footer-content background-footer-03">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-9">
                        <section class="footer-item">
                            <a href="TrangChu" class="logo footer-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                            <div class="footer-phone-info">
                                <i class="biolife-icon icon-head-phone"></i>
                                <p class="r-info">
                                    <span>Liên lạc với chúng tôi qua hot-line: </span>
                                    <span>037-353-5207</span>
                                </p>
                            </div>
                            <!--                            <div class="newsletter-block layout-01">-->
                            <!--                                <h4 class="title">Đăng kí nhận tin</h4>-->
                            <!--                                <div class="form-content">-->
                            <!--                                    <form action="#" name="new-letter-foter">-->
                            <!--                                        <input type="email" class="input-text email" value="" placeholder="nhập email ở đây...">-->
                            <!--                                        <button type="submit" class="bnt-submit" name="ok">Đăng kí</button>-->
                            <!--                                    </form>-->
                            <!--                                </div>-->
                            <!--                            </div>-->
                        </section>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                        <section class="footer-item">
                            <h3 class="section-title">link quan trọng</h3>
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <div class="wrap-custom-menu vertical-menu-2">
                                        <ul class="menu">
                                            <!--                                            <li><a href="TrangChu">Trang chủ</a></li>-->
                                            <!--                                            <li><a href="danhsachBlog.jsp">Blog</a></li>-->
                                            <!--                                            <li><a href="ChinhSachGIaoHang">Chích sách giao hàng</a></li>-->
                                            <!--                                            <li><a href=" lienHe.jsp">liên hệ</a></li>-->
                                            <li ><a href="TrangChu">Trang chủ</a></li>
                                            <li ><a href="khuyenMai.jsp">Sản phẩm khuyễn mãi</a></li>
                                            <li ><a href="banChay.jsp">Các ản phẩm HOT</a></li>
                                            <li ><a href="ChinhSachGIaoHang">Chính sách </a></li>
                                            <li ><a href="danhsachBlog.jsp">Blog</a></li>
                                            <li ><a href=" lienHe.jsp">Liên hệ</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <div class="wrap-custom-menu vertical-menu-2">
                                        <ul class="menu">
                                            <li><a href="cacLoaiSanPham.jsp">Trái cây</a></li>
                                            <li><a href="cacLoaiSanPham.jsp">Rau củ</a></li>
                                            <li ><a href="khuyenMai.jsp">Sản phẩm khuyễn mãi</a></li>
                                            <li ><a href="banChay.jsp">Các ản phẩm HOT</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                        <section class="footer-item">
                            <h3 class="section-title">Trung tâm phân phối rau củ quả, có bán sỉ</h3>
                            <div class="contact-info-block footer-layout xs-padding-top-10px">
                                <ul class="contact-lines">
                                    <li>
                                        <p class="info-item">
                                            <i class="biolife-icon icon-location"></i>
                                            <b class="desc">phường Linh trung, quận Thủ Đức, thành phố HCM</b>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="info-item">
                                            <i class="biolife-icon icon-phone"></i>
                                            <b class="desc">số điện thoại: 037 353 5208</b>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="info-item">
                                            <i class="biolife-icon icon-letter"></i>
                                            <b class="desc">Email: Organic@company.com</b>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="info-item">
                                            <i class="biolife-icon icon-clock"></i>
                                            <b class="desc">lịch làm việc: 6h sáng-> 10 tối. 7 ngày/tuần</b>
                                        </p>
                                    </li>
                                </ul>
                            </div>
                            <div class="biolife-social inline">
                                <ul class="socials">
                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="separator sm-margin-top-70px xs-margin-top-40px"></div>
                    </div>
                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="copy-right-text"><p><a href="templateshub.net">Templates Hub</a></p></div>
                    </div>
                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="payment-methods">
                            <ul>
                                <li><a href="#" class="payment-link"><img src="assets/images/card1.jpg" width="51" height="36" alt=""></a></li>
                                <li><a href="#" class="payment-link"><img src="assets/images/card2.jpg" width="51" height="36" alt=""></a></li>
                                <li><a href="#" class="payment-link"><img src="assets/images/card3.jpg" width="51" height="36" alt=""></a></li>
                                <li><a href="#" class="payment-link"><img src="assets/images/card4.jpg" width="51" height="36" alt=""></a></li>
                                <li><a href="#" class="payment-link"><img src="assets/images/card5.jpg" width="51" height="36" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/biolife.framework.js"></script>
    <script src="assets/js/functions.js"></script>
</body>

</html>