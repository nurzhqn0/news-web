package kz.bitlab.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.java.database.DBConnector;
import kz.bitlab.java.models.News;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/admin")
public class Admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<News> newsList = DBConnector.getAllNews();

        req.setAttribute("newsList", newsList);
        req.getRequestDispatcher("admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("newsTitle");
        String content = req.getParameter("newsContent");
        String language = req.getParameter("newsLanguage");

        System.out.println(title);

        DBConnector.addNews(title, content, language);

        resp.sendRedirect("/admin");
    }
}