
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

            <a class="navbar-brand fw-bold" href="/">Jakarta shop</a>

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



<section class="container mx-5 mt-5">
    <div class="text-center">
        <h1 class="mb-4">Welcome to Home Page</h1>
        <p class="lead">Hello, you are successfully logged in!</p>
        <a href="/auth" class="btn btn-primary">Log Out</a>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
