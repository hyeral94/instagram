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

</head>
<body>

	<div id="wrap">
	
		<c:import url ="/WEB-INF/jsp/include/logo.jsp" />
		
		<section>
			<div id="content2"></div>
			<div id="content1">
				
				<textarea class="form-control mt-2" rows="5" cols="3" placeholder="내용을 입력하세요." id="contentInput"></textarea>
				
				<div class="d-flex justify-content-between">
					<input type="file" class="mt-3" id="fileInput">
					<button type="button" class="btn btn-small btn-primary mt-3" id="saveBtn">업로드</button>
				</div>

			
			</div>
			<div id="content2"></div>
		</section>
		
		<footer>
			<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
	
	<script>
		$(document).ready(function(){

			$("#saveBtn").on("click", function(){
				
				var content = $("#contentInput").val();
				
				if(content == null || content == "") {
					alert("게시글에 내용을 입력하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
			
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data", // 파일 업로드 필수
					processData:false, // 파일 업로드 필수
					contentType:false, // 파일 업로드 필수
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline_view";
						}else {
							alert("글쓰기 실패");
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