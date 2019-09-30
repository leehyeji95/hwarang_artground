<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../layout/left.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.div{
    padding: 0;
	margin: 0 auto;
    box-sizing: border-box;
}
form {
    margin-top: 0em;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<script type="text/javascript">
	$(function(){
		var id = '${param.id}';
		if(id.match(".*(naver).*")){
			$("input[name='member_id']").val("네이버 간편 로그인");
			$("input[name='snsId']").val(id);
		}else if(id.match(".*(kakao).*")){
			$("input[name='member_id']").val("카카오톡 간편 로그인");
			$("input[name='snsId']").val(id);
		}else{
			$("input[name='member_id']").val(id);
		}
		
		$("input[type='checkbox']").ionCheckRadio();
	});
	function doSubmit(frm){
		if($("textarea[name='content']").val() == ""){
			alert("탈퇴사유를 입력하세요.");
			$("textares[name='content']").focus();
			return;
		}
		if($("input[name='agree']:checked").val() != "Y"){
			alert("안내사항 동의를 체크해주세요.");
			return;
		}
		document.deleteForm.method = "post";
		document.deleteForm.action = "/member/delete";
		document.deleteForm.submit();
	}
</script>
</head>
<body>

		<div align="center">
			<h1>탈 퇴</h1>
		</div>
			<div class="div" id="containers" style="width: 720px; margin: 0 auto;" align="center">
				<form action="/member/delete" onsubmit="doSubmit(this);return false;">
					<input class="deleteForm" type="hidden" name="snsId" id="snsId">
					<table class="table"> 
						<tbody>
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" class="form-control" style="width: 40%;" readonly="readonly" name="member_id" id="member_id">
								</td>
							</tr>
							<tr>
								<th>탈퇴 사유</th>
								<td><textarea name="content" class="form-control" placeholder="탈퇴사유에 대해 적어주시기 바랍니다." style="width: 80%;" rows="5" cols="50"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="checkbox" name="agree" value="Y">
									탈퇴 시 아이디의 재사용 및 데이터 복구가 불가함에 동의합니다.
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<div>
									<input type="submit" value="회원탈퇴" class="form-control">
									<input type="button" onclick="history.back()" class="form-control" value="취소">
								</div>
								</td>
								
							</tr>
						</tbody>
					</table>
				</form>
				
			</div>
<%@ include file="../layout/bottom.jsp"%>
</body>
</html>