<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu Bookshop - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --secondary: #10b981;
            --dark: #1f2937;
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
            background: linear-gradient(135deg, #f3f4ff 0%, #eef2ff 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }
        
        /* Animated background elements */
        .bg-element {
            position: absolute;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            opacity: 0.1;
            z-index: -1;
        }
        
        .bg-element-1 {
            width: 300px;
            height: 300px;
            top: -150px;
            left: -150px;
        }
        
        .bg-element-2 {
            width: 200px;
            height: 200px;
            bottom: -100px;
            right: -100px;
        }
        
        .bg-element-3 {
            width: 150px;
            height: 150px;
            top: 50%;
            right: 30%;
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            width: 100%;
            max-width: 440px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 70px rgba(0, 0, 0, 0.12);
        }
        
        .login-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 35px 30px;
            text-align: center;
            position: relative;
        }
        
        .login-header::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 40px;
            height: 40px;
            background: var(--primary);
            border-radius: 50%;
            z-index: 1;
        }
        
        .login-header::before {
            content: '';
            position: absolute;
            bottom: -35px;
            left: 50%;
            transform: translateX(-50%);
            width: 70px;
            height: 70px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            z-index: 0;
        }
        
        .login-header h2 {
            font-weight: 700;
            font-size: 28px;
            margin-bottom: 5px;
            letter-spacing: -0.5px;
        }
        
        .login-header p {
            font-weight: 400;
            opacity: 0.9;
            font-size: 16px;
        }
        
        .login-body {
            padding: 50px 40px 40px;
            position: relative;
            z-index: 2;
        }
        
        .form-group {
            margin-bottom: 24px;
            position: relative;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .input-group {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            z-index: 3;
        }
        
        .form-control {
            width: 100%;
            padding: 14px 16px 14px 48px;
            border: 2px solid var(--gray-light);
            border-radius: 12px;
            background-color: var(--light);
            color: var(--dark);
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }
        
        .form-control::placeholder {
            color: var(--gray);
            font-weight: 400;
        }
        
        .btn-login {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            padding: 16px 24px;
            font-weight: 600;
            font-size: 16px;
            border-radius: 12px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s ease;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(99, 102, 241, 0.3);
        }
        
        .btn-login:hover::before {
            left: 100%;
        }
        
        .alert {
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 24px;
            border: none;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideIn 0.5s ease;
        }
        
        .alert-danger {
            background-color: #fee2e2;
            color: #b91c1c;
        }
        
        .alert i {
            font-size: 20px;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
            color: var(--gray);
            font-size: 14px;
        }
        
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background-color: var(--gray-light);
        }
        
        .divider::before {
            margin-right: 16px;
        }
        
        .divider::after {
            margin-left: 16px;
        }
        
        .footer-text {
            text-align: center;
            margin-top: 30px;
            color: var(--gray);
            font-size: 14px;
        }
        
        .footer-text a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .footer-text a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }
        
        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        .login-container {
            animation: fadeIn 0.8s ease;
        }
        
        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-body {
                padding: 40px 25px 30px;
            }
            
            .login-header {
                padding: 25px 20px;
            }
            
            .login-header h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <!-- Background elements -->
    <div class="bg-element bg-element-1"></div>
    <div class="bg-element bg-element-2"></div>
    <div class="bg-element bg-element-3"></div>
    
    <div class="login-container">
        <div class="login-header">
            <h2><i class="fas fa-book-open me-2"></i>Pahana Edu Bookshop</h2>
            <p>Management System</p>
        </div>
        <div class="login-body">
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle"></i> 
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="login" method="post" id="loginForm">
                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <div class="input-group">
                        <i class="input-icon fas fa-user"></i>
                        <input type="text" class="form-control" id="username" name="username" 
                               placeholder="Enter your username" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <i class="input-icon fas fa-lock"></i>
                        <input type="password" class="form-control" id="password" name="password" 
                               placeholder="Enter your password" required>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-login">
                    <i class="fas fa-sign-in-alt me-2"></i> Login
                </button>
            </form>
            
            <div class="footer-text">
                <p>© 2023 Pahana Edu Bookshop. All rights reserved.</p>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        $(document).ready(function() {
            // Input focus effects
            $('.form-control').focus(function() {
                $(this).parent().siblings('.form-label').css('color', 'var(--primary)');
            }).blur(function() {
                $(this).parent().siblings('.form-label').css('color', 'var(--dark)');
            });
            
            // Form validation
            $('#loginForm').on('submit', function(e) {
                const username = $('#username').val().trim();
                const password = $('#password').val().trim();
                
                if (!username || !password) {
                    e.preventDefault();
                    
                    // Add shake animation to empty fields
                    if (!username) {
                        $('#username').addClass('is-invalid');
                        setTimeout(() => $('#username').removeClass('is-invalid'), 1000);
                    }
                    
                    if (!password) {
                        $('#password').addClass('is-invalid');
                        setTimeout(() => $('#password').removeClass('is-invalid'), 1000);
                    }
                    
                    // Create error message if it doesn't exist
                    if ($('.alert-danger').length === 0) {
                        const alert = $('<div class="alert alert-danger" role="alert"><i class="fas fa-exclamation-circle"></i> Please fill in all fields</div>');
                        $('#loginForm').prepend(alert);
                        
                        // Remove alert after 3 seconds
                        setTimeout(() => {
                            alert.fadeOut(() => alert.remove());
                        }, 3000);
                    }
                    
                    return false;
                }
            });
            
            // Remove error state when user starts typing
            $('.form-control').on('input', function() {
                $(this).removeClass('is-invalid');
            });
        });
    </script>
</body>
</html>