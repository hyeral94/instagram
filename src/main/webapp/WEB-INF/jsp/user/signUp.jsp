<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap" class="d-flex">
		<div class="box1"></div>
		<div class="box2">
			<header>
				<div><h1 class="text-center mt-3">Instagram</h1></div>
				<div><h4 class="text-center text-secondary mt-3">친구들의 사진과 동영상을 보려면 가입하세요.</h4></div>
				<div><button type="button" class="btn btn-primary form-control mt-3">Facebook으로 로그인</button></div>
			</header>
			<hr>
			<section>
				<input type="text" class="form-control" placeholder="사용자 이름">
				<input type="text" class="form-control mt-3" placeholder="비밀번호">
				<input type="text" class="form-control mt-3" placeholder="비밀번호 확인">
				<input type="text" class="form-control mt-3" placeholder="성명">
				<input type="text" class="form-control mt-3" placeholder="이메일 주소">
				
				<button type="button" class="btn form-control mt-3 text-white" id="joinbtn">가입</button>
				
				<div class="text-center mt-3">계정이 있으신가요?<a href="">로그인</a></div>
				<div class="text-center mt-5">앱을 다운로드 하세요.</div>
				<div class="d-flex justify-content-center">
					<img width="150" src="https://static.renishaw.net/media/thumbnails/240high/1fe7dbf73a9b41d085e1baee821c25d3.jpg">
					<img width="150" src="https://img4.yna.co.kr/etc/inner/KR/2020/09/28/AKR20200928187700017_02_i_P4.jpg">
				</div>
			</section>
			
			<footer class="text-secondary text-center mt-5">© 2022 Instagram from Meta</footer>
		
		
		</div>
		
		<div class="box1"></div>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#joinbtn").on("click", function(){
				alert();
				
			});
			
		});
		
	
	</script>

</body>
</html>