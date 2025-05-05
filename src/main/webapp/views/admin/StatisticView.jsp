<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thống kê</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/assets/js/init-alpine.js" defer></script>
    <style>
        .container-fluid {
            max-width: 1400px;
            margin: 0 auto;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .table th, .table td {
            white-space: normal;
            word-break: break-word;
            vertical-align: middle;
        }
        .stat-card {
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }
        .stat-card h5 {
            color: #1f2937;
            font-weight: 600;
        }
        .stat-card p {
            color: #6b7280;
            font-size: 1.5rem;
            font-weight: 500;
        }
        .export-btn {
            background-color: #10b981;
            border-color: #10b981;
        }
        .export-btn:hover {
            background-color: #059669;
            border-color: #059669;
        }
        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.85rem;
            }
            .stat-card p {
                font-size: 1.2rem;
            }
        }
    </style>
</head>

<body>
<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
     x-data="{ userRole: 'Quản lý' }">
    <!-- Sidebar -->
    <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
        <div class="py-4 text-gray-500 dark:text-gray-400">
            <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="/admin">HOLO - Trang quản lý</a>
            <ul class="mt-6">
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                       href="/admin/list-review">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.286 3.95a1 1 0 00.95.69h4.15c.969 0 1.371 1.24.588 1.81l-3.36 2.44a1 1 0 00-.364 1.118l1.286 3.951c.3.921-.755 1.688-1.54 1.118l-3.36-2.44a1 1 0 00-1.176 0l-3.36 2.44c-.784.57-1.838-.197-1.539-1.118l1.285-3.95a1 1 0 00-.364-1.119L2.975 9.377c-.783-.57-.38-1.81.588-1.81h4.15a1 1 0 00.95-.69l1.286-3.95z" />
                        </svg>
                        <span class="ml-4">Danh sách đánh giá</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                       href="/admin/list-report">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M9 17v-2a2 2 0 012-2h2a2 2 0 012 2v2m-6 0h6m-6 0H5a2 2 0 01-2-2V7a2 2 0 012-2h4m4 0h4a2 2 0 012 2v8a2 2 0 01-2 2h-4m-4 0v0" />
                        </svg>
                        <span class="ml-4">Danh sách báo cáo</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                          aria-hidden="true"></span>
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 dark:text-gray-100 dark:hover:text-gray-200"
                       href="/admin/statistic">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M11 11V7a1 1 0 011-1h1a1 1 0 011 1v4m-3 0v4m0-4H7a1 1 0 00-1 1v1a1 1 0 001 1h4m4 0h2a1 1 0 001-1v-1a1 1 0 00-1-1h-2" />
                        </svg>
                        <span class="ml-4">Thống kê</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                       href="/">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M12 4v1m0 14v1m8-8h-1M5 12H4m15.364-5.364l-.707.707M6.343 17.657l-.707.707M17.657 17.657l-.707-.707M6.343 6.343l-.707-.707M12 8a4 4 0 100 8 4 4 0 000-8z" />
                        </svg>
                        <span class="ml-4">Web</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                       href="/login">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7" />
                        </svg>
                        <span class="ml-4">Đăng xuất</span>
                    </a>
                </li>
            </ul>
        </div>
    </aside>

    <!-- Content -->
    <div class="flex flex-col flex-1 w-full">
        <!-- Header -->
        <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
            <div
                    class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
                <div></div>
                <ul class="flex items-center flex-shrink-0 space-x-6">
                    <li class="relative flex items-center">
                        <button class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none">
                            <img class="object-cover w-8 h-8 rounded-full" src="./assets/img/team-1.jpg"
                                 alt="Avatar" />
                        </button>
                        <div class="ml-2 text-sm">
                            <span class="font-medium text-gray-700 dark:text-gray-300">Nguyễn Văn A</span>
                            <p class="text-xs text-gray-500 dark:text-gray-400" x-text="userRole"></p>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
        <!-- Main content -->
        <main class="h-full overflow-y-auto">
            <div class="container-fluid px-4">
                <!-- Filter section -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300" style="margin: 10px;">
                    Lọc thống kê
                </h4>

                <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
                    <!-- Row: From date + To date + Export button -->
                    <div class="flex flex-col sm:flex-row gap-6 mb-6 align-items-center">
                        <!-- From date -->
                        <div class="flex-1 px-2">
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Từ ngày</span>
                                <input type="date"
                                       class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" />
                            </label>
                        </div>
                        <!-- To date -->
                        <div class="flex-1 px-2">
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Đến ngày</span>
                                <input type="date"
                                       class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" />
                            </label>
                        </div>
                        <!-- Export button -->
                        <div class="flex-1 px-2 d-flex align-items-end">
                            <button class="btn btn-primary export-btn w-100 mt-4"
                                    onclick="exportExcel()">
                                Xuất Excel
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Statistics section -->
                <div class="mb-4">
                    <h4 class="text-lg font-semibold text-gray-600 dark:text-gray-300">
                        Thống kê đánh giá
                    </h4>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h5>Tổng số đánh giá</h5>
                            <p>150</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h5>Điểm đánh giá trung bình</h5>
                            <p>4.2 sao</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h5>Tổng số báo cáo</h5>
                            <p>25</p>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <div class="w-full rounded-lg shadow-xs">
                        <table class="w-full table">
                            <thead>
                            <tr
                                    class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Món ăn</th>
                                <th class="px-4 py-3">Số lượng đánh giá</th>
                                <th class="px-4 py-3">Điểm trung bình</th>
                                <th class="px-4 py-3">Số báo cáo</th>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">Cơm chiên dương châu</td>
                                <td class="px-4 py-3 text-sm">50</td>
                                <td class="px-4 py-3 text-sm">4.5 sao</td>
                                <td class="px-4 py-3 text-sm">8</td>
                            </tr>
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">Phở bò</td>
                                <td class="px-4 py-3 text-sm">60</td>
                                <td class="px-4 py-3 text-sm">4.3 sao</td>
                                <td class="px-4 py-3 text-sm">10</td>
                            </tr>
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">Bánh mì pate</td>
                                <td class="px-4 py-3 text-sm">40</td>
                                <td class="px-4 py-3 text-sm">3.9 sao</td>
                                <td class="px-4 py-3 text-sm">7</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Toast Notification for Export Success -->
<div class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true" id="successToast">
    <div class="d-flex">
        <div class="toast-body">
            Xuất Excel thành công!
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
</div>

<script>
    // Handle export Excel
    function exportExcel() {
        // Simulate API call to exportExcel()
        setTimeout(() => {
            // Simulate file download
            const link = document.createElement('a');
            link.href = '#'; // Replace with actual file URL from backend
            link.download = 'statistics.xlsx';
            link.click();

            // Show success toast
            const toast = new bootstrap.Toast(document.getElementById('successToast'));
            toast.show();
        }, 500); // Simulate network delay
    }
</script>

</body>
</html>