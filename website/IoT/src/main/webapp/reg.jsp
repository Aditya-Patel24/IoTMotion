<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <%@include file="all_component/all_css.jsp"%>
    <style>
        #btnlogin input[type=submit] {
            background-color: #ffc800; /* Yellow color */
            border: none; /* No border */
            color: white; /* Text color */
            padding: 10px 20px; /* Padding around the text */
            text-align: center; /* Center the text */
            text-decoration: none; /* No underline */
            display: inline-block; /* Align with other elements */
            font-size: 16px; /* Text size */
            margin: 4px 2px; /* Margin around the button */
            cursor: pointer; /* Pointer cursor on hover */
            border-radius: 8px; /* Rounded corners */
        }
    </style>
</head>
<body>
<%@include file="all_component/regnav.jsp"%>
<div class="container" id="login">
    <div class="row">
        <div class="col-md-5 py-3 py-md-0" id="side1">
            <h3 class="text-center">Register</h3>
        </div>
        <div class="col-md-7 py-3 py-md-0" id="side2">
            <h3 class="text-center">Create Account</h3>
            <!-- Start of form -->
            <form action="User" method="post">
                <div class="input2 text-center">
                    <input type="text" name="username" placeholder="User Name">
                    <input type="text" name="phone" placeholder="Phone">
                    <input type="email" name="email" placeholder="Email">
                    <input type="password" name="password" placeholder="Password">
                </div>
                <!-- Button to submit the form -->
                <div class="text-center" id="btnlogin">
                    <input type="submit" value="SIGN UP">
                </div>
            </form>
            <!-- End of form -->
        </div>
    </div>
</div>
<%@include file="all_component/footer.jsp"%>
<a href="#" class="arrow"><i><img src="all_component/img/arrow.png" alt=""></i></a>
</body>
</html>
