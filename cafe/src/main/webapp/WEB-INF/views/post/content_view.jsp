<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		var formObj = $("form[name='readForm']");
		
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "modify_view");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 삭제
		$(".delete_btn").on("click", function(){
			var deleteYN = confirm("삭제하시겠습니까?");
			
			if(deleteYN == true){
				formObj.attr("action", "delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
			
		});
		
		// 목록
		$(".list_btn").on("click", function(){
			location.href = "list?page=${scri.page}"
				+"&perPageNum=${scri.perPageNum}"
				+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
	});
</script>
<body>
	<div>
		<button class="list_btn">목록</button>
	</div>
	<div>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="post_no" name="post_no" value="${content_view.post_no}" />
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		</form>
		<table>
			<tr>
				<td>작성자</td>
				<td>${content_view.post_writer }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${content_view.post_title }</td>
				<td>조회수</td>
				<td>${content_view.post_hit }</td>
				<td><button type="button" onclick="">신고</button></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><fmt:formatDate value="${content_view.post_regdate }" pattern="yyyy.MM.dd"/></td>
				<td>수정일</td>
				<td><fmt:formatDate value="${content_view.post_moddate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${content_view.post_content }</td>
			</tr>
			<tr>
				<td>좋아요</td>
				<td>${content_view.post_like }</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${content_view.file_name ne null}">
						<a href="download_file?post_no=${content_view.post_no}&file_name=${content_view.file_name}">${content_view.file_name }</a>
						${content_view.file_name }
						(${content_view.file_size }KB)
					</c:if>
				</td>
			</tr>
			<c:if test="${not empty mem_id && mem_id eq content_view.post_writer}">
				<tr>
					<td colspan="2">
						<button type="submit" class="update_btn">수정</button>
						<button type="submit" class="delete_btn">삭제</button>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>