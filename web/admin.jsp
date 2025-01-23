<%@ page import="kz.bitlab.java.models.News" %>
<%@ page import="java.util.ArrayList" %>
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

<section class="container mx-5">
    <button class="btn btn-primary mt-5" data-bs-toggle="modal" data-bs-target="#addTaskModal">
        + Добавить новости
    </button>

    <div class="modal fade w-1/2" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTaskModalLabel">Добавить новости</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="post" action="">
                        <div class="mb-3">
                            <label for="newsTitle" class="form-label">Название новости</label>
                            <input type="text" class="form-control" id="newsTitle" name="newsTitle" required>
                        </div>

                        <div class="mb-3">
                            <label for="newsContent" class="form-label">Описание новости</label>
                            <textarea class="form-control" id="newsContent" name="newsContent" rows="3" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="newsLanguage" class="form-label">Язык</label>
                            <div class="input-group w-50">
                                <select class="form-select" id="newsLanguage" name="newsLanguage">
                                    <option value="en" selected>English</option>
                                    <option value="ru">Русский</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Заголовок</th>
                <th>Дата Публикации</th>
                <th>Язык</th>
                <th>Детали</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<News> newsList = (ArrayList<News>) request.getAttribute("newsList");
                for (News news : newsList) {
            %>
            <tr >
                <td scope="row"><%= news.getId() %></td>
                <td><%= news.getTitle() %></td>
                <td><%= news.getPostDate() %></td>

                <% String language = news.getLanguage().equals("en") ? "English" : "Русский"; %>
                <td><%= language %></td>
                <td><a href="/admin/news/<%= news.getId() %>" class="btn btn-primary">Детали</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>