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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

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
        .panel>:last-child {
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

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
        .media-block .media-body {
            display: block;
            overflow: hidden;
            width: auto
        }

        .middle .media-left,
        .middle .media-body {
            vertical-align: middle
        }

        .btn-sm,
        .btn-group-sm>.btn {
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

        .btn-group {
            display: inline-flex;
            align-items: center;
        }

        .like-button, .dislike-button {
            cursor: pointer;
            color: #000;
            transition: color 0.3s ease;
            margin-right: 5px;
        }

        .like-button:hover, .dislike-button:hover,
        .like-button.active, .dislike-button.active {
            color: blue;
        }

        .like-count, .dislike-count {
            margin-right: 15px;
            margin-left: 5px;
        }

        .reply-button {
            margin-left: 10px;
        }

        .btn-hover-primary:hover {
            color: red;
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
                <li><a href="/" class="active">Thực đơn</a></li>
                <li><a href="#contact">Đăng nhập</a></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
    </div>
</header>

<main class="main">

    <!-- Product section -->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0 hover-effect" src="assets/img/portfolio/app-1.png" alt="..." />
                </div>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder">Súp gà ngô non</h1>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-line-through">50.000</span>
                        <span>40.000 VND</span>
                    </div>
                    <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
                    <div class="d-flex">
                        <input class="form-control text-center me-3" placeholder="Nhập số lượng" id="inputQuantity" type="number"
                               style="max-width: 8rem" />
                        <button class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="bi-cart-fill me-1"></i> Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Review Section -->
    <div class="container bootdey">
        <div class="col-md-12 bootstrap snippets">
            <!-- Nhập bình luận chính -->
            <div class="panel">
                <div class="panel-body">
                    <textarea class="form-control" rows="2"
                              placeholder="Bạn thấy món ăn này như thế nào? Chia sẻ cho mọi người cùng biết nhé!"></textarea>
                    <div class="mar-top clearfix">
                        <button class="btn btn-sm btn-primary pull-right" type="submit">
                            <i class="fa fa-pencil fa-fw"></i> Bình luận ngay
                        </button>
                    </div>
                </div>
            </div>

            <!-- Một bình luận -->
            <div class="panel">
                <div class="panel-body">
                    <div class="media-block">
                        <a class="media-left" href="#"><img class="img-circle img-sm"
                                                            src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Picture"></a>
                        <div class="media-body">
                            <div class="mar-btm">
                                <a href="#" class="btn-link text-semibold media-heading box-inline"
                                   style="text-decoration: none;">Nguyễn Văn A</a>
                            </div>
                            <p>Món ăn rất ngon!</p>
                            <div class="pad-ver">
                                <div class="btn-group">
                                    <span class="like-button" data-liked="false"><i class="fa fa-thumbs-up"></i></span>
                                    <span class="like-count">0</span>
                                    <span class="dislike-button" data-disliked="false"><i class="fa fa-thumbs-down"></i></span>
                                    <span class="dislike-count">0</span>
                                    <a href="#" class="btn btn-sm btn-default btn-hover-primary reply-button">Phản hồi</a>
                                </div>
                            </div>
                            <hr>

                            <!-- Một phản hồi con -->
                            <div class="media-block">
                                <a class="media-left" href="#"><img class="img-circle img-sm"
                                                                    src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="Profile Picture"></a>
                                <div class="media-body">
                                    <div class="mar-btm">
                                        <a href="#" class="btn-link text-semibold media-heading box-inline"
                                           style="text-decoration: none;">Nguyễn Thị B</a>
                                    </div>
                                    <p>Mình cũng thấy vậy, ngon quá</p>
                                    <div class="pad-ver">
                                        <div class="btn-group">
                                            <span class="like-button" data-liked="false"><i class="fa fa-thumbs-up"></i></span>
                                            <span class="like-count">0</span>
                                            <span class="dislike-button" data-disliked="false"><i class="fa fa-thumbs-down"></i></span>
                                            <span class="dislike-count">0</span>
                                            <a href="#" class="btn btn-sm btn-default btn-hover-primary reply-button">Phản hồi</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End phản hồi con -->

                        </div>
                    </div>
                </div>
            </div>
            <!-- End một bình luận -->
        </div>
    </div>
</main>

<footer id="footer" class="footer dark-background">
    <div class="container copyright text-center mt-4">
        <p>© <span>Copyright</span> <strong class="px-1 sitename">Hoang Long</strong> <span>All Rights Reserved</span></p>
    </div>
</footer>

<!-- Reply Box Template (ẩn sẵn, sẽ chèn qua JS) -->
<template id="reply-template">
    <div class="reply-box mt-2">
        <textarea class="form-control mb-2" rows="2" placeholder="Viết phản hồi..."></textarea>
        <button class="btn btn-sm btn-primary">Gửi phản hồi</button>
    </div>
</template>

<!-- JS xử lý phản hồi và like/dislike -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Xử lý phản hồi
        const template = document.querySelector("#reply-template").innerHTML;

        document.querySelectorAll(".reply-button").forEach(button => {
            button.addEventListener("click", function (e) {
                e.preventDefault();

                // Xoá các ô reply hiện tại
                document.querySelectorAll(".reply-box").forEach(el => el.remove());

                // Tìm phần media-body gần nhất
                const parent = this.closest(".media-body");

                // Thêm ô nhập phản hồi
                const box = document.createElement("div");
                box.innerHTML = template;
                parent.appendChild(box);
            });
        });

        // Xử lý like/dislike cho mỗi nhóm nút
        document.querySelectorAll(".btn-group").forEach(group => {
            const likeButton = group.querySelector(".like-button");
            const dislikeButton = group.querySelector(".dislike-button");
            const likeCountElement = group.querySelector(".like-count");
            const dislikeCountElement = group.querySelector(".dislike-count");

            // Xử lý like
            likeButton.addEventListener("click", function () {
                const isLiked = this.getAttribute("data-liked") === "true";
                const isDisliked = dislikeButton.getAttribute("data-disliked") === "true";
                let likeCount = parseInt(likeCountElement.textContent);

                // Nếu đã dislike, reset dislike trước khi like
                if (isDisliked) {
                    dislikeButton.setAttribute("data-disliked", "false");
                    dislikeButton.classList.remove("active");
                    dislikeCountElement.textContent = "0";
                }

                // Toggle trạng thái like
                if (isLiked) {
                    likeCount -= 1;
                    this.setAttribute("data-liked", "false");
                    this.classList.remove("active");
                } else {
                    likeCount += 1;
                    this.setAttribute("data-liked", "true");
                    this.classList.add("active");
                }

                likeCountElement.textContent = likeCount;
            });

            // Xử lý dislike
            dislikeButton.addEventListener("click", function () {
                const isDisliked = this.getAttribute("data-disliked") === "true";
                const isLiked = likeButton.getAttribute("data-liked") === "true";
                let dislikeCount = parseInt(dislikeCountElement.textContent);

                // Nếu đã like, reset like trước khi dislike
                if (isLiked) {
                    likeButton.setAttribute("data-liked", "false");
                    likeButton.classList.remove("active");
                    likeCountElement.textContent = "0";
                }

                // Toggle trạng thái dislike
                if (isDisliked) {
                    dislikeCount -= 1;
                    this.setAttribute("data-disliked", "false");
                    this.classList.remove("active");
                } else {
                    dislikeCount += 1;
                    this.setAttribute("data-disliked", "true");
                    this.classList.add("active");
                }

                dislikeCountElement.textContent = dislikeCount;
            });
        });
    });
</script>

</body>

</html>