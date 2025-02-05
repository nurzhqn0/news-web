<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    HttpSession sessionObj = request.getSession(false);
    String userEmail = (sessionObj != null) ? (String) sessionObj.getAttribute("email") : null;
    Integer role = (sessionObj != null) ? (Integer) sessionObj.getAttribute("role") : null;

    if (userEmail != null) {
        if (role != null) {
            if (role == 1) {
                response.sendRedirect("/admin");
            } else if (role == 2) {
                response.sendRedirect("/dashboard");
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Global Pulse News</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<!-- Login Form -->
<div class="bg-white shadow-lg rounded-lg p-8 max-w-md w-full">
    <h2 class="text-2xl font-semibold text-center text-gray-900">Login</h2>

    <!-- Display Error Message if Login Fails -->
    <%
        String loginError = (String) request.getAttribute("loginError");
        if (loginError != null) {
    %>
    <p class="text-red-500 text-sm text-center mt-2"><%= loginError %></p>
    <%
        }
    %>

    <form action="/login" method="POST" class="mt-6">
        <!-- Email -->
        <label class="block text-gray-700">Email</label>
        <input type="email" name="email" required
               class="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-yellow-500 outline-none mt-1">

        <!-- Password -->
        <label class="block text-gray-700 mt-3">Password</label>
        <div class="relative">
            <input type="password" name="password" id="password" required
                   class="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-yellow-500 outline-none mt-1 pr-10">
            <button type="button" onclick="togglePassword()"
                    class="absolute inset-y-0 right-3 flex items-center text-gray-500">
                <svg id="eyeIcon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
                     viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M2 12s4-8 10-8 10 8 10 8-4 8-10 8S2 12 2 12z"/>
                </svg>
            </button>
        </div>

        <!-- Login Button -->
        <button type="submit"
                class="mt-6 w-full px-4 py-2 bg-yellow-500 text-white font-semibold rounded-lg hover:bg-yellow-600 transition">
            Login
        </button>

        <!-- Register Link -->
        <p class="text-center text-sm text-gray-600 mt-4">
            Don't have an account? <a href="register.jsp"
                                      class="text-yellow-500 font-medium hover:underline">Sign up</a>
        </p>
    </form>
</div>

<!-- JavaScript for Password Toggle -->
<script>
    function togglePassword() {
        const input = document.getElementById("password");
        const icon = document.getElementById("eyeIcon");

        if (input.type === "password") {
            input.type = "text";
            icon.innerHTML = `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4l16 16M9.9 9.9a5 5 0 017.2 7.2m-2.5-2.5a5 5 0 00-7.2-7.2" />`;
        } else {
            input.type = "password";
            icon.innerHTML = `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2 12s4-8 10-8 10 8 10 8-4 8-10 8S2 12 2 12z" />`;
        }
    }
</script>

</body>
</html>
