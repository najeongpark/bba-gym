<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbagym.model.vo.*, java.util.List" %>

<%
	CenterDetail cd = (CenterDetail)request.getAttribute("cd");
	List<Comment> comments = (List)request.getAttribute("comments");
	int cCode = (int)request.getAttribute("cCode");
	int mCode = (int)request.getAttribute("mCode");
	int score=1;
	int count=0;
%>
	

<%@ include file="/views/common/header.jsp"%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/centerViewDetail.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<body data-spy="scroll" data-target=".navbar" data-offset="100"> <!--시설 이용후기등 메뉴바 클릭시 이동과 관련-->
<div class="page-header page-header-xs" data-parallax="true" style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<!-- section -->
    <div id="container">
        <div id="header-info">
            <div id="detail-header">
                <div id="all-info">
                    <div class="img-info">
                        <img src="<%=request.getContextPath()%>/upload/center/<%=cd.getCenterMainImg() %>" width="450" height="450">
                    </div>
                    <div class="text-info">
                        <div id="title"><h2 style="margin-right: auto;"><%=cd.getCenterName() %></h2>
                            <div class="jjim"><!--찜 좋아요-->
                            	<input type="hidden" value="<%=cCode %>">
								<h2 style="cursor: pointer;">
		                            <%if(cd.isJjim()==false){ %>
		                            <i class="far fa-heart" style='color:red'>
		                            <%}else{ %>
		                            <i class='fas fa-heart'  style='color:red'></i>
		                            <%} %>
		                            </i>
	                            </h2>
                            </div>
                        </div>
                        <div id="star-point" style="color: black;">
                        	<%for(;score<=cd.getCenterScore();score++){ %>
                            		<i class="fa fa-star"></i>&nbsp;&nbsp;
                            	<%} 
                            	if(score-cd.getCenterScore()<0.5){%>
                            		<i class="fa fa-star-half"></i>
                            	<%} score=1;%>
                            	<%=cd.getCenterScore()==0 ?  "0" : cd.getCenterScore() %>
                        </div>
                        <div id="address-phone"><h7><%=cd.getCenterAddr() %><br><%=cd.getCenterPhone() %></h7></div>
                        <div id="choice">옵션 선택
                            <select id="pChoice" name="pchoice" aria-placeholder="옵션선택" style="width: 100%; height: 40px;" >
                                
                                <%for(CenterPrograms cp : cd.getCenterPrograms()) {%> 
                                	<option value="<%=cp.getpCode() %>">프로그램명 : <%=cp.getpName() %> 가격: <%=cp.getPrice() %>원 개월 수 : <%=cp.getMonth() %>개월</option>
                                <%} %>
                            </select>
                        </div>
                        <div id="basket-button"><!--담기-->
                            <button type="button" class="btn btn-primary btn-baguni" style="width: 100%; height: 100%;" >회원권 담기</button>
                        </div>
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
                            <a class="nav-link" href="#section2"><h5>사진<	/h5></a>
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
														<div style="width: 730px;">
														<table id="price_table">
															<tr>
																<th></th>
	                                        				<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<th><%=cp2.getMonth() %>개월</th>						
                                                				<%} 
                                        						}%>    
                                        				   	</tr>
                                        				   	<tr style="color: lightgray;">
                                        				   		<td>정상가</td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><%=(int)(cp2.getPrice()+(cp2.getPrice()*0.1)) %>원</td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				   	<tr>
                                        				   		<td>BBAGYM 회원가</td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><%=cp2.getPrice() %>원</td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				   	<tr style="font-size: 18px; font-weight: bolder;">
                                        				   		<td></td>
                                        				   	<%for(int j=0; j<cd.getCenterPrograms().size(); j++) { 
	                                        					CenterPrograms cp2 = cd.getCenterPrograms().get(j);
	                                        					if(preName1.equals(cp2.getpName())) {%>
																	<td><span>월 <%=(int)(cp2.getPrice()/cp2.getMonth()) %>원</span></td>						
                                                				<%} 
                                        						}%>
                                        				   	</tr>
                                        				</table>                                   			

		                                        <%} 
		                                        }%>
                                        	</div>  
                                </div>
                            </div>
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

                                        	<%for(int i=0; i<cd.getCenterFacilityNames().size(); i++){ %>
                                        		<%=cd.getCenterFacilityNames().get(i) %>&nbsp;&nbsp;
                                        	<%} %>

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
                                        <div class="col-md-12 ml-auto mr-auto">
                                        <%if(cd.getCenterImgs()!=null && cd.getCenterImgs().isEmpty()) {
                                        	for(int i=0; i<cd.getCenterImgs().size();i++) { %>
                                            <a href="img/light01_s.jpg"><img src="img/light01.jpg" alt="이미지"></a>
                                            <%if(i%4==0&&i!=0){ %>
                                            	<br>
                                            <%} %>
							            <%}
                                        }else {%>
                                        	<input type="text" id="content" placeholder="등록된 사진이 없습니다." >
                                        <% }%>    
                                        </div>    
                                    </div>
                                </div>
                                <!-- <div class="button">펼쳐보기</div>     -->
                            </div>
                        </div>
                        <div id="section4" class="container-fluid">
                            <div id="map-title"><h5>위치</h5></div>
                            <div id="map-api">지도api</div>
                        </div>
                    
                        <div id="section3" class="container-fluid" style="height:auto;">
                            <div id="review-zone">
                                <div class="title-button">
                                    <div id="review-title"><h5>이용후기</h5></div>
                            <%if(logginMember!=null&&cd.isBuy()==true) {%>
								<div id="review-button">
                                        <button class="btn btn-primary enterComment" style="width:100px">후기 쓰기</button>
                                    </div>  
							<%}%>
                                </div>    
                                <div id="review-content">
                                	<div id="comment-container">
                                		<div class="comment-editor hidden">
	                                		 <%if(logginMember!=null&&cd.isBuy()==true) {%>
												<form action="<%=request.getContextPath()%>/center/commentInsert.do" method="post" id="comment-form">
													    <div>
													    	<label style="margin:0px">평점</label><br>
        													<input type="number" name="orderScore" id="orderScore" min="1" max="5" required>/5점
    													</div>
													<button type="submit" id="btn-insert" class="btn btn-primary">등록</button>
													<textarea name="commentContent" cols="88" rows="3"></textarea>
														<div id="choice1">
															<select id="orderChoice" name="orderChoice" aria-placeholder="결제내역 선택" required>
																<option value="">결제내역 선택</option>
																<%boolean flag= false;
																for(int i=0; i<cd.getBuyInfo().size(); i++) {
																	BuyInfo bi = cd.getBuyInfo().get(i);{
																	if(bi.getScore()==0) {
																	flag = true;%>
																	<option name="orderCode" value="<%=bi.getOrderCode()%>" data-meta="<%=bi.getpCode()%>" data-meta2="<%=bi.getMonth()%>"><%=bi.getpName()%>/<%=bi.getMonth() %>개월</option>

																<%}else {%>
																	
																<%}
																	} 
																} 
																if(flag=false){%>
																	<option value="" disabled>선택 항목 없음</option>
																<%} %>
																
															</select>
														</div>
													<input type="hidden" name="commentWriter" value="<%=logginMember.getM_CODE()%>">
													<input type="hidden" name="centerCode" value="<%=cCode%>">
													<input type="hidden" name="memberName" value="<%=logginMember.getM_NAME()%>">
													<input type="hidden" name="level" value="1">
													<input type="hidden" name="commentRef" value="0">
												</form>
											<%}%>
										</div>
									<%if(comments!=null && !comments.isEmpty()) { %>
										<table id="tbl-comment">
											<!-- 뎃글 출력하기 -->
												<%for(Comment c : comments) {
												if(c.getCommentLevel()==1) {%>
												<tr class="level1">
													<td>
													<div id="star-point1" style="color: black;">
														<%for(int i=1;i<=c.getOrderScore();i++){%>
						                            		<i class="fa fa-star"></i>&nbsp;&nbsp;
						                            	<%}%>
						                             	 <%-- if(score-c.getOrderScore()<0.5){%>
						                            		<i class="fa fa-star-half"></i>
						                            	<%} score=1;%> --%>
						                            	<%=c.getOrderScore()==0 ?  "0" : c.getOrderScore() %>
						                        </div>
														<sub class="comment-writer"><%=c.getmId() %></sub>
														<input type="hidden" name="mCode" value="<%=c.getmCode()%>">
														<sub class="comment-date"><%=c.getCommentDate() %></sub>
														<sub class="program">구매 상품 : <%=c.getpName() %>/<%=c.getMonth() %>개월</sub>
														<input type="hidden" name="orderCode" value="<%=c.getOrderCode()%>">
														<br>
														<%=c.getCommentContent() %>
													</td>
													<td>
														<button class="btn-reply btn btn-primary" value="<%=c.getCommentCode()%>">등록</button>
													</td>
												</tr>
												<%} else {%>
												<tr class="level2">
													<td>
														<sub><%=c.getmId() %></sub>
														<sub><%=c.getCommentDate() %></sub>
														<br>
														<%=c.getCommentContent() %>
													</td>
													<td>
														
													</td>
												</tr>
												<%}
												}%>
										</table>
											<%} else {%>
	                                    <input type="text" id="content" placeholder="아직 작성된 후기가 없어요. 첫번째 후기를 남겨주세요." >
	                                    	<%} %>
									</div>
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


                    </div><!--bord-section-->
                    </div>    
                </div>
            </div><!--detail-window-->
        </div>
    </div>
    <!-- sectio끝 -->

	<script>
	
	$(function(){
		$(".btn-baguni").click(function(){
			location.href="<%=request.getContextPath()%>/baguni/baguniView.do?pCode=$('#pChoice option:selected').val()";
		})
	});
	
	
			<%if(logginMember!=null){%>
			$(".fa-heart").parent().on("click",function(){
				var code = {ccode:$(this).parents(".jjim").find("input[type=hidden]").val()};
				var i= $(this).find("i");
				 $.ajax({
					url : "<%=request.getContextPath() %>/center/centerPrefer.do",
					data : code,
					type : "post",
					success : function(data){
						if(data=="true"){
							i.removeClass('far');
							i.addClass('fas');
						}else{
							i.removeClass('fas');
							i.addClass('far');
						}
					}
				}) 
			});
			<%} else{ %>
				$(".fa-heart").parent().on("click",function(){
			        alert("로그인후 이용하세요");
				});
			<%}%>
			
	        $(".enterComment").click(function(){
	            $(".comment-editor").toggleClass("hidden")
	        })
			
	    	$(function(){
	    		$(".btn-reply").click(function(){
	    			if(<%=logginMember!=null%>) {
	    				const tr = $("<tr>");
	    				const td = $("<td>").css({
	    					"display":"none", "text-align":"left"
	    				}).attr("colspan",2);
	    				const form = $("<form>").attr({
	    					"action":"<%=request.getContextPath()%>/center/commentInsert.do", "method":"post"
	    				});
	    				const textarea = $("<textarea>").attr({"cols":"50","rows":"2","name":"commentContent", "id":"commentContent"});
	    				const button = $("<input>").attr({"type":"submit","value":"답글", "class":"btn btn-primary", "id":"btn-reply2"});
	    				const writer = $("<input>").attr({"type":"hidden","name":"commentWriter", "value":"<%=logginMember!=null?logginMember.getM_CODE():""%>"});
	    				const centerCode = $("<input>").attr({"type":"hidden","name":"centerCode", "value":"<%=cCode%>"});
	    				const level = $("<input>").attr({"type":"hidden","name":"level", "value":"2"});
	    				const commentRef = $("<input>").attr({"type":"hidden","name":"commentRef", "value":$(this).val()});
	    				const ordercode =$("<input>").attr({"type":"hidden","name":"orderChoice","value":$(this).parent().prev().find("input[name=orderCode]").val(), "data": $(this).parent().prev().find("input[name=orderCode]").data("meta"), "data": $(this).parent().prev().find("input[name=orderCode]").data("meta2")})
	    				form.append(textarea).append(button).append(writer).append(centerCode).append(level).append(commentRef).append(ordercode);
	    				td.append(form);
	    				tr.append(td);
	    				($(this).parent().parent()).after(tr);
	    				tr.children("td").slideDown(500);
	    				$(this).off("click");   /* off=>이벤트 삭제 */

	    			}
	    		});
	    	});
	        
	        
	        /* price comma추가하기 */
	        
        $(function () {
            $('.output').append($("#pChoice option").each(function (i, item) {
                console.log($(item).text());
                /[\d]+/.exec($(item).text());
            }))
        })
			
	</script>



<%@ include file="/views/common/footer.jsp"%>
