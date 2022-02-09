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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>
<body>
	<div class="d-flex mt-5">
		<div class="box2"></div>
		<img id="img" src="https://img.appstory.co.kr/@files/monthly.appstory.co.kr/thum/Bdatafile/Board/dir_100/10045.jpg">
		
		<div class="box1" id="box">
			<div id="box-border">
				<header>
					<div><h1 class="text-center mt-3">Instagram</h1></div>
					<div><h4 class="text-center text-secondary mt-3">친구들의 사진과 동영상을 보려면 가입하세요.</h4></div>
					<div><button type="button" class="btn btn-primary form-control mt-3"><i class="fa-brands fa-facebook-square" style="font-size: 20px;"></i>Facebook으로 로그인</button></div>
				</header>
				<hr>
				<form id="signUpForm">
						<input type="text" class="form-control" placeholder="사용자 이름" id="loginIdInput">
						<div id="duplicateId" class="d-none"><small class="text-danger">중복된 ID 입니다.</small></div>
						<div id="noneDuplicateId" class="d-none"><small class="text-success">사용 가능한 ID 입니다.</small></div>
						
						<input type="text" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
						<input type="text" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordCkInput">
						<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
						
						<input type="text" class="form-control mt-3" placeholder="성명" id="nameInput">
						<input type="text" class="form-control mt-3" placeholder="이메일 주소" id="emailInput">
						
						<button type="submit" class="btn form-control mt-3 text-white" id="joinbtn">가입</button>
				</form>
			</div>
			
			<div id="box-border" class="mt-3">
				<div class="text-center"><h4>계정이 있으신가요?<a href="/user/signin_view">로그인</a></h></div>
			</div>		
			
				<c:import url ="/WEB-INF/jsp/include/appStore.jsp" />
					
		</div>
		
		<div class="box2"></div>
	</div>
		<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	
	<script>
		$(document).ready(function(){
			
			$("#loginIdInput").on("input", function(){
				
				var loginId = $("#loginIdInput").val();

				var isIdCheck = false;
				var isDuplicateId = true;
				
				if(loginId == null || loginId == ""){
					alert("사용자 이름을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"loginId":loginId},
					success:function(data){
						isIdCheck = true;
						
						if(data.is_duplicate){					
							isDuplicateId = true;
							$("#duplicateId").removeClass("d-none");
							$("#noneDuplicateId").addClass("d-none");
						}else{
							isDuplicate = false;
							$("#noneDuplicateId").removeClass("d-none");
							$("#duplicateId").addClass("d-none");
							
						}
					},
					error:function() {
						alert("에러 발생");
					}
					
				});
				
			});
			
			$("#signUpForm").on("submit", function(e){
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordCheck = $("#passwordCkInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				
				if(loginId == null || loginId == ""){
					alert("사용자 이름을 입력하세요.");
					return;
				}
				
				if(password == null || password == ""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(password != passwordCheck){
					$("#errorPassword").removeClass("d-none");
					return;
				}
				
				if(name == null || name == ""){
					alert("성명을 입력하세요.");
					return;
				}
				
				if(email == null || email == ""){
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
						}else{
							alert("회원가입 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
					
				});
			});
			
		     var bannerList = ["https://img.appstory.co.kr/@files/monthly.appstory.co.kr/thum/Bdatafile/Board/dir_100/10045.jpg", "https://u7.uidownload.com/vector/355/925/vector-instagram-gradient-background-eps.jpg",
		    	 "http://economychosun.com/query/upload/253/20180603141644_grakbuzv.jpg"];
	         var currentImageIndex = 0;
	         
	            setInterval(function() {
	                $("#img").attr("src", bannerList[currentImageIndex]);
	                currentImageIndex++;

	                if(currentImageIndex == bannerList.length) {
	                    currentImageIndex = 0;
	                }
	            }, 1500); 
			
		});
	
	
	</script>

</body>
</html>