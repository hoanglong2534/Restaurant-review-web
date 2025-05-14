<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Chi tiết món ăn</title>
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
        <a href="/" class="logo d-flex align-items-center me-auto">
            <h1 class="sitename">HOLO</h1>
        </a>
        <%
            Object userObj = session.getAttribute("user");
            request.setAttribute("isLoggedIn", userObj != null);
            String fullName = "";
            Integer currentUserId = null;
            if (userObj != null) {
                fullName = ((com.javaweb.model.User) userObj).getFullName();
                currentUserId = ((com.javaweb.model.User) userObj).getId();
            }
            request.setAttribute("currentUserId", currentUserId);
        %>
        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="/" class="active">Thực đơn</a></li>
                <% if (userObj != null) { %>
                    <li><a href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                <% } else { %>
                    <li><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                <% } %>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <% if (userObj != null) { %>
            <span class="navmenu-user" style="margin-left: 32px; color: #fff; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;">
                Xin chào, <%= fullName %>!
            </span>
        <% } %>
    </div>
</header>
<main class="main">
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center mt-5">${error}</div>
    </c:if>
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
                    <c:if test="${isLoggedIn}">
                        <form action="${pageContext.request.contextPath}/detail?id=${dish.id}" method="post" enctype="multipart/form-data" style="margin-bottom: 24px;">
                            <div class="rating-wrapper">
                                <span class="rating-label">Đánh giá món ăn:</span>
                                <div class="star-rating" data-rating="0">
                                    <c:forEach var="i" begin="1" end="5">
                                        <input type="radio" name="star" value="${i}" id="star${i}" required>
                                        <label for="star${i}"><i class="fas fa-star"></i></label>
                                    </c:forEach>
                                </div>
                            </div>

                        </form>
                    </c:if>
                    <c:if test="${!isLoggedIn}">
                        <div class="alert alert-info text-center">
                            Bạn cần <a href="${pageContext.request.contextPath}/login">đăng nhập</a> để bình luận.
                        </div>
                    </c:if>
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
                    <c:if test="${!isLoggedIn}">
                        <div class="alert alert-info text-center">
                            Bạn cần <a href="${pageContext.request.contextPath}/login">đăng nhập</a> để tương tác (bình luận, thích, phản hồi, báo cáo...)
                        </div>
                    </c:if>
                    <c:forEach var="review" items="${reviews}">
                        <div class="media-block" style="margin-bottom: 32px;">
                            <div class="media-body">
                                <div class="mar-btm">
                                    <a href="#" class="btn-link text-semibold media-heading box-inline" style="text-decoration: none; color: #e74c3c;">
                                        ${review.userFullName}
                                    </a>
                                    <span class="comment-time text-muted" style="margin-left: 10px; font-size: 0.9rem;">
                                        <fmt:formatDate value="${review.createDate}" pattern="dd/MM/yyyy"/>
                                    </span>
                                    <span class="badge bg-warning text-dark ms-2">${review.star}★</span>
                                </div>
                                <p class="comment-text">${review.content}</p>
                                <c:if test="${not empty review.image}">
                                    <img class="comment-image" src="${review.image}" alt="Review Image">
                                </c:if>
                                <c:if test="${isLoggedIn}">
                                    <form action="${pageContext.request.contextPath}/interaction" method="post" style="display:inline;">
                                        <input type="hidden" name="reviewId" value="${review.id}"/>
                                        <input type="hidden" name="type" value="like"/>
                                        <button type="submit" class="like-button" style="background:none;border:none;padding:0;"><i class="fa fa-thumbs-up"></i></button>
                                        <span class="like-count">${likeDislikeMap[review.id][0]}</span>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/interaction" method="post" style="display:inline;">
                                        <input type="hidden" name="reviewId" value="${review.id}"/>
                                        <input type="hidden" name="type" value="dislike"/>
                                        <button type="submit" class="dislike-button" style="background:none;border:none;padding:0;"><i class="fa fa-thumbs-down"></i></button>
                                        <span class="dislike-count">${likeDislikeMap[review.id][1]}</span>
                                    </form>
                                    <button type="button" class="btn btn-sm btn-default btn-hover-primary reply-toggle" data-review-id="${review.id}">Phản hồi</button>
                                    <span class="report-button" data-bs-toggle="modal" data-bs-target="#reportModal" data-review-id="${review.id}"><i class="fa fa-flag"></i> Báo cáo</span>
                                    <c:if test="${review.userId == currentUserId}">
                                        <button type="button" class="btn btn-sm btn-warning edit-toggle" data-review-id="${review.id}">Sửa</button>
                                        <div class="edit-form" id="edit-form-${review.id}" style="display:none; margin-top:10px;">
                                            <form action="${pageContext.request.contextPath}/detail?id=${dish.id}" method="post">
                                                <input type="hidden" name="reviewId" value="${review.id}" />
                                                <textarea class="form-control mb-2" name="content" rows="2">${review.content}</textarea>
                                                <input type="number" name="star" min="1" max="5" value="${review.star}" class="form-control mb-2" style="width:100px;display:inline-block;" />
                                                <button type="submit" class="btn btn-primary btn-sm">Lưu</button>
                                                <button type="button" class="btn btn-secondary btn-sm cancel-edit" data-review-id="${review.id}">Hủy</button>
                                            </form>
                                        </div>
                                    </c:if>
                                    <div class="reply-form" id="reply-form-${review.id}" style="display:none; margin-top:10px;">
                                        <form action="${pageContext.request.contextPath}/comment" method="post">
                                            <input type="hidden" name="reviewId" value="${review.id}" />
                                            <textarea class="form-control mb-2" name="content" rows="2" placeholder="Viết phản hồi..."></textarea>
                                            <button type="submit" class="btn btn-primary btn-sm">Gửi</button>
                                        </form>
                                    </div>
                                </c:if>
                                <!-- Hiển thị comment cho review này -->
                                <c:forEach var="comment" items="${commentsMap[review.id]}">
                                    <div class="media-block" style="margin-left: 40px;">
                                        <div class="media-body">
                                            <div class="mar-btm">
                                                <a href="#" class="btn-link text-semibold media-heading box-inline" style="text-decoration: none; color: #2980b9;">
                                                    ${comment.userFullName}
                                                </a>
                                                <span class="comment-time text-muted" style="margin-left: 10px; font-size: 0.9rem;">
                                                    <fmt:formatDate value="${comment.createDate}" pattern="dd/MM/yyyy"/>
                                                </span>
                                            </div>
                                            <p class="comment-text">${comment.content}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
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
            <form id="reportForm" action="${pageContext.request.contextPath}/report" method="post">
                <input type="hidden" id="reportReviewId" name="reviewId" value="" />
                <div class="modal-header">
                    <h5 class="modal-title" id="reportModalLabel">Báo cáo đánh giá</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Vui lòng chọn lý do báo cáo:</p>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="reason" id="reason1" value="Ngôn từ không phù hợp" required>
                        <label class="form-check-label" for="reason1">Ngôn từ không phù hợp</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="reason" id="reason2" value="Thông tin sai lệch" required>
                        <label class="form-check-label" for="reason2">Thông tin sai lệch</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="reason" id="reason3" value="Khác" required>
                        <label class="form-check-label" for="reason3">Khác</label>
                    </div>
                    <textarea class="form-control" id="otherReasonTextarea" name="reasonOther" rows="3" placeholder="Vui lòng nhập lý do cụ thể..."></textarea>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit" class="btn btn-primary">Gửi báo cáo</button>
                </div>
            </form>
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
        document.querySelectorAll(".reply-toggle").forEach(button => {
            button.addEventListener("click", function () {
                var reviewId = button.getAttribute('data-review-id');
                var form = document.getElementById('reply-form-' + reviewId);
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            });
        });
        document.querySelectorAll(".edit-toggle").forEach(function(btn) {
            btn.addEventListener('click', function() {
                var reviewId = btn.getAttribute('data-review-id');
                var form = document.getElementById('edit-form-' + reviewId);
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            });
        });
        document.querySelectorAll(".cancel-edit").forEach(function(btn) {
            btn.addEventListener('click', function() {
                var reviewId = btn.getAttribute('data-review-id');
                var form = document.getElementById('edit-form-' + reviewId);
                form.style.display = 'none';
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
        const reportModal = document.getElementById('reportModal');
        const reportForm = document.getElementById('reportForm');
        const otherReasonTextarea = document.getElementById('otherReasonTextarea');
        const reportReviewId = document.getElementById('reportReviewId');

        document.querySelectorAll('.report-button').forEach(button => {
            button.addEventListener('click', function() {
                const reviewId = this.getAttribute('data-review-id');
                console.log('Opening report modal for reviewId:', reviewId);
                reportReviewId.value = reviewId;
                
                reportForm.reset();
                otherReasonTextarea.style.display = 'none';
            });
        });

        document.querySelectorAll('input[name="reason"]').forEach(radio => {
            radio.addEventListener('change', function() {
                if (this.value === 'Khác') {
                    otherReasonTextarea.style.display = 'block';
                    otherReasonTextarea.setAttribute('required', 'required');
                } else {
                    otherReasonTextarea.style.display = 'none';
                    otherReasonTextarea.removeAttribute('required');
                    otherReasonTextarea.value = '';
                }
            });
        });

        reportForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const reviewId = reportReviewId.value;
            const selectedReason = document.querySelector('input[name="reason"]:checked');
            const otherReason = otherReasonTextarea.value.trim();

            console.log('Submitting report:', {
                reviewId: reviewId,
                reason: selectedReason ? selectedReason.value : null,
                otherReason: otherReason
            });

            // Hiển thị thông báo lỗi
            const errorAlertModal = new bootstrap.Modal(document.getElementById('errorAlertModal'));
            const errorAlertMessage = document.getElementById('errorAlertMessage');

            if (!reviewId) {
                errorAlertMessage.textContent = 'Lỗi: Không xác định được review để báo cáo!';
                errorAlertModal.show();
                return;
            }

            if (!selectedReason) {
                errorAlertMessage.textContent = 'Vui lòng chọn một lý do trước khi gửi báo cáo!';
                errorAlertModal.show();
                return;
            }

            if (selectedReason.value === 'Khác' && !otherReason) {
                errorAlertMessage.textContent = 'Vui lòng nhập lý do cụ thể khi chọn "Khác"!';
                errorAlertModal.show();
                return;
            }

            // Nếu mọi thứ hợp lệ, submit form
            this.submit();
            
            // Hiển thị thông báo thành công
            const reportModal = bootstrap.Modal.getInstance(document.getElementById('reportModal'));
            reportModal.hide();
            
            // Hiển thị alert thành công
            const customAlertModal = new bootstrap.Modal(document.getElementById('customAlertModal'));
            document.getElementById('customAlertMessage').textContent = 'Báo cáo đã được gửi thành công!';
            document.querySelector('#customAlertModal .modal-footer').innerHTML = 
                '<button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>';
            customAlertModal.show();
            
            // Reset form sau khi đóng alert
            customAlertModal._element.addEventListener('hidden.bs.modal', function () {
                reportForm.reset();
                otherReasonTextarea.style.display = 'none';
                document.querySelector('#customAlertModal .modal-footer').innerHTML = 
                    '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>' +
                    '<button type="button" class="btn btn-primary confirm-delete">OK</button>';
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