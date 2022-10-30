<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link
	href="https://fonts.googleapis.com/css2?family=K2D:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
	rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.nav {
	width: 77px;
	display: flex;
	justify-content: center;
	background-color: #1a1a1a;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	border-right: 1px solid #2F2F2F;
}

.nav ul {
	list-style: none;
	text-decoration: none;
}

.nav ul .logo {
	width: 50px;
	margin: 30px auto 25px;
}

.nav ul .logo a img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.nav ul li a i {
	font-size: 2rem;
	color: #fff;
}

.nav ul .item {
	background-color: #39393f;
	text-align: center;
	margin-bottom: 18px;
	border-radius: 18px;
}

.nav .active {
	background-color: #7b68ee !important;
}

.nav ul .item a {
	padding: 15px;
	display: block;
}

/* sidebar  */
.sidebar {
	width: 300px;
	background-color: #1a1a1a;
	position: fixed;
	top: 0;
	bottom: 0;
	left: 77px;
	color: #fff;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.sidebar__title {
	padding: 20px;
	font-size: 1.6rem;
	display: block;
	width: 100%;
}

.sidebar__fillter-wrapper {
	margin-top: 50px;
	height: 720px;
	overflow-y: scroll;
	padding-bottom: 50px;
	width: 100%;
	padding: 0 20px;
}

.sidebar__support-wrapper::-webkit-scrollbar-track {
	background-color: #343A3F;
}

.sidebar__support-wrapper::-webkit-scrollbar-thumb {
	background-color: #1a1a1a;
}

.sidebar__support-wrapper::-webkit-scrollbar {
	width: 10px;
	border-radius: 2px;
	position: relative;
	z-index: 4;
}

.event__fillter {
	width: 100%;
	margin-bottom: 20px;
}

.event__fillter select, .categories__fillter select {
	width: 100%;
	min-height: 46px;
	border-radius: 14px;
	background-color: transparent;
	border: 2px solid #F2F2F2;
	color: #fff;
	font-size: 1.6rem;
	padding: 10px;
	outline: none;
	display: block;
}

.categories__fillter select {
	position: relative;
}

.over-select {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 1;
	background-color: #101010;
	width: 100%;
	height: 100%;
}

.checkboxes label, .checkboxes__categories label {
	width: 100%;
	min-height: 46px;
	font-size: 1.6rem;
	outline: none;
	/* display: block; */
	text-align: left;
	display: flex;
	align-items: center;
}

.checkboxes .checkbox__wrap, .checkboxes__categories .checkbox__wrap {
	border-radius: 14px;
	background-color: transparent;
	border: 2px solid #F2F2F2;
	border-top: 1px;
	color: #fff;
	padding: 10px;
}

.checkboxes label input[type="checkbox"], .checkboxes__categories label input[type="checkbox"]
	{
	margin-right: 10px;
}

.event__fillter option {
	width: 100%;
}

.sidebar__login {
	margin-top: auto;
	width: 100%;
	display: flex;
	width: 100%;
	justify-content: center;
}

.sidebar__login i {
	margin-right: 5px;
}

.sidebar__login-btn {
	border: transparent;
	width: 100%;
	padding: 15px 0;
	background-color: #343A3F;
	color: #fff;
	font-size: 1.6rem;
	/* border-radius: 10px 10px 0 0; */
	cursor: pointer;
}

.sidebar__login-btn:first-child {
	border-radius: 10px 0 0 0;
	width: 60%;
}

.sidebar__login-btn:nth-child(2) {
	width: 40%;
	background-color: #2F2F2F;
	border-radius: 0 10px 0 0;
}

.sidebar__login-btn:hover {
	filter: brightness(110%);
}

/* content  */
.content__wrap {
	background-color: #2F2F2F;
	padding-left: 377px;
	min-height: 100vh;
}

.content {
	padding: 20px;
}

.sidebar__search {
	width: 100%;
	padding: 10px 0px;
}

.sidebar__search .search {
	width: 100%;
	min-height: 46px;
	padding: 10px;
	outline: none;
	border: none;
	background-color: #f1f1f1;
	font-size: 1.5rem;
	border-radius: 14px;
}

.list__card {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.checkboxes, .checkboxes__categories {
	display: none;
}

.btn__add {
	width: 100%;
	margin-bottom: 10px;
}

.btn__add button {
	width: 100%;
	min-height: 46px;
	border-radius: 14px;
	background-color: transparent;
	border: 2px solid #F2F2F2;
	color: #fff;
	font-size: 1.6rem;
	padding: 10px;
	outline: none;
	display: block;
	cursor: pointer;
}

.option-item {
	color: #000;
}

.card__delete {
	position: relative;
}

.block__delete {
	filter: brightness(0.5) blur(3px);
}

.text__delete {
	font-size: 3rem;
	font-weight: 900;
	color: #fff;
	position: absolute;
	z-index: 999999;
	top: 50%;
	left: 50%;
	transform: translate(-50%);
}

.text-font {
	font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
	font-weight: 700;
	letter-spacing: .156rem;
	font-size: 1.125rem;
}

.text-price {
	padding: 0 .625rem;
	font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
	font-style: normal;
	font-size: .75rem;
	font-weight: 700;
	line-height: .813rem;
	letter-spacing: 1.6px;
}

.text-descriptions {
	font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
	font-style: normal;
	font-size: .75rem;
	font-weight: 400;
	line-height: 1.125rem;
	margin: .313rem 0 .938rem;
	padding: 0 .625rem;
}

.button-color {
	color: #4e4e4e;
	border-color: #4e4e4e;
}

.button-order {
	font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
	font-style: normal;
	font-size: .75rem;
	font-weight: 700;
	background-color: hsl(90, 40%, 50%);
	color: white;
}
</style>
<body>
	<div class="main__wrapper">
		<div class="nav">
			<ul>
				<li class="logo"><a href="#"> <img
						src="https://upload.motgame.vn/photos/motgame-vn/2022/05/Spy-x-family-Anya_3.jpg"
						alt="logo">
				</a></li>
				<li class="item"><a href="/AssignmentJava5/admin/index"> <i
						class="fa-solid fa-house"></i>
				</a></li>
				<li class="item "><a href="/AssignmentJava5/admin/list"> <i
						class="fa-solid fa-tag"></i>
				</a></li>
				<li class="item active"><a href="/AssignmentJava5/admin/cart">
						<i class="fa-solid fa-cart-shopping"></i>
				</a></li>
				<li class="item "><a href="/AssignmentJava5/admin/accountlist">
						<i class="fa-solid fa-list"></i>
				</a></li>
			</ul>
		</div>
		<div class="sidebar">
			<div class="sidebar__title">
				<h1>List</h1>
			</div>
			<div class="sidebar__fillter-wrapper">
				<div class="btn__add">
					<button
						onclick="window.location.href='/AssignmentJava5Java5/admin/insert'">Thêm</button>
				</div>

				<div class="sidebar__search">
					<input type="text" name="name" placeholder="Tìm kiếm theo tên"
						class="search js-keyup" id="key">
				</div>
				<div class="sidebar__search">
					<input type="text" name="price" placeholder="Tìm kiếm theo giá"
						class="search">
				</div>
				<div class="btn__add">
					<button>Lọc</button>
				</div>
				<div class="event__fillter">
					<select name="status" class="form-select "
						aria-label="Default select example">
						<option class="option-item" value="false">CHƯA</option>
						<option class="option-item" value="">ALL</option>
						<option class="option-item" value="true">ĐÃ XÓA</option>

					</select>
				</div>
				</form>
			</div>
			<div class="sidebar__login">
				<button class="sidebar__login-btn">
					<span style="text-transform: capitalize; font-weight: 800;">${sessionScope.fullname}
					</span>
				</button>

				<button class="sidebar__login-btn"
					onclick="window.location.href='/AssignmentJava5/logout'">
					<i class="fa-solid fa-arrow-right-from-bracket"></i>
				</button>
			</div>
		</div>
		<div class="content__wrap">
			<div class="content">
				<div class="container my-5 py-5">
					<form action="/AssignmentJava5/admin/pay" method="post">
						<!--Section: Design Block-->
						<section>

							<div class="row">
								<div class="col-md-4 mb-4 position-static">
									<div class="card mb-4">
										<div class="card-header py-3">
											<h5 class="mb-0 text-font">
												item <span class="float-end mt-1" style="font-size: 13px;"><a
													href="http://localhost:8080/AssignmentJava5/admin/cart">Edit</a></span>
											</h5>
										</div>
										<div class="card-body">
											<c:forEach items="${listCart}" var="x">
												<div class="row">
													<div class="col-md-4" style="margin-top: 10px;">
														<img
															src=" ${pageContext.request.contextPath}/img/${x.image}"
															class="rounded-3" style="width: 100px;"
															alt="Blue Jeans Jacket" />
													</div>
													<div class="col-md-6 ms-3">
														<span class="mb-0 text-price">$ ${x.name}</span>
														<p class="text-descriptions mt-0">
															Qty:<span class="text-descriptions fw-bold">${x.qty }</span>
														</p>
													</div>
												</div>
											</c:forEach>
											<div class="card-footer mt-4">
												<ul class="list-group list-group-flush">
													<li
														class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0 text-muted">
														Subtotal <span>$ ${total}</span>
													</li>
													<li
														class="list-group-item d-flex justify-content-between align-items-center px-0 fw-bold text-uppercase">
														Total to pay <span>$ ${total}</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-8 mb-4">
									<div class="card mb-4">
										<div class="card-header py-3">
											<h5 class="mb-0 text-font text-uppercase">Delivery
												address</h5>
										</div>
										<div class="card-body">
											<form action="/AssignmentJava5/admin/pay" method="post">

												<!-- Text input -->
												<div class="form-outline mb-4">
													<input type="text" id="form11Example4" class="form-control"
														name="address" /> <label class="form-label"
														for="form11Example4">Address</label>
												</div>
												<!-- Number input -->
												<div class="form-outline mb-4">
													<input type="number" id="form11Example6"
														class="form-control" /> <label class="form-label"
														for="form11Example6">Phone</label>
												</div>

												<!-- Message input -->
												<div class="form-outline mb-4">
													<textarea class="form-control" id="form11Example7" rows="4"></textarea>
													<label class="form-label" for="form11Example7">Additional
														information</label>
												</div>

												<!-- Checkbox -->
												<div class="form-check d-flex justify-content-center mb-2">
													<input class="form-check-input me-2" type="checkbox"
														value="" id="form11Example8" checked /> <label
														class="form-check-label" for="form11Example8">
														Create an account? </label>
												</div>
										</div>

									</div>
									<div class="text-center">
										<button type="submit" class="btn button-order col-md-10">Place
											order</button>
									</div>
					</form>
				</div>
			</div>

			</section>
			<!--Section: Design Block-->

		</div>

	</div>
	</div>
	</section>
	</div>
	</div>
	</div>
	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$(".js-keyup")
									.keyup(
											function() {
												var strKey = $("#key").val();
												if (strKey.trim() !== "") {
													$
															.get(
																	'/AssignmentJava5/admin/find',
																	function(
																			data) {
																		console
																		$(
																				".list__card")
																				.empty();
																		$(
																				".list__card")
																				.append(
																						data)
																	})
												}
											});
							function subString() {
								var text = document
										.getElementsByClassName("card__main-title");
								var title = document
										.getElementsByClassName("card__main-description");
								for (var i = 0; i < text.length; i++) {
									text[i].textContent = text[i].textContent
											.substr(0, 52)
											+ ` ...`;
								}
								for (var i = 0; i < title.length; i++) {
									title[i].textContent = title[i].textContent
											.substr(0, 52)
											+ ` ...`;
								}
							}
							;
							subString();
						});
	</script>
</body>
</html>