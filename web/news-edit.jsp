<%@ page import="kz.bitlab.java.models.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="kz.bitlab.java.database.DBConnector" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>News Manager</title>
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

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">

            <%
                News news = (News) request.getAttribute("news");
                if (Objects.isNull(news)) {
            %>

            <div class="alert alert-danger" role="alert">
                News not found.
            </div>
            <%
            } else {
            %>
            <form action="/admin/news/<%= news.getId() %>" method="post">
                <div class="mb-3">
                    <label for="newsTitle" class="form-label">Название новости</label>
                    <input
                            type="text"
                            class="form-control"
                            id="newsTitle"
                            name="newsTitle"
                            value="<%= news.getTitle() %>"
                            required>
                </div>

                <div class="mb-3">
                    <label for="newsContent" class="form-label">Описание новости</label>
                    <textarea
                            class="form-control"
                            id="newsContent"
                            name="newsContent"
                            rows="3"
                            required><%= news.getContent() %></textarea>
                </div>

                <div class="mb-3">
                    <label for="newsLanguage" class="form-label">Язык</label>
                    <div class="input-group w-50">
                        <select class="form-select" id="newsLanguage" name="newsLanguage">
                            <option value="en" <%= news.getLanguage().equals("en") ? "selected" : "" %>>English</option>
                            <option value="ru" <%= news.getLanguage().equals("ru") ? "selected" : "" %>>Русский</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Save Changes</button>
            </form>

            <div class="d-flex align-items-center gap-3">
            <a href="/admin" class="btn btn-secondary">Back to News</a>
            <form  action="/admin/news/<%= news.getId() %>" method="post" onsubmit="return confirm('Are you sure you want to delete this task?');">
                <input type="hidden" name="_method" value="DELETE">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
            </div>


            <%
                }
            %>

        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>