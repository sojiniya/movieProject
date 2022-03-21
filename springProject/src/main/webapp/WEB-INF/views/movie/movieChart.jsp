<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="tit-moviechart">
<h1>무비차트</h1>
</div>
<div class="order-moviechart">
<select id="order_type" name="order-type">
<option title="현재 선택됨" selected value="1">예매율순</option>
                <option value="2">평점순</option>
                <option value="3">관람객순</option>
            </select>
            <button type="button" class="round gray"><span>GO</span></button>
</div>
<div class="list-moviechart">
<ol>
            
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.1</strong>	
                        <a href="/movies/detail-view/?midx=85673">
                            <span class="thumb-image">
                                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85673/85673_320.jpg" alt="뜨거운 피 포스터" onerror="errorImage(this)"/>
                                <span class="ico-grade grade-15">15세 이상</span>
                            </span>
                            
                        </a>
                        <span class="screentype">
                            
                        </span>
                    </div>
                    
                    <div class="box-contents">
                        <a href="/movies/detail-view/?midx=85673">
                            <strong class="title">뜨거운 피</strong>
                        </a>

                        <div class="score">
                            <strong class="percent">예매율<span>23.8%</span></strong>
                            <div class='egg-gage small'>
                                            <span class='sprite_preegg default'></span>
                                            <span class='percent'>99%</span>
                                        </div>
                        </div>

                        <span class="txt-info">
                            <strong>
                                2022.03.23 
                                <span>개봉</span>
                                <em class="dday">D-2</em>
                            </strong>
                        </span>
                        <span class="like"> 
                            <a class="link-reser" href="${pageContext.request.contextPath}/reserve/reserveStep1.do">예매</a>
                        </span>
                    </div>    
                </li>
            
      
</div>
