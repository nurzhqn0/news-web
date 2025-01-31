<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Pulse News</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<!-- Header -->
<header>
    <nav class="bg-gray-900 text-white p-4">
        <div class="container mx-auto flex justify-between items-center">
            <!-- Logo -->
            <a href="#" class="text-xl font-bold">Global Pulse News</a>

            <!-- Hamburger Menu (Mobile) -->
            <button class="lg:hidden text-white focus:outline-none" onclick="toggleMenu()">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16m-7 6h7"></path>
                </svg>
            </button>

            <!-- Navigation Links -->
            <div id="nav-menu" class="hidden lg:flex lg:items-center lg:space-x-6 w-full lg:w-auto">
                <a href="#" class="hover:text-yellow-400 transition">Home</a>
                <a href="#" class="hover:text-yellow-400 transition">Categories</a>

                <!-- Search Bar -->
                <form class="flex items-center bg-gray-800 rounded-lg px-3 py-1">
                    <input type="search" class="bg-gray-800 text-white px-2 py-1 outline-none w-40"
                           placeholder="Search news..." aria-label="Search">
                    <button type="submit" class="text-yellow-400 hover:text-yellow-500 px-2">🔍</button>
                </form>

                <!-- Login Button -->
                <a href="login.jsp"
                   class="bg-yellow-500 hover:bg-yellow-600 text-gray-900 px-4 py-2 rounded-lg transition">
                    Login
                </a>
            </div>
        </div>
    </nav>
</header>

<!-- Hero Section -->
<section class="relative bg-gray-900 text-white py-16">
    <div class="container mx-auto px-6 lg:px-12 flex flex-col lg:flex-row items-center">
        <div class="lg:w-1/2 text-center lg:text-left">
            <h1 class="text-4xl lg:text-6xl font-bold leading-tight">
                Stay Updated with <span class="text-yellow-400">Global Pulse News</span>
            </h1>
            <p class="mt-4 text-lg text-gray-300">
                Bringing you the latest breaking news from around the world. Stay informed, stay ahead.
            </p>
            <a href="latest-news.jsp"
               class="mt-6 inline-block bg-yellow-500 hover:bg-yellow-600 text-gray-900 font-semibold px-6 py-3 rounded-lg transition">
                Read Latest News
            </a>
        </div>
    </div>
</section>

<!-- Description Section -->
<section class="bg-gray-100 py-16">
    <div class="container mx-auto px-6 lg:px-12 flex flex-col gap-6 lg:flex-row items-center">

        <!-- Left Side: Text -->
        <div class="lg:w-1/2 text-center lg:text-left">
            <h2 class="text-3xl lg:text-4xl font-bold text-gray-900">Trusted News from Around the Globe</h2>
            <p class="mt-4 text-lg text-gray-700">
                At <span class="font-semibold">Global Pulse News</span>, we bring you the latest stories from reliable sources.
                Our journalists work tirelessly to keep you informed with unbiased, in-depth news coverage.
            </p>
            <p class="mt-2 text-lg text-gray-700">
                Stay ahead with real-time updates, exclusive interviews, and expert analysis from industry professionals.
            </p>
        </div>

        <div class="lg:w-1/2 flex items-center justify-center">
            <button onclick="toggleModal()"
                    class="mt-6 inline-flex items-center bg-gray-900 hover:bg-gray-700 text-white font-semibold px-6 py-3 rounded-lg transition w-full max-w-xs justify-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
                </svg>
                Register Now
            </button>
        </div>

        <!-- Modal Background -->
        <div id="registerModal" class="fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-50 hidden items-center justify-center z-50 transition-opacity duration-300">
            <div id="modalContent" class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md transform scale-95 opacity-0 transition-all duration-300">

                <!-- Modal Header -->
                <div class="flex justify-between items-center border-b pb-3">
                    <h3 class="text-xl font-semibold text-gray-900">Register</h3>
                    <button onclick="toggleModal()" class="text-gray-500 hover:text-gray-700">
                        ✖
                    </button>
                </div>

                <!-- Modal Body -->
                <form class="mt-4" action="/register" method="POST" onsubmit="return validatePassword()">
                    <!-- Full Name -->
                    <label class="block text-gray-700">Full Name</label>
                    <input type="text" name="fullName" required class="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-yellow-500 outline-none mt-1">

                    <!-- Email -->
                    <label class="block text-gray-700 mt-3">Email</label>
                    <input type="email" name="email" required class="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-yellow-500 outline-none mt-1">

                    <!-- Password -->
                    <label class="block text-gray-700 mt-3">Password</label>
                    <div class="relative">
                        <input type="password" name="password" id="password" required class="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-yellow-500 outline-none mt-1 pr-10">
                        <button type="button" onclick="togglePassword('password', 'eyeIcon1')" class="absolute inset-y-0 right-3 flex items-center text-gray-500">
                            <svg id="eyeIcon1" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2 12s4-8 10-8 10 8 10 8-4 8-10 8S2 12 2 12z" />
                            </svg>
                        </button>
                    </div>

                    <!-- Confirm Password -->
                    <label class="block text-gray-700 mt-3">Confirm Password</label>
                    <div class="relative">
                        <input type="password" id="confirmPassword" required class="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-yellow-500 outline-none mt-1 pr-10">
                        <button type="button" onclick="togglePassword('confirmPassword', 'eyeIcon2')" class="absolute inset-y-0 right-3 flex items-center text-gray-500">
                            <svg id="eyeIcon2" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2 12s4-8 10-8 10 8 10 8-4 8-10 8S2 12 2 12z" />
                            </svg>
                        </button>
                    </div>

                    <!-- Error Message -->
                    <p id="errorMessage" class="text-red-500 text-sm mt-2 hidden">Passwords do not match!</p>

                    <!-- Submit Button -->
                    <div class="flex justify-end mt-4">
                        <button type="button" onclick="toggleModal()" class="px-4 py-2 bg-gray-300 rounded-lg hover:bg-gray-400 transition">
                            Cancel
                        </button>
                        <button type="submit" class="ml-3 px-4 py-2 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600 transition">
                            Register
                        </button>
                    </div>
                </form>


            </div>
        </div>

    </div>
</section>

<section class="bg-white py-16">
    <div class="container mx-auto px-6 lg:px-12 text-center">
        <h2 class="text-3xl lg:text-4xl font-bold text-gray-900 mb-10">Why Choose <span class="text-yellow-500">Global Pulse News</span>?</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

            <!-- Feature 1: Real-Time Updates -->
            <div class="bg-gray-100 p-6 rounded-lg shadow-md flex flex-col items-center text-center hover:shadow-lg transition">
                <svg class="w-12 h-12 text-yellow-500 mb-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M8 16l4-4m0 0l4-4m-4 4V4m0 12v4"></path>
                </svg>
                <h3 class="text-xl font-semibold text-gray-900">Real-Time Updates</h3>
                <p class="text-gray-700 mt-2">
                    Get breaking news delivered instantly, ensuring you're always informed.
                </p>
            </div>

            <!-- Feature 2: Verified Sources -->
            <div class="bg-gray-100 p-6 rounded-lg shadow-md flex flex-col items-center text-center hover:shadow-lg transition">
                <svg class="w-12 h-12 text-yellow-500 mb-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"></path>
                </svg>
                <h3 class="text-xl font-semibold text-gray-900">Verified Sources</h3>
                <p class="text-gray-700 mt-2">
                    We ensure accuracy by sourcing news from trusted and reliable agencies.
                </p>
            </div>

            <!-- Feature 3: Personalized Experience -->
            <div class="bg-gray-100 p-6 rounded-lg shadow-md flex flex-col items-center text-center hover:shadow-lg transition">
                <svg class="w-12 h-12 text-yellow-500 mb-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M20 13V7a4 4 0 00-4-4H8a4 4 0 00-4 4v6m16 0a4 4 0 01-4 4h-4l-4 4v-4H4a4 4 0 01-4-4m20 0H4"></path>
                </svg>
                <h3 class="text-xl font-semibold text-gray-900">Personalized Experience</h3>
                <p class="text-gray-700 mt-2">
                    Customize your feed and get news tailored to your interests.
                </p>
            </div>

        </div>
    </div>
</section>

<footer class="bg-gray-800 text-white py-8">
    <div class="container mx-auto px-6 lg:px-12 flex flex-col lg:flex-row justify-between items-center text-center lg:text-left">

        <!-- Left Content: Logo & Copyright -->
        <div>
            <a href="#" class="text-2xl font-bold text-yellow-500">Global Pulse News</a>
            <p class="mt-2 text-gray-400">&copy; 2025 Global Pulse News. All rights reserved.</p>
        </div>

        <!-- Center: Navigation Links -->
        <div class="mt-4 lg:mt-0 flex space-x-6">
            <a href="about.jsp" class="hover:text-yellow-400 transition">About</a>
            <a href="contact.jsp" class="hover:text-yellow-400 transition">Contact</a>
            <a href="privacy.jsp" class="hover:text-yellow-400 transition">Privacy Policy</a>
        </div>

        <!-- Right: Social Media Links -->
        <div class="mt-4 lg:mt-0 flex space-x-6">
            <a href="#" class="hover:text-yellow-400 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M22.675 0h-21.35C.597 0 0 .597 0 1.325v21.351C0 23.403.597 24 1.325 24h11.497v-9.294H9.691V11.02h3.132V8.413c0-3.1 1.893-4.787 4.656-4.787 1.325 0 2.463.099 2.794.143v3.24h-1.918c-1.504 0-1.793.715-1.793 1.762v2.308h3.587l-.467 3.686h-3.12V24h6.117C23.403 24 24 23.403 24 22.676V1.325C24 .597 23.403 0 22.675 0z"/>
                </svg>
            </a>
            <a href="#" class="hover:text-yellow-400 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M23.954 4.569c-.885.392-1.833.656-2.828.775 1.017-.611 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.173-1.555-3.591-1.555-2.717 0-4.92 2.203-4.92 4.919 0 .39.044.765.127 1.126-4.09-.205-7.719-2.164-10.148-5.144-.424.728-.667 1.573-.667 2.476 0 1.708.869 3.215 2.188 4.098-.807-.026-1.566-.247-2.228-.616v.061c0 2.385 1.693 4.374 3.946 4.827-.413.111-.849.171-1.296.171-.317 0-.626-.031-.926-.088.627 1.956 2.445 3.38 4.6 3.421-1.688 1.323-3.809 2.112-6.115 2.112-.398 0-.79-.023-1.175-.068 2.179 1.397 4.768 2.212 7.557 2.212 9.064 0 14.015-7.508 14.015-14.016 0-.214-.005-.426-.014-.637.961-.695 1.797-1.562 2.457-2.549z"/>
                </svg>
            </a>
            <a href="#" class="hover:text-yellow-400 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2.163c-5.488 0-9.962 4.474-9.962 9.962 0 4.412 2.865 8.163 6.839 9.488.5.092.682-.217.682-.482 0-.238-.008-.867-.013-1.703-2.782.604-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.907-.62.069-.608.069-.608 1.002.071 1.53 1.03 1.53 1.03.891 1.529 2.339 1.088 2.91.832.091-.645.35-1.088.636-1.339-2.22-.252-4.555-1.11-4.555-4.935 0-1.09.39-1.982 1.03-2.68-.103-.252-.448-1.267.098-2.64 0 0 .841-.269 2.75 1.025a9.608 9.608 0 0 1 2.5-.336 9.63 9.63 0 0 1 2.5.336c1.909-1.294 2.749-1.025 2.749-1.025.547 1.373.202 2.388.1 2.64.641.698 1.029 1.59 1.029 2.68 0 3.835-2.339 4.68-4.566 4.927.359.309.678.921.678 1.855 0 1.34-.013 2.419-.013 2.75 0 .268.18.577.687.479 3.976-1.327 6.837-5.077 6.837-9.487C21.962 6.637 17.488 2.163 12 2.163z"/>
                </svg>
            </a>
        </div>

    </div>
</footer>

<!-- JavaScript for Mobile Menu Toggle -->
<script>
    function toggleMenu() {
        document.getElementById("nav-menu").classList.toggle("hidden");
    }

    function toggleModal() {
        const modal = document.getElementById("registerModal");
        const modalContent = document.getElementById("modalContent");

        if (modal.classList.contains("hidden")) {
            modal.classList.remove("hidden");
            setTimeout(() => {
                modal.classList.add("opacity-100");
                modalContent.classList.add("scale-100", "opacity-100");
            }, 10); // Small delay for smooth animation
        } else {
            modal.classList.remove("opacity-100");
            modalContent.classList.remove("scale-100", "opacity-100");
            setTimeout(() => {
                modal.classList.add("hidden");
            }, 300); // Matches the duration of transition (300ms)
        }
    }


    function validatePassword() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        const errorMessage = document.getElementById("errorMessage");

        if (password !== confirmPassword) {
            errorMessage.classList.remove("hidden");
            return false; // Prevent form submission
        }

        errorMessage.classList.add("hidden");
        return true; // Allow form submission
    }

    function togglePassword(inputId) {
        const input = document.getElementById(inputId);
        if (input.type === "password") {
            input.type = "text";
        } else {
            input.type = "password";
        }
    }
</script>

</body>

</html>
