<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>

		<header class="d-flex" id="logo">
			<div class="col-4 d-flex">
				<img width="50" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODExMjRfMjcx%2FMDAxNTQzMDU0NzM0MjAx.39pqg0lYdA8WKpPjZEDU49hMMj3y1eHlZhRcwREuHn4g.tX6jV1TwgQsPuVNDTZA9-UD54nrEV90J1Wr-Pl_21fAg.JPEG.appcomo%2Fse3_image_1804520136.jpg&type=sc960_832">
				<h3 class="mt-1 m-1">Instagram</h3>
			</div>
			<div class="col-6 text-end">		
				<i class="bi bi-plus-square mr-5 mt-2" style="font-size: 25px;"></i>
				<i class="bi bi-heart mr-5 mt-2" style="font-size: 25px;"></i>
				<i class="bi bi-search mr-5 mt-2" style="font-size: 25px;"></i>
			</div>
			
			<c:choose>
				<c:when test="${not empty userId }"> 
					<div class="mr-3 mt-3">${userLoginId }님 <a href="/user/sign_out">로그아웃</a></div>
				</c:when>
				<c:otherwise>
					<div class="mr-3 mt-3"><a href="/user/signin_view">로그인</a></div>
				</c:otherwise>
			</c:choose>
			
		</header>