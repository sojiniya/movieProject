<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />    
<!DOCTYPE html>
  <div class="sect-wishlist-lst">
		        <ul id="wishlist_container">
		             <c:forEach var="watchedMovie" items="${list}">
		                    <li>
		                        <div class="box-image">
		                            <a href="/movies/detail-view/?midx=85673">
		                                <span class="thumb-image"> 
				                            <img alt="${watchedMovie.movie_name}" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85673/85673_185.jpg" onerror="errorImage(this)"/>
                                            
		                                </span>
		                            </a>
		                        </div>
		                        <div class="box-contents">
		                            <a href="/movies/detail-view/?midx=85673">
		                                <strong class="title">${watchedMovie.movie_name}</strong>
		                            </a>
		                            <span class="like"> 
                                        <a class="link-reservation" href="/ticket/?MOVIE_CD=20028988&MOVIE_CD_GROUP=20028988">예매</a>
                                        

		                            </span>
		                        </div>
		                        <button type="button" class="btn-del" value="85673"><img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del02.png" alt="${watchedMovie.movie_name}삭제" /></button>
		                    </li>
		               </c:forEach>
		        </ul>
		    </div>
