<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Retrieve session
    HttpSession sessionObj = request.getSession(false);

    // Retrieve user email from session
    String userEmail = null;
    if (sessionObj != null) {
        userEmail = (String) sessionObj.getAttribute("email");
    }

    // Redirect to login if the user is not authenticated
    if (userEmail == null) {
        response.sendRedirect("/login");
        return; // Important to stop further execution
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Global Pulse News</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex h-screen">

<!-- Sidebar -->
<aside class="w-64 bg-gray-900 text-white hidden lg:flex flex-col">
    <div class="text-center py-6 text-2xl font-bold border-b border-gray-700">
        Global Pulse News
    </div>
    <nav class="flex-grow">
        <a href="#" class="block py-3 px-6 hover:bg-gray-800 transition">Dashboard</a>
        <a href="#" class="block py-3 px-6 hover:bg-gray-800 transition">Profile</a>
        <a href="#" class="block py-3 px-6 hover:bg-gray-800 transition">Settings</a>
    </nav>
    <div class="p-6">
        <a href="logout" class="w-full text-center bg-red-500 hover:bg-red-600 py-2 rounded-lg transition block">Logout</a>
    </div>
</aside>

<!-- Main Content -->
<div class="flex-1 flex flex-col">
    <!-- Top Navigation Bar -->
    <header class="bg-white shadow-lg px-6 py-4 flex justify-between items-center">
        <h2 class="text-2xl font-semibold text-gray-900">Welcome, <%= userEmail %>!</h2>  <!-- This should now work -->
        <button class="lg:hidden text-gray-900 focus:outline-none" onclick="toggleSidebar()">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16m-7 6h7"></path>
            </svg>
        </button>
    </header>

    <!-- Dashboard Content -->
    <main class="p-6 flex-1 overflow-y-auto">
        <div class="bg-white shadow-md rounded-lg p-6">
            <h3 class="text-xl font-semibold text-gray-900">Your Dashboard</h3>
            <p class="text-gray-700 mt-2">Here you can manage your account, view the latest news, and more.</p>
        </div>
    </main>
</div>

<!-- JavaScript to Toggle Sidebar -->
<script>
    function toggleSidebar() {
        document.querySelector('aside').classList.toggle('hidden');
    }
</script>

</body>
</html>
