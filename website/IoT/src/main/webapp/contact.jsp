<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MDS Site</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
<%@include file="all_component/navbar2.jsp"%>
 <div class="container" id="contact">
        <div class="row" style="margin-top: 50px;">
            <div class="col-md-4 py-3 py-md-0">
                <div class="card">
                    <i class="fas fa-phone"> Phone</i>
                    <h6>7046461000</h6>
                </div>
            </div>
            <div class="col-md-4 py-3 py-md-0">
                <div class="card">
                    <i class="fas fa-envelope"> Email</i>
                    <h6>info@saffrony.ac.in</h6>
                </div>
            </div>
            <div class="col-md-4 py-3 py-md-0">
                <div class="card">
                    <i class="fas fa-location-dot"> Address</i>
                    <h6>Ahmedabad-Mehsana Highway, Linch, Gujarat 384435</h6>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 30px;">
            <div class="col-md-4 py-3 py-md-0">
                <input type="text" class="form-control form-control" placeholder="Name">
            </div>
            <div class="col-md-4 py-3 py-md-0">
                <input type="text" class="form-control form-control" placeholder="Email">
            </div>
            <div class="col-md-4 py-3 py-md-0">
                <input type="text" class="form-control form-control" placeholder="Phone">
            </div>
            <div class="form-group" style="margin-top: 30px;">
                <textarea class="form-control" id="" rows="5" placeholder="Message"></textarea>
            </div>
            <div class="messagebtn text-center"><button>Message</button></div>
        </div>
    </div>

	<%@include file="all_component/footer.jsp"%>
	<a href="#" class="arrow"><i><img
			src="all_component/img/arrow.png" alt=""></i></a>
</body>
</html>