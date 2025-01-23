package kz.bitlab.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.java.database.DBConnector;
import kz.bitlab.java.models.News;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.Optional;

@WebServlet(value = "/admin/news/*")
public class EditNews extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String pathInfo = req.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3>News ID is required</h3>");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length < 2) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3>Invalid URL format</h3>");
            return;
        }

        try {
            Long newsId = Long.parseLong(pathParts[1]);

            News news= DBConnector.getNewsById(newsId);

            if (news == null) {
                System.out.println("No news found for ID: " + newsId);
            }

            if (news != null) {
                req.setAttribute("news", news);
                req.getRequestDispatcher("/news-edit.jsp").forward(req, resp);
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.println("<h3>News not found</h3>");
            }
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3>Invalid News ID format</h3>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        if (method != null && method.equalsIgnoreCase("DELETE")) {
            doDelete(req, resp);
            return;
        }

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String pathInfo = req.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3>News ID is required for editing</h3>");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length < 2) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3>Invalid URL format</h3>");
            return;
        }

        try {
            Long newsId = Long.parseLong(pathParts[1]);

            News news = DBConnector.getNewsById(newsId);


            if (news != null) {
                String title = req.getParameter("newsTitle");
                String content = req.getParameter("newsContent");
                String language = req.getParameter("newsLanguage");
                LocalDateTime localDateTime = LocalDateTime.now();
                Timestamp timestamp = Timestamp.valueOf(localDateTime);

                System.out.println("Title: " + title);
                System.out.println("Content: " + content);
                System.out.println("Language: " + language);

                if (!(Objects.isNull(title) || Objects.isNull(content) || Objects.isNull(language))) {
                    DBConnector.updateNews(new News(newsId, title, content, language, timestamp));
                }


                resp.sendRedirect("/admin");
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.println("<h3>News not found</h3>");
            }
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("<h3>Invalid News ID format</h3>");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("News ID is required for deletion.");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length < 2) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid URL format. News ID is missing.");
            return;
        }

        try {
            Long newsId = Long.parseLong(pathParts[1]);

            DBConnector.deleteNewsById(newsId);
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("News successfully deleted.");
            response.sendRedirect("/admin");


        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid News ID format.");
        }
    }

}