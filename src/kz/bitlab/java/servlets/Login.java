package kz.bitlab.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.java.database.DBConnector;
import kz.bitlab.java.models.User;

import java.io.IOException;
import java.util.Objects;

@WebServlet(value="/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = DBConnector.login(email, password);

        if(!Objects.isNull(user)) {
            req.getSession().setAttribute("email", email);
            req.getSession().setAttribute("role", user.getRoleId());


            if(user.getRoleId() == 2){
                resp.sendRedirect("/dashboard");
            } else{
                resp.sendRedirect("/admin");
            }
        } else {
            req.setAttribute("loginError", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}


