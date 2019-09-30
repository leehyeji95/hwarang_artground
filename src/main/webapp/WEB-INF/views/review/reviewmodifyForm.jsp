<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ include file="../layout/left.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewmodifyForm</title>
<script type="text/javascript">

</script>
<script type="text/javascript">
$(function(){
	$("a[name='fileDeleteBtn']").on("click", function() {
		$(this).parent().remove();
		var d = $(this).data("uuid");
		$.ajax({
			url: "fileDelete",
			data: {"uuid" : d},
			type: "post",
			dataType: "json",
			success: function(result){
				if(result){
					alert("file ajax() 삭제 성공");
				}else{
					alert("file ajax() 삭제 실패");
				}
			},
			error: function(){
				alert("file ajax() 삭제 오류");
			}
		});
	});
});
</script>
</head>
<body>

	<div align="center">
			<h1>관람 후기</h1>
	</div>
	<div>
		<form action="modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${review.review_num}">
			<table class="table">
				<tr>
					<th>Program name</th>
					<td>
						${review.review_exh_name}
					</td>
				</tr>
				<tr>
					<th>Title</th>
					<td>
						<input type="text" name="title" value="${review.review_title}">
					</td>
				</tr>
				<tr>
					<th>Write</th>
					<td>
						${review.member_id}
					</td>
				</tr>
				<tr>
					<th>img Upload</th>
					<td>
						<c:choose>
							<c:when test="${empty imgs }">
								<p><input type="file" name="file" accept=".jpg, .jpeg, .png" multiple="multiple"></p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${imgs }" var="img">
								<div>
									${img.review_filename }
									<a href="#this" name="fileDeleteBtn" class="btn" data-uuid="${img.review_uuid }">삭제</a>
								</div>
								</c:forEach>
								<!-- 파일 추가하기 -->
								<div>
								파일 추가<input type="file" name="file" multiple="multiple">
								</div>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="50" name="content">${review.review_content}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Ok">
					</td>
				</tr>			
			</table>
		</form>
	</div>
<%@ include file="../layout/bottom.jsp"%>
</body>
</html>