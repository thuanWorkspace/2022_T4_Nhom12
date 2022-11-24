<%@ page import="com.example.the_final_term20220216.dao.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.the_final_term20220216.functions.Blog" %>
<%@ page import="com.example.the_final_term20220216.functions.UserAccount" %>
<%--<%@ page import="com.example.the_final_term20220216.functions.UserAccount" %>--%>
<%--<%@ page import="com.example.the_final_term20220216.functions.Search" %>--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%--<%@ page import="com.example.the_final_term20220216.functions.UserAccount" %>--%>

<%
    UserAccount ua =null;
    if(session.getAttribute("auth")!=null) {
        ua = (UserAccount) session.getAttribute("auth");
    }
    System.out.println(ua);
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/main-color.css">

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
                        <%
                        if(ua==null){%>
                        <li><a href="dangNhap.jsp" class="login-link"><i class="biolife-icon icon-login"></i>Đăng nhập/</a> <a href="dangKy.jsp"> Đăng ký</a></li>
                        <%}else {%>
                        <li><a href="thongTinTaiKhoan/thongTinTaiKhoan.jsp" class="login-link"><i class="biolife-icon icon-login"></i>xin chào <%=ua.getUser_name()%> <a href="LogOut">/ Thoát</a></li>
                        <%}%>
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
                                <li class="menu-item"><a href="TrangChu" style="color:red;">Trang chủ</a></li>
                                <li class="menu-item"><a href="khuyenMai.jsp"> khuyễn mãi</a></li>
                                <li class="menu-item"><a href="banChay.jsp">Sản phẩm HOT</a></li>
                                <li class="menu-item"><a href="chinhSachGiaoHang.jsp">Chính sách </a></li>
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
                            <div class="minicart-block" onmouseover="executeData()">
                                <div class="minicart-contain">
                                    <!--                                    <a href="javascript:void(0)" class="link-to">-->
                                    <a href="gioHangCuaBan.jsp" class="link-to">
                                            <span class="icon-qty-combine">
                                                <i class="icon-cart-mini biolife-icon"><i style="color:#b9b6b6;"></i></i>
                                                <!--                                            <span class="qty">8</span>-->
                                            </span>
                                        <span class="title">Giỏ hàng của bạn </span>
                                        <span class="sub-total" id="money-total-cart">0.00</span>

                                    </a>

                                    <div class="cart-content" >
                                        <div class="cart-inner">



                                            <ul class="products" id="products-cart">

                                            </ul>






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
                                <input type="text" name="s" class="input-text" value="" onkeyup="showResult(this.value)" placeholder="Tìm kiếm sản phẩm...">
<%--                                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>--%>
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
    <div id="livesearch"></div>

    <!-- Page Contain -->
    <div class="page-contain">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <!--Block 04: Banner Promotion 01 -->
            <div class="banner-promotion-01 xs-margin-top-50px sm-margin-top-11px">
                <div class="biolife-banner promotion biolife-banner__promotion">
                    <div class="banner-contain">
                        <div class="media background-biolife-banner__promotion">
                            <div class="img-moving position-2">
                                <img src="assets/images/home-03/img-moving-pst-2.png" width="185" height="265" alt="img msv">
                            </div>
                            <div class="img-moving position-3">
                                <img src="assets/images/home-03/img-moving-pst-3-cut.png" width="384" height="151" alt="img msv">
                            </div>
                            <div class="img-moving position-4">
                                <img src="assets/images/home-03/img-moving-pst-4.png" width="198" height="269" alt="img msv">
                            </div>
                        </div>
                        <div class="text-content">
                            <div class="container text-wrap" style="margin-top: 55px">
                                <i class="first-line">Trái cây tốt cho sức khỏe</i>
                                <span class="second-line">Rau củ quả tươi sạch</span>
<%--                                <p class="third-line">Rau, quả còn chứa nhiều chất xơ và các chất chống oxy hóa nên có tác dụng nâng cao sức khỏe, phòng chống các bệnh mạn tính không lây như tim mạch, huyết áp cao, ung thư... Ăn rau còn làm giảm mức cholesterol và tăng axit folic trong máu</p>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Block 05: Banner Promotion 02-->
            <!--Block 06: Products-->
            <div class="Product-box sm-margin-top-96px xs-margin-top-0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-5 col-sm-6">
                            <div class="advance-product-box">
                                <div class="biolife-title-box bold-style biolife-title-box__bold-style">
                                    <h3 class="title">Ưu đãi LỚN</h3>
                                </div>
                                <ul class="products biolife-carousel nav-top-right nav-none-on-mobile" data-slick='{"arrows":true, "dots":false, "infinite":false, "speed":400, "slidesMargin":30, "slidesToShow":1}'>
                                    <% Product firstDiscountProduct = (Product)request.getAttribute("firstProduct");
                                        if(firstDiscountProduct ==null)
                                            firstDiscountProduct = new Product();
                                        String firstLink = "dangNhap.jsp";
                                        if(ua!=null){
                                            firstLink = "AddCart";
                                        }
                                    %>

                                    <li class="product-item">
                                        <div class="contain-product deal-layout contain-product__deal-layout">
                                            <div class="product-thumb">
                                                <%String linkProductDetail = "ChiTietSanPham?id_product="+firstDiscountProduct.getId_product();%>
                                                <a href=<%=linkProductDetail%> class="link-to-product">
                                                    <img src=<%=firstDiscountProduct.getImg_url()%> alt="dd" width="330" height="330" class="product-thumnail">
                                                </a>
                                                <div class="labels">
                                                    <span class="sale-label">-<%=firstDiscountProduct.getPercent_discount()%>%</span>
                                                </div>
                                            </div>
                                            <div class="info">
<%--                                                <div class="biolife-countdown" data-datetime="2021/11/09 00:00:00">--%>
<%--                                                    <span class="days"><span class="number">00</span><span class="text">Ngày</span></span>--%>
<%--                                                    <span class="hours"><span class="number">00</span><span class="text">Giờ</span></span>--%>
<%--                                                    <span class="mins"><span class="number">00</span><span class="text">Phút</span></span>--%>
<%--                                                    <span class="secs"><span class="number">00</span><span class="text">Giây</span></span>--%>
<%--                                                </div>--%>
                                                <b class="categories"></b>
                                                <h4 class="product-title"><a href=<%=linkProductDetail%> class="pr-name"><%=firstDiscountProduct.getProduct_name()%></a></h4>
                                                <div class="price ">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span><%=firstDiscountProduct.getPriceDiscount()%>đ</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=firstDiscountProduct.getPrice()%>đ</span></del>
                                                </div>
                                                <div class="slide-down-box">
                                                    <p class="message"><%=firstDiscountProduct.getShort_description()%></p>
                                                    <div class="buttons">
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
                                                        <a class="btn add-to-cart-btn" type="button"onclick="addCart('<%=firstDiscountProduct.getId_product()%>',1,'<%=firstDiscountProduct.getProduct_name()%>')">Thêm vào giỏ hàng</a>

<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product deal-layout contain-product__deal-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/home-03/product_deal-02_330x330.jpg" alt="dd" width="330" height="330" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <div class="labels">--%>
<%--                                                    <span class="sale-label">-50%</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <div class="biolife-countdown" data-datetime="2020/04/18 00:00:00"></div>--%>
<%--                                                <b class="categories"></b>--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Chanh vàng</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn">Thê vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product deal-layout contain-product__deal-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/home-03/product_deal-03_330x330.jpg" alt="dd" width="330" height="330" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <div class="labels">--%>
<%--                                                    <span class="sale-label">-50%</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <div class="biolife-countdown" data-datetime="2020/01/18 00:00:00"></div>--%>
<%--                                                <b class="categories"></b>--%>
<%--                                                <h4 class="product-title"><a href=chiTietSanPham.jsp class="pr-name">Súp lơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn">Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-sm-6">
                            <div class="advance-product-box">
                                <div class="biolife-title-box bold-style biolife-title-box__bold-style">
                                    <h3 class="title">Sản phẩm được xếp hạng cao nhất (HOT)</h3>
                                </div>
                                <ul class="products biolife-carousel eq-height-contain nav-center-03 nav-none-on-mobile row-space-29px" data-slick='{"rows":2,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":2,"responsive":[{"breakpoint":1200,"settings":{ "rows":2, "slidesToShow": 2}},{"breakpoint":992, "settings":{ "rows":2, "slidesToShow": 1}},{"breakpoint":768, "settings":{ "rows":2, "slidesToShow": 2}},{"breakpoint":500, "settings":{ "rows":2, "slidesToShow": 1}}]}'>
                                    <%=((List<Product>)request.getAttribute("hotProducts")).size()%>
                                    <% for (Product p :(List<Product>)request.getAttribute("hotProducts")
                                            ) {
                                    %>
                                    <li class="product-item">
                                        <div class="contain-product right-info-layout contain-product__right-info-layout">
                                            <div class="product-thumb">
                                                <%String link_p = "ChiTietSanPham?id_product="+p.getId_product();%><%=link_p%>

                                                <a href=<%=link_p%> class="link-to-product">
                                                    <img src=<%=p.getImg_url()%> alt="dd" width="270" height="270" class="product-thumnail">
                                                </a>
                                            </div>
                                            <div class="info">
                                                <h4 class="product-title"><a href=<%=link_p%> class="pr-name"><%=p.getProduct_name()%></a></h4>
                                                <div class="price ">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span><%=p.getPrice()%>đ</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=p.getPriceDiscount()%>đ</span></del>
                                                </div>
                                                <div class="rating">
                                                    <% String percent = "width-"+p.getNumstar()*10+"percent";%>
                                                    <p class="star-rating"><span class=<%=percent%>></span></p>
                                                    <span class="review-count"> (<%=p.getNumberComment()%> Đánh giá)</span>
                                                </div>
                                            </div>
                                        </div>

                                    </li>
                                    <%}%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-03.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Súp lơ xanh</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-02.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Ớt chuông</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-22.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--<!--                                                <b class="categories">Vegetables</b>-->--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Cà chua</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>

<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-20.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-06.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Lê</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product right-info-layout contain-product__right-info-layout">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-20.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="rating">--%>
<%--                                                    <p class="star-rating"><span class="width-80percent"></span></p>--%>
<%--                                                    <span class="review-count">(05 Đánh giá)</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                                <div class="biolife-banner style-01 biolife-banner__style-01 xs-margin-top-80px-im sm-margin-top-30px-im">
                                    <div class="banner-contain">
                                        <a href="banChay.jsp" class="bn-link"></a>
                                        <div class="text-content" style="margin-top: -17px">
                                            <span class="first-line">Tươi ngon</span>
                                            <b class="second-line">Tự nhiên</b>
                                            <i class="third-line">Thực phẩm sạch </i>
                                            <span class="fourth-line">Chất lượng tốt</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Block 03: Product Tab-->
            <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
                <div class="container">
                    <div class="biolife-title-box" style="background-color: #fafafa">
                        <span class="subtitle">Sản phẩm tốt dành cho bạn</span>
                        <h3 class="main-title">Những sản phẩm khuyến mãi</h3>
                    </div>
                    <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
<%--                        <div class="tab-head tab-head__icon-top-layout icon-top-layout">--%>
<%--                            <ul class="tabs md-margin-bottom-35-im xs-margin-bottom-40-im">--%>
<%--                                <!--                                <li class="tab-element active">-->--%>
<%--                                <!--                                    <a href="#tab01_1st" class="tab-link"><span class="biolife-icon icon-lemon"></span>Cam</a>-->--%>
<%--                                <!--                                </li>-->--%>
<%--                                <!--                                <li class="tab-element" >-->--%>
<%--                                <!--                                    <a href="#tab01_2nd" class="tab-link"><span class="biolife-icon icon-grape2"></span>Nho</a>-->--%>
<%--                                <!--                                </li>-->--%>
<%--                                <li class="tab-element" >--%>
<%--                                    <a href="#tab01_3rd" class="tab-link"><span class="biolife-icon icon-blueberry"></span>Trái cây</a>--%>
<%--                                </li>--%>
<%--                                <!--                                <li class="tab-element" >-->--%>
<%--                                <!--                                    <a href="#tab01_4th" class="tab-link"><span class="biolife-icon icon-orange"></span>Chanh</a>-->--%>
<%--                                <!--                                </li>-->--%>
<%--                                <li class="tab-element" >--%>
<%--                                    <a href="#tab01_5th" class="tab-link"><span class="biolife-icon icon-broccoli"></span>Rau củ</a>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
                        <div class="tab-content">
                            <div id="tab01_1st" class="tab-contain active">
                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                    <% for (Product p :(List<Product>)request.getAttribute("discountProducts")
                                    ) {

                                    %>
                                    <%String link_p = "ChiTietSanPham?id_product="+p.getId_product();%>

                                    <li class="product-item">
                                        <div class="contain-product layout-default">
                                            <div class="product-thumb">
                                                <a href=<%=link_p%> class="link-to-product">
                                                    <img src=<%=p.getImg_url()%> alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                </a>
                                                <a class="lookup btn_call_quickview" href=<%=link_p%>><i class="biolife-icon icon-search"></i></a>
                                            </div>
                                            <div class="info">
                                                <h4 class="product-title"><a href=<%=link_p%> class="pr-name"><%=p.getProduct_name()%></a></h4>
                                                <div class="price ">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span><%=p.getPriceDiscount()%>đ</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=p.getPrice()%>đ</span></del>
                                                </div>
                                                <div class="slide-down-box">
                                                    <p class="message"><%=p.getShort_description()%></p>
                                                    <div class="buttons">
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
                                                        <a type="button" class="btn add-to-cart-btn" onclick="addCart('<%=p.getId_product()%>',1,'<%=p.getProduct_name()%>')" ><i class="fa fa-cart-arrow-down" aria-hidden="true" ></i>Thêm vào giỏ hàng</a>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Chanh vàng</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-02.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Ớt Đà Lạt</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Súp lơ xanh</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-06.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Lê</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-20.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-19.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bí đỏ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-22.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Cà chua</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-18.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Trái cây trộn</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                            </div>
<%--                            <div id="tab01_2nd" class="tab-contain ">--%>
<%--                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>--%>
<%--                                    <%--%>
<%--                                        List<Blog> blogs4 = (List<Blog>) request.getAttribute("blogs4");--%>
<%--                                        for (Blog blog:blogs4--%>
<%--                                             ) {--%>

<%--                                        %>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src=<%=blog.getImg_url()%>> alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <%}%>--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Chanh vàng</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-02.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Ớt chuông</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-20.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-19.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bí đỏ</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Súp lơ xanh</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-18.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Trái cây trộn</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-06.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Lê</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <li class="product-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <div class="contain-product layout-default">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="product-thumb">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a href="chiTietSanPham.jsp" class="link-to-product">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <img src="assets/images/products/p-22.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <div class="info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Cà chua</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="price ">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="slide-down-box">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="buttons">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </li>&ndash;%&gt;--%>

<%--                                </ul>--%>
<%--                            </div>--%>
<%--                            <div id="tab01_3rd" class="tab-contain ">--%>
<%--                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>--%>

<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-02.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Ớt chuông</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-06.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Lê</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Chanh vàng</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-18.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Trái cây trộn</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-20.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-22.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Cà chua</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-19.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bí đỏ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Súp lơ xanh</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>

<%--                                </ul>--%>
<%--                            </div>--%>
<%--                            <div id="tab01_4th" class="tab-contain ">--%>
<%--                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>--%>

<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-20.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-22.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Cà chua</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Chanh vàng</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-02.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Ớt chuông</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Súp lơ xanh</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-18.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Trái cây trộn</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-19.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bí đỏ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol">£</span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-06.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Lê</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào gỉ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                            <div id="tab01_5th" class="tab-contain ">--%>
<%--                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>--%>

<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-20.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Khoai lang</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-22.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Cà chua</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-02.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Ớt chuông</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Chanh vàng</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Súp lơ xanh</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bơ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-19.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Bí đỏ</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-06.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Lê</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="product-item">--%>
<%--                                        <div class="contain-product layout-default">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                                    <img src="assets/images/products/p-18.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                                </a>--%>
<%--                                                <a class="lookup btn_call_quickview" href="chiTietSanPham.jsp"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <h4 class="product-title"><a href="chiTietSanPham.jsp" class="pr-name">Trái cây trộn</a></h4>--%>
<%--                                                <div class="price ">--%>
<%--                                                    <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                                    <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                                </div>--%>
<%--                                                <div class="slide-down-box">--%>
<%--                                                    <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                                    <div class="buttons">--%>
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>

            <!--Block 07: Brands-->
            <div class="brand-slide sm-margin-top-100px background-fafafa xs-margin-top-80px xs-margin-bottom-80px">
                <div class="container">
                    <ul class="biolife-carousel nav-center-bold nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}},{"breakpoint":450, "settings":{ "slidesToShow": 1, "slidesMargin":10}}]}'>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://www.organicgarage.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-01.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://www.explorganics.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-02.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://organiccertifiers.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-03.jpg" width="153" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://yerbamate.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-04.jpg" width="224" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-01.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-02.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-03.jpg" width="153" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-04.jpg" width="224" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!--Block 08: Blog Posts-->
            <div class="blog-posts sm-margin-top-93px sm-padding-top-72px xs-padding-bottom-50px">
                <div class="container">
                    <div class="biolife-title-box">
                        <h3 class="main-title">Các blog mới và thú vị </h3>
                    </div>
                    <ul class="biolife-carousel nav-center nav-none-on-mobile xs-margin-top-36px" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":3, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 3}},{"breakpoint":992, "settings":{ "slidesToShow": 2}},{"breakpoint":768, "settings":{ "slidesToShow": 2}},{"breakpoint":600, "settings":{ "slidesToShow": 1}}]}'>
                            <%
                                List<Blog> blogs4 = (List<Blog>) request.getAttribute("blogs4");
                                for (Blog blog:blogs4
                                ) {
//                                    UserAccount ua = Search.searchUserById(blog.getName());
//                                    System.out.println("runme!"+ua.getUser_name());
                        String link_p = "ChiTietBlog?id_blog="+blog.getId_blog();

                            %>
                        <li>
                            <div class="post-item effect-01 style-bottom-info layout-02 ">
                                <div class="thumbnail">
                                    <a href=<%=link_p%> class="link-to-post"><img src=<%=blog.getImg_url()%>> width="370" height="270" alt=""></a>
                                    <div class="post-date">
                                        <span class="date"><%=blog.getDate_post().toString()%></span>
                                    </div>
                                </div>
                                <div class="post-content">
                                    <h4 class="post-name"><a href=<%=link_p%> class="linktopost"><%=blog.getName()%></a></h4>
                                    <div class="post-meta">
<%--                                        <a href="#" class="post-meta__item author"><img src="" width="28" height="28" alt=""><span><%=ua.getUser_name()%></span></a>--%>
                                        <a  class="post-meta__item btn liked-count" href=<%=link_p%>><%=blog.getNumberComment()%><span class="biolife-icon icon-comment"></span></a>
<%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
<%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
<%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
<%--                                            <div class="inner-content">--%>
<%--                                                <ul class="socials">--%>
<%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                    </div>
                                    <p class="excerpt"><%=blog.getShort_discription()%></p>
                                    <div class="group-buttons">
                                        <a  class="btn readmore" href=<%=link_p%>>Tìm hiểu thêm</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%}%>
<%--                        <li>--%>
<%--                            <div class="post-item effect-01 style-bottom-info layout-02">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-02.jpg" width="370" height="270" alt=""></a>--%>
<%--                                    <div class="post-date">--%>
<%--                                        <span class="date">26/12</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">4 điều sẽ xảy ra nêu bạn không chịu ăn rau</a></h4>--%>
<%--                                    <div class="post-meta">--%>
<%--                                        <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
<%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
<%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
<%--                                            <div class="inner-content">--%>
<%--                                                <ul class="socials">--%>
<%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p class="excerpt">Chắc các bạn cũng đã nghe giảng giải quá nhiều về lợi ích của việc ăn rau đúng không? Tuy nhiên, có vẻ như những bài giảng này...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">Tìm hiểu thêm</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="post-item effect-01 style-bottom-info layout-02">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-04.jpg" width="370" height="270" alt=""></a>--%>
<%--                                    <div class="post-date">--%>
<%--                                        <span class="date">26/12</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">11+ lợi ích sức khỏe của dâu tây, những điều cần lưu ý</a></h4>--%>
<%--                                    <div class="post-meta">--%>
<%--                                        <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
<%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
<%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
<%--                                            <div class="inner-content">--%>
<%--                                                <ul class="socials">--%>
<%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p class="excerpt">Khi nhắc đến dâu tây, chắc hẳn ai cũng biết rõ về những lợi ích sắc đẹp mà loại thực phẩm này mang lại. Tuy nhiên ở trái dâu tây còn có một số lợi ích...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">Tìm hiểu thêm</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="post-item effect-01 style-bottom-info layout-02">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-03.jpg" width="370" height="270" alt=""></a>--%>
<%--                                    <div class="post-date">--%>
<%--                                        <span class="date">26/12</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">5 lý do bạn cần thêm quả mọng trong cuộc sống – Fitbit Blog</a></h4>--%>
<%--                                    <div class="post-meta">--%>
<%--                                        <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
<%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
<%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
<%--                                            <div class="inner-content">--%>
<%--                                                <ul class="socials">--%>
<%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p class="excerpt">Ăn bất kỳ loại trái cây nào cũng là một động thái lành mạnh. Nhưng nếu bạn thực sự muốn xây dựng trò chơi sản xuất của mình, hãy nghĩ đến quả mọng...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">Tìm hiểu thêm</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="post-item effect-01 style-bottom-info layout-02">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-05.jpg" width="370" height="270" alt=""></a>--%>
<%--                                    <div class="post-date">--%>
<%--                                        <span class="date">26/12</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">11+ lợi ích sức khỏe của dâu tây, những điều cần lưu ý</a></h4>--%>
<%--                                    <div class="post-meta">--%>
<%--                                        <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
<%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
<%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
<%--                                            <div class="inner-content">--%>
<%--                                                <ul class="socials">--%>
<%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p class="excerpt">Khi nhắc đến dâu tây, chắc hẳn ai cũng biết rõ về những lợi ích sắc đẹp mà loại thực phẩm này mang lại. Tuy nhiên ở trái dâu tây còn có một số lợi ích...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">Tìm hiểu thêm</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="post-item effect-01 style-bottom-info layout-02">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-06.jpg" width="370" height="270" alt=""></a>--%>
<%--                                    <div class="post-date">--%>
<%--                                        <span class="date">26/12</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">Trái dâu tằm: Món ăn ngon, vị thuốc quý!</a></h4>--%>
<%--                                    <div class="post-meta">--%>
<%--                                        <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>--%>
<%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
<%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
<%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
<%--                                            <div class="inner-content">--%>
<%--                                                <ul class="socials">--%>
<%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
<%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <p class="excerpt">Nói đến dâu tằm, ai cũng nghĩ ngay đến vải vóc, tơ lụa. Nhưng dâu tằm cũng là một cây thuốc quý với nhiều công dụng khác nhau....</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">Tìm hiểu thêm</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
                    </ul>
                </div>
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
                        </section>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                        <section class="footer-item">
                            <h3 class="section-title">link quan trọng</h3>
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 col-xs-6">
                                    <div class="wrap-custom-menu vertical-menu-2">
                                        <ul class="menu">
                                            <li ><a href="TrangChu" >Trang chủ</a></li>
                                            <li ><a href="khuyenMai.jsp">Sản phẩm khuyễn mãi</a></li>
                                            <li ><a href="banChay.jsp">Các ản phẩm HOT</a></li>
                                            <li ><a href="chinhSachGiaoHang.jsp">Chính sách </a></li>
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
    <script>
        var formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',

            // These options are needed to round to whole numbers if that's what you want.
            //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
            //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
        });
        function executeData(){
            <%
            String id = "";
            if(ua==null){
            %>
            let strVar = "";
            strVar += "<li>";
            strVar += "                                                    <div href=\"dangNhap.jsp\" class=\"minicart-item\">";
            strVar += "                                                        <div class=\"left-info\">";
            strVar += "                                                            <div class=\"product-title\"><a  class=\"product-name\">vui lòng đăng nhập để mở chức năng giỏ hàng<\/a><\/div>";
            strVar += "                                                        <\/div>";
            strVar += "                                                    <\/div>";
            strVar += "                                                <\/li>";
            document.getElementById("products-cart").innerHTML=strVar;
            return ;
            <%}else{
                id = ua.getId_user();
            }%>

            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                let realData = "";
                let mydata = JSON.parse(this.responseText);
                console.log(mydata);
                let totalmoney = 0.0;
                for(let i =0;i<mydata.length;i++){
                    // console.log("");
                    let line = "ChiTietSanPham?id_product="+mydata[i].product.id_product;
                    realData += "<li>";
                    realData += "                                                    <div class=\"minicart-item\">";
                    realData += "                                                        <div class=\"thumb\">";
                    realData += "                                                            <a href=\""+line+"\"><img src=\""+mydata[i].product.img_url+"\" width=\"90\" height=\"90\" alt=\"National Fresh\"><\/a>";
                    realData += "                                                        <\/div>";
                    realData += "                                                        <div class=\"left-info\">";
                    realData += "                                                            <div class=\"product-title\"><a href=\""+line+"\" class=\"product-name\">"+mydata[i].product.product_name+"<\/a><\/div>";
                    realData += "                                                            <div class=\"price\">";
                    realData += "                                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price_discount+" đ<\/span><\/ins>";
                    realData += "                                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price+" đ<\/span><\/del>";
                    realData += "                                                            <\/div>";
                    realData += "                                                            <div class=\"qty\">";
                    realData += "                                                                <label for=\"cart[id123][qty]\">Qty:<\/label>";
                    realData += "                                                                <input type=\"number\" class=\"input-qty\" name=\"cart[id123][qty]\" id=\"cart[id123][qty]\" value=\""+mydata[i].amount+"\" disabled>";
                    realData += "                                                            <\/div>";
                    realData += "                                                        <\/div>";
                    realData += "                                                    <\/div>";
                    realData += "                                                <\/li>";
                    totalmoney+=parseFloat(mydata[i].amount)*parseFloat(mydata[i].product.price_discount);
                }


                document.getElementById("money-total-cart").innerHTML = formatter.format(totalmoney);
                document.getElementById("products-cart").innerHTML = realData;
            }
            let va = Math.random();
            xhttp.open("GET", "ShowCart?id_user=<%=id%>&x="+va);
            xhttp.send();

        }
    </script>
    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/biolife.framework.js"></script>
    <script src="assets/js/functions.js"></script>
    <script>
        function addCart(id_product,amount,name_product){
            const xhttp = new XMLHttpRequest();
            console.log(id_product+", amount: "+amount+", name_product: "+name_product);
            xhttp.onload = function() {
                let rawResult = xhttp.response;
                let result = rawResult.substring(0,rawResult.length-2);
                if(result === 'true'){
                    alert("thêm sản phẩm "+name_product +"<p style='color:green;'>THÀNH CÔNG</p>");
                }else{
                    alert("thêm sản phẩm "+name_product +" <p style='color:red;'>THẤT BẠI</p>");
                }
            }
            xhttp.open("GET", "AddCart?id_user=<%=id%>&id_product="+id_product+"&amount="+amount);
            xhttp.send();
        }
    </script>

    <!--search-->
    <script>
        function showResult(str) {
            if (str.length==0) {
                document.getElementById("livesearch").innerHTML="";
                return;
            }
            var xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=function() {
                try {
                    let va = JSON.parse(this.responseText);
                    let searchResult = "";
                    console.log(va);
                    if (this.readyState==4 && this.status==200) {
                        for(let i =0;i<va.length;i++) {
                            searchResult += va[i] + "</br>";
                            // document.getElementById("livesearch").style.border="1px solid #A5ACB2";
                        }
                        console.log(searchResult)
                        document.getElementById("livesearch").innerHTML = searchResult;

                    }
                }
                //catch json error
                catch(err) {
                }

            }
            xmlhttp.open("GET","LiveSearch?q="+str,true);
            xmlhttp.send();
        }
    </script>
</body>

</html>