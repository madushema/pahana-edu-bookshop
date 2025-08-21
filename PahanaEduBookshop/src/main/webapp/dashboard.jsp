<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pahanaedu.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu Bookshop - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --secondary: #10b981;
            --accent: #f59e0b;
            --danger: #ef4444;
            --dark: #0f172a;
            --dark-light: #1e293b;
            --light: #f9fafb;
            --gray: #6b7280;
            --gray-light: #e5e7eb;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: var(--light);
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        /* Glassmorphism effect */
        .glass {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }
        
        /* Navbar styling */
        .navbar {
            background: rgba(15, 23, 42, 0.8);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 15px 25px;
        }
        
        .navbar-brand {
            font-weight: 800;
            font-size: 24px;
            color: var(--light);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .navbar-brand i {
            color: var(--primary);
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            color: white;
        }
        
        .logout-btn {
            background: rgba(239, 68, 68, 0.2);
            color: var(--light);
            border: 1px solid rgba(239, 68, 68, 0.3);
            padding: 8px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .logout-btn:hover {
            background: rgba(239, 68, 68, 0.3);
            transform: translateY(-2px);
        }
        
        /* Main layout */
        .main-container {
            display: flex;
            padding: 20px;
            gap: 20px;
        }
        
        /* Sidebar styling */
        .sidebar {
            width: 280px;
            flex-shrink: 0;
            padding: 25px 15px;
            height: calc(100vh - 80px);
            position: sticky;
            top: 80px;
            overflow-y: auto;
        }
        
        .nav-header {
            padding: 0 15px 20px;
            margin-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .nav-header h3 {
            font-size: 18px;
            font-weight: 700;
            color: var(--light);
        }
        
        .nav-item {
            margin-bottom: 8px;
            position: relative;
        }
        
        .nav-link {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 14px 20px;
            border-radius: 12px;
            color: var(--light);
            opacity: 0.8;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .nav-link::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background: linear-gradient(to bottom, var(--primary), var(--secondary));
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .nav-link:hover, .nav-link.active {
            opacity: 1;
            background: rgba(255, 255, 255, 0.05);
            transform: translateX(5px);
        }
        
        .nav-link.active {
            opacity: 1;
            background: rgba(99, 102, 241, 0.1);
        }
        
        .nav-link.active::before {
            opacity: 1;
        }
        
        .nav-link i {
            width: 20px;
            text-align: center;
            font-size: 18px;
        }
        
        /* Main content area */
        .content-area {
            flex: 1;
            padding: 25px;
            border-radius: 20px;
            background: rgba(15, 23, 42, 0.5);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .section-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 25px;
            color: var(--light);
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .section-title::after {
            content: '';
            flex: 1;
            height: 2px;
            background: linear-gradient(to right, var(--primary), transparent);
        }
        
        /* Stats cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            padding: 25px;
            border-radius: 16px;
            background: linear-gradient(135deg, var(--dark-light) 0%, var(--dark) 100%);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .stat-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: linear-gradient(transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(-15deg);
            transition: all 0.6s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .stat-card:hover::before {
            right: 100%;
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 20px;
            background: rgba(255, 255, 255, 0.1);
        }
        
        .stat-value {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 5px;
            background: linear-gradient(135deg, var(--light) 0%, var(--gray-light) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .stat-label {
            color: var(--gray);
            font-weight: 500;
        }
        
        /* Content sections */
        .content-section {
            display: none;
            animation: fadeIn 0.5s ease;
        }
        
        .content-section.active {
            display: block;
        }
        
        /* Tables */
        .table-container {
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .data-table {
            width: 100%;
            background: var(--dark-light);
            color: var(--light);
            border-collapse: collapse;
        }
        
        .data-table th {
            background: rgba(30, 41, 59, 0.7);
            padding: 16px;
            text-align: left;
            font-weight: 600;
            color: var(--light);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .data-table td {
            padding: 16px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        .data-table tr:last-child td {
            border-bottom: none;
        }
        
        .data-table tr {
            transition: background 0.3s ease;
        }
        
        .data-table tr:hover {
            background: rgba(255, 255, 255, 0.03);
        }
        
        /* Buttons */
        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border: none;
            padding: 12px 24px;
            border-radius: 10px;
            font-weight: 600;
            color: white;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
        }
        
        .btn-sm {
            padding: 8px 16px;
            font-size: 14px;
        }
        
        .btn-danger {
            background: rgba(239, 68, 68, 0.2);
            color: var(--light);
            border: 1px solid rgba(239, 68, 68, 0.3);
        }
        
        .btn-danger:hover {
            background: rgba(239, 68, 68, 0.3);
        }
        
        /* Billing section */
        .billing-container {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
        }
        
        .bill-form, .bill-summary {
            padding: 25px;
            border-radius: 16px;
            background: var(--dark-light);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--light);
        }
        
        .form-control {
            width: 100%;
            padding: 14px 16px;
            border-radius: 10px;
            background: rgba(15, 23, 42, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--light);
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }
        
        /* Bill items */
        .bill-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin-bottom: 10px;
            background: rgba(15, 23, 42, 0.3);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        .bill-total {
            font-size: 24px;
            font-weight: 700;
            margin: 20px 0;
            color: var(--light);
        }
        
        /* Modals */
        .modal-content {
            background: var(--dark-light);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            color: var(--light);
        }
        
        .modal-header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 25px;
        }
        
        .modal-title {
            font-weight: 700;
            color: var(--light);
        }
        
        .modal-body {
            padding: 25px;
        }
        
        .modal-footer {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 25px;
        }
        
        .close {
            color: var(--light);
            opacity: 0.7;
        }
        
        .close:hover {
            opacity: 1;
            color: var(--light);
        }
        
        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .main-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
                position: static;
            }
            
            .billing-container {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .navbar-brand {
                font-size: 20px;
            }
            
            .user-info {
                flex-direction: column;
                gap: 10px;
                align-items: flex-end;
            }
        }
        
        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        
        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }
        
        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 10px;
        }
        
        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-dark);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">
            <i class="fas fa-book-open"></i> Pahana Edu Bookshop
        </a>
        
        <div class="user-info">
            <div class="user-avatar">
                <%= user.getUsername().substring(0, 1).toUpperCase() %>
            </div>
            <div>
                <div class="text-white"><%= user.getUsername() %></div>
                <div class="text-small text-muted"><%= user.getRole() %></div>
            </div>
            <a class="logout-btn" href="logout" onclick="return confirm('Are you sure you want to logout?')">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </nav>
    
    <div class="main-container">
        <!-- Sidebar -->
        <div class="sidebar glass">
            <div class="nav-header">
                <h3>Navigation</h3>
            </div>
            
            <div class="nav flex-column nav-pills">
                <li class="nav-item">
                    <a class="nav-link active" href="#" data-section="dashboard">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-section="customers">
                        <i class="fas fa-users"></i> Customers
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-section="items">
                        <i class="fas fa-book"></i> Items
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-section="billing">
                        <i class="fas fa-file-invoice-dollar"></i> Billing
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-section="help">
                        <i class="fas fa-question-circle"></i> Help
                    </a>
                </li>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="content-area">
            <!-- Dashboard Section -->
            <div id="dashboard" class="content-section active">
                <h2 class="section-title">Dashboard Overview</h2>
                
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #6366f1;">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-value" id="totalCustomers">0</div>
                        <div class="stat-label">Total Customers</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #10b981;">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="stat-value" id="totalItems">0</div>
                        <div class="stat-label">Total Items</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #f59e0b;">
                            <i class="fas fa-file-invoice"></i>
                        </div>
                        <div class="stat-value" id="totalBills">0</div>
                        <div class="stat-label">Total Bills</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #ef4444;">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div class="stat-value" id="totalRevenue">LKR 0</div>
                        <div class="stat-label">Total Revenue</div>
                    </div>
                </div>
            </div>
            
            <!-- Customers Section -->
            <div id="customers" class="content-section">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title">Customer Management</h2>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCustomerModal">
                        <i class="fas fa-plus"></i> Add Customer
                    </button>
                </div>
                
                <div class="table-container">
                    <table class="data-table" id="customersTable">
                        <thead>
                            <tr>
                                <th>Account Number</th>
                                <th>Name</th>
                                <th>Telephone</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Customer data will be loaded here -->
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Items Section -->
            <div id="items" class="content-section">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title">Item Management</h2>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addItemModal">
                        <i class="fas fa-plus"></i> Add Item
                    </button>
                </div>
                
                <div class="table-container">
                    <table class="data-table" id="itemsTable">
                        <thead>
                            <tr>
                                <th>Item Code</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Stock</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Item data will be loaded here -->
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Billing Section -->
            <div id="billing" class="content-section">
                <h2 class="section-title">Billing System</h2>
                
                <div class="billing-container">
                    <div class="bill-form">
                        <form id="billingForm">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Customer Account Number</label>
                                        <input type="text" class="form-control" id="billCustomerAccount" placeholder="Enter account number">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Customer Name</label>
                                        <input type="text" class="form-control" id="billCustomerName" readonly>
                                    </div>
                                </div>
                            </div>
                            
                            <hr style="border-color: rgba(255,255,255,0.1); margin: 20px 0;">
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label">Item Code</label>
                                        <input type="text" class="form-control" id="billItemCode" placeholder="Enter item code">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label">Quantity</label>
                                        <input type="number" class="form-control" id="billQuantity" min="1" value="1">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label">&nbsp;</label>
                                        <button type="button" class="btn btn-primary btn-block" id="addToBill">
                                            <i class="fas fa-plus"></i> Add to Bill
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="bill-summary">
                        <h5 class="mb-3">Bill Summary</h5>
                        <div id="billItems">
                            <p class="text-muted">No items added yet</p>
                        </div>
                        <hr style="border-color: rgba(255,255,255,0.1);">
                        <div class="d-flex justify-content-between align-items-center">
                            <strong>Total: </strong>
                            <span class="bill-total">LKR <span id="billTotal">0.00</span></span>
                        </div>
                        <hr style="border-color: rgba(255,255,255,0.1);">
                        <button class="btn btn-primary btn-block" id="generateBill" disabled>
                            <i class="fas fa-file-invoice"></i> Generate Bill
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Help Section -->
            <div id="help" class="content-section">
                <h2 class="section-title">Help & Documentation</h2>
                
                <div class="accordion" id="helpAccordion">
                    <div class="accordion-item glass" style="margin-bottom: 15px; border-radius: 12px; overflow: hidden;">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#help1" aria-expanded="true">
                                How to add a new customer?
                            </button>
                        </h2>
                        <div id="help1" class="accordion-collapse collapse show" data-bs-parent="#helpAccordion">
                            <div class="accordion-body">
                                <ol>
                                    <li>Go to the Customers section</li>
                                    <li>Click the "Add Customer" button</li>
                                    <li>Fill in all required fields</li>
                                    <li>Click "Save Customer"</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item glass" style="margin-bottom: 15px; border-radius: 12px; overflow: hidden;">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#help2">
                                How to create a bill?
                            </button>
                        </h2>
                        <div id="help2" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                            <div class="accordion-body">
                                <ol>
                                    <li>Go to the Billing section</li>
                                    <li>Enter customer account number</li>
                                    <li>Add items by entering item codes and quantities</li>
                                    <li>Review the bill summary</li>
                                    <li>Click "Generate Bill" to create the invoice</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    
                    <div class="accordion-item glass" style="border-radius: 12px; overflow: hidden;">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#help3">
                                How to manage inventory?
                            </button>
                        </h2>
                        <div id="help3" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                            <div class="accordion-body">
                                <ol>
                                    <li>Go to the Items section</li>
                                    <li>Use "Add Item" to add new books</li>
                                    <li>Edit existing items by clicking the edit button</li>
                                    <li>Monitor stock levels regularly</li>
                                    <li>Update quantities as needed</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Customer Modal -->
    <div class="modal fade" id="addCustomerModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addCustomerForm">
                        <div class="form-group">
                            <label class="form-label">Account Number</label>
                            <input type="text" class="form-control" name="accountNumber" placeholder="Auto-generated if empty">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Name *</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Address</label>
                            <textarea class="form-control" name="address" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Telephone *</label>
                            <input type="text" class="form-control" name="telephone" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="saveCustomer()">Save Customer</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Item Modal -->
    <div class="modal fade" id="addItemModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addItemForm">
                        <div class="form-group">
                            <label class="form-label">Item Code *</label>
                            <input type="text" class="form-control" name="itemCode" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Title *</label>
                            <input type="text" class="form-control" name="title" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Author</label>
                            <input type="text" class="form-control" name="author">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Category</label>
                            <select class="form-control" name="category">
                                <option value="">Select Category</option>
                                <option value="Fiction">Fiction</option>
                                <option value="Non-Fiction">Non-Fiction</option>
                                <option value="Academic">Academic</option>
                                <option value="Children">Children</option>
                                <option value="Reference">Reference</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Price *</label>
                            <input type="number" class="form-control" name="price" step="0.01" min="0" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Stock Quantity *</label>
                            <input type="number" class="form-control" name="stockQuantity" min="0" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="saveItem()">Save Item</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Edit Customer Modal -->
    <div class="modal fade" id="editCustomerModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editCustomerForm">
                        <input type="hidden" name="customerId">
                        <div class="form-group">
                            <label class="form-label">Account Number</label>
                            <input type="text" class="form-control" name="accountNumber" readonly>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Name *</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Address</label>
                            <textarea class="form-control" name="address" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Telephone *</label>
                            <input type="text" class="form-control" name="telephone" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="updateCustomer()">Update Customer</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Item Modal -->
    <div class="modal fade" id="editItemModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editItemForm">
                        <input type="hidden" name="itemId">
                        <div class="form-group">
                            <label class="form-label">Item Code *</label>
                            <input type="text" class="form-control" name="itemCode" readonly>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Title *</label>
                            <input type="text" class="form-control" name="title" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Author</label>
                            <input type="text" class="form-control" name="author">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Category</label>
                            <select class="form-control" name="category">
                                <option value="">Select Category</option>
                                <option value="Fiction">Fiction</option>
                                <option value="Non-Fiction">Non-Fiction</option>
                                <option value="Academic">Academic</option>
                                <option value="Children">Children</option>
                                <option value="Reference">Reference</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Price *</label>
                            <input type="number" class="form-control" name="price" step="0.01" min="0" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Stock Quantity *</label>
                            <input type="number" class="form-control" name="stockQuantity" min="0" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="updateItem()">Update Item</button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/dashboard.js"></script>
    
    <script>
        // Navigation handling
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Update active nav
                document.querySelectorAll('.nav-link').forEach(nav => nav.classList.remove('active'));
                this.classList.add('active');
                
                // Show corresponding section
                const section = this.getAttribute('data-section');
                document.querySelectorAll('.content-section').forEach(section => {
                    section.classList.remove('active');
                });
                document.getElementById(section).classList.add('active');
                
                // Load section data
                loadSectionData(section);
            });
        });
        
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    </script>
</body>
</html>