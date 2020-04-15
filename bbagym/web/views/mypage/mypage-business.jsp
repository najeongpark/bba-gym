<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.bbagym.model.vo.*, java.util.*" %>
<%
	List<TrainerView> myTrainer = (List<TrainerView>)request.getAttribute("myTrainer");
	List<CenterEnroll> myCenter = (List<CenterEnroll>)request.getAttribute("myCenter");
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypageUser.css">
<div class="page-header page-header-xs" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/fabio-mangione.jpg');"></div>
<section class="section-container">
	
	<nav>
		<!-- 왼쪽메뉴 -->
		<div class="left-menu-container">
			<div class="profile-img">
			<%if(logginMember.getM_IMAGE()!=null){ %>
				<img src="<%=request.getContextPath()%>/upload/member/<%=logginMember.getM_IMAGE()%>" alt="my image" id="myImage" />
			<%}else{ %>
				<img src="<%=request.getContextPath()%>/resources/img/admin/log.png" alt="my image" id="myImage" />
			<%} %>
			</div>
			<div class="profile-info">
				<div>
					<span>♥<%=logginMember.getM_NAME()%>님 환영합니다♥</span>
				</div>
			</div>

			<div>
				<hr>
				<a class="updateMyProfile" href="<%=request.getContextPath()%>/business/businessEnrollView.do?M_ID=<%=logginMember.getM_ID()%>">회원정보수정</a>
				<a class="updateMyProfile"  onclick="removeCheck();">회원탈퇴</a>
				
				<hr>
			</div>
		</div>
			
	</nav>
	<!-- 본문 -->
	<div class="content-container">
	  <br>
	  <h1 style="text-align:center;">My Page</h1>
	  <div class="parent">
		<div class="first">
			<img src="<%=request.getContextPath()%>/resources/img/1.png"
				id="img">
			<div>
				<a href="#1">시설 등록현황</a>
			</div>
		</div>
		<div class="second">
			<img src="<%=request.getContextPath()%>/resources/img/2.png"
				id="img">
			<div>
				<a href="#2">트레이너 등록 현황</a>
			</div>
		</div>		 
	  </div>

		<div class="category-1">
			<div class="MyEnroll">
				<h4 id="1" style="color:#6E675F; font-weight:bolder">시설 등록 현황</h4>
			</div>
			<hr/>
			<table id="table" class="table table-hover" style="text-align:center;">
				<tr id="tr" class="table-secondary">
					<th>시설명</th>
					<th>시설 주소</th>
					<th>시설 연락처</th>
					<th>상태</th>
					<th> </th>
				</tr>
				
			<%if(myCenter==null||myCenter.isEmpty()){ %>
				<tr>	
					<td colspan="5"><h3>데이터가 존재하지 않습니다.</h3></td>
				</tr>
			<%}else{
				for(CenterEnroll c : myCenter){ %>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getAddress().substring(0,10) %>...</td>
					<td><%=c.getTel() %></td>
					<td><%=c.getApproval() %></td>
					<td>
						<%-- <button type="button" class="btn btn-secondary btn-sm" value="<%=c.getCode()%>" onclick="centerModify(this);">수정</button> --%>
						<button type="button" class="btn btn-secondary btn-sm" value="<%=c.getCode()%>" onclick="centerDelete(this);">삭제</button>
					</td>
				</tr>
				<%} 
			}%>
			</table>
			
			<div class="MyEnroll2">
				<h4 id="2" style="color:#6E675F; font-weight:bolder">트레이너 등록 현황</h4>
			</div>
			
			<table id="table" class="table table-hover" style="text-align:center;">
				<tr id="tr" class="table-secondary">
					<th>트레이너이름</th>
					<th>소속센터</th>
					<th>등록일시</th>
					<th>상태</th>
					<th> </th>
				</tr>
		<%if(myTrainer==null||myTrainer.isEmpty()){ %>
				<tr>	
					<td colspan="5"><h3>데이터가 존재하지 않습니다.</h3></td>
				</tr>
		<%}else{ 
			for(TrainerView t : myTrainer){
			%>
				<tr>
					<td><%=t.getMname()%></td>
					<td><%= t.getCcenter()%></td>
					<td><%= t.getEnrollDate() %></td>
					<td><%= t.getApproval() %></td>
					<td>
						<%if(t.getApproval().equals("승인")){ %>
						<button type="button" class="btn btn-secondary btn-sm" value="<%=t.getTcode()%>" onclick="trainerInactivate(this)">전환</button>
						<%} %>
						<%-- <button type="button" class="btn btn-secondary btn-sm" value="<%=t.getTcode()%>" onclick="trainerModity(this);">수정</button> --%>
						<button type="button" class="btn btn-secondary btn-sm" value="<%=t.getTcode()%>" onclick="trainerDelete(this);">삭제</button>
					
					</td>
				</tr>
			<%}
			}%>
			</table>
			
			<div id="program-modal">
				
			</div>

			<a class="top" href="#" title="”맨"위로">TOP</a>
	
		</div>

		</div>
		
	<script>
		function removeCheck() {
			 if (confirm("정말 '탈퇴'하시겠습니까??") == true){    //확인
				location.replace('<%=request.getContextPath()%>/member/memberDelete.do?M_ID=<%=logginMember.getM_ID()%>');
	 		}else{   //취소
		 		return false;
	    
	 		}
		}
	
		var isUsClicked = false;
		
		function updateMyProfile() {
			var el = document.getElementsByClassName("userinfo-update")[0];
			var back = document
					.querySelectorAll(".content-container>*:not(.popup)");
			console.log(back);
			// back.chi.style = "filter: blur(4px);";
			if (isUsClicked) {
				el.style = "visibility: hidden;";
				isUsClicked = false;
			} else {
				el.style = "visibility: visible;";
				isUsClicked = true;
			}
		}
		

		function centerDelete(e){
			var cCode=e.value;
			if(confirm('정말 삭제하시겠습니까?')){
				location.replace('<%=request.getContextPath()%>/mypage/centerDelete?cCode='+cCode);
			}
			else{
				return
			}
		}
		
		
		function trainerDelete(e){
			var tCode=e.value;
			console.log(tCode);
			if(confirm('정말 삭제하시겠습니까?')){
				location.replace('<%=request.getContextPath()%>/mypage/trainerDelete?tCode='+tCode);
			}else{
				return;
			}
		} 
		
		function trainerInactivate(e){
			var tCode=e.value;
			$.ajax({
				url:"<%=request.getContextPath()%>/mypage/trainerInactivate?tCode="+tCode,
				type:"get",
				success : function(data){
					$("#program-modal").html(data);
					$("#modalBtn").click();
	                /* setTimeout(() => {
						$("#modalBtn").trigger("click");
					}, 300); */
				}
				
			})
		}
		
		function changeProgramStatus(e){
			var split = e.value.split(',');
			var pCode=split[0];
			var status=split[1];
			location.replace("<%=request.getContextPath()%>/mypage/statusChange?pCode="+pCode+"&status="+status);
			
		}
	</script>	
</section>



<%@ include file="/views/common/footer.jsp"%>