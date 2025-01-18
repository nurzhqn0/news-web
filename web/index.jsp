<%@ page import="kz.bitlab.java.models.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.java.database.DBConnector" %>
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
            <!-- Brand Name -->
            <a class="navbar-brand fw-bold" href="/">BITLAB SHOP</a>

            <!-- Toggle Button for Mobile View -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links -->
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



<section class="container text-center mt-5">
    <h1>Welcome to BITLAB SHOP</h1>
    <p class="text-muted">Electronic devices with high quality and service</p>
    <div class="row mt-4">
        <%
            List<Item> items = DBConnector.getAllItems();

            if (items != null && !items.isEmpty()) {
                for (Item item : items) {
        %>
        <div class="col-md-4 col-lg-3 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= item.getName() %></h5>
                    <h6 class="text-success fs-3">$<%= String.format("%.2f", item.getPrice()) %></h6>
                    <p class="card-text"><%= item.getDescription() %></p>
                    <button class="btn btn-success w-100">Buy Now</button>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12">
            <p class="text-muted">No items available at the moment.</p>
        </div>
        <%
            }
        %>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
