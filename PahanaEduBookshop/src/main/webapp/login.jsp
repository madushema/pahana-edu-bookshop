<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu Bookshop - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        body {
            background: #121212;
            color: #fff;
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Glassmorphism Effect */
        .login-container {
            background: rgba(255, 255, 255, 0.1); /* Transparent white */
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px); /* Glass effect */
            width: 100%;
            max-width: 400px;
            padding: 40px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-10px);
        }

        /* Header */
        .login-header {
            font-size: 2rem;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .login-header i {
            margin-right: 10px;
            color: #0072ff;
        }

        /* Form Input Styles */
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            font-size: 1rem;
            transition: border-color 0.3s ease, background 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            border: 1px solid #0072ff;
            box-shadow: 0 0 5px rgba(0, 114, 255, 0.6);
        }

        .form-group label {
            font-size: 0.9rem;
            font-weight: 600;
            color: #fff;
            margin-bottom: 8px;
            text-align: left;
        }

        /* Button Style */
        .btn-login {
            background-color: #0072ff;
            color: white;
            padding: 12px 30px;
            font-size: 1.1rem;
            border: none;
            border-radius: 30px;
            width: 100%;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-login:hover {
            background-color: #005cbf;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        /* Alert Style */
        .alert {
            margin-top: 15px;
            padding: 12px;
            background-color: #f44336;
            color: white;
            border-radius: 10px;
            font-size: 0.9rem;
            display: none;
        }

        /* Forgot Password Link */
        .forgot-password {
            color: #0072ff;
            font-size: 0.9rem;
            text-decoration: none;
            margin-top: 20px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <i class="fas fa-book"></i> Pahana Edu Bookshop
        </div>

        <!-- Error Message -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert" role="alert">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <!-- Login Form -->
        <form action="login" method="post" id="loginForm">
            <div class="form-group">
                <label for="username">
                    <i class="fas fa-user"></i> Username
                </label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="password">
                    <i class="fas fa-lock"></i> Password
                </label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn-login">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>

            <div class="login-footer">
                <a href="#" class="forgot-password">Forgot your password?</a>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#loginForm').on('submit', function(e) {
                const username = $('#username').val().trim();
                const password = $('#password').val().trim();

                if (!username || !password) {
                    e.preventDefault();
                    $('.alert').text('Please fill in all fields').fadeIn();
                    return false;
                }
            });
        });
    </script>
</body>
</html>
