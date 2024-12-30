<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	// 헤더
	int users_idx = 0;
	String users_idx_param = request.getParameter("users_idx");
	
	if (users_idx_param != null && !users_idx_param.trim().isEmpty()) {
		try {
			users_idx = Integer.parseInt(users_idx_param);
		} catch (NumberFormatException e) {
	        // 예외 처리: 잘못된 형식의 숫자가 들어온 경우 기본값 0을 사용
			users_idx = 0;
		}
	}
	
	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
	HttpSession hs = request.getSession();
	
	try {
		users_idx =	 Integer.parseInt(hs.getAttribute("L_users_idx").toString());
		
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
		} catch(Exception e){
			
	}

	// 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
	Integer isgosu = (Integer) hs.getAttribute("isgosu");
	
	if (isgosu == null) {	
	// 고수일때 실행할 메서드
	isgosu = 2; // 기본값 2
	}//else{
	// 고수아닐때 일반회원일때 실행할 메서드
	// }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/sgNation.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"> <!-- 헤더 css 꼭 추가하기 -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script> <!--헤더 jquery 시작 -->
		$(function() {
			$(".usermenu-dropdown").hide();
			$(".usermenu3-dropdown").hide();
			$(".header-total1").hide();
			$(".header-total2").hide();
	        
			$(".right-section-div2").click(function(){
				var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
				var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
				
				$(".usermenu-dropdown").toggle();
				
				if ($(".right-section-div2-2-img").attr("src") === img1) {
					$(".right-section-div2-2-img").attr("src", img2);
				} else {
					$(".right-section-div2-2-img").attr("src", img1);
				}
			});
	
			$(".right3-section-div2").click(function(){
				var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
				var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
	    
				$(".usermenu3-dropdown").toggle();
				
				if ($(".right3-section-div2-2-img").attr("src") === img1) {
					$(".right3-section-div2-2-img").attr("src", img2);
				} else {
					$(".right3-section-div2-2-img").attr("src", img1);
				}
			});
			
			$(".usermenu-dropdown-div2-button").click(function(){
				if(g_user != 0){
					$(".header-total1").hide();
					$(".header-total2").show();
	        	}else{
	        		$(".header-total1").show();
	        		$(".header-total2").hide();
					location.href = "Gosu_join.jsp";
				}
			});
			
			$(".usermenu3-dropdown-div2-button").click(function(){
				$(".header-total1").show();
				$(".header-total2").hide(); 
			});
	        
			let users_idx = <%=users_idx%>; 
			//alert(users_idx);
	       
			let g_user = <%=isgosu%>
			
			$(document).ready(function(){
				if(g_user == 0){
					$(".header-total").hide();
					$(".header-total1").show();
					$(".header-total2").hide();
				} else if(g_user == 1) {
					$(".header-total").hide();
					$(".header-total1").hide();
					$(".header-total2").show();
				}
			});
			
			$(".usermenu-dropdown-div3-button").click(function(){
				$(".header-total").show();
				$(".header-total1").hide();
				$(".header-total2").hide();
			});
	       
			$(".usermenu-dropdown-div2-button").click(function(){
				if(g_user != 1) {
					location.href = "Gosu_join.jsp";
					$(".header-total2").hide();
					$(".header-total1").show();
				} else {
					$(".header-total2").show();
					$(".header-total1").hide();
				}
			});	
	       
			$(function(){
				$(".usermenu-dropdown-div3-button").click(function(){
				$.ajax({
					type: "POST",
					url: "LogoutServlet", // 로그아웃을 처리하는 서블릿 URL
					success: function(data) {
						// 로그아웃 성공 시 처리할 코드
						// 예를 들어 세션 무효화 후 화면 처리 등을 할 수 있음
						console.log("로그아웃 성공");
						$(".header-total").show();
						$(".header-total1").hide();
						$(".header-total2").hide();
					},
					error: function() {
						// 에러 발생 시 처리할 코드
						console.error("로그아웃 에러");
					}
				});
				});
			});
		});
	</script> <!--헤더 jquery 끝 -->
</head>
<body>
	<div id="app" class="">
		<header class = "header-total"> <!-- 헤더 HTML 시작 -->
			<div class = "header-inner">
				<section class = "header-section1">
					<div class = "header-div1">
						<div class = "header-div1-1">
							<div class = "header-div1-1-logo">
								<a href = "soomgo_main.jsp">
									<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
								</a>
							</div>
							<nav class = "header-nav">
								<ul class = "header-nav-ul">
									<li class = "header-nav-li">
										<a href = "sgRequestMain.jsp">
											<span class = "header-nav-li-span">견적요청</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "Seach.profile.jsp">
											<span class = "header-nav-li-span" id = "serarch_profile">고수찾기</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "soomgo_market.jsp?category_idx=1">
											<span class = "header-nav-li-span">마켓</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "soomgoCommu.jsp">
											<span class = "header-nav-li-span">커뮤니티</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class = "right-section">
							<nav class = "right-section-nav">
								<ul class = "right-section-nav-ul">
									<li class = "right-section-nav-li">
										<a href = "Login.jsp">
											<span class = "right-section-nav-li-span">로그인</span>
										</a>
									</li>
									<li class = "right-section-nav-li1">
										<a href = "User.join.jsp">
											<span class = "right-section-nav-li-span">회원가입</span>
										</a>
									</li>
								</ul>
							</nav>
							<button type = "button" class = "btn-signup">
								<a href = "Gosu_join.jsp" class = "btn-a">고수가입</a>
							</button>
						</div>
					</div>
				</section>
			</div>
		</header>
		<header class = "header-total1">
			<div class = "header-inner">
				<section class = "header-section1">
					<div class = "header-div1">
						<div class = "header-div1-1">
							<div class = "header-div1-1-logo">
								<a href = "soomgo_main.jsp">
									<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
								</a>
							</div>
							<nav class = "header-nav">
								<ul class = "header-nav-ul">
									<li class = "header-nav-li">
										<a href = "sgRequestMain.jsp">
											<span class = "header-nav-li-span">견적요청</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "Seach.profile.jsp">
											<span class = "header-nav-li-span">고수찾기</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "soomgo_market.jsp?category_idx=1">
											<span class = "header-nav-li-span">마켓</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "soomgoCommu.jsp">
											<span class = "header-nav-li-span">커뮤니티</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class = "center-section">
							<div class = "center-section-desktop">
								<form class = "center-section-form">
									<div class = "center-section-form-div1">
										<div class = "center-section-form-div2">
											<img class = "center-section-form-div2-img"src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
										</div>
										<input type = "text" class = "center-section-form-div2-input" placeholder="어떤 서비스가 필요하세요?" autocomplete="off">
									</div>
								</form>
							</div>
						</div>
						<div class = "right-section">
							<nav class = "right-section-nav">
								<ul class = "right-section-nav-ul">
									<li class = "right-section-nav-li3">
										<a href = "">
											<span class = "right-section-nav-li-span">받은견적</span>
										</a>
									</li>
									<li class = "right-section-nav-li1">
										<a href = "">
											<span class = "right-section-nav-li-span">채팅</span>
										</a>
										<span class = "right-section-nav-li-span1">148</span>
									</li>
								</ul>
							</nav>
							<div class = "right-section-div1">
								<button type = "button" class = "right-section-div1-button">
									<span class = "right-section-div1-span">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
										</svg>
									</span>
								</button>
							</div>
							<% 
								if (SoomgoHeader != null && !SoomgoHeader.isEmpty()) {
									for(Soomgo_headerDto shdto : SoomgoHeader){ 
							%>
							<div class = "right-section-div2-outter">
								<div class = "right-section-div2">
									<div class = "right-section-div2-1">
										<div class = "right-section-div2-2">
											<img src = "<%=shdto.getF_img() %>">
										</div>
									</div>
									<img class = "right-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K">
								</div>
								<div class = "usermenu-dropdown">
									<div class = "usermenu-dropdown-div1">
										<h4 class = "usermenu-dropdown-div1-font"><%=shdto.getName()%> 고객님</h4>
									</div>
									<ul class = "usermenu-dropdown-ul">
										<li class = "usermenu-dropdown-li">
											<a href = "">
												<div class = "usermenu-dropdown-li-font">받은 견적</div>
											</a>
										</li>
										<li class = "usermenu-dropdown-li">
											<a href = "">
												<div class = "usermenu-dropdown-li-font">마이페이지</div>
											</a>
										</li>
									</ul>
									<div class = "usermenu-dropdown-div2">
										<button type = "button" class = "usermenu-dropdown-div2-button">
											<img class = "usermenu-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4=">
												고수전환
										</button>
									</div>
									<div class = "usermenu-dropdown-div3">
										<a href = "soomgo_main.jsp">
											<button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
										</a>
									</div>
								</div>
							</div>
							<% 
									} 
								}
							%>
						</div>
					</div>
				</section>
			</div>
		</header>
		<header class = "header-total2">
			<div class = "header-inner">
				<section class = "header-section1">
					<div class = "header-div1">
						<div class = "header-div1-1">
							<div class = "header-div1-1-logo">
								<a href = "soomgo_main.jsp">
									<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
								</a>
							</div>
							<nav class = "header-nav">
								<ul class = "header-nav-ul">
									<li class = "header-nav-li">
										<a href = "sgRequestMain.jsp">
											<span class = "header-nav-li-span">견적요청</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "Seach.profile.jsp">
											<span class = "header-nav-li-span">고수찾기</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "soomgo_market.jsp?category_idx=1">
											<span class = "header-nav-li-span">마켓</span>
										</a>
									</li>
									<li class = "header-nav-li1">
										<a href = "soomgoCommu.jsp">
											<span class = "header-nav-li-span">커뮤니티</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class = "right3-section">
							<nav class = "right3-section-nav">
								<ul class = "right3-section-nav-ul">
									<li class = "right3-section-nav-li3">
										<a href = "">
											<span class = "right3-section-nav-li-span">받은견적</span>
										</a>
									</li>
									<li class = "right3-section-nav-li1">
										<a href = "">
											<span class = "right3-section-nav-li-span">바로견적</span>
										</a>
									</li>
									<li class = "right3-section-nav-li1">
										<a href = "">
											<span class = "right3-section-nav-li-span">채팅</span>
										</a>
									</li>
									<li class = "right3-section-nav-li1">
										<a href = "">
											<span class = "right3-section-nav-li-span">프로필</span>
										</a>
									</li>
								</ul>
							</nav>
							<a href= "" class = "right3-section-cash-outter">
								<span class = "right3-section-cash-span1">
									<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
										<g fill="none" fill-rule="evenodd">
											<path fill="none" d="M0 0h20v20H0z"></path>
											<path d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10z" fill="#FFBF0D"></path>
											<path d="M7.916 7.341a3.312 3.312 0 0 1 2.316-.912 3.32 3.32 0 0 1 2.293.974.714.714 0 1 0 1.005-1.015A4.75 4.75 0 0 0 10.25 5a4.74 4.74 0 0 0-3.313 1.301 5.066 5.066 0 0 0-1.562 3.264 5.124 5.124 0 0 0 .989 3.49 4.806 4.806 0 0 0 3.038 1.878 4.703 4.703 0 0 0 3.467-.773c.325-.224.62-.486.879-.778a.714.714 0 1 0-1.069-.948 3.453 3.453 0 0 1-.621.55 3.274 3.274 0 0 1-2.416.541 3.377 3.377 0 0 1-2.133-1.323 3.695 3.695 0 0 1-.71-2.517A3.637 3.637 0 0 1 7.915 7.34z" stroke="#FFF" stroke-width=".833" fill="#FFF"></path>
										</g>
									</svg>
								</span>
							</a>
							<div class = "right3-section-div1">
								<button type = "button" class = "right3-section-div1-button">
									<span class = "right3-section-div1-span">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
										</svg>
									</span>
								</button>
							</div>
							<% 
							if (SoomgoHeader2 != null && !SoomgoHeader2.isEmpty()) {
								for(Soomgo_header2Dto sh2dto : SoomgoHeader2){ 
							%>
							<div class = "right3-section-div2-outter">
								<div class = "right3-section-div2">
									<div class = "right3-section-div2-1">
										<div class = "right3-section-div2-2">
											<img src = "<%=sh2dto.getF_img()%>" width = "30px;" height = "30px;">
										</div>
									</div>
									<img class = "right3-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K">
								</div>
								<div class = "usermenu3-dropdown">
									<div class = "usermenu3-dropdown-div1">
										<h4 class = "usermenu3-dropdown-div1-font"><%=sh2dto.getName() %> 고객님</h4>
										<a class = "usermenu3-dropdown-div1-a">
											<div class = "usermenu3-dropdown-div1-a-1">
												<span class = "usermenu3-dropdown-div1-a-1-span1">
													<img class = "usermenu3-dropdown-div1-a-1-span1-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxwYXRoIGZpbGw9IiNFMUUyRTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjRTFFMkU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iLjUiIGQ9Ik04IDFsMi4xNjMgNC4zODJMMTUgNi4wODlsLTMuNSAzLjQwOS44MjYgNC44MTZMOCAxMi4wMzlsLTQuMzI2IDIuMjc1LjgyNi00LjgxNkwxIDYuMDg5bDQuODM3LS43MDd6Ii8+Cjwvc3ZnPgo=">
													평점 <%=sh2dto.getAvg_score() %>.0
												</span>
												<span class = "usermenu3-dropdown-div1-a-1-span2"></span>
												<span class = "usermenu3-dropdown-div1-a-1-span3">리뷰 <%=sh2dto.getCount_review() %>개</span>
											</div>
										</a>
									</div>
									<ul class = "usermenu3-dropdown-ul">
										<li class = "usermenu3-dropdown-li">
											<a href = "">
												<div class = "usermenu3-dropdown-li-font">받은 견적</div>
											</a>
										</li>
										<li class = "usermenu3-dropdown-li">
											<a href = "">
												<div class = "usermenu3-dropdown-li-font">마이페이지</div>
											</a>
										</li>
									</ul>
									<div class = "usermenu3-dropdown-div2">
										<button type = "button" class = "usermenu3-dropdown-div2-button">
											<img class = "usermenu3-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4=">
											고객전환
										</button>
									</div>
									<div class = "usermenu3-dropdown-div3">
										<a href = "soomgo_main.jsp">
											<button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
										</a>
									</div>
								</div>
							</div>
							<%
									}
								}
							%>
						</div>
					</div>
				</section>
			</div>
		</header> <!-- 헤더 HTML 끝 -->
	    <!-- 메인 -->
	    <div id="app_body" class="">
	    	<div id="body_main" class="">
	    		<div id="body_header" class="">
	    			<h1>서울</h1>
	    			<button>서울
	    			 <img src="img/soomgo/img_icon_downarrow.svg">
	    			</button>
	    			<div class=""></div>
	    		</div>
	    		<div id="body_container" class="">
	    			<div id="main_head" class="">
	    				<h3>서울 지역 인기 서비스</h3>
	    				<ol class="fl">
	    					<li class="fl"><a href="https://soomgo.com/">숨고</a></li>
	    					<li class="fl">
	    						<img src="img/soomgo/img_icon_rightarrow.svg"/>
	    						<span>서울</span>
	    					</li>
	    				</ol>
	    			</div>
	    			<ul id="main_list" class="">
	    				<li id="list" class="">이사/입주 청소업체</li>
	    				<li id="list" class="">영어 과외</li>
	    				<li id="list" class="">에어컨 설치 및 수리</li>
	    				<li id="list" class="">원룸/소형 이사</li>
	    				<li id="list" class="">도배 시공</li>
	    				<li id="list" class="">에어컨 청소</li>
	    				<li id="list" class="">퍼스널트레이닝(PT)</li>
	    				<li id="list" class="">용달/화물 운송</li>
	    				<li id="list" class="">국내 이사</li>
	    				<li id="list" class="">욕실/화장실 리모델링</li>
	    				<li id="list" class="">정리수납 컨설팅</li>
	    				<li id="list" class="">도배장판 시공</li>
	    				<li id="list" class="">거주 청소업체</li>
	    				<li id="list" class="">폐기물 처리</li>
	    				<li id="list" class="">집 인테리어</li>
	    				<li id="list" class="">전기배선 설치 및 수리</li>
	    				<li id="list" class="">수학 과외</li>
	    				<li id="list" class="">싱크대 교체</li>
	    				<li id="list" class="">인테리어필름 시공</li>
	    				<li id="list" class="">가정이사(투룸 이상)</li>
	    				<li id="list" class="">세탁기 청소</li>
	    				<li id="list" class="">페인트 시공</li>
	    				<li id="list" class="">문 설치 및 수리</li>
	    				<li id="list" class="">조명 인테리어</li>
	    				<li id="list" class="">상업공간 인테리어</li>
	    				<li id="list" class="">블라인드/커튼 시공</li>
	    				<li id="list" class="">피아노/키보드 레슨</li>
	    				<li id="list" class="">벽걸이TV 설치 및 철거</li>
	    				<li id="list" class="">타일 시공</li>
	    				<li id="list" class="">방송댄스 레슨</li>
	    			</ul>
	    			<a id="main_more" class="">서비스 더보기</a>
	    		</div>
	    	</div>
	    </div>
	    
	    <!-- 하단바 -->
		<div id = "under-box" class="center">
	        <div id = "under-1" class = "center">
	            <div id = "under-1-1" class = "center">
	                <div id = "phone-number" class = "center">
	                    <p class ="p-number">1599-5319</p>
	                </div>
	            
	                <div id = "operating-time" class = "center">
	                    <p class= "operating-time-p">평일 10:00 - 18:00</p>
	                    <p class= "operating-time-p">(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)</p>
	                </div>
	                
	                <div id = "store-box" class = "center">
	                    <div id ="app-store" class ="center">
	                        <a href = "https://soomgo.com/app-download/sender?c=%EB%A9%94%EC%9D%B8&pid=google&af_sub4=footer&af_channel=cpc&af_keywords=%EC%88%A8%EA%B3%A0&af_sub2=%EB%A9%94%EC%9D%B8" >
	                            <div id = "app-img" class = "center">
	                                <img src = "https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" width = "26px" height = "20px" class = "app-img">
	                            </div>
	
	                            <div id = "app-store-text" class = "center" style = "font-size: 0.75rem; color :#fff; letter-spacing: normal;">
	                                APP STORE
	                            </div>
	                        </a>
	                    </div>
	
	                    <div id ="play-store" class ="center">
	                        <a href = "https://soomgo.com/app-download/sender?c=%EB%A9%94%EC%9D%B8&pid=google&af_sub4=footer&af_channel=cpc&af_keywords=%EC%88%A8%EA%B3%A0&af_sub2=%EB%A9%94%EC%9D%B8" >
	                            <div id = "play-store-img" class = "center">
	                                <img src = "https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" width = "26px" height = "20px" class = "play-store-img">
	                            </div>
	
	                            <div id = "play-store-text" class = "center" style = "font-size: 0.75rem; color :#fff; letter-spacing: normal;">
	                                PLAY STORE
	                            </div>
	                        </a>
	                    </div>
	                </div>
	            </div>
	
	            <div id = "under-1-2" class = "center">
	                <div id = "Introduction-to-hiding" class =  "center">
	                    <ul>
	                        <li class = "under-title">숨고소개</li>
	                        <li><a href = "https://soomgo.com/about" class = "under-title-link">회사소개</a></li>
	                        <li><a href ="https://www.soomgo.team/career" class = "under-title-link">채용안내</a></li>
	                        <li><a href = "https://blog.soomgo.com/"  class = "under-title-link">팀블로그</a></li>
	                    </ul>
	                </div>
	
	                <div id = "Customer-information" class = "center">
	                    <ul>
	                        <li class = "under-title">고객안내</li>
	                        <li><a href ="https://soomgo.com/how-it-works"  class = "under-title-link">이용안내</a></li>
	                        <li><a href ="https://soomgo.com/safety"  class = "under-title-link">안전정책</a></li>
	                        <li><a href ="https://soomgo.com/prices"  class = "under-title-link">예상금액</a></li>
	                        <li><a href ="https://soomgo.com/search/pro/review_count"  class = "under-title-link">고수찾기</a></li>
	                        <li><a href ="https://help.soomgo.com/hc/ko/articles/360056329911--24-04-22-%EC%A0%81%EC%9A%A9-%EC%88%A8%EA%B3%A0%EB%B3%B4%EC%A6%9D-%EC%9D%B4%EC%9A%A9%EC%95%BD%EA%B4%80" class = "under-title-link">숨고보증</a></li>
	                        <li><a href ="https://soomgo.com/questions/" class = "under-title-link">고수에게묻다</a></li>
	                    </ul>
	                </div>
	
	                <div id ="Master-Guide" class= "center">
	                    <ul>
	                        <li class = "under-title">고수안내</li>
	                        <li><a href = "https://soomgo.com/how-soomgo-works"  class = "under-title-link">이용안내</a></li>
	                        <li><a href = "https://help.soomgo.com/hc/ko/categories/115001218027"  class = "under-title-link">고수가이드</a></li>
	                        <li><a href = "https://soomgo.com/pro"  class = "under-title-link">고수가입</a></li>
	                    </ul>
	                </div>
	
	                <div id = "customer-service-center" class = "center">
	                    <ul>
	                        <li class = "under-title">고객센터</li>
	                        <li><a href = "https://help.soomgo.com/hc/ko/categories/360002081551-%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD" class = "under-title-link">공지사항</a></li>
	                        <li><a href = "https://help.soomgo.com/hc/ko"  class = "under-title-link">자주묻는질문</a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>

	        <div id = "under-2" class = "center">
	            <div id = "under-2-1" class = "center">
	                <div id = "under-2-1-1" class ="center">
	                    <a href = "https://soomgo.com/terms/usage/2023-12-28" class = "text-term">이용약관</a>
	                </div>
	
	                <div id = "under-2-1-2" class ="center">
	                    <a href = "https://soomgo.com/terms/privacy/2024-04-17" class = "text-term">개인정보처리방침</a>
	                </div>
	
	                <div id = "under-2-1-3" class = "center">
	                    <a href = "https://soomgo.com/terms/location/2023-02-15" class = "text-term">위치기반 서비스 이용약관</a>
	                </div>
	
	                <div id = "under-2-1-4" class = "center">
	                    <a href = "https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208822325" class = "text-term">사업자 정보확인</a>
	                </div>
	            </div>
	
	            <div id = "under-2-2" class = "center">
	                <span class ="under-2-2-text">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 
	                    의무와 책임은 거래당사자에게 있습니다.</span>
	            </div>
	
	            <ul id = "under-2-3" class = "center">
	                <li class = "under-2-3-text">상호명:(주)브레이브모바일 · 대표이사:KIM ROBIN H · 개인정보책임관리자:김태우 · 주소:서울특별시 강남구 테헤란로 415, L7 강남타워 5층</li>
	                <li class = "under-2-3-text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</li>
	                <li class = "under-2-3-text">고객센터:1599-5319 · 이메일:support@soomgo.com</li>
	                <li class = "under-2-3-text">Copyright ©Brave Mobile Inc. All Rights Reserved.</li>
	            </ul>
	
	            <div id = "under-2-4" class = "center">
	                <div id = "under-2-4-1" class = "center">
	                    <a href = "https://www.facebook.com/SoomgoKorea/">
	                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-facebook.svg">
	                    </a>
	                </div>
	
	                <div id = "under-2-4-2" class = "center">
	                    <a href = "https://www.instagram.com/soomgo_official/">
	                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-instagram.svg">
	                    </a>
	                </div>
	
	                <div id = "under-2-4-3" class = "center">
	                    <a href = "https://blog.naver.com/brave_mobile_mkt">
	                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverblog.svg">
	                    </a>
	                </div>
	
	                <div id = "under-2-4-4" class = "center">
	                    <a href = "https://post.naver.com/brave_mobile_mkt?isHome=1">
	                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverpost.svg">
	                    </a>
	                </div>
	
	                <div id = "under-2-4-5" class = "center">
	                    <a href = "https://news.soomgo.com/">
	                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-tistory.svg">
	                    </a>
	                </div>
	            </div>
	       	 </div>
		<!-- 하단바 종료 -->
  	 	</div>
	</div>
</body>
</html>