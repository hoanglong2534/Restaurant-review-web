
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>

    <!-- Favicons -->
    <link href="assets/img/favicon2.png" rel="icon">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f7fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            border: none;
        }

        .cardbody-color {
            background-color: #ffffff;
            padding: 2.5rem;
        }

        .form-title {
            font-size: 2rem;
            font-weight: bold;
            color: #0e1c36;
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .form-label {
            font-weight: 500;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding: 0.75rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #0e1c36;
            box-shadow: 0 0 8px rgba(14, 28, 54, 0.2);
            outline: none;
        }

        .btn-color {
            background-color: #0e1c36;
            color: #fff;
            border-radius: 8px;
            padding: 0.75rem;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-color:hover {
            background-color:  #0e1c36;
            transform: translateY(-2px);
            color: #fff;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-lg-4 offset-md-3 offset-lg-4">
            <div class="card my-5">
                <form class="card-body cardbody-color">
                    <div class="text-center">
                        <h2 class="form-title">Đăng nhập</h2>
                    </div>

                    <div class="mb-4">
                        <label for="Username" class="form-label">Tên người dùng</label>
                        <input type="text" class="form-control" id="Username" placeholder="User Name">
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-color px-5 mb-5 w-100">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>
