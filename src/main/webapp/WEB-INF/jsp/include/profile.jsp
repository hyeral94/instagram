<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>          
<!DOCTYPE html>
				<div class="mt-3">
					<div id="profile" class="d-flex ml-3">
					<img width="50" class="mt-2" src="https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg">
					<c:choose>
					<c:when test="${not empty userId }"> 
						<div class="mr-3 mt-3"><h4>${userLoginId }</h4></div>
					</c:when>
					</c:choose>
					</div>
					
					<div id="content-border" class="mt-3"></div>
					<div></div>
				</div>