<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>1:1 질문</title>
<%@ include file="../../layout/left.jsp" %>
<script type="text/javascript" src="/resources/js/manager/validationCheck.js"></script>
<script>
$(function(){
	$("#qnaForm").on("submit", function(){
		var validation = valCheck("qnaForm");
		if(!validation){
			return false;
		}
	});
});

//카테고리 선택
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    if(val == 'info') {
		var opt1 = new Option('정보수정', 'modiInfo', true, true);
		var opt2 = new Option('회원탈퇴', 'delInfo');
		var opt3 = new Option('포인트', 'point');
		//option 추가
		$("#subCategory").append(opt1);
		$("#subCategory").append(opt2);
		$("#subCategory").append(opt3);
    }else if(val == 'order'){
    	var opt1 = new Option('결제', 'pay', true, true);
		var opt2 = new Option('취소', 'cancel');
		var opt3 = new Option('변경', 'change');
		var opt4 = new Option('환불', 'refund');
		//option 추가
		$("#subCategory").append(opt1);
		$("#subCategory").append(opt2);
		$("#subCategory").append(opt3);
		$("#subCategory").append(opt4);
    }else if(val == 'Board'){
    	var opt1 = new Option('전시', 'Exhibit', true, true);
    	var opt2 = new Option('공지게시판', 'Notice');
		var opt3 = new Option('신고게시판', 'Report');
		var opt4 = new Option('자유게시판', 'Free');
		var opt5 = new Option('추천게시판', 'Recommend');
		var opt6 = new Option('펀딩게시판', 'Funding');
		var opt7 = new Option('후기게시판', 'Review');
		var opt8 = new Option('티켓나눔게시판', 'Ticket');
		//option 추가
		$("#subCategory").append(opt1);
		$("#subCategory").append(opt2);
		$("#subCategory").append(opt3);
		$("#subCategory").append(opt4);
		$("#subCategory").append(opt5);
		$("#subCategory").append(opt6);
		$("#subCategory").append(opt7);
		$("#subCategory").append(opt8);
    }
    else {
    	var opt = new Option('기타 서비스', 'service', true, true);
		$("#subCategory").append(opt);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}
</script>
<!-- 사용자에게 보여질 1:1 질문 작성 Form -->
	<div class="container">
		<h3>화랑에 문의하기</h3>
		<div class="form-group">
		<form id="qnaForm" action="qnaWrite" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" name="memId" value="olaf">
			<div class="table-responsive">
			<table class="table">
				<tr>
					<th>문의분류</th>
					<td>
						<select id="category" name="category" class="form-control col-md-3" onchange="doChange(this, 'subCategory')" style="display: inline-block;">
							<option value="default">==문의종류 1차선택==</option>
							<option value="info">고객정보</option>
							<option value="order">주문</option>
							<option value="Board">게시판</option>
							<option value="other">기타</option>
						</select>
						<select id="subCategory" name="subCategory" class="form-control col-md-3" style="display: inline-block;">
							<option value="default">==문의종류 2차선택==</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" class="form-control col-md-6"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control" rows="10" name="content" style="resize: none;" placeholder="*문의 내용은 2000자까지 가능합니다. "></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="file" multiple="multiple" class="form-control">
					</td>
				</tr>
			</table>
			</div>
			<div>
				<input type="submit" value="문의 등록" class="btn btn-outline-success">
				<input type="reset" value="초기화" class="btn btn-outline-danger">
				<input type="button" value="목록보기" onclick="location.href='qnaListForUser?memId=haddie" class="btn btn-outline-dark">
			</div>
		</form>
		</div>
	</div>
<%@ include file="../../layout/bottom.jsp"%>