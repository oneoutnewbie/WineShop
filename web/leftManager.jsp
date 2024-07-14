
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Custom CSS to position the menu on the left side */
            .custom-menu {
                background-color: #a0d2eb;
                height: 100vh; /* Full height */
                width: 13%; /* 1/4 of the page */
                position: fixed; /* Fixed position */
                left: 0; /* Left side of the page */
                top: 0; /* Top of the page */
                overflow-x: hidden; /* Hide horizontal scrollbar */
                padding-top: 20px;
            }

            /* Style for menu items */
            .main-menu li {
                list-style: none;
                padding: 10px 0;
            }

            /* Style for active menu items */
            .active-menu a {
                color: black;
                font-weight: bold;
                text-decoration: none; /* Remove underline from links */
            }

            /* Style for buttons */
            .btn-menu {
                width: 100%;
                text-align: left;
            }
        </style>
    <div class="container-fluid custom-menu">
        <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop container">
                <!-- Logo -->
                <!--<a href="Home" class="logo">
                    <img src="images/icons/_19e26e55-d0c8-465d-b85f-b9daab756364.jpg" alt="IMG-LOGO">
                </a>-->

                <!-- Main Menu -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <!-- If user is logged in -->
                        <c:if test="${sessionScope['account']!=null}">
                            <li >
                                <a style="color: red" href="contact.html">Hello, ${sessionScope.account.name}</a>
                            </li>
                        </c:if>
                        <li class="active-menu">
                            <button class="btn btn-menu" onclick="location.href = 'Home'">Home</button>
                        </li>
                        <li class="active-menu">
                            <button class="btn btn-menu" onclick="location.href = 'manageroder'">Manager Order</button>
                        </li>
                        <li class="active-menu">
                            <button class="btn btn-menu" onclick="location.href = 'xem.jsp'">Statistics</button>
                        </li>
                        
                        <c:if test="${sessionScope['account']!=null}">
                            <li>
                                <button class="btn btn-menu" onclick="location.href = 'Logout'">Logout</button>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <!-- Content Section (Not affected by Bootstrap) -->
    <div class="container-fluid" style="margin-left: 25%;">
        <!-- Your content here -->
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
</html>
