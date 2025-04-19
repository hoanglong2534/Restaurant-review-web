
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Chi tiết</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="assets/img/favicon2.png" rel="icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">

    <style>
        html,
        body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        main.main {
            flex: 1;
            padding-top: 80px;
        }

        .header {
            background-color: rgba(0, 0, 0, 0.8);
            transition: background-color 0.3s ease;
        }

        body {
            margin-top: 20px;
            background: #ebeef0;
        }

        .img-sm {
            width: 46px;
            height: 46px;
        }

        .panel {
            box-shadow: 0 2px 0 rgba(0, 0, 0, 0.075);
            border-radius: 0;
            border: 0;
            margin-bottom: 15px;
        }

        .panel .panel-footer,
        .panel>:last-child {
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        .panel .panel-heading,
        .panel>:first-child {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .panel-body {
            padding: 25px 20px;
        }


        .media-block .media-left {
            display: block;
            float: left;
        }

        .media-block .media-left img {
            border-radius: 60%;
            margin-right: 10px;
        }

        .media-block .media-right {
            float: right
        }

        .media-block .media-body {
            display: block;
            overflow: hidden;
            width: auto
        }

        .middle .media-left,
        .middle .media-right,
        .middle .media-body {
            vertical-align: middle
        }

        .thumbnail {
            border-radius: 0;
            border-color: #e9e9e9
        }

        .tag.tag-sm,
        .btn-group-sm>.tag {
            padding: 5px 10px;
        }

        .tag:not(.label) {
            background-color: #fff;
            padding: 6px 12px;
            border-radius: 2px;
            border: 1px solid #cdd6e1;
            font-size: 12px;
            line-height: 1.42857;
            vertical-align: middle;
            -webkit-transition: all .15s;
            transition: all .15s;
        }

        .text-muted,
        a.text-muted:hover,
        a.text-muted:focus {
            color: #acacac;
        }

        .text-sm {
            font-size: 0.9em;
        }

        .text-5x,
        .text-4x,
        .text-5x,
        .text-2x,
        .text-lg,
        .text-sm,
        .text-xs {
            line-height: 1.25;
        }

        .btn-trans {
            background-color: transparent;
            border-color: transparent;
            color: #929292;
        }

        .btn-icon {
            padding-left: 9px;
            padding-right: 9px;
        }

        .btn-sm,
        .btn-group-sm>.btn,
        .btn-icon.btn-sm {
            padding: 5px 10px !important;
        }

        .mar-top {
            margin-top: 15px;
        }

        .hover-effect {
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            border-radius: 12px;
        }

        .hover-effect:hover {
            transform: scale(1.02);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }
        .btn-hover-success:hover, .btn-hover-danger:hover{
            color: blue;
        }

    </style>

</head>

<body class="index-page">

<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

        <a href="index.html" class="logo d-flex align-items-center me-auto">
            <h1 class="sitename">HOLO</h1>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="">Trang chủ</a></li>
                <li><a href="">Giới thiệu</a></li>
                <li><a href="/" class="active">Menu</a></li>
                <li><a href="">Đăng nhập</a></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>

    </div>
</header>

<main class="main">

    <!-- Product section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0 hover-effect" src="assets/img/portfolio/app-1.png"
                                           alt="..." />
                </div>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder">Súp gà ngô non</h1>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-line-through">50.000</span>
                        <span>40.000 VND</span>
                    </div>
                    <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi.
                        Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea
                        iste laborum vero?</p>
                    <div class="d-flex">
                        <input class="form-control text-center me-3 " placeholder="Nhập số lượng" id="inputQuantity" type="num" value=""
                               style="max-width: 8rem" />
                        <button class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Review -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container bootdey">
        <div class="col-md-12 bootstrap snippets">
            <div class="panel">
                <div class="panel-body">
                    <textarea class="form-control" rows="2" placeholder="Bạn thấy món ăn này như thế nào? Chia sẻ cho mọi người cùng biết nhé!"></textarea>
                    <div class="mar-top clearfix">
                        <button class="btn btn-sm btn-primary pull-right" type="submit"><i class="fa fa-pencil fa-fw"></i>
                            Bình luận ngay</button>

                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="panel-body">
                    <!-- Newsfeed Content -->
                    <!--===================================================-->
                    <div class="media-block">
                        <a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture"
                                                            src="https://bootdey.com/img/Content/avatar/avatar1.png"></a>
                        <div class="media-body">
                            <div class="mar-btm">
                                <a href="#" class="btn-link text-semibold media-heading box-inline " style="text-decoration: none;">Nguyễn Văn A</a>
                            </div>
                            <p>Ngon quá</p>
                            <div class="pad-ver">
                                <div class="btn-group">
                                    <span class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></span>
                                    <span class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></span>
                                </div>
                                <a class="btn btn-sm btn-default btn-hover-primary" href="#">Phản hồi</a>
                            </div>
                            <hr>

                            <!-- Comments -->
                            <div>
                                <div class="media-block">
                                    <a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture"
                                                                        src="https://bootdey.com/img/Content/avatar/avatar2.png"></a>
                                    <div class="media-body">
                                        <div class="mar-btm">
                                            <a href="#" class="btn-link text-semibold media-heading box-inline " style="text-decoration: none;" >Nguyễn Thị B</a>


                                        </div>
                                        <p>Hấp dẫn thật</p>
                                        <div class="pad-ver">
                                            <div class="btn-group">
                                                <span class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></span>
                                                <span class="btn btn-sm btn-default btn-hover-danger" href="#"><i
                                                        class="fa fa-thumbs-down"></i></span>
                                            </div>
                                            <a class="btn btn-sm btn-default btn-hover-primary" href="#">Phản hồi</a>
                                        </div>

                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<footer id="footer" class="footer dark-background">

    <div class="container copyright text-center mt-4">
        <p>© <span>Copyright</span> <strong class="px-1 sitename">Hoang Long</strong> <span>All Rights Reserved</span>
        </p>
    </div>

</footer>

<!-- Scroll Top -->
<a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Preloader -->
<div id="preloader"></div>

<!-- Vendor JS Files -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

<!-- Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>