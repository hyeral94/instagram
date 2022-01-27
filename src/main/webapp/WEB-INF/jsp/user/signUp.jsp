<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram 회원가입</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div class="d-flex">
		<div class="box1"></div>
		<div class="box1" id="box-border">
			<header>
				<div><h1 class="text-center mt-3">Instagram</h1></div>
				<div><h4 class="text-center text-secondary mt-3">친구들의 사진과 동영상을 보려면 가입하세요.</h4></div>
				<div><button type="button" class="btn btn-primary form-control mt-3">Facebook으로 로그인</button></div>
			</header>
			<hr>
			<section>
				<input type="text" class="form-control" placeholder="사용자 이름" name="loginId" id="loginIdInput">
				<input type="text" class="form-control mt-3" placeholder="비밀번호" name="password" id="passwordInput">
				<input type="text" class="form-control mt-3" placeholder="비밀번호 확인" name="passwordCk" id="passwordCkInput">
				<input type="text" class="form-control mt-3" placeholder="성명" name="name" id="nameInput">
				<input type="text" class="form-control mt-3" placeholder="이메일 주소" name="email" id="emailInput">
				
				<button type="button" class="btn form-control mt-3 text-white" id="joinbtn">가입</button>
				
				<div class="text-center mt-3"><h4>계정이 있으신가요?<a href="">로그인</a></h4></div>
				<c:import url ="/WEB-INF/jsp/include/appStore.jsp" />
			</section>
			
			<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
		
		
		</div>
		
		<div class="box1"></div>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#loginIdInput").on("Input", function(){
				var loginId = $(this).val();

				$.ajax({
					type:"post",
					utl:"user/id_check",
					data:{"loginId":loginId},
					success:function(data) {
						if(data.idCheck == "success");
						alert("사용가능한 아이디 입니다.");
					}else {
						alert("중복된 아이디 입니다.").
					},
					error:function() {
						alert("에러발생");
					}
					
					
				});
				
			});
			
			
			$("#joinbtn").on("click", function(){
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordCk = $("#passwordCkInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				
				if(loginId == ""){
					alert("사용자 이름을 입력하세요.");
					return;
				}
	
				if(password == ""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(password != passwordCk){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				if(name == ""){
					alert("성명을 입력하세요.");
					return;
				}
				
				if(email == ""){
					alert("이메일 주소를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success"){
							location.href="/user/signin_view";
							
						}else {
							alert("회원가입 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
				});
				
				
				

			});
			
		});
		
	
	</script>

</body>
</html>