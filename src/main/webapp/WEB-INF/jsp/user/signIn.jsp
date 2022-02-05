<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram 로그인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div class="d-flex mt-5">
		<div class="box2"></div>
		
		<img id="img" src="https://www.thedigitalmkt.com/wp-content/uploads/business-hands-instagram-iphone-preview.jpg">
		
		<div class="box1" id="box">
			<div id="box-border">
			<header>
				<div><h1 class="text-center mt-3">Instagram</h1></div>
				<input type="text" class="form-control mt-5" placeholder="사용자 이름 또는 이메일 주소" id="loginIdInput">
				<input type="text" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
				
				<button type="button" class="btn form-control mt-3 text-white" id="login-btn">로그인</button>
				<hr>
			</header>
			<section class="text-center">
				
				<button type="button" class="btn form-control mt-3" id="facebook-login"><strong><h4>Facebook으로 로그인</h4></strong></button>
				
				<a class="text-secondary mt-5" style="text-decoration-line: none;">비밀번호를 잊으셨나요?</a>
			</div>
			<div id="box-border" class="mt-5 mb-5">
				<div class="text-center"><h4>계정이 없으신가요?<a href="/user/signup_view">가입하기</a></h4></div>
			</div>		
				<c:import url ="/WEB-INF/jsp/include/appStore.jsp" />
			</section>
		</div>	
		<div class="box2"></div>
	</div>
		<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
		
	<script>
	
		$(document).ready(function(){
			
			$("#login-btn").on("click", function(){
			
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == ""){
					alert("사용자 이름 또는 이메일 주소를 입력하세요.");
					return;
				}
				
				if(password == ""){
					 alert("비밀번호를 입력하세요.");
					 return;
				}
	
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data){
						if(data.result == "success"){
							location.href="/post/timeline"
						}else {
							alert("아이디 또는 비밀번호를 입력하세요.");
						}
						
					},
					error:function() {
						alert("에러발생");
					}
					
					
				});
			});
			
		});
	
	</script>	
</body>
</html>