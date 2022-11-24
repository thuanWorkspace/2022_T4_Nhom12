<%@ page import="com.example.the_final_term20220216.functions.Blog" %>
<%@ page import="com.example.the_final_term20220216.functions.CommentBlog" %>
<%@ page import="com.example.the_final_term20220216.functions.IComment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.the_final_term20220216.ChiTietBlog" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>chi tiết Blog</title>
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
    <div class="hero-section hero-background style-02">
        <h1 class="page-title">Blog Biolife Shop</h1>
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
                <li class="nav-item"><span class="current-page">Blog</span></li>
            </ul>
        </nav>
    </div>

    <!-- Page Contain -->
    <div class="page-contain blog-page left-sidebar">
        <div class="container">
            <div class="row">
                <% Blog blog = (Blog) request.getAttribute("blog");

                %>
                <!-- Main content -->
                <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                    <!--Single Post Contain-->
                    <div class="single-post-contain">

                        <div class="post-head">
                            <div class="thumbnail">
                                <figure><img src=<%=blog.getImg_url()%> width="870" height="635" alt=""></figure>
                            </div>
                            <h2 class="post-name"><%=blog.getName()%></h2>
                            <p class="post-archive"><b class="post-cat"></b><span class="post-date"> <%=blog.getDate_post().toString()%></span><span class="author"><%=blog.getAuthor()%></span></p>
                        </div>

                        <div class="post-content">
                            <p><%=blog.getContent()%></p>
<%--                            <%--%>
<%--                                System.out.println(blog.getContent());%>--%>
<%--                            <p>1. Tuyệt đối không rửa rau, củ, quả trước khi mang đi cất trữ.Điều đó sẽ khiến rau, củ, quả dễ bị ủng, thối. Bạn chỉ cần lau qua bằng giấy ăn hoặc khăn khô là được.</p>--%>
<%--                            <p>2. Không nên để rau, củ, quả trong môi trường ẩm ướt bởi như vậy sẽ khiến chúng nhanh hỏng.Các bạn nên đặt giấy ăn khô và những chiếc túi hay hộp bảo quản rau, củ, quả.</p>--%>
<%--                            <p>3. Tuyệt đối không cho các loại rau quả này vào tủ lạnh!Ớt chuông, dưa chuột, cà chua cần được bảo quản ở nhiệt độ phòng, nếu không chúng sẽ nhanh hỏng và dễ mất chất.</p>--%>
<%--                            <p>4. Rau, củ, quả đã cắt hoặc gọt vỏ cần cho vào hộp kín.Như vậy sẽ khiến cho thực phẩm của bạn giữ được lâu hơn và hạn chế tình trạng mất chất.</p>--%>
<%--                            <p>5. Không nên để rau, củ, quả ở nhiệt độ quá lạnh.Đừng nghĩ rằng điều đó sẽ giúp bảo quản lâu hơn, trái lại nó còn khiến thực phẩm của bạn nhanh hỏng hơn khi rã đông đó.</p>--%>
<%--                            <p>6. Một số loại rau quả không nên để cùng nhau.Chúng ta không nên để chung chuối, quả mơ, dưa hấu, lê, mận, xoài, và cà chua với một trong các loại rau quả bao gồm táo, cà tím, dưa hấu, khoai tây, bí ngô, cà rốt và bông cải xanh. Điều đó sẽ khiến rau quả của bạn nhanh bị hỏng.</p>--%>
<%--                            <p>7. Muốn bảo quản rau củ ở nhiệt độ phòng, hãy để chúng ở vị trí thông thoáng.Tránh cho vào hộp hay túi nilon ở nhiệt độ thường, như vậy thực phẩm sẽ nhanh bị ủng, thối…</p>--%>
<%--                            <p>8. Muốn giữ nho tươi lâu, hãy cho vào túi polyetylen hoặc hộp nhựa.Với nho hay cherry, bạn nên cho vào túi polyetylen hoặc hộp nhựa rồi đặt vào tủ lạnh.</p>--%>
<%--                            <p>9. Không nên cho chuối vào tủ lạnh.Thay vào đó, các bạn hãy để ở nhiệt độ phòng và bọc phần cuống lại bằng màng bọc thực phẩm.</p>--%>
                            <blockquote>
                                <address>
<%--                                    <span>Nguồn từ <a href="#" class="author">Koan Conella</a></span>--%>
                                </address>
                            </blockquote>
                        </div>

                        <div class="post-foot">



                            <div class="auth-info">
                                <div class="ath">
                                    <a href="#" class="avata"><img src="assets/images/blogpost/author-02.png" width="29" height="28" alt="Christian Doe">Christian Doe</a>
<!--                                    <span class="count-item viewer"><i class="fa fa-eye" aria-hidden="true"></i>630</span>-->
                                    <span class="count-item commented"><i class="fa fa-commenting" aria-hidden="true"></i>26</span>
                                </div>
                                <div class="socials-connection">
                                    <span class="title">Chia sẻ:</span>
                                    <ul class="social-list">
                                        <li><a href="#" class="socail-link"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                    </div>

                    <!--Comment Block-->
                    <div class="post-comments">
                        <h3 class="cmt-title">Bình luân<sup>(26)</sup></h3>
                        <%
                            System.out.println("on jsp file: "+blog.getCommentRootBlogs().size());
                            for (CommentBlog b:blog.getCommentRootBlogs()
                                 ) {

                            }%>
                        <div class="comment-form">
                            <form action="#" method="post" name="frm-post-comment">
                                <p class="form-row">
                                    <textarea name="txt-comment" id="txt-comment-ath-3364" cols="30" rows="10" placeholder="Viết bình luận của bạn"></textarea>
                                    <a href="#" class="current-author"><img src="assets/images/blogpost/viewer-avt.png" width="41" height="41" alt=""></a>
                                </p>
                                <p class="form-row last-btns">
                                    <button type="submit" class="btn btn-sumit">Đăng bình luận</button>
                                </p>
                            </form>
                        </div>

                        <div class="comment-list">

                            <ol class="post-comments lever-0">
<%--                                <li class="comment-elem">--%>
<%--                                    <div class="wrap-post-comment">--%>

<%--                                        <div class="cmt-inner">--%>
<%--                                            <div class="auth-info">--%>
<%--                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-02.png" alt="" width="29" height="28">Người nào đó</a>--%>
<%--                                                <span class="cmt-time">4 days ago</span>--%>
<%--                                            </div>--%>
<%--                                            <div class="cmt-content">--%>
<%--                                                <p>Bài viết có những chia sẻ thú vị và bổ ích</p>--%>
<%--                                            </div>--%>
<%--                                            <div class="cmt-fooot">--%>
<%--                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="comment-resposes">--%>
<%--                                            <ol class="post-comments lever-1">--%>
<%--                                                <li class="comment-elem">--%>
<%--                                                    <div class="wrap-post-comment">--%>
<%--                                                        <div class="cmt-inner">--%>
<%--                                                            <div class="auth-info">--%>
<%--                                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">admin</a>--%>
<%--                                                                <span class="cmt-time">4 days ago</span>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="cmt-content">--%>
<%--                                                                <p>Cám ơn bạn!</p>--%>

<%--                                                            </div>--%>
<%--                                                            <div class="cmt-fooot">--%>
<%--                                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </li>--%>
<%--                                            </ol>--%>
<%--                                        </div>--%>
<%--&lt;%&ndash;                                        <div class="comment-resposes">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <ol class="post-comments lever-1">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <li class="comment-elem">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="wrap-post-comment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <div class="cmt-inner">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <div class="auth-info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">admin</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <span class="cmt-time">4 days ago</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <div class="cmt-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <p>Cám ơn bạn! 2</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <div class="cmt-fooot">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </ol>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>

<%--                                    </div>--%>
<%--                                </li>--%>

    <% for (CommentBlog commentBlog: blog.getCommentRootBlogs()
            ) {
        System.out.println("[SIZE]"+blog.getCommentRootBlogs().size());
%>
                               <li class="comment-elem">
                                    <div class="wrap-post-comment">

                                        <div class="cmt-inner">
                                            <div class="auth-info">
                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-02.png" alt="" width="29" height="28"><%=commentBlog.getId_user()%></a>
                                                <span class="cmt-time"><%=commentBlog.getDate_post().toString()%></span>
                                            </div>
                                            <div class="cmt-content">
                                                <p><%=commentBlog.getComment_content()%></p>
                                            </div>
                                            <div class="cmt-fooot">
                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>
                                            </div>
                                        </div>
                                        <% for (IComment x: commentBlog.getChildren()
                                        ) {
    CommentBlog child = (CommentBlog) x;

                                        %>
                                        <div class="comment-resposes">
                                            <ol class="post-comments lever-1">
                                                <li class="comment-elem">
                                                    <div class="wrap-post-comment">
                                                        <div class="cmt-inner">
                                                            <div class="auth-info">
                                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">@<b style="color:green;"><%=child.getParent()+" "%></b><%=child.getId_user()%></a>
                                                                <span class="cmt-time"><%=child.getDate_post().toString()%></span>
                                                            </div>
                                                            <div class="cmt-content">
                                                                <p><%=child.getComment_content()%></p>
                                                            </div>
                                                            <div class="cmt-fooot">
                                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ol>
                                        </div>
                                        <%}%>

                                    </div>
                                </li>
                                <%}%>
                            </ol>

<%--                            <div class="biolife-panigations-block ">--%>
<%--                                <ul class="panigation-contain">--%>
<%--                                    <li><span class="current-page">1</span></li>--%>
<%--                                    <li><a href="#" class="link-page">2</a></li>--%>
<%--                                    <li><a href="#" class="link-page">3</a></li>--%>
<%--                                    <li><span class="sep">....</span></li>--%>
<%--                                    <li><a href="#" class="link-page">20</a></li>--%>
<%--                                    <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                        </div>

                    </div>

                </div>

                <!-- Sidebar -->
                <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">
                    <div class="sidebar-contain">

                        <!--Posts Widget-->
                        <div class="widget posts-widget">
                            <h4 class="wgt-title">Bài viết gần đây</h4>
                            <div class="wgt-content">
                                <ul class="posts">
                                    <%
                                        List<Integer> numbersComment = (List<Integer>) request.getAttribute("numberCommentsWithRelateBlogs");
                                        Iterator<Integer> itor = numbersComment.iterator();
                                        for (Blog b:(List<Blog>)request.getAttribute("relateBlogs")
                                             ) {
                                            int numberComment = itor.next();
        String link = "ChiTietBlog?id_blog="+b.getId_blog();
                                    %>
                                    <li>
                                        <div class="wgt-post-item">
                                            <div class="thumb">
                                                <a href=<%=link%>><img src=<%=b.getImg_url()%> width="80" height="58" alt=""></a>
                                            </div>
                                            <div class="detail">
                                                <h4 class="post-name"><a style="font-size: 13px;" href=<%=link%>><%=b.getName()%></a></h4>
                                                <p class="post-archive"><%=b.getDate_post().toString()%>><span class="comment"><%=numberComment%>> Bình luận</span></p>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
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
                                            <!--                                            <li><a href="chinhSachGiaoHang.jsp">Chích sách giao hàng</a></li>-->
                                            <!--                                            <li><a href=" lienHe.jsp">liên hệ</a></li>-->
                                            <li ><a href="TrangChu">Trang chủ</a></li>
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