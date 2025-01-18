package kz.bitlab.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.java.database.DBConnector;

import java.io.IOException;

@WebServlet(value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("signUpEmail");
        String password = req.getParameter("signUpPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        boolean isSuccess = false;

        if (!password.equals(confirmPassword)) {
            req.setAttribute("passwordError", "Passwords do not match!");
            req.getRequestDispatcher("auth.jsp").forward(req, resp);
            return;
        }

        isSuccess = DBConnector.register(email, fullName, password);

        if (isSuccess) {
            resp.sendRedirect("/home");
        } else {
            req.setAttribute("signUpError", "Email already in use or registration failed!");
            req.getRequestDispatcher("auth.jsp").forward(req, resp);

        }
        resp.sendRedirect("/auth");
    }
}

