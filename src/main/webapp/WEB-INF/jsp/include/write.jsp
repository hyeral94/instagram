<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>

				<textarea class="form-control mt-2" rows="5" cols="3" placeholder="내용을 입력하세요." id="contentInput"></textarea>
				
				<div class="d-flex justify-content-between">
					<input type="file" class="mt-3" id="fileInput">
					<button type="button" class="btn btn-small btn-primary mt-3" id="saveBtn">업로드</button>
				</div>