<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WYHotel</title>
    
        <!--BOOTSTRAP CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <!-- google font CDN -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        
        <!-- jquery and daterangepicker -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    
        <!-- swiper -->
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>

        <!-- xeicon CDN-->
	    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        
    </head>
    <body>    
        <header> <!-- start header -->
            <div class="header-wrapper">
                <div class="contatiner" style="text-align: center;">
                    <div class="img-wrapper">
                        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/em_logo.svg" width="150"></a>
                    </div>
                </div>
            </div>        
        </header> <!-- end header -->
        <nav class="navbar navbar-expand-lg bg-light sticky-top"> <!-- start navbar -->         
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"><span class="bi bi-menu-button-wide"></span></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ????????????
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/hotels">??????</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/hotelsSinfo">WY?????? ??????</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/hotelsBinfo">WY?????? ??????</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce/hotelsJinfo">WY?????? ??????</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${ pageContext.request.contextPath }/promotion/list">????????????</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ????????????
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/cscenter/faq">FAQ</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/cscenter/customer">????????????</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ????????????
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/reservationPage">????????????</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/myReservations">??? ??????</a></li>
                            </ul>
                        </li>
                        <!-- ??????????????? ????????? ???????????? ?????? -->
                        <c:if test="${member == null}">
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                                ????????????
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">?????????</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/join">????????????</a></li>                                
	                            </ul>
	                        </li>
                        </c:if>
                        <!-- ???????????? ????????? ???????????? ?????? -->
                        <c:if test="${member != null}">
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                                ???????????????
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">?????????</a></li>
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/pwChk">??????????????????</a></li>
	                                <li><a class="dropdown-item" id="logoutBtn" href="${pageContext.request.contextPath}/member/logout">????????????</a></li>
	                            </ul>
	                        </li>
                        </c:if>
                        <!-- ????????? ???????????? ????????? ???????????? ?????? -->
                        <c:if test="${admin == true}">
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                                ??????????????????
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/member">????????????</a></li>	                                
	                            </ul>
	                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav> <!-- end navbar-->
        
        <script>
        	
        	
        	
        </script>
        
        
        
        
        
