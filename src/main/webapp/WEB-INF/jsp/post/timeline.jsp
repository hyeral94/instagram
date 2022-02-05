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
		<header class="d-flex">
			<div id="logo" class="col-4 d-flex">
				<img width="50" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODExMjRfMjcx%2FMDAxNTQzMDU0NzM0MjAx.39pqg0lYdA8WKpPjZEDU49hMMj3y1eHlZhRcwREuHn4g.tX6jV1TwgQsPuVNDTZA9-UD54nrEV90J1Wr-Pl_21fAg.JPEG.appcomo%2Fse3_image_1804520136.jpg&type=sc960_832">
				<h3 class="mt-1">Instagram</h3>
			</div>
			<div class="col-7"></div>
			<div class="col-2">
				<button type="button" class="btn btn-samll text-white mt-1" id="logout-btn">로그아웃</button>
			</div>
		</header>
		
		<section class="d-flex">
			<div class="col-2"></div>
			<div class="col-8">
				<textarea class="form-control mt-2" rows="5" cols="3"></textarea>
				<button type="button" class="btn btn-small btn-primary justify-content-end">업로드</button>
			</div>
			<div>
				<div id="profill"></div>

				<div></div>
				<div></div>
			</div>
			<div class="col-2"></div>
		</section>
		
		<footer>
			<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>