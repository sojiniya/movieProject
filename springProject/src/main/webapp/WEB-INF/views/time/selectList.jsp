<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- �߾� ������ ���� -->
<div class="page-main">
	<h2>��������������� ����Ʈ��ȸ</h2>
	<form action="list.do" method="get">
		<ul>
			<li class="on"><a href="#">����</a></li>
			<li class="on"><a href="#">���</a></li>
			<li class="on"><a href="#">��õ</a></li>
			<li class="on"><a href="#">����</a></li>
			<li class="on"><a href="#">�뱸</a></li>
		</ul>
		<c:if test="${count > 0}">
		<div class="area">
			<ul>
				<li class="on"><a title="CGV����" href="#">CGV����</a></li>
				<li class="on"><a title="CGV����" href="#">CGV����</a></li>
				<li class="on"><a title="CGV�Ǵ��Ա�" href="#">CGV�Ǵ��Ա�</a></li>
				<li class="on"><a title="CGV����" href="#">CGV����</a></li>
			</ul>
		</div>
		</c:if>
	</form>
</div>
<!-- �߾� ������ �� -->