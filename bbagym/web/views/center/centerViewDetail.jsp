<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.CenterDetail, com.bbagym.model.vo.CenterPrograms" %>

<%
	CenterDetail cd = (CenterDetail)request.getAttribute("cd");
%>
	

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/centerViewDetail.css">

<body data-spy="scroll" data-target=".navbar" data-offset="100"> <!--시설 이용후기등 메뉴바 클릭시 이동과 관련-->
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<!-- section -->
    <div id="container">
        <div id="header-info">
            <div id="detail-header">
                <div id="all-info">
                    <div class="img-info">
                        <img src="<%=request.getContextPath()%>/resources/img/Gym-1.jpg" width="450" height="450">
                    </div>
                    <div class="text-info">
                        <div id="title"><h2><%=cd.getCenterName() %></h2>
                            <div class="heart"><!--찜 좋아요-->
                                <i onclick="myFunction(this)" class="fa fa-thumbs-up"></i>
                            </div>
                            <script> function myFunction(){ alert('찜 성공'); } </script>
                        </div>
                        <div id="star-point">★ ★ ★ ★ ★</div><!--평점 어찌넣지?-->
                        <div id="address-phone"><h7><%=cd.getCenterAddr() %><br><%=cd.getCenterPhone() %></h7></div>
                        <div id="choice">옵션 선택
                            <select name="choice" aria-placeholder="옵션선택" style="width: 100%; height: 40px;" >
                                <% String preName=(cd.getCenterPrograms().get(0)).getpName(); 
                                for(int i=0; i<cd.getCenterPrograms().size(); i++){ 
                                	CenterPrograms cp = cd.getCenterPrograms().get(i);
                               		if(i==0||!preName.equals(cp.getpName())) {
                               			preName=cp.getpName();%>
                                	<option value="<%=cp.getpName()%>"><%=cp.getpName()%></option>
                                <%}
                                }%>
<!--                                 <option value="two">요가</option>
                                <option value="three">필라테스</option>
                                <option value="four">클라이밍</option> -->
                            </select>
                        </div>
                        <div id="basket-button"><!--담기-->
                            <button onclick="javascript:btn()" type="button" class="btn btn-primary" style="width: 100%; height: 100%;" >회원권 담기</button>
                        </div>
                        <script> function btn(){ alert('담기 성공'); } </script>
                    </div>
                </div>    
            </div><!--detail-header-->
            
            <div id="detail-window">
                <div id="window-menu">
                    <ul class="nav nav-tabs nav-justified"><!--클릭시 메뉴바 태그 연결-->
                        <li class="nav-item">
                            <a class="nav-link" href="#section1"><h5>시설정보</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section2"><h5>사진</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section3"><h5>이용후기</h5></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section4"><h5>위치</h5></a>
                        </li>
                    </ul>
                </div>
                <div id="menu-sebu">
                    <div class="bord-section">
                        <div id="section1" class="container-fluid">
	                    	<div id="notice-zone">
	                            <div id="notice">
	                                <p><%=cd.getCenterIntro() %></p>
	                            </div>
	                        </div> 
                            <div id="price-zone">    
                                <div id="price">
                                    <div class="price-title"><h5>가격정보</h5></div>
                                    <div id="price-buga">
										<%String preName1=(cd.getCenterPrograms().get(0)).getpName(); 
                                    	for(int i=0; i<cd.getCenterPrograms().size(); i++) {
                                    		CenterPrograms cp = cd.getCenterPrograms().get(i);
                                    		if(i==0||!preName1.equals(cp.getpName())) {
                                    			preName1=cp.getpName();%>

										<div class="buga-title"><h6><%=cp.getpName() %></h6></div>
                                        	<div class="row">
                                        		<div class="col-md-6 ml-auto mr-auto text-center">

                                        				<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
                                        					if(preName1.equals(cp2.getpName())) {%>
                                        				   <table >
                                        				   		<tr>
                                        				   			<td></td>
                                        				   		</tr>
                                        				   </table>
                                        				   
                                        				   <%=cp2.getMonth() %>개월 <br>
                                        				   <%=cp2.getPrice() %>원
                                        				<%} 
                                        				}%>                                       			

                                        		</div>
                                        	</div>
                                        <%} 
                                        }%>
                                        <!-- <div id="contentt">
                                            1개월 3개월 6개월 12개월
                                        </div>
                                        <div class="buga-title"><h6>요가</h6></div>
                                        <div id="contentt">
                                            1개월 3개월 6개월 12개월
                                        </div>
                                        <div class="buga-title"><h6>필라테스</h6></div>
                                        <div id="contentt">
                                            1개월 3개월 6개월 12개월
                                        </div> -->
                                        
                                    </div>    
                                </div>
                            </div>
                            <!-- <div id="notice2-zone">
                                <div id="notice2">
                                    <div id="notice2-title"><h5>공지사항</h5></div>
                                    <div id="notice2-con">
                                    ※ONLY 다짐에서만 가능한 VIP휘트니스 선착순 우주 최저가 혜택
                                    -12개월권을 6개월 가격으로! 선착순 5명 (조기소진시 정상가전환)
                                    </div>
                                </div>
                            </div> -->
                            <div id="time-zone">
                                <div id="time">
                                    <div id="time-play"><h5>운영시간</h5></div>
                                    <div id="time-con">
                                        <%=cd.getCenterOpenHours() %><br>
                                        [휴관일] <%=cd.getCenterHolidays() %>
                                    </div>
                                </div>
                            </div>
                            <div id="program-zone">
                                <div id="program">
                                    <div class="program-title"><h5>시설</h5></div>
                                    <div class="program-sebu">
                                        <small>
                                        	<%for(int i=0; i<cd.getCenterFacilityNames().size(); i++){ %>
                                        		<%=cd.getCenterFacilityNames().get(i) %>&nbsp;&nbsp;
                                        	<%} %>
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--이미지구역-->
                        <div id="section2" class="container-fluid">
                            <div id="image-zone">
                                <div id="image-title"><h5>사진</h5></div>
                                <div id="image-sebu">    
                                    <div class="img">
                                        <div class="col-md-12 ml-auto mr-auto text-center">
                                        <%for(int i=0; i<cd.getCenterImgs().size();i++) { %>
                                            <a href="img/light01_s.jpg"><img src="img/light01.jpg" alt="이미지"></a>
							            <%} %>    
                                        </div>    
                                    </div>
                                </div>
                                <div class="button">펼쳐보기</div>    
                            </div>
                        </div>
                    
                        <div id="section3" class="container-fluid">
                            <div id="review-zone">
                                <div class="title-button">
                                    <div id="review-title"><h5>이용후기</h5></div>
                                    <div id="review-button">
                                        <button onclick="inputData();">후기 쓰기</button>
                                    </div>  
                                </div>    
                                <div id="review-content">
                                    <input type="text" id="content" placeholder="아직 작성된 후기가 없어요. 첫번째 후기를 남겨주세요." >
                                </div>
                                <script>
                                    function inputData(){
                                        var text=document.getElementById("content").value;
                                        document.getElementById("review-content").innerText+=text;
                                        alert(text);
                                    }
                                </script>
                            </div>
                        </div>

                        <div id="section4" class="container-fluid">
                            <div id="map-title"><h5>위치</h5></div>
                            <div id="map-api">지도api</div>
                        </div>

                    </div><!--bord-section-->
                    <div class="aside">
                        <div id="choice-bar">옵션 선택
                            <select name="choice" aria-placeholder="옵션선택" style="width: 100%; height: 40px;" >
                                <% String preName2=(cd.getCenterPrograms().get(0)).getpName(); 
                                for(int i=0; i<cd.getCenterPrograms().size(); i++){ 
                                	CenterPrograms cp = cd.getCenterPrograms().get(i);
                               		if(i==0||!preName2.equals(cp.getpName())) {
                               			preName2=cp.getpName();%>
                                	<option value="<%=cp.getpName()%>"><%=cp.getpName()%></option>
                                <%}
                                }%>
                                <!-- <option value="one">헬스</option>
                                <option value="two">요가</option>
                                <option value="three">필라테스</option>
                                <option value="four">클라이밍</option> -->
                            </select>
                        </div>
                        <div id="basket-button2">
                            <button onclick="javascript:btn()" type="button" class="btn btn-primary" style="width: 100%; height: 100%;" >회원권 담기</button>
                        </div>
                        <script> function btn(){ alert('담기 성공'); } </script>
                    </div>    
                </div>
            </div><!--detail-window-->
        </div>
    </div>
    <!-- sectio끝 -->





<%@ include file="/views/common/footer.jsp"%>