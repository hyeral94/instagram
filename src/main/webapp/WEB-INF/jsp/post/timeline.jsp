<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>

	<div id="wrap">

		<c:import url ="/WEB-INF/jsp/include/logo.jsp" />
		
		<section>
			<div id="content2"></div>
			<div id="content1">
				<div class="border rounded bg-white mt-3">
					<div>
						<textarea class="form-control w-100 border-0 non-resize" style="border: none" rows="4" cols="3" placeholder="내용을 입력하세요." id="contentInput"></textarea>
					</div>
									
					<div class="d-flex justify-content-between">
						<span class="img-icon"> <i class="bi bi-image" id="imgBtn"></i></span>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="btn btn-small btn-primary" id="uploadBtn">업로드</button>					
					</div>
				</div>
				
			<c:forEach var="post" items="${postList }" >
				<!-- 피드 -->
				<div class="mt-3 border rounded bg-white">
					<!-- 타이틀 -->
					<div class="p-2 border-bottom">
						<div class="d-flex justify-content-between">
							<div class="d-flex">
								<i class="bi bi-person-circle" style="font-size:30px;"></i>
								<c:choose>
								<c:when test="${not empty userId }"> 
								<div class="m-1 mt-3"><strong>${userLoginId }</strong></div>
								</c:when>
								</c:choose>
							</div>
							<div>
								<a class="text-dark" href="#">
									<i class="bi bi-three-dots mt-3"></i>
								</a>
							</div>	
						</div>	
						
						<!-- 이미지 -->
						<div class="mt-1">
							<img src="${post.imagePath }" >
						</div>
								
						<!-- 좋아요 -->
						<div>
							<i class="bi bi-heart btn" style="font-size: 20px;"></i>
							좋아요 5개
						</div>
								
								
						<!-- content -->
						<div>
							<b>"${post.userName }</b>
						</div>			
						
							
						<!-- 댓글 -->
						
						<!-- 댓글입력 -->
						<div class="d-flex border-top">
							<input type="text" class="form-control border-0" id="commentInput${post.id }">
							<button class="commentBtn btn btn-primary text-white" data-post-id="${post.id }">게시</button>
						</div>
						
					</div>			
				</div>
			</c:forEach>
			
			<div id="content2"></div>
		</section>
		
	
			<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	
	<script>
		$(document).ready(function(){
			
			$("#imgBtn").on("click", function() {
				// fileInput 클릭 효과
				$("#fileInput").click();
				
			});
			
			$("#uploadBtn").on("click", function(){
				
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("게시글에 내용을 입력하세요.");
					return;
				}

				// 파일 유효성 검사
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
			
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
			
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data", 
					processData:false, 
					contentType:false, 
					success:function(data) {
						if(data.result == "success") {
							location.reload();
							$("postList").removeClass("d-none");
						}else {
							alert("글쓰기 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
					
				});
			});
			
			$(".commentBtn").on("click", function(){
				// postId, content 전달
				let postId = $(this).data("post-id");
				let content = $("#commentInput" + postId).val();
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":content},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else{
							alert("댓글 작성 실패");
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