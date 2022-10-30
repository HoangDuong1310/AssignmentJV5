<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=K2D:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap"
	rel="stylesheet">

</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	font-size: 62.5%;
	font-family: 'K2D', sans-serif;
}

.backround {
	background-image:
		url(https://kickey.net/static/images/b236e80c866b149e67159c425eac5aea.gif);
	background-size: cover;
	width: 100%;
	position: fixed;
	height: 100%;
	filter: blur(6px);
	height: 100vh;
	position: relative;
}

.form__wrap {
	background: rgb(26, 26, 26);
	position: absolute;
	border-radius: 14px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	box-shadow: rgb(0 0 0/ 40%) 0px 10px 28px 0px;
	padding: 40px;
	width: 490px;
}

.form {
	
}

.form__close {
	color: #fff;
	/* background-color: #343A3F; */
	display: flex;
	justify-content: flex-end;
}

.form__close:hover {
	filter: brightness(120%);
	cursor: pointer;
}

.form__close i {
	background-color: #343A3F;
	padding: 15px 18px;
	font-size: 15px;
	border-radius: 14px;
}

.form__title {
	margin-bottom: 10px;
}

.form__title span {
	color: #f1f1f1;
	font-size: 24px;
}

.d-flex {
	display: flex;
}

.justify-space-between {
	justify-content: space-between;
}

.form__group {
	margin-bottom: 14px;
}

.form__group input {
	height: 46px;
	padding: 0 16px;
	border-radius: 14px;
	border: none;
	outline: none;
	background-color: #f1f1f1;
	font-size: 1.5rem;
}

.input-firstname, .input-lastname {
	width: 49%;
}

.input-account {
	width: 69%;
}

.input-select {
	width: 29%;
	border-radius: 14px;
	padding: 0 16px;
}

.input-controll {
	width: 100%;
}

.input-controll[type="submit"] {
	background-color: #343A3F;
	color: #fff;
}

.input-controll[type="submit"]:hover {
	filter: brightness(120%);
	cursor: pointer;
}

.redirec {
	display: flex;
	justify-content: center;
}

.redirec span, .redirec a {
	color: #f1f1f1;
	font-size: 1.6rem;
}

input[type="radio"] {
	height: 25px;
}

.label__radio {
	color: #fff;
	font-size: 1.6rem;
}

.radio {
	display: flex;
}

.controll__radio {
	display: flex;
	width: 30%;
}

.error {
	font-size: 2rem;
	color: #e72121;
	text-align: center;
	display: block;
	margin: 10px 0;
}
</style>
<body>
	<div class="main__wrapper">
		<div class="backround"></div>
		<div class="form__wrap">
			<f:form class="form" action="/AssignmentJava5/register" method="post" modelAttribute="register">
				<div class="form__close">
					<i class="fa-solid fa-xmark"></i>
				</div>

				<div class="form__title">
					<span>Tạo tài khoản mới</span>
				</div>
				<p class="error">${massage}${errorPass}</p>
				<div class="form__group">
					<f:input type="text" path="fullname" placeholder="Fullname"
						class="input-controll"/>
				</div>
				<div class="form__group d-flex justify-space-between"></div>
				<div class="form__group">
					<f:input type="text" path="username" placeholder="Username"
						class="input-controll"/>
				</div>
				<div class="form__group">
					<f:input type="email" path="email" placeholder="Email"
						class="input-controll"/>
				</div>
				-->
				<div class="form__group">
					<f:input type="password" path="password" placeholder="Mật Khẩu"
						class="input-controll"/>
				</div>
				<!-- <div class="form__group">
                    <input type="password" name="repassword"  placeholder="Nhập Lại Mật Khẩu" class="input-controll">
                </div> -->
				<div class="form__group">
					<input type="submit" class="input-controll">
				</div>
				<div class="redirec">
					<span>Bạn đã có tài khoản?<a href="/Assignment/login">Đăng
							nhập</a></span>
				</div>
			</f:form>
		</div>
	</div>

	<script type="text/javascript">
		let a = document.querySelector('.error')

		console.log(a)
		function b() {
			a.style.display = 'none'
		}
		setTimeout(b, 4000); //execute greet after 2000 milliseconds (2 seconds)
	</script>

</body>
</html>