<%@ page import="kz.bitlab.java.models.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.java.database.DBConnector" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Task Manager</title>
    <style>
        .truncate-5-lines {
            display: -webkit-box;
            -webkit-line-clamp: 4; /* Truncate after 5 lines */
            -webkit-box-orient: vertical;
            overflow: hidden;
            font-size: 16px;
            line-height: 1.5;
            max-width: 100%; /* Adjust width as needed */

        }

        body {
            overflow-y: scroll; /* Always show scrollbar */
            scrollbar-gutter: stable; /* Prevent layout shift when scrollbar appears */
        }

        body::-webkit-scrollbar {
            width: 10px;
        }

        body::-webkit-scrollbar-track {
            background: transparent;
        }

        body::-webkit-scrollbar-thumb {
            background: rgba(0, 0, 0, 0.5);
            border-radius: 5px;
        }

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary w-100" style="scrollbar-gutter: stable;">
        <div class="container-fluid w-75 mx-auto">
            <a class="navbar-brand fw-bold" href="/">Jakarta News</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link fw-semibold text-light" href="/admin">Admin Panel</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle fw-semibold text-light" href="#" id="languageDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Language
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
                            <li>
                                <form action="" method="get">
                                    <input type="hidden" name="lang" value="ru">
                                    <button type="submit" class="dropdown-item">РУС</button>
                                </form>
                            </li>
                            <li>
                                <form action="" method="get">
                                    <input type="hidden" name="lang" value="en">
                                    <button type="submit" class="dropdown-item">ENG</button>
                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

</header>

<section class="d-flex flex-column gap-4 w-75 my-4 mx-auto">
    <%
        ArrayList<News> newsList = (ArrayList<News>) request.getAttribute("newsList");
        for (News news : newsList) {
    %>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title fw-semibold"><%=news.getTitle()%></h2>
                <p class="card-text mt-3 truncate-5-lines">
                    <%=news.getContent()%>
                </p>
                <%
                    SimpleDateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy");
                %>
                <p class="text-secondary mt-4"><strong>Posted at <%=outputFormat.format(news.getPostDate())%></strong></p>
            </div>
        </div>
    </div>
    <%
        }
    %>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>