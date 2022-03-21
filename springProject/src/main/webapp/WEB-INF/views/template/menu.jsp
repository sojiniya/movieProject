<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 상단 메뉴 시작 -->
<ul>
	<li><a href="/">영화</a></li>
	<li><a href="/">극장</a></li>
	<li><a href="/">예매</a></li>
	<li>스토어</li>
	<li>이벤트</li>
	<li>혜택</li>
	<c:if test="${!empty user_num && user_auth == 3}">
	<li><a href="${pageContext.request.contextPath}/member/admin_list.do">회원관리</a></li>	
	</c:if>
</ul>
        <div class="search_box">
          <input type="text" maxlength="225" placeholder="스텔라" onfocus="this.placeholder=''" onblur="this.placeholder='스텔라'" id="keyword" />
          <img src="${pageContext.request.contextPath}/resources/images/search.png">
        </div>
<!-- 상단 메뉴 끝 -->