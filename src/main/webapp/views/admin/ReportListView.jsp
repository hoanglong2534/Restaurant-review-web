<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    com.javaweb.model.User user = (com.javaweb.model.User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../public/LoginView.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Danh sách báo cáo</title>
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
    .content-column, .report-content-column {
      max-width: 200px;
    }
    .user-column {
      max-width: 120px;
    }
    .dish-column {
      max-width: 150px;
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
    .action-column {
      min-width: 100px;
    }
    .toast {
      position: fixed;
      bottom: 20px;
      right: 20px;
      z-index: 1050;
    }
    .modal-dialog {
      margin: 1.75rem auto;
    }
    .modal-content {
      border-radius: 0.5rem;
      box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    }
    @media (max-width: 768px) {
      .table th, .table td {
        font-size: 0.85rem;
      }
      .content-column, .report-content-column, .user-column, .dish-column, .image-url {
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
                    <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                          aria-hidden="true"></span>
          <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 dark:text-gray-100 dark:hover:text-gray-200"
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
          Tìm kiếm báo cáo
        </h4>

        <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
          <!-- Row 1: Dish name + From date + To date -->
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

        <!-- Report list -->
        <div class="mb-4">
          <h4 class="text-lg font-semibold text-gray-600 dark:text-gray-300">
            Danh sách báo cáo
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
                <th class="px-4 py-3 user-column">Người đánh giá</th>
                <th class="px-4 py-3 user-column">Người báo cáo</th>
                <th class="px-4 py-3 content-column">Nội dung đánh giá</th>
                <th class="px-4 py-3 image-url">Ảnh</th>
                <th class="px-4 py-3 report-content-column">Nội dung báo cáo</th>
                <th class="px-4 py-3">Thời gian</th>
                <th class="px-4 py-3 action-column">Hành động</th>
              </tr>
              </thead>
              <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
              <tr class="text-gray-700 dark:text-gray-400">
                <td class="px-4 py-3 text-sm">1</td>
                <td class="px-4 py-3 text-sm dish-column">Cơm chiên dương châu</td>
                <td class="px-4 py-3 user-column">
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
                <td class="px-4 py-3 user-column">
                  <div class="flex items-center text-sm">
                    <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                      <img class="object-cover w-full h-full rounded-full"
                           src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max"
                           alt="" loading="lazy" />
                      <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                    </div>
                    <div>
                      <p>Phạm Văn E</p>
                    </div>
                  </div>
                </td>
                <td class="px-4 py-3 text-sm content-column">
                  Món ăn ngon, nhiều tôm và thịt, nhưng hơi nhiều dầu.
                </td>
                <td class="px-4 py-3 text-sm image-url">
                  <a href="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38" target="_blank">Link</a>
                </td>
                <td class="px-4 py-3 text-sm report-content-column">
                  Đánh giá chứa nội dung không phù hợp, có từ ngữ xúc phạm.
                </td>
                <td class="px-4 py-3 text-sm">25-04-2025</td>
                <td class="px-4 py-3 action-column">
                  <div class="flex items-center space-x-4 text-sm">
                    <button x-show="userRole === 'Quản lý'"
                            class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-red-600 rounded-lg dark:text-red-400 focus:outline-none focus:shadow-outline-gray"
                            aria-label="Delete" title="Xóa đánh giá"
                            data-bs-toggle="modal" data-bs-target="#deleteModal">
                      Xóa
                    </button>
                  </div>
                </td>
              </tr>
              <tr class="text-gray-700 dark:text-gray-400">
                <td class="px-4 py-3 text-sm">2</td>
                <td class="px-4 py-3 text-sm dish-column">Phở bò</td>
                <td class="px-4 py-3 user-column">
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
                <td class="px-4 py-3 user-column">
                  <div class="flex items-center text-sm">
                    <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                      <img class="object-cover w-full h-full rounded-full"
                           src="https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max"
                           alt="" loading="lazy" />
                      <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                    </div>
                    <div>
                      <p>Hoàng Văn F</p>
                    </div>
                  </div>
                </td>
                <td class="px-4 py-3 text-sm content-column">
                  Nước dùng thơm, thịt bò mềm, nhưng bánh phở hơi dính.
                </td>
                <td class="px-4 py-3 text-sm image-url">
                  Không có ảnh
                </td>
                <td class="px-4 py-3 text-sm report-content-column">
                  Đánh giá có dấu hiệu spam, lặp lại nội dung vô nghĩa.
                </td>
                <td class="px-4 py-3 text-sm">19-04-2025</td>
                <td class="px-4 py-3 action-column">
                  <div class="flex items-center space-x-4 text-sm">
                    <button x-show="userRole === 'Quản lý'"
                            class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-red-600 rounded-lg dark:text-red-400 focus:outline-none focus:shadow-outline-gray"
                            aria-label="Delete" title="Xóa đánh giá"
                            data-bs-toggle="modal" data-bs-target="#deleteModal">
                      Xóa
                    </button>
                  </div>
                </td>
              </tr>
              <tr class="text-gray-700 dark:text-gray-400">
                <td class="px-4 py-3 text-sm">3</td>
                <td class="px-4 py-3 text-sm dish-column">Bánh mì pate</td>
                <td class="px-4 py-3 user-column">
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
                <td class="px-4 py-3 user-column">
                  <div class="flex items-center text-sm">
                    <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                      <img class="object-cover w-full h-full rounded-full"
                           src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max"
                           alt="" loading="lazy" />
                      <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                    </div>
                    <div>
                      <p>Nguyễn Thị G</p>
                    </div>
                  </div>
                </td>
                <td class="px-4 py-3 text-sm content-column">
                  Bánh mì giòn, pate đậm đà, nhưng rau hơi ít.
                </td>
                <td class="px-4 py-3 text-sm image-url">
                  <a href="https://images.unsplash.com/photo-1600585154340-be6161a56a0c" target="_blank">Link</a>
                </td>
                <td class="px-4 py-3 text-sm report-content-column">
                  Đánh giá chứa liên kết quảng cáo không liên quan.
                </td>
                <td class="px-4 py-3 text-sm">18-04-2025</td>
                <td class="px-4 py-3 action-column">
                  <div class="flex items-center space-x-4 text-sm">
                    <button x-show="userRole === 'Quản lý'"
                            class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-red-600 rounded-lg dark:text-red-400 focus:outline-none focus:shadow-outline-gray"
                            aria-label="Delete" title="Xóa đánh giá"
                            data-bs-toggle="modal" data-bs-target="#deleteModal">
                      Xóa
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

<!-- Modal for Delete Confirmation -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Xóa đánh giá</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Bạn có chắc chắn muốn xóa đánh giá này không?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="cancelDelete" data-bs-dismiss="modal">Hủy</button>
        <button type="button" class="btn btn-danger" id="confirmDelete">Xóa</button>
      </div>
    </div>
  </div>
</div>

<!-- Toast Notification for Success -->
<div class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true" id="successToast">
  <div class="d-flex">
    <div class="toast-body">
      Xóa đánh giá thành công!
    </div>
    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
  </div>
</div>

<script>
  // Function to close modal and clean up backdrop
  function closeModal(modalElement) {
    const modal = bootstrap.Modal.getInstance(modalElement);
    if (modal) {
      modal.hide();
      document.body.classList.remove('modal-open');
      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
    }
  }

  // Handle delete confirmation
  document.getElementById('confirmDelete').addEventListener('click', function() {
    // Simulate API call to deleteReview()
    setTimeout(() => {
      // Close the modal
      closeModal(document.getElementById('deleteModal'));

      // Show success toast
      const toast = new bootstrap.Toast(document.getElementById('successToast'));
      toast.show();
    }, 500); // Simulate network delay
  });

  // Handle cancel button
  document.getElementById('cancelDelete').addEventListener('click', function() {
    closeModal(document.getElementById('deleteModal'));
  });

  // Handle close button
  document.querySelector('#deleteModal .btn-close').addEventListener('click', function() {
    closeModal(document.getElementById('deleteModal'));
  });

  // Initialize modal trigger
  document.querySelectorAll('[aria-label="Delete"]').forEach(button => {
    button.addEventListener('click', () => {
      const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
      deleteModal.show();
    });
  });
</script>

</body>
</html>