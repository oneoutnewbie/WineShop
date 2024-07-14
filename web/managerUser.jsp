<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>

        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <link rel="stylesheet" href="assets/css/main-color.css">
        <script type="text/javascript">
            function doDelete(id) {
                if (id == 2) {
                    alert("Cannot delete Student with RollNo: " + id);
                } else {
                    if (confirm("Are you sure to delete Student with RollNo: " + id)) {
                        window.location = "delete?id=" + id;
                    }
                }
            }
        </script>
    </head>

    <body class="biolife-body">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container-fluid">

                <div class="row" >

                    <div class="col-md-12">
                        <h1 style="text-align: center;">Manager User</h1>
                        <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModalAddNew">Add New User</button>
                        <a class="btn btn-default btn-lg" href="Home">Back To Home</a>
                        <!-- Modal -->
                        <div class="modal fade" id="myModalAddNew" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add New User:</h4>
                                    </div>
                                    <form action="register" method="post">
                                        <div class="modal-body">
                                            <b>Name: </b><input type="text" class="form-control" value="" required name="username"><br>
                                            <b>Email: </b><input type="text" step="0.1" class="form-control"  required value="" name="email"><br>
                                            <b>Phone: </b><input type="text" step="0.1" class="form-control"  required value="" name="phone"><br>
                                            <b>Address: </b><input type="text" class="form-control" required value="" name="address"><br>
                                            <b>Gender: </b><label>
                                                <input type="radio" name="gender" value="1">
                                                Male
                                            </label>
                                            <label>
                                                <input type="radio" name="gender" value="0">
                                                Female
                                            </label><br>
                                            <b>Password:</b><input type="text" class="form-control" required  value="" name="password"><br>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>

                        <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                            <thead >
                                <tr style="font-size: 20px;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Phone</th>

                                    <th scope="col" style="text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${ul}">
                                    <tr>
                                        <th scope="row">${u.getId()}</th>
                                        <td>${u.getName()}</td>
                                        <td>${u.getEmail()}</td>
                                        <td>${u.getPassword()}</td>
                                        <td>${u.getGender()}</td>
                                        <td>${u.getPhone()}</td>

                                        <td ><a href="#" onclick="doDelete('${u.getId()}')" class="btn- btn-danger  btn-lg" style="display: block;" > Delete</a></td>                                       

                                    </tr>
                                    <!-- Modal -->
                                <div class="modal fade" id="myModal${u.getId()}" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit product:</h4>
                                            </div>
                                            <form action="EditProduct" method="post">
                                                <div class="modal-body">
                                                    <b>ID: </b><input type="text" class="form-control" name="id" value="${u.getId()}" readonly=""><br>
                                                    <b>Name: </b><input type="text" class="form-control" value="${u.getName()}" name="name"><br>
                                                    <b>Price: </b><input type="number" step="0.1" class="form-control" value="${u.getName()}" name="price"><br>
                                                    <b>Category: </b>
                                                    <div style="height: 50px; w30pxidth: 100%">
                                                        <select  class="form-control" style="display: block;" name="category" >

                                                        </select>
                                                    </div>
                                                    <b>Stock: </b><input type="number" class="form-control" value="${u.getName()}" name="stock"><br>
                                                    <b>Create Date: </b><input type="date" class="form-control" value="${u.getName()}" name="creDate"><br>
                                                    <b>Description: </b><input type="text" class="form-control" value="${u.getName()}" name="descri"><br>
                                                    <b>Image link:</b><input type="text" class="form-control" value="${u.getName()}" name="img"><br>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="assets/js/jquery-3.4.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.nicescroll.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/biolife.framework.js"></script>
        <script src="assets/js/functions.js"></script>
    </body>

</html>