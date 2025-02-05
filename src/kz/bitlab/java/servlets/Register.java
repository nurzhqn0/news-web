package kz.bitlab.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.java.database.DBConnector;
import kz.bitlab.java.models.User;

import java.io.IOException;

@WebServlet(value="/register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = new User(null, email, password, fullName, 2);

        boolean isSuccess = DBConnector.addUser(user);
        resp.sendRedirect("/");

        System.out.println(isSuccess);
    }
}
