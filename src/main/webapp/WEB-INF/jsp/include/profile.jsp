<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>          
<!DOCTYPE html>
				<div class="mt-3">
					<div id="profile" class="d-flex ml-3">
						<i class="bi bi-person-circle" style="font-size:30px;"></i>
						<c:choose>
						<c:when test="${not empty userId }"> 
							<div class="mr-3 mt-4"><strong>${userLoginId }</strong></div>
						</c:when>
					</c:choose>
					</div>
					
					<div id="content-border" class="mt-3"></div>
					<div></div>
				</div>