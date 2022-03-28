<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline{
	min-height:350px;
	overflow:auto;
}
table{
	width:100%;
	border:none;
	border-collapse:collapse;
}
table td, table th{
	border:none;
	padding:5px;
}

</style>
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<!-- 중앙 시작 -->
<!-- 3월 11일 31분 -->
<div class="adminBoardWrite-main">
	<h3>문의 및 건의</h3>
	<form:form modelAttribute="boardVO" action="userBoardWrite.do" 
	 class="adminWriteForm" method="post" enctype="multipart/form-data">
		<table style="width:100%; table-layout:fixed;" class="tbl_notice_list tbl_left">
			<colgroup>
				<col style="width:140px;">
			</colgroup>
			<tbody>
				<tr style="display: none;">
					<th scope="row">게시글 유형</th>
					<td>
						<ul>
							<li >
								<input type="radio" id="ask" name="board_auth" class="radio_b1" value="2" checked>건의 및 문의
							</li>
						</ul>
					</td>
				</tr>
				<tr class="radio_v1">
					<th scope="row">카테고리</th>
					<td>
						<ul class="type_list">
							<li>
								<label for="question">
								<input type="radio" id="question" name="cate_num" value="8" checked>문의
								</label>
							</li>
							<li>
								<label for="complain">
								<input type="radio" id="complain" name="cate_num" value="9">불만
								</label>
							</li>
							<li>
								<label for="compliment">
								<input type="radio" id="compliment" name="cate_num" value="10">칭찬
								</label>
							</li>
							<li>
								<label for="proposal">
								<input type="radio" id="proposal" name="cate_num" value="11">제안
								</label>
							</li>
						</ul>
					</td>
				</tr>
				<tr class="radio_v1">
					<th scope="row">영화관 선택</th>
					<td>
						
						<label for="sel_regioncode" class="hidden">지역 선택</label> 
						<select title="지역 선택" class="sel01" id="sel_regioncode" name="sel_regioncode" style="width: 114px; height: 30px;">
							<option value="0" selected>지역 선택</option>
							<option value="1">서울</option>
							<option value="2">경기</option>
							<option value="3">인천</option>
							<option value="4">강원</option>
							<option value="5">대구</option>
						</select> 
						<label for="sel_theatercode" class="hidden">영화관 선택</label> 
						<select title="영화관 선택" class="sel01" id="sel_theatercode" name="sel_theatercode" style="width: 114px; height: 30px;">
							<option value="0" selected>영화관 선택</option>
							<option value="1">cgv 강남</option>
							<option value="2">cgv 홍대</option>
							<option value="3">cgv 압구정</option>
							<option value="4">cgv 대학로</option>
							<option value="5">cgv 동대문</option>
							<option value="6">cgv 수원</option>
							<option value="7">cgv 강남</option>
						</select>
					</td>
				</tr>

				<tr>
					<th scope="row">제목</th>
					<td>
						<input name="board_title" style="width: 660px; height: 30px;" type="text" placeholder="제목을 입력하세요" />
					</td>
				</tr>
				<tr>
					<th scope="row"><b>내용</b></th>
					<td>
						<textarea name="board_content" class="ck" placeholder="내용을 입력하세요"></textarea>
						<script>
						 function MyCustomUploadAdapterPlugin(editor) {
					    	editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        	return new UploadAdapter(loader);
					    	}
						}
				 
				 	ClassicEditor
		            	.create( document.querySelector( '.ck' ),{
		            		extraPlugins: [MyCustomUploadAdapterPlugin]
		            	})
		            	.then( editor => {
							window.editor = editor;
						} )
		            	.catch( error => {
		                	console.error( error );
		           		} );
			    	</script>       
					</td>
				</tr>
				<tr style="display:none">
					<th>파일업로드</th>
					<td>
					<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="box-btn_adminSubmit">
			<input type="button" value="취소하기" class="round cancel" onclick="location.href='boardMain.do'">
			<form:button class="round submit">등록하기</form:button>
		</div>
	</form:form>
</div>
<!-- 중앙 끝-->