<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
	
    <style>

        /* font setting */
        *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none;}
        a{ text-decoration: none; color: silver;}

        /* 공통 */
        .posi{padding: 80px 0;}
        .btn { border-radius: 0;}
        
        /* introduce_hotel */
        .hMenu { list-style: none;}

        /* info */
        .info {text-align: justify;}

    </style>



	
	
	<div class="container posi">
        
        <!-- 오프 캔버스 메뉴 -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title mt-3 ms-2" id="offcanvasExampleLabel">호텔 소개</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div>
                <ul class="hMenu">
                    <li class="pb-3 fs-5"><a href="#">개요</a></li> 
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotels">객실소개</a></li>
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotelsSinfo">WY 서울 호텔</a></li>
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotelsBinfo">WY 부산 호텔</a></li>
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotelsJinfo">WY 제주 호텔</a></li>
                </ul>
            </div>
        </div>
        </div>
    
        <!-- 오프캔버스 버튼 -->
        <a class="btn btn btn-dark mb-3" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
            <i class="xi-hamburger-out"></i>
        </a>
        
        <div class="row">
            <div class="col-12">
                <!-- 여기는 지도 api가 들어가는 장소입니다 -->
                <h3>Location</h3>
                <br>
                <div id="map" class="mapSize text-bg-danger" style="width: 1200px; height: 500px; background: silver;"></div>
                
            </div>
        </div>
            
        <div class="row pt-5">
            <div class="col-5">
                <h4 class="mb-2 fs-2">WY HOTEL</h4>
                <h4>SEOUL</h4>
                <p class="mt-5 fs-5 info">
                    WY  HOTEL 서울이 새롭고 편안한 안식처가 되어드립니다. 품격 높은 개인 서비스와 기품이 깃든 시설로 투숙객 여러분을 모시는 대한민국 소재 럭셔리 호텔입니다. 굵직한 정치·경제·문화 행사를 다수 개최하며 서울의 역사와 함께 해 온 명동 인근의 서양식 호텔에서 대한민국 최고 호텔의 명성을 경험해 보세요. 각국의 기업체와 유서 깊은 관광 명소, 인기 쇼핑가가 도보 거리에 있는 서울 한복판 명동에 자리해 비즈니스와 관광에 모두 편리한 위치를 자랑합니다. 웨스틴 조선 서울은 여러분의 여정을 함께하겠습니다.
                </p>
            </div>
            <!-- 공간부분 -->
            <div class="col-2"></div>
            <div class="col-4 fs-5">
                <hr>
                <!-- 양끝정렬 맞추기 -->
                    <p>
                        <b> 주소 </b>
                        <span class="ms-5">서울특별시 마포구 백범로 23, 3층 </span>
                    </p>
                    <p>
                        <b> 대표전화 </b>
                        <span class="ms-4"> 02-739-7235 </span>
                    </p>
                <hr>
        </div> <!-- row end-->
    </div>
        
    </div>

    
    <!-- kakao map api-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${ kakaoKey }"></script>

    <script>
    
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

    </script>
	
<%@ include file="../include/footer.jsp" %>