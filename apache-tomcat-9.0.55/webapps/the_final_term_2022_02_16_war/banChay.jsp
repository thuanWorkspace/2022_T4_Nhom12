<%@ page import="com.example.the_final_term20220216.dao.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%List<Product> products = (List<Product>) request.getAttribute("productHot");
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sản phẩm HOT</title>
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
    <script>
        class Product{

            constructor(id,name,type,priceDiscount,percentDiscount,price,shortDescription,imgUrl,numStar,numComment) {
                this._id = id;
                this._name = name;
                this._type = type;
                this._priceDiscount = priceDiscount;
                this._percentDiscount = percentDiscount;
                this._price = price;
                this._shortDescription = shortDescription;
                // this._description = description;
                this._imgUrl = imgUrl;
                this._numStar = numStar;
                this._numComment = numComment;
            }


            get id() {
                return this._id;
            }

            get name() {
                return this._name;
            }

            get type() {
                return this._type;
            }

            get priceDiscount() {
                return this._priceDiscount;
            }

            get percentDiscount() {
                return this._percentDiscount;
            }

            get price() {
                return this._price;
            }

            get shortDescription() {
                return this._shortDescription;
            }

            get imgUrl() {
                return this._imgUrl;
            }

            get numStar() {
                return this._numStar;
            }

            get numComment() {
                return this._numComment;
            }
            toString(){
                return "id: "+this._id+", name: "+this._name
                    ;
            }
        }
        var productsJs = [];
        <%for (Product p : products ) {
        %>
        //(id,name,type,priceDiscount,percentDiscount,price,shortDescription,description,imgUrl,numStar,numComment) {

        <%--console.log("<%=p.getProduct_name()%>, <%=p.getNumberComment()%>");--%>
        productsJs[productsJs.length] = new Product("<%=p.getId_product()%>","<%=p.getProduct_name()%>","<%=p.getProduct_type()%>"
            ,<%=p.getPriceDiscount()%>,<%=p.getPercent_discount()%>,<%=p.getPrice()%>,"<%=p.getShort_description()%>","<%=p.getImg_url()%>",<%=p.getNumstar()%>,<%=p.getNumberComment()%>);

        <%}%>
        console.log("run me")
        console.log(productsJs);
    </script>
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
                    <a href="trangchu.jsp" class="biolife-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                </div>
                <div class="col-lg-7 col-md-7 hidden-sm hidden-xs">
                    <div class="primary-menu">
                        <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                            <li class="menu-item"><a href="trangchu.jsp">Trang chủ</a></li>
                            <li class="menu-item"><a href="khuyenMai.jsp"> khuyễn mãi</a></li>
                            <li class="menu-item"><a href="banChay.jsp" style="color:red;">Sản phẩm HOT</a></li>
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
<div class="hero-section hero-background">
    <h1 class="page-title">Những sản phẩm bán chạy</h1>
</div>


<div>
    <br>
</div>

<div class="page-contain category-page no-sidebar">
    <div class="container">
        <div class="row">

            <!-- Main content -->
            <div id="main-content" class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="product-category grid-style">

                    <div id="top-functions-area" class="top-functions-area" >
                        <div class="flt-item to-left group-on-mobile">
                            <span class="flt-title">Sắp xếp giá:</span>
                            <a href="#" class="icon-for-mobile">
                                <span></span>
                                <span></span>
                                <span></span>
                            </a>
                            <div class="wrap-selectors">
                                <form action="#" name="frm-refine" method="get">
                                    <div data-title="Price:" class="selector-item">
                                        <select name="price" class="selector" id ="option_price" onchange="arrange()">
                                            <option value="normal">Mặc định </option>
                                            <option value="increase">Tăng dần</option>
                                            <option value="decrease">Giảm dần</option>
                                        </select>
                                    </div>
                                    <span class="flt-title" style="margin-left:15px ;">Phân loại:</span>
                                    <div data-title="Brand:" class="selector-item">
                                        <select name="brad" class="selector" id = "option_classification" onchange="arrange()">
                                            <option value="normal">Mặc định</option>
                                            <option value="traicay">Trái cây</option>
                                            <option value="raucu">Rau củ</option>

                                        </select>
                                    </div>

                                    <p class="btn-for-mobile"><button type="submit" class="btn-submit">Go</button></p>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <ul class="products-list" id="product-list">

<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories"> Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Fresh Fruit</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>


<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories"> Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Fresh Fruit</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories"> Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Fresh Fruit</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories"> Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">Fresh Fruit</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                                <div class="contain-product layout-default">--%>
<%--                                    <div class="product-thumb">--%>
<%--                                        <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                            <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="info">--%>
<%--                                        <b class="categories">trái cây</b>--%>
<%--                                        <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                        <div class="price">--%>
<%--                                            <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                            <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                        </div>--%>
<%--                                        <div class="shipping-info">--%>
<%--                                            <p class="shipping-day">còn hàng</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="slide-down-box">--%>
<%--                                            <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                            <div class="buttons">--%>
<%--                                                <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                                <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                                <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

                        </ul>
                    </div>

                    <div class="biolife-panigations-block">
                        <ul class="panigation-contain">
                            <li><span class="current-page">1</span></li>
                            <li><a href="#" class="link-page">2</a></li>
                            <li><a href="#" class="link-page">3</a></li>
                            <li><span class="sep">....</span></li>
                            <li><a href="#" class="link-page">20</a></li>
                            <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>

                </div>

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
                        <a href="trangchu.jsp" class="logo footer-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
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
                                        <!--                                            <li><a href="trangchu.jsp">Trang chủ</a></li>-->
                                        <!--                                            <li><a href="danhsachBlog.jsp">Blog</a></li>-->
                                        <!--                                            <li><a href="chinhSachGiaoHang.jsp">Chích sách giao hàng</a></li>-->
                                        <!--                                            <li><a href=" lienHe.jsp">liên hệ</a></li>-->
                                        <li ><a href="trangchu.jsp">Trang chủ</a></li>
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

<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.countdown.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/jquery.nicescroll.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/biolife.framework.js"></script>
<script src="assets/js/functions.js"></script>
<script>
    function priceArrangeIncrease(a, b) {
        if (a.priceDiscount > b.priceDiscount) {
            return 1;
        }
        if (a.priceDiscount < b.priceDiscount) {
            return -1;
        }
        return 0;
    }

    function priceArrangeDecrease(a, b) {
        if (a.priceDiscount > b.priceDiscount) {
            return -1;
        }
        if (a.priceDiscount < b.priceDiscount) {
            return 1;
        }
        return 0;
    }
    function displayProduct(arr){
        let productListHtml = "";
        for(let i=0;i<arr.length;i++){
            let p = arr[i];
            let link_p = "ChiTietSanPham?id_product="+p.id;
            productListHtml += "<li class=\"product-item col-lg-3 col-md-3 col-sm-4 col-xs-6\">";
            productListHtml += "        <div class=\"contain-product layout-default\">";
            productListHtml += "            <div class=\"product-thumb\">";
            productListHtml += "                <a href=\""+link_p+"\" class=\"link-to-product\">";
            productListHtml += "                    <img src=\""+p.imgUrl+"\" alt=\"Vegetables\" width=\"270\" height=\"270\" class=\"product-thumnail\">";
            productListHtml += "                <\/a>";
            productListHtml += "                <a class=\"lookup btn_call_quickview\" href=\""+link_p+"\"><i class=\"biolife-icon icon-search\"><\/i><\/a>";
            productListHtml += "            <\/div>";
            productListHtml += "            <div class=\"info\">";
            productListHtml += "                <h4 class=\"product-title\"><a href=\""+link_p+"\" class=\"pr-name\">\""+p.name+"\"<\/a><\/h4>";
            productListHtml += "                <div class=\"price \">";
            productListHtml += "                    <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>\""+p.priceDiscount+"\"đ<\/span><\/ins>";
            productListHtml += "                    <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>\""+p.price+"\"đ<\/span><\/del>";
            productListHtml += "                <\/div>";
            productListHtml += "                <div class=\"slide-down-box\">";
            productListHtml += "                    <p class=\"message\">\""+p.shortDescription+"\"<\/p>";
            productListHtml += "                    <div class=\"buttons\">";
            productListHtml += "                        <a href=\"#\" class=\"btn wishlist-btn\"><i class=\"fa fa-heart\" aria-hidden=\"true\"><\/i><\/a>";
            productListHtml += "                        <a href=\"#\" class=\"btn add-to-cart-btn\"><i class=\"fa fa-cart-arrow-down\" aria-hidden=\"true\"><\/i>Thêm vào giỏ hàng<\/a>";
            productListHtml += "                        <a href=\"#\" class=\"btn compare-btn\"><i class=\"fa fa-random\" aria-hidden=\"true\"><\/i><\/a>";
            productListHtml += "                    <\/div>";
            productListHtml += "                <\/div>";
            productListHtml += "            <\/div>";
            productListHtml += "        <\/div>";
            productListHtml += "    <\/li>";
        }
        document.getElementById("product-list").innerHTML = productListHtml;
    }

    displayProduct(productsJs);

    function arrange() {
        //shallow copy
        let arr = productsJs.slice();
        //arrange

        let option = document.getElementById('option_price').value;
        if((option==="normal")==false) {

            if (option === "increase") {
                arr.sort(priceArrangeIncrease);
            }
            if (option === "decrease") {
                arr.sort(priceArrangeDecrease);
            }
        }
        //classify
        var classify = document.getElementById('option_classification').value;

        if((classify==="normal")==false){
            let indexRemove = [];

            let value ="";
            if (classify === "traicay") {
                value = "rau củ"
            }
            if (classify === "raucu") {
                value = "trái cây"
            }
            //remove different element type
            for (let i=0;i<arr.length;i++){
                if(arr[i].type===value) {
                    arr.splice(i,1);
                    i--;
                }
            }
        }
        displayProduct(arr);
    }
</script>

</body>

</html>