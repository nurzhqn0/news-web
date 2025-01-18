
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Task Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light w-full" >
        <div class="container-fluid w-75 mx-auto">
            <a class="navbar-brand fw-bold" href="/">BITLAB SHOP</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Top Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">New Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">By Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth">Sign In</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class="container mx-auto mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
            <% } %>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title text-center mb-4">Sign In</h4>
                    <form method="post" action="/auth">
                        <input type="hidden" name="action" value="login">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Sign In</button>
                        </div>
                    </form>
                    <p class="text-center mt-3">
                        Don't have an account? <a href="#" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign up</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade <% if (request.getAttribute("signUpError") != null || request.getAttribute("passwordError") != null) { %> show <% } %>"
     id="signUpModal"
     tabindex="-1"
     aria-labelledby="signUpModalLabel"
     aria-hidden="false" style="<% if (request.getAttribute("signUpError") != null || request.getAttribute("passwordError") != null) { %> display: block; <% } %>">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/auth">
                    <input type="hidden" name="action" value="register">
                    <!-- Full Name -->
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
                    </div>
                    <!-- Email -->
                    <div class="mb-3">
                        <label for="signUpEmail" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="signUpEmail" name="signUpEmail" placeholder="Enter your email" required>
                    </div>
                    <!-- Password -->
                    <div class="mb-3">
                        <label for="signUpPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="signUpPassword" name="signUpPassword" placeholder="Create a password" required>
                    </div>
                    <!-- Confirm Password -->
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                    </div>
                    <!-- Submit -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Sign Up</button>
                    </div>
                </form>

                <!-- Error Messages -->
                <% if (request.getAttribute("signUpError") != null) { %>
                <div class="alert alert-danger mt-3">
                    <%= request.getAttribute("signUpError") %>
                </div>
                <% } %>
                <% if (request.getAttribute("passwordError") != null) { %>
                <div class="alert alert-danger mt-3">
                    <%= request.getAttribute("passwordError") %>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
