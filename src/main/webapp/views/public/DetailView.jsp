<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Chi tiết</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="assets/img/favicon2.png" rel="icon">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        html, body { height: 100%; margin: 0; display: flex; flex-direction: column; }
        body { margin-top: 20px; background: #ebeef0; min-height: 100vh; }
        main.main { flex: 1 0 auto; padding-top: 80px; padding-bottom: 100px; position: relative; }
        footer { flex-shrink: 0; width: 100%; position: static !important; }
        .header { background-color: rgba(0, 0, 0, 0.8); transition: background-color 0.3s ease; }
        .img-sm { width: 46px; height: 46px; }
        .panel { box-shadow: 0 2px 0 rgba(0, 0, 0, 0.075); border-radius: 0; border: 0; margin-bottom: 15px; }
        .panel>:last-child { border-bottom-left-radius: 0; border-bottom-right-radius: 0; }
        .panel>:first-child { border-top-left-radius: 0; border-top-right-radius: 0; }
        .panel-body { padding: 25px 20px; }
        .media-block .media-left { display: block; float: left; }
        .media-block .media-left img { border-radius: 60%; margin-right: 10px; }
        .media-block .media-body { display: block; overflow: hidden; width: auto; }
        .middle .media-left, .middle .media-body { vertical-align: middle; }
        .btn-sm, .btn-group-sm>.btn { padding: 5px 10px !important; }
        .mar-top { margin-top: 15px; display: flex; justify-content: space-between; align-items: center; }
        .hover-effect { transition: transform 0.4s ease, box-shadow 0.4s ease; border-radius: 12px; }
        .hover-effect:hover { transform: scale(1.02); box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2); }
        .btn-group { display: inline-flex !important; align-items: center; visibility: visible !important; }
        .pad-ver { padding: 10px 0; display: block !important; visibility: visible !important; }
        .like-button, .dislike-button { cursor: pointer; color: #000; transition: color 0.3s ease; margin-right: 5px; }
        .like-button:hover, .dislike-button:hover, .like-button.active, .dislike-button.active { color: blue; }
        .like-count, .dislike-count { margin-right: 15px; margin-left: 5px; }
        .reply-button { margin-left: 10px; }
        .report-button { margin-left: 10px; color: #666; cursor: pointer; transition: color 0.3s ease; }
        .report-button:hover { color: #dc3545; }
        .edit-button, .delete-button { margin-left: 10px; color: #666; cursor: pointer; transition: color 0.3s ease; }
        .edit-button:hover { color: #007bff; }
        .delete-button:hover { color: #dc3545; }
        .btn-hover-primary:hover { color: red; }
        #otherReasonTextarea { display: none; margin-top: 10px; }
        .star-rating { display: inline-block; font-size: 1.5rem; margin: 10px 0; }
        .star-rating .star { color: #ccc; cursor: pointer; transition: color 0.2s ease; }
        .star-rating .star.filled { color: #f39c12; }
        .star-rating .star:hover, .star-rating .star:hover ~ .star { color: #f1c40f; }
        .rating-wrapper { display: flex; align-items: center; gap: 10px; }
        .rating-label { font-size: 1.2rem; font-weight: 600; color: Orange; }
        .attach-photo-btn { cursor: pointer; color: #666; transition: color 0.3s ease; }
        .attach-photo-btn:hover { color: #007bff; }
        #photoInput { display: none; }
        .photo-preview { margin-top: 10px; max-width: 200px; max-height: 200px; display: none; }
        .photo-preview img { width: 100%; height: auto; border-radius: 5px; }
        .remove-photo { cursor: pointer; color: #dc3545; margin-left: 10px; font-size: 0.9rem; }
        .comment-image { margin-top: 10px; max-width: 200px; max-height: 200px; width: 100%; height: auto; border-radius: 5px; }
        .edit-textarea { margin-top: 10px; width: 100%; }
        .edit-actions { margin-top: 10px; }
        #customAlertModal .modal-dialog { max-width: 450px; }
        #errorAlertModal .modal-dialog { max-width: 450px; }
        .comment-image-link { position: relative; display: inline-block; }
        .comment-image-link .comment-image { transition: opacity 0.3s ease; }
        .comment-image-link:hover .comment-image { opacity: 0.8; }
    </style>
</head>
<body class="index-page">
<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">
        <a href="index.html" class="logo d-flex align-items-center me-auto">
            <h1 class="sitename">HOLO</h1>
        </a>
        <%
            Object userObj = session.getAttribute("user");
            boolean isLoggedIn = userObj != null;
            String fullName = "";
            if (isLoggedIn) {
                fullName = ((com.javaweb.model.User) userObj).getFullName();
            }
        %>
        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="/" class="active">Thực đơn</a></li>
                <% if (isLoggedIn) { %>
                    <li><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                <% } else { %>
                    <li><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                <% } %>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <% if (isLoggedIn) { %>
            <span class="navmenu-user" style="margin-left: 32px; color: #fff; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;">
                Xin chào, <%= fullName %>!
            </span>
        <% } %>
    </div>
</header>
<main class="main">
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0 hover-effect" src="${dish.image}" alt="${dish.name}" />
                </div>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder">${dish.name}</h1>
                    <div class="fs-5 mb-5">
                        <span>${dish.price} VND</span>
                    </div>
                    <p class="lead">${dish.description}</p>
                    <div class="d-flex">
                        <input class="form-control text-center me-3" placeholder="Nhập số lượng" id="inputQuantity" type="number" style="max-width: 10rem" />
                        <button class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="bi-cart-fill me-1"></i> Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="container bootdey">
        <div class="col-md-12 bootstrap snippets">
            <div class="panel">
                <div class="panel-body">
                    <div class="rating-wrapper">
                        <span class="rating-label">Đánh giá món ăn:</span>
                        <div class="star-rating" data-rating="0">
                            <span class="star" data-value="1"><i class="fas fa-star"></i></span>
                            <span class="star" data-value="2"><i class="fas fa-star"></i></span>
                            <span class="star" data-value="3"><i class="fas fa-star"></i></span>
                            <span class="star" data-value="4"><i class="fas fa-star"></i></span>
                            <span class="star" data-value="5"><i class="fas fa-star"></i></span>
                        </div>
                    </div>
                    <textarea class="form-control" rows="2" placeholder="Bạn thấy món ăn này như thế nào? Chia sẻ cho mọi người cùng biết nhé!"></textarea>
                    <div class="mar-top">
                        <label for="photoInput" class="attach-photo-btn">
                            <i class="fas fa-paperclip"></i> Đính kèm ảnh
                        </label>
                        <input type="file" id="photoInput" accept="image/*">
                        <button class="btn btn-sm btn-primary pull-right" type="submit">
                            <i class="fa fa-pencil fa-fw"></i> Bình luận ngay
                        </button>
                    </div>
                    <div class="photo-preview" id="photoPreview">
                        <img id="previewImage" src="" alt="Photo Preview">
                        <span class="remove-photo" id="removePhoto">Xóa</span>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="panel-body">
                    <div class="media-block" data-comment-id="1" data-is-own="true">
                        <a class="media-left" href="#"><img class="img-circle img-sm" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Picture"></a>
                        <div class="media-body">
                            <div class="mar-btm">
                                <a href="#" class="btn-link text-semibold media-heading box-inline" style="text-decoration: none;">Nguyễn Văn A</a>
                                <span class="comment-time text-muted" style="margin-left: 10px; font-size: 0.9rem;">
                                    15/04/2025
                                </span>
                            </div>
                            <p class="comment-text">Trang trí đẹp quá</p>
                            <div class="pad-ver">
                                <div class="btn-group">
                                    <span class="like-button" data-liked="false"><i class="fa fa-thumbs-up"></i></span>
                                    <span class="like-count">0</span>
                                    <span class="dislike-button" data-disliked="false"><i class="fa fa-thumbs-down"></i></span>
                                    <span class="dislike-count">0</span>
                                    <a href="#" class="btn btn-sm btn-default btn-hover-primary reply-button">Phản hồi</a>
                                    <span class="report-button" data-bs-toggle="modal" data-bs-target="#reportModal"><i class="fa fa-flag"></i> Báo cáo</span>
                                    <span class="edit-button"><i class="fa fa-edit"></i> Sửa</span>
                                    <span class="delete-button"><i class="fa fa-trash"></i> Xóa</span>
                                </div>
                            </div>
                            <hr>
                            <div class="media-block" data-comment-id="2" data-is-own="false">
                                <a class="media-left" href="#"><img class="img-circle img-sm" src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="Profile Picture"></a>
                                <div class="media-body">
                                    <digv class="mar-btm">
                                        <a href="#" class="btn-link text-semibold media-heading box-inline" style="text-decoration: none;">Nguyễn Thị B</a>
                                        <span class="comment-time text-muted" style="margin-left: 10px; font-size: 0.9rem;">
                                            16/04/2025
                                        </span>
                                    </digv>
                                    <p class="comment-text">Công phu ghê</p>
                                    <div class="pad-ver">
                                        <div class="btn-group">
                                            <span class="like-button" data-liked="false"><i class="fa fa-thumbs-up"></i></span>
                                            <span class="like-count">0</span>
                                            <span class="dislike-button" data-disliked="false"><i class="fa fa-thumbs-down"></i></span>
                                            <span class="dislike-count">0</span>
                                            <a href="#" class="btn btn-sm btn-default btn-hover-primary reply-button">Phản hồi</a>
                                            <span class="report-button" data-bs-toggle="modal" data-bs-target="#reportModal"><i class="fa fa-flag"></i> Báo cáo</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="media-block" data-comment-id="3" data-is-own="false">
                                <a class="media-left" href="#"><img class="img-circle img-sm" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Profile Picture"></a>
                                <div class="media-body">
                                    <div class="mar-btm">
                                        <a href="#" class="btn-link text-semibold media-heading box-inline" style="text-decoration: none;">Nguyễn Văn C</a>
                                        <span class="comment-time text-muted" style="margin-left: 10px; font-size: 0.9rem;">
                                            17/04/2025
                                        </span>
                                    </div>
                                    <p class="comment-text">Món súp này nhìn ngon quá, mình vừa thử làm ở nhà, đây là thành quả!</p>
                                    <a href="https://bootdey.com/img/Content/avatar/avatar3.png" title="Nguyen Van C's Soup" data-gallery="comment-gallery" class="glightbox comment-image-link">
                                        <img class="comment-image" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Nguyen Van C's Soup">
                                    </a>
                                    <div class="pad-ver">
                                        <div class="btn-group">
                                            <span class="like-button" data-liked="false"><i class="fa fa-thumbs-up"></i></span>
                                            <span class="like-count">0</span>
                                            <span class="dislike-button" data-disliked="false"><i class="fa fa-thumbs-down"></i></span>
                                            <span class="dislike-count">0</span>
                                            <a href="#" class="btn btn-sm btn-default btn-hover-primary reply-button">Phản hồi</a>
                                            <span class="report-button" data-bs-toggle="modal" data-bs-target="#reportModal"><i class="fa fa-flag"></i> Báo cáo</span>
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
        <p>© <span>Copyright</span> <strong class="px-1 sitename">Hoang Long</strong> <span>All Rights Reserved</span></p>
    </div>
</footer>
<template id="reply-template">
    <div class="reply-box mt-2">
        <textarea class="form-control mb-2" rows="2" placeholder="Viết phản hồi..."></textarea>
        <button class="btn btn-sm btn-primary">Gửi</button>
    </div>
</template>
<template id="edit-template">
    <div class="edit-box mt-2">
        <textarea class="form-control edit-textarea" rows="2"></textarea>
        <div class="edit-actions">
            <button class="btn btn-sm btn-primary save-edit">Lưu</button>
            <button class="btn btn-sm btn-secondary cancel-edit">Hủy</button>
        </div>
    </div>
</template>
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel">Báo cáo bình luận</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Vui lòng chọn lý do báo cáo:</p>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reportReason" id="reason1" value="Ngôn từ không phù hợp">
                    <label class="form-check-label" for="reason1">Ngôn từ không phù hợp</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reportReason" id="reason2" value="Thông tin sai lệch">
                    <label class="form-check-label" for="reason2">Thông tin sai lệch</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reportReason" id="reason3" value="Khác">
                    <label class="form-check-label" for="reason3">Khác</label>
                </div>
                <textarea class="form-control" id="otherReasonTextarea" rows="3" placeholder="Vui lòng nhập lý do cụ thể..."></textarea>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary" id="submitReport">Gửi báo cáo</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="customAlertModal" tabindex="-1" aria-labelledby="customAlertModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body text-center">
                <p id="customAlertMessage"></p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary confirm-delete">OK</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="errorAlertModal" tabindex="-1" aria-labelledby="errorAlertModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body text-center">
                <p id="errorAlertMessage"></p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const lightbox = GLightbox({ selector: '.glightbox' });
        const replyTemplate = document.querySelector("#reply-template").innerHTML;
        const editTemplate = document.querySelector("#edit-template").innerHTML;
        document.querySelectorAll(".reply-button").forEach(button => {
            button.addEventListener("click", function (e) {
                e.preventDefault();
                document.querySelectorAll(".reply-box").forEach(el => el.remove());
                const parent = this.closest(".media-body");
                const box = document.createElement("div");
                box.innerHTML = replyTemplate;
                parent.appendChild(box);
            });
        });
        document.querySelectorAll(".btn-group").forEach(group => {
            const likeButton = group.querySelector(".like-button");
            const dislikeButton = group.querySelector(".dislike-button");
            const likeCountElement = group.querySelector(".like-count");
            const dislikeCountElement = group.querySelector(".dislike-count");
            likeButton.addEventListener("click", function () {
                const isLiked = this.getAttribute("data-liked") === "true";
                const isDisliked = dislikeButton.getAttribute("data-disliked") === "true";
                let likeCount = parseInt(likeCountElement.textContent);
                if (isDisliked) {
                    dislikeButton.setAttribute("data-disliked", "false");
                    dislikeButton.classList.remove("active");
                    dislikeCountElement.textContent = "0";
                }
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
            dislikeButton.addEventListener("click", function () {
                const isDisliked = this.getAttribute("data-disliked") === "true";
                const isLiked = likeButton.getAttribute("data-liked") === "true";
                let dislikeCount = parseInt(dislikeCountElement.textContent);
                if (isLiked) {
                    likeButton.setAttribute("data-liked", "false");
                    likeButton.classList.remove("active");
                    likeCountElement.textContent = "0";
                }
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
        const reportReasons = document.querySelectorAll('input[name="reportReason"]');
        const otherReasonTextarea = document.getElementById("otherReasonTextarea");
        reportReasons.forEach(reason => {
            reason.addEventListener("change", function () {
                if (this.value === "Khác") {
                    otherReasonTextarea.style.display = "block";
                    otherReasonTextarea.focus();
                } else {
                    otherReasonTextarea.style.display = "none";
                    otherReasonTextarea.value = "";
                }
            });
        });
        document.getElementById("submitReport").addEventListener("click", function () {
            const selectedReason = document.querySelector('input[name="reportReason"]:checked');
            const reportModal = bootstrap.Modal.getInstance(document.getElementById("reportModal"));
            const errorAlertModal = new bootstrap.Modal(document.getElementById("errorAlertModal"));
            const errorAlertMessage = document.getElementById("errorAlertMessage");
            const customAlertModal = new bootstrap.Modal(document.getElementById("customAlertModal"));
            const customAlertMessage = document.getElementById("customAlertMessage");
            const modalFooter = document.querySelector("#customAlertModal .modal-footer");
            if (!selectedReason) {
                errorAlertMessage.textContent = "Vui lòng chọn một lý do trước khi gửi báo cáo!";
                errorAlertModal.show();
                return;
            }
            if (selectedReason.value === "Khác" && !otherReasonTextarea.value.trim()) {
                errorAlertMessage.textContent = "Vui lòng nhập lý do cụ thể khi chọn 'Khác'!";
                errorAlertModal.show();
                return;
            }
            customAlertMessage.textContent = "Báo cáo đã được gửi thành công!";
            modalFooter.innerHTML = '<button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>';
            customAlertModal.show();
            reportModal.hide();
            otherReasonTextarea.style.display = "none";
            otherReasonTextarea.value = "";
            document.querySelector('input[name="reportReason"]:checked').checked = false;
            customAlertModal._element.addEventListener('hidden.bs.modal', function () {
                modalFooter.innerHTML = `
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary confirm-delete">OK</button>
                `;
            }, { once: true });
        });
        const starRating = document.querySelector(".star-rating");
        const stars = starRating.querySelectorAll(".star");
        stars.forEach(star => {
            star.addEventListener("click", function () {
                const value = parseInt(this.getAttribute("data-value"));
                starRating.setAttribute("data-rating", value);
                stars.forEach(s => {
                    const starValue = parseInt(s.getAttribute("data-value"));
                    if (starValue <= value) {
                        s.classList.add("filled");
                    } else {
                        s.classList.remove("filled");
                    }
                });
            });
            star.addEventListener("mouseover", function () {
                const value = parseInt(this.getAttribute("data-value"));
                stars.forEach(s => {
                    const starValue = parseInt(s.getAttribute("data-value"));
                    if (starValue <= value) {
                        s.classList.add("filled");
                    } else {
                        s.classList.remove("filled");
                    }
                });
            });
            star.addEventListener("mouseout", function () {
                const currentRating = parseInt(starRating.getAttribute("data-rating"));
                stars.forEach(s => {
                    const starValue = parseInt(s.getAttribute("data-value"));
                    if (starValue <= currentRating) {
                        s.classList.add("filled");
                    } else {
                        s.classList.remove("filled");
                    }
                });
            });
        });
        const photoInput = document.getElementById("photoInput");
        const photoPreview = document.getElementById("photoPreview");
        const previewImage = document.getElementById("previewImage");
        const removePhoto = document.getElementById("removePhoto");
        photoInput.addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    previewImage.src = e.target.result;
                    photoPreview.style.display = "block";
                };
                reader.readAsDataURL(file);
            }
        });
        removePhoto.addEventListener("click", function () {
            photoPreview.style.display = "none";
            previewImage.src = "";
            photoInput.value = "";
        });
        document.querySelectorAll(".media-block").forEach(comment => {
            const isOwnComment = comment.getAttribute("data-is-own") === "true";
            if (!isOwnComment) return;
            const editButton = comment.querySelector(".edit-button");
            const deleteButton = comment.querySelector(".delete-button");
            const commentText = comment.querySelector(".comment-text");
            const commentImage = comment.querySelector(".comment-image");
            editButton.addEventListener("click", function () {
                document.querySelectorAll(".edit-box").forEach(el => el.remove());
                const parent = commentText.parentElement;
                const editBox = document.createElement("div");
                editBox.innerHTML = editTemplate;
                parent.insertBefore(editBox, commentText.nextSibling);
                const textarea = editBox.querySelector(".edit-textarea");
                textarea.value = commentText.textContent;
                const saveButton = editBox.querySelector(".save-edit");
                const cancelButton = editBox.querySelector(".cancel-edit");
                saveButton.addEventListener("click", function () {
                    const newText = textarea.value.trim();
                    if (newText) {
                        commentText.textContent = newText;
                        editBox.remove();
                    }
                });
                cancelButton.addEventListener("click", function () {
                    editBox.remove();
                });
            });
            deleteButton.addEventListener("click", function () {
                const customAlertModal = new bootstrap.Modal(document.getElementById("customAlertModal"));
                const customAlertMessage = document.getElementById("customAlertMessage");
                customAlertMessage.textContent = "Bạn có chắc chắn muốn xóa bình luận này?";
                customAlertModal.show();
                const confirmButton = document.querySelector("#customAlertModal .confirm-delete");
                confirmButton.addEventListener("click", function () {
                    comment.remove();
                    customAlertModal.hide();
                }, { once: true });
            });
        });
    });
</script>
</body>
</html>