<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    com.javaweb.model.User user = (com.javaweb.model.User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh sách đánh giá</title>
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
        .image-url {
            max-width: 120px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .image-url a {
            color: #6b7280;
            text-decoration: none;
        }
        .image-url a:hover {
            text-decoration: underline;
            cursor: pointer;
        }
        .content-column {
            max-width: 200px;
        }
        .customer-column {
            max-width: 150px;
        }
        .dish-column {
            max-width: 150px;
        }
        .action-column {
            min-width: 100px;
        }
        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.85rem;
            }
            .image-url, .content-column, .customer-column, .dish-column {
                max-width: 100px;
            }
        }
    </style>
</head>

<body>
<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
     x-data="{ userRole: 'Quản lý', currentPage: 1, itemsPerPage: 5 }">
    <!-- Sidebar -->
    <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
        <div class="py-4 text-gray-500 dark:text-gray-400">
            <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="/admin">HOLO - Trang quản lý</a>
            <ul class="mt-6">
                <li class="relative px-6 py-3">
                    <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                          aria-hidden="true"></span>
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 dark:text-gray-100 dark:hover:text-gray-200"
                       href="#">
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
                    <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
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
            <div class="container flex items-center justify-end h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
                <span class="font-medium text-gray-700 dark:text-gray-300">
                    Xin chào, <b><%= user.getFullName() %></b> - <%= user.getRole() %>
                </span>
            </div>
        </header>
        <!-- Main content -->
        <main class="h-full overflow-y-auto">
            <div class="container-fluid px-4">
                <!-- Search section -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300" style="margin: 10px;">
                    Lọc đánh giá
                </h4>

                <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
                    <!-- Row 1: Dish name + Stars + Reply status -->
                    <div class="flex flex-col sm:flex-row gap-6 mb-6">
                        <!-- Dish name -->
                        <div class="flex-1 px-2">
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Tên món ăn</span>
                                <input
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Ví dụ: Cơm chiên dương châu" />
                            </label>
                        </div>
                        <!-- Stars -->
                        <div class="flex-1 px-2">
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Số sao</span>
                                <select
                                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                    <option>Tất cả</option>
                                    <option>1 sao</option>
                                    <option>2 sao</option>
                                    <option>3 sao</option>
                                    <option>4 sao</option>
                                    <option>5 sao</option>
                                </select>
                            </label>
                        </div>
                        <!-- Reply status -->
                        <div class="flex-1 px-2">
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Trạng thái phản hồi</span>
                                <select
                                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                    <option>Tất cả</option>
                                    <option>Chưa phản hồi</option>
                                    <option>Đã phản hồi</option>
                                </select>
                            </label>
                        </div>
                    </div>

                    <!-- Row 2: From date + To date -->
                    <div class="flex flex-col sm:flex-row gap-6 mb-6">
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
                    </div>
                </div>

                <!-- Review list -->
                <div class="mb-4">
                    <h4 class="text-lg font-semibold text-gray-600 dark:text-gray-300">
                        Danh sách đánh giá
                    </h4>
                </div>
                <div class="table-responsive">
                    <div class="w-full rounded-lg shadow-xs"
                         x-data="{ checkAll: false, checkedItems: [false, false, false] }"
                         x-init="$watch('checkAll', value => checkedItems = checkedItems.map(() => value))">
                        <table class="w-full table">
                            <thead>
                            <tr
                                    class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">STT</th>
                                <th class="px-4 py-3 dish-column">Tên món ăn</th>
                                <th class="px-4 py-3 customer-column">Khách hàng</th>
                                <th class="px-4 py-3 content-column">Nội dung</th>
                                <th class="px-4 py-3 image-url">Ảnh</th>
                                <th class="px-4 py-3">Số sao</th>
                                <th class="px-4 py-3">Thời gian</th>
                                <th class="px-4 py-3">Trạng thái</th>
                                <th class="px-4 py-3 action-column">Hành động</th>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">1</td>
                                <td class="px-4 py-3 text-sm dish-column">Cơm chiên dương châu</td>
                                <td class="px-4 py-3 customer-column">
                                    <div class="flex items-center text-sm">
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full"
                                                 src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                 alt="" loading="lazy" />
                                            <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                                        </div>
                                        <div>
                                            <p>Nguyễn Thị D</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm content-column">
                                    Món ăn ngon, nhiều tôm và thịt, nhưng hơi nhiều dầu.
                                </td>
                                <td class="px-4 py-3 text-sm image-url">
                                    <a href="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38" target="_blank">Link</a>
                                </td>
                                <td class="px-4 py-3 text-sm">4 sao</td>
                                <td class="px-4 py-3 text-sm">25-04-2025</td>
                                <td class="px-4 py-3 text-sm">
                                    <span class="px-2 py-1 font-semibold text-red-700 bg-red-100 rounded-full dark:bg-red-700 dark:text-red-100">
                                        Chưa phản hồi
                                    </span>
                                </td>
                                <td class="px-4 py-3 action-column">
                                    <div class="flex items-center space-x-4 text-sm">
                                        <button x-show="userRole === 'Quản lý'"
                                                class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                aria-label="Reply" title="Phản hồi đánh giá">
                                            Phản hồi
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">2</td>
                                <td class="px-4 py-3 text-sm dish-column">Phở bò</td>
                                <td class="px-4 py-3 customer-column">
                                    <div class="flex items-center text-sm">
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full"
                                                 src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&facepad=3&fit=facearea&s=707b9c33066bf8808c934c8ab394dff6"
                                                 alt="" loading="lazy" />
                                            <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                                        </div>
                                        <div>
                                            <p>Trần Thị B</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm content-column">
                                    Nước dùng thơm, thịt bò mềm, nhưng bánh phở hơi dính.
                                </td>
                                <td class="px-4 py-3 text-sm image-url">
                                    Không có ảnh
                                </td>
                                <td class="px-4 py-3 text-sm">5 sao</td>
                                <td class="px-4 py-3 text-sm">19-04-2025</td>
                                <td class="px-4 py-3 text-sm">
                                    <span class="px-2 py-1 font-semibold text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                        Đã phản hồi
                                    </span>
                                </td>
                                <td class="px-4 py-3 action-column">
                                    <div class="flex items-center space-x-4 text-sm">
                                        <button x-show="userRole === 'Quản lý'"
                                                class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                aria-label="Reply" title="Phản hồi đánh giá">
                                            Phản hồi
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">3</td>
                                <td class="px-4 py-3 text-sm dish-column">Bánh mì pate</td>
                                <td class="px-4 py-3 customer-column">
                                    <div class="flex items-center text-sm">
                                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                            <img class="object-cover w-full h-full rounded-full"
                                                 src="https://images.unsplash.com/photo-1551069613-1904dbdcda11?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                 alt="" loading="lazy" />
                                            <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                                        </div>
                                        <div>
                                            <p>Lê Văn C</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-3 text-sm content-column">
                                    Bánh mì giòn, pate đậm đà, nhưng rau hơi ít.
                                </td>
                                <td class="px-4 py-3 text-sm image-url">
                                    <a href="https://images.unsplash.com/photo-1600585154340-be6161a56a0c" target="_blank">Link</a>
                                </td>
                                <td class="px-4 py-3 text-sm">3 sao</td>
                                <td class="px-4 py-3 text-sm">18-04-2025</td>
                                <td class="px-4 py-3 text-sm">
                                    <span class="px-2 py-1 font-semibold text-red-700 bg-red-100 rounded-full dark:bg-red-700 dark:text-red-100">
                                        Chưa phản hồi
                                    </span>
                                </td>
                                <td class="px-4 py-3 action-column">
                                    <div class="flex items-center space-x-4 text-sm">
                                        <button x-show="userRole === 'Quản lý'"
                                                class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                aria-label="Reply" title="Phản hồi đánh giá">
                                            Phản hồi
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal for Reply -->
<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="replyModalLabel">Phản hồi đánh giá</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400">Nội dung phản hồi</span>
                    <textarea
                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-textarea"
                            rows="4" placeholder="Nhập nội dung phản hồi"></textarea>
                </label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary">Gửi</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('[aria-label="Reply"]').forEach(button => {
        button.addEventListener('click', () => {
            const replyModal = new bootstrap.Modal(document.getElementById('replyModal'));
            replyModal.show();
        });
    });
</script>

</body>
</html>