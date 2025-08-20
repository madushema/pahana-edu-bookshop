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
            --accent: #f59e0b;
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
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
            color: var(--light);
        }
        
        /* Animated background elements */
        .bg-blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.3;
            z-index: -1;
            animation: float 15s infinite ease-in-out;
        }
        
        .blob-1 {
            width: 400px;
            height: 400px;
            top: 10%;
            left: 10%;
            background: var(--primary);
            animation-delay: 0s;
        }
        
        .blob-2 {
            width: 500px;
            height: 500px;
            bottom: 5%;
            right: 10%;
            background: var(--secondary);
            animation-delay: -5s;
        }
        
        .blob-3 {
            width: 300px;
            height: 300px;
            top: 60%;
            left: 25%;
            background: var(--accent);
            animation-delay: -10s;
        }
        
        /* Floating particles */
        .particles-container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
            overflow: hidden;
        }
        
        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: float-particle 20s infinite linear;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translate(0, 0) scale(1);
            }
            25% {
                transform: translate(-30px, -40px) scale(1.1);
            }
            50% {
                transform: translate(20px, 30px) scale(0.9);
            }
            75% {
                transform: translate(40px, -20px) scale(1.05);
            }
        }
        
        @keyframes float-particle {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(720deg);
                opacity: 0;
            }
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 24px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            width: 100%;
            max-width: 480px;
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
        }
        
        .login-container::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            z-index: -1;
            background: linear-gradient(45deg, var(--primary), var(--secondary), var(--accent), var(--primary));
            background-size: 400% 400%;
            border-radius: 25px;
            animation: gradient-border 8s ease infinite;
        }
        
        @keyframes gradient-border {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .login-container:hover {
            transform: translateY(-8px) scale(1.01);
            box-shadow: 0 35px 70px rgba(0, 0, 0, 0.4);
        }
        
        .login-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 40px 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .login-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23ffffff' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
            opacity: 0.3;
        }
        
        .login-header h2 {
            font-weight: 800;
            font-size: 32px;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .login-header p {
            font-weight: 400;
            opacity: 0.9;
            font-size: 16px;
        }
        
        .login-body {
            padding: 50px 40px 40px;
            position: relative;
        }
        
        .form-group {
            margin-bottom: 28px;
            position: relative;
        }
        
        .form-label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: var(--light);
            font-size: 15px;
            transition: all 0.3s ease;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
        }
        
        .input-group {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--light);
            z-index: 3;
            font-size: 18px;
        }
        
        .form-control {
            width: 100%;
            padding: 16px 20px 16px 55px;
            border: 2px solid rgba(255, 255, 255, 0.15);
            border-radius: 16px;
            background: rgba(0, 0, 0, 0.2);
            color: var(--light);
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
        }
        
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.3);
            outline: none;
            background: rgba(0, 0, 0, 0.25);
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
            font-weight: 400;
        }
        
        .btn-login {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            padding: 18px 28px;
            font-weight: 600;
            font-size: 17px;
            border-radius: 16px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.3);
            letter-spacing: 0.5px;
        }
        
        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: all 0.6s ease;
        }
        
        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(79, 70, 229, 0.4);
        }
        
        .btn-login:hover::before {
            left: 100%;
        }
        
        .btn-login:active {
            transform: translateY(1px);
        }
        
        .alert {
            border-radius: 16px;
            padding: 18px;
            margin-bottom: 28px;
            border: none;
            display: flex;
            align-items: center;
            gap: 14px;
            animation: slideIn 0.5s ease;
            backdrop-filter: blur(5px);
            background: rgba(239, 68, 68, 0.2);
            color: #fff;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }
        
        .alert i {
            font-size: 22px;
        }
        
        .footer-text {
            text-align: center;
            margin-top: 35px;
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }
        
        .footer-text a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .footer-text a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--accent);
            transition: width 0.3s ease;
        }
        
        .footer-text a:hover {
            color: #fff;
        }
        
        .footer-text a:hover::after {
            width: 100%;
        }
        
        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        .login-container {
            animation: fadeIn 0.8s ease;
        }
        
        /* Toggle password visibility */
        .toggle-password {
            position: absolute;
            right: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.6);
            cursor: pointer;
            z-index: 4;
            transition: color 0.3s ease;
        }
        
        .toggle-password:hover {
            color: var(--light);
        }
        
        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-body {
                padding: 40px 25px 30px;
            }
            
            .login-header {
                padding: 30px 20px;
            }
            
            .login-header h2 {
                font-size: 26px;
            }
            
            .form-control {
                padding: 14px 16px 14px 50px;
            }
        }
    </style>
</head>
<body>
    <!-- Animated background elements -->
    <div class="bg-blob blob-1"></div>
    <div class="bg-blob blob-2"></div>
    <div class="bg-blob blob-3"></div>
    
    <!-- Floating particles -->
    <div class="particles-container" id="particles-container"></div>
    
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
                        <span class="toggle-password" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </span>
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
            // Create floating particles
            function createParticles() {
                const container = $('#particles-container');
                const particleCount = 30;
                
                for (let i = 0; i < particleCount; i++) {
                    const size = Math.random() * 5 + 2;
                    const posX = Math.random() * 100;
                    const delay = Math.random() * 20;
                    const duration = Math.random() * 10 + 20;
                    
                    const particle = $('<div class="particle"></div>').css({
                        width: size + 'px',
                        height: size + 'px',
                        left: posX + '%',
                        top: '100vh',
                        animationDelay: delay + 's',
                        animationDuration: duration + 's'
                    });
                    
                    container.append(particle);
                }
            }
            
            createParticles();
            
            // Input focus effects
            $('.form-control').focus(function() {
                $(this).parent().siblings('.form-label').css('color', 'var(--accent)');
            }).blur(function() {
                $(this).parent().siblings('.form-label').css('color', 'var(--light)');
            });
            
            // Toggle password visibility
            $('#togglePassword').click(function() {
                const passwordInput = $('#password');
                const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
                passwordInput.attr('type', type);
                
                // Toggle eye icon
                $(this).find('i').toggleClass('fa-eye fa-eye-slash');
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