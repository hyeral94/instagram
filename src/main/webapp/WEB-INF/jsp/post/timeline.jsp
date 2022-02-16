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
	<div id="wrap" >
		<c:import url ="/WEB-INF/jsp/include/logo.jsp" />
		<section class="d-flex justify-content-center">
			<div class="col-6">
				
				<!--  입력 상자  -->
				<div class="border rounded mt-3  bg-white">
					<div>
						<textarea class="form-control w-100 border-0 non-resize" style="border: none" rows="4" cols="3" placeholder="내용을 입력하세요." id="contentInput"></textarea>
					</div>
										
					<div class="d-flex justify-content-between">
						<span class="img-icon"> <i class="bi bi-image" id="imgBtn"></i></span>
						<input type="file" id="fileInput" class="d-none">
						
						<button type="button" class="btn btn-small btn-primary" id="uploadBtn">업로드</button>					
					</div>
				</div>
				
				<c:forEach var="postDetail" items="${postList }" >
				<!--  피드  -->
				<div class="card border rounded mt-3">
					<!-- 타이틀 -->
					<div class="d-flex justify-content-between p-2 border-bottom">
					
						<div class="d-flex">
							<i class="bi bi-person-circle" style="font-size:30px;"></i>
							<div class="m-2 mt-3">${postDetail.post.userName }</div>
						</div>
						
						<div>	
							<a class="text-dark moreBtn mt-5" href="#" data-toggle="modal" data-target="#exampleModalCenter">
								<div class="mt-3"><i class="bi bi-three-dots"></i></div>
							</a>
						</div>	
					</div>
					<!--이미지 -->
					<div>
						<img src="${postDetail.post.imagePath }" class="imageClick w-100">
					</div>
					
					<!-- 좋아요 -->
					<div>
						<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }">
							<c:choose>
								<c:when test="${postDetail.like }">
								
									<i class="bi bi-heart-fill btn text-danger" style="font-size: 20px;"></i>
									
								</c:when>
								
								<c:otherwise>
									
									<i class="bi bi-heart btn text-dark" style="font-size: 20px;"></i>
									
								</c:otherwise>
							</c:choose>
						</a>
		
						<span class="middle-size ml-1"> 좋아요 ${postDetail.likeCount }개 </span>
					</div>	
					
					<!--  content -->
					<div class="middle-size m-2">
							<b>${postDetail.post.userName }</b> ${postDetail.post.content }
					</div>			
	
					
					<!--  댓글 -->
					
					<div class="mt-2">
						<div class="border-bottom m-2">
							<!-- 댓글 타이틀 -->
							<div>댓글</div>
						</div>
						
						<!--  댓글 -->
						<div class="middle-size m-2">
							<c:forEach var="comment" items="${postDetail.commentList }">
							<div class="mt-1">
								<b>${comment.userName }</b> ${comment.content }
							</div>
							</c:forEach>
							
						</div>
						<!--  댓글 -->
						
						<!-- 댓글 입력 -->
						<div class="d-flex mt-2 border-top">
							<input type="text" class="form-control border-0" id="commentInput${postDetail.post.id }">
							<button class="btn btn-primary commentBtn" data-post-id="${postDetail.post.id }">게시</button>
						</div>
						<!-- 댓글 입력 -->
						
					</div>
					<!--  댓글 -->
					
				</div>
				</c:forEach>
						
			</div>	
		</section>
		<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      <div class="modal-body text-center">
	        삭제하기
	      </div>
	      
	    </div>
	  </div>
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
						alert("댓글 작성 에러 발생");
					}
				});
			});	
				
				$(".likeBtn").on("click", function(e) {

					e.preventDefault(); //고유의 기능을 없앰.
					
					let postId = $(this).data("post-id");
					
					$.ajax({
						type:"get",
						url:"/post/like",
						data:{"postId":postId},
						success:function(data) {
							
							location.reload();
							
							
						}, 
						error:function() {
							
							alert("좋아요 에러");
						}
						
					});
					
				});
					
				$(".unlikeBtn").on("click", function(e) {
					
					e.preventDefault();
					
					let postId = $(this).data("post-id");
					
					$.ajax({
						type:"get",
						url:"/post/unlike",
						data:{"postId":postId},
						success:function(data) {
							
							if(data.result == "success") {
								
								location.reload();
								
							} else {
								alert("좋아요 취소 실패");
							}
							
						}, 
						error:function() {
							alert("좋아요 취소 에러");
						}
						
					});
				});
			});
	
	</script>
</body>
</html>