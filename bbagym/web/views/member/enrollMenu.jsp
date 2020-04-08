<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%>  --%>
<%@ page
	import="com.bbagym.model.vo.Member"%>
<%
	Member logginMember = (Member) session.getAttribute("logginMember");

	/* Cookie[] cookies = request.getCookies();
	String saveId = "";
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("saveId")) {
			
				saveId = c.getValue();
			}
		}
	} */
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bbagym</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/css1.css">
	<link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/assets/demo/demo.css" rel="stylesheet" />
	<!-- Jquery File -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</head>
<body>    

	<video autoplay muted loop id="backgroundvideo">
		<source src="<%=request.getContextPath() %>/resources/video/run.mp4" type="video/mp4">
	</video>
	        <div id="leftbar"> 
	        	<div>

				    <ul>		        

				         <a href="<%=request.getContextPath()%>/center/centerSearch.do"> <li>센터 찾기</li></a>		<!-- /views/center/centerView.jsp -->
<!-- 로그인x기본 -->		 <a href="<%=request.getContextPath()%>/trainer/trainerView.do"> <li>트레이너 찾기</li></a>	<!-- /views/trainner/trainnerView.jsp -->
				         <a href="<%=request.getContextPath()%>/notice/notice.do"><li>Notice</li></a>				<!-- /views/board/noticeList.jsp -->
				         <a href="<%=request.getContextPath()%>/notice/q&a.do"><li>Q&A</li></a>						<!-- /views/board/boardList.jsp -->
				    

				        
				        
				    </ul>
			    </div>				          
			</div>  
	<section>	
		<div class="container-fiuld">
			<div id="log">
	       <!--   <nav><h2>
	             BBAGYM
	         </h2></nav> -->
		         <nav>
		         	<img src="<%=request.getContextPath()%>/resources/img/logo-1.png" width="100px">
		         </nav>       
	   		</div>
			
	     <div id="content">
	         <nav>
	             <p>
	             당신 주변의 운동 시설과 트레이너<br>
	             <b>'빠짐'</b>이 찾아드릴게요
	             </p>
	             <br>
	             <br>
	         </nav>
	     </div>
	
	  
	      <div id ="box">
	   
	        <div >																								
	        	<button type="button" class="btn a text-white" data-toggle="modal" data-target="#join"  
	        	style="width:320px; height:320px; margin:45px;padding-bottom: 20px; border-radius: 50%;border: 5px solid #e7e7e7;"
	        	onclick="location.replace('<%=request.getContextPath()%>/member/memberEnroll.do')" /><h2><strong>일반 회원가입</strong></h2></button> &nbsp; 
	        	
	        	<button type="button" class="btn b text-white" data-toggle="modal" data-target="#join"
	        	style="width:320px; height:320px; margin:45px; padding-bottom: 20px; border-radius: 50%;border: 5px solid #e7e7e7;"  
	        	onclick="location.replace('<%=request.getContextPath()%>/member/businessEnroll.do')" /><h2><strong>&nbsp사업자 회원가입</strong></h2></button> &nbsp; 
	      	</div>
	    </div>
	    	
	    	<style>
	    	  border: 1px solid rgb(211, 208, 208);
	    	  
.a {
color: #fff;
	background-color: #007bff;
	border-color: #007bff;
	font-size: 35px;
}

.a:hover {
	color: #fff;
	background-color: #007bff;
	border-color: #007bff
}

.b:hover {
	color: #fff;
	background-color: #007bff;
	border-color: #007bff
}
	    	   
	    	</style>
	   	

	   	
	   
	   

		</div>	<!-- 첫 div 끝 -->
	</section>

<script src="<%=request.getContextPath()%>/js/js1.js">
</script>
<br>

<br>
<br>
<br>
<br>


<%@ include file="/views/common/footer.jsp"%>