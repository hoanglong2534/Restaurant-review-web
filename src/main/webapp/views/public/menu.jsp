<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Menu</title>
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
        .portfolio-content img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            object-position: center;
            display: block;
        }

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
    </style>

</head>

<body class="index-page">

<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

        <a href="index.html" class="logo d-flex align-items-center me-auto">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <h1 class="sitename">HOLO</h1>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="" >Trang chủ</a></li>
                <li><a href="">Giới thiệu</a></li>
                <li><a href="/" class="active">Thực đơn</a></li>
                <li><a href="/login">Đăng nhập</a></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>

    </div>
</header>

<main class="main">


    <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <h2>HoLo</h2>
            <p>Danh sách món ăn</p>
        </div><!-- End Section Title -->

        <div class="container">

            <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

                <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
                    <li data-filter="*" class="filter-active">Tất cả</li>
                    <li data-filter=".filter-app">Súp</li>
                    <li data-filter=".filter-product">Khai vị</li>
                    <li data-filter=".filter-branding">Cơm chiên</li>
                </ul><!-- End Portfolio Filters -->

                <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/app-1.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Súp 1</h4>
                                <p>Súp gà ngô non</p>
                                <a href="assets/img/portfolio/app-1.png" title="Súp gà ngô non"
                                   data-gallery="portfolio-gallery-app"
                                   class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=1" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/product-1.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Khai vị 1</h4>
                                <p>Nộm rau muống</p>
                                <a href="assets/img/portfolio/product-1.png" title="Nộm rau muống"
                                   data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i
                                        class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=2" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/branding-1.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Cơm chiên 1</h4>
                                <p>Cơm chiên chay ngũ sắc</p>
                                <a href="assets/img/portfolio/branding-1.png" title="Cơm chiên chay ngũ sắc"
                                   data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i
                                        class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=3" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->


                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/app-2.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Súp 2</h4>
                                <p>Súp rau củ</p>
                                <a href="assets/img/portfolio/app-2.png" title="Súp rau củ"
                                   data-gallery="portfolio-gallery-app"
                                   class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=4" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/product-2.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Khai vị 2</h4>
                                <p>Chả giò chay</p>
                                <a href="assets/img/portfolio/product-2.png" title="Chả giò chay"
                                   data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i
                                        class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=5" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/branding-2.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Cơm chiên 2</h4>
                                <p>Cơm chiên dương châu</p>
                                <a href="assets/img/portfolio/branding-2.png" title="Cơm chiên dương châu"
                                   data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i
                                        class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=6" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->


                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/app-3.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Súp 3</h4>
                                <p>Súp gà nấm hương</p>
                                <a href="assets/img/portfolio/app-3.png" title="Súp gà nấm hương"
                                   data-gallery="portfolio-gallery-app"
                                   class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=7" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/product-3.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Khai vị 3</h4>
                                <p>Há cảo chay</p>
                                <a href="assets/img/portfolio/product-3.png" title="Há cảo chay"
                                   data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i
                                        class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=8" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
                        <div class="portfolio-content h-100">
                            <img src="assets/img/portfolio/branding-3.png" class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h4>Cơm chiên 3</h4>
                                <p>Cơm chiên nấm rong biển</p>
                                <a href="assets/img/portfolio/branding-3.png" title="Cơm chiên nấm rong biển"
                                   data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i
                                        class="bi bi-zoom-in"></i></a>
                                <a href="/detail?id=9" title="More Details" class="details-link"><i
                                        class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div><!-- End Portfolio Item -->

                </div><!-- End Portfolio Container -->

            </div>

        </div>

    </section><!-- /Portfolio Section -->

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