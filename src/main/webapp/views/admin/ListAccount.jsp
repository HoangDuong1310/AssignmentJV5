<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<meta charset="utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.get-in-touch {
	max-width: 800px;
	margin: 50px auto;
	position: relative;
}

.get-in-touch .title {
	text-align: center;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-size: 3.2em;
	line-height: 48px;
	padding-bottom: 48px;
	color: #5543ca;
	background: #5543ca;
	background: -moz-linear-gradient(left, #f4524d 0%, #5543ca 100%)
		!important;
	background: -webkit-linear-gradient(left, #f4524d 0%, #5543ca 100%)
		!important;
	background: linear-gradient(to right, #f4524d 0%, #5543ca 100%)
		!important;
	-webkit-background-clip: text !important;
	-webkit-text-fill-color: transparent !important;
}

.contact-form .form-field {
	position: relative;
	margin: 32px 0;
}

.contact-form .input-text {
	display: block;
	width: 100%;
	height: 36px;
	border-width: 0 0 2px 0;
	border-color: #5543ca;
	font-size: 18px;
	line-height: 26px;
	font-weight: 400;
}

.contact-form .input-text:focus {
	outline: none;
}

.contact-form .input-text:focus+.label, .contact-form .input-text.not-empty+.label
	{
	-webkit-transform: translateY(-30px);
	transform: translateY(-30px);
}

.contact-form .label {
	position: absolute;
	left: 20px;
	bottom: 20px;
	font-size: 18px;
	line-height: 26px;
	font-weight: 400;
	color: #5543ca;
	cursor: text;
	transition: -webkit-transform .2s ease-in-out;
	transition: transform .2s ease-in-out;
	transition: transform .2s ease-in-out, -webkit-transform .2s ease-in-out;
}

.contact-form .submit-btn {
	display: inline-block;
	background-color: #000;
	background-image: linear-gradient(125deg, #a72879, #064497);
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 16px;
	padding: 8px 16px;
	border: none;
	width: 200px;
	cursor: pointer;
}

.d-flex {
	display: flex;
}

.align-items-center {
	align-items: center;
}

.w-40 {
	width: 40%;
}

.flex-direction-row-reverse {
	flex-direction: row-reverse;
}

.d-none {
	display: none;
}
</style>
<body>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>id</th>
					<th>username</th>
					<th>fullname</th>
					<th>password</th>
					<th>email</th>
					<th>photo</th>
					<th>activated</th>
					<th>role</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="x">
					<tr>
						<td>${x.id}</td>
						<td>${x.username}</td>
						<td>${x.fullname}</td>
						<td>${x.password}</td>
						<td>${x.email}</td>
						<td>${x.photo}</td>
						<td><span class="badge badge-success rounded-pill d-inline">${x.activated?'Hoạt động':'Không hoạt động'}</span></td>
						<td>${x.role}</td>
						<td><a href="/AssignmentJava5/admin/updateAcc/${x.id}">Edit</a></td>
						<td><a href="/AssignmentJava5/admin/deleteAcc/${x.id}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<f:form class="contact-form row"
			action="/AssignmentJava5/admin/updateAcc" method="POST"
			modelAttribute="updateAcc">
			<div class="form-field col-lg-6 d-none">
				<f:input id="text" path="id" class="input-text js-input" type="text" />
				<label class="label">ID</label>
			</div>
			<div class="form-field col-lg-6 ">
				<f:input id="phone" path="username" class="input-text js-input"
					type="text" />
				<label class="label">username</label>
			</div>
			<div class="form-field col-lg-6 ">
				<f:input id="phone" path="fullname" class="input-text js-input"
					type="text" />
				<label class="label">fullname</label>
			</div>
			<div class="form-field col-lg-6 ">
				<f:input id="phone" path="password" class="input-text js-input"
					type="text" />
				<label class="label">password</label>
			</div>
			<div class="form-field col-lg-6 ">
				<f:input id="video" path="email" class="input-text js-input"
					type="text" />
				<label class="label">email</label>
			</div>
			<div class="form-field col-lg-6 d-flex align-items-center">
				<label style="position: unset; width: 50%;" class="label">photo</label>
				<f:input id="phone" path="photo" class="input-text js-input"
					type="file" />
			</div>
			<div class="form-field col-lg-6 d-flex align-items-center">
				<f:radiobutton path="activated" value="1" label="con" />
				<f:radiobutton path="activated" value="0" label="het" />
			</div>
			<%-- <div class="form-field col-lg-6 d-flex align-items-center">
				<f:radiobutton path="role" value="0" label="Admin" />
				<f:radiobutton path="role" value="1" label="User" />
			</div> --%>
			<div class="form-field col-lg-12">
				<input class="submit-btn" type="submit" value="Update">
			</div>

		</f:form>
	</div>
</body>
</html>