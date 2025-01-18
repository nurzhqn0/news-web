package kz.bitlab.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.java.database.DBConnector;

import java.io.IOException;

@WebServlet(value = "/auth")
public class Auth extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("auth.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("login".equalsIgnoreCase(action)) {
            handleLogin(req, resp);
        } else if ("register".equalsIgnoreCase(action)) {
            handleRegistration(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean isSuccess = DBConnector.login(email, password);

        if (isSuccess) {
            resp.sendRedirect("/home");
        } else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("auth.jsp").forward(req, resp);
        }
    }

    private void handleRegistration(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("signUpEmail");
        String password = req.getParameter("signUpPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            req.setAttribute("passwordError", "Passwords do not match!");
            req.getRequestDispatcher("auth.jsp").forward(req, resp);
            return;
        }

        boolean isSuccess = DBConnector.register(email, password, fullName);

        if (isSuccess) {
            resp.sendRedirect("/home");
        } else {
            req.setAttribute("signUpError", "Email already in use or registration failed!");
            req.getRequestDispatcher("auth.jsp").forward(req, resp);
        }
    }

}
