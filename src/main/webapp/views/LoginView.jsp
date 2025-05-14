<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Đăng nhập</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/main.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f8fafc 0%, #e0e7ff 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Roboto', sans-serif;
        }
        .login-container {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 41, 55, 0.15);
            padding: 40px 32px 32px 32px;
            max-width: 400px;
            width: 100%;
        }
        .login-title {
            font-weight: 700;
            font-size: 2rem;
            color: #1e293b;
            margin-bottom: 10px;
            text-align: center;
        }
        .login-desc {
            color: #64748b;
            text-align: center;
            margin-bottom: 24px;
        }
        .form-label {
            font-weight: 500;
            color: #334155;
        }
        .form-control {
            border-radius: 8px;
            min-height: 44px;
        }
        .btn-login {
            width: 100%;
            border-radius: 8px;
            font-weight: 600;
            background: #6366f1;
            border: none;
            color: #fff;
            margin-top: 10px;
            transition: background 0.2s;
        }
        .btn-login:hover {
            background: #4338ca;
        }
        .error-message {
            color: #dc3545;
            background: #f8d7da;
            border-radius: 6px;
            padding: 8px 12px;
            margin-bottom: 16px;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="login-title">Đăng nhập</div>
        <div class="login-desc">Vui lòng nhập tài khoản để tiếp tục</div>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        <form action="<%=request.getContextPath()%>/login" method="post" autocomplete="off">
            <div class="mb-3">
                <label for="username" class="form-label">Tên đăng nhập</label>
                <input type="text" class="form-control" id="username" name="username" required autofocus>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-login">Đăng nhập</button>
        </form>
    </div>
    <script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
