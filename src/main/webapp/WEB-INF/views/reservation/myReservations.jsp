<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <%@ include file="../include/header.jsp" %>


    <style>
        /* reservations page css */
        a {
            color: inherit;
            text-decoration: none;
        }

        .reservations{
            margin: 50px auto;
            
        }
        
        .resv-select{
            text-align: center;
            border: none;
        }

        .resv-select li {
            
            height: 50px;
            line-height: 50px;
            background: #ccc;
            border-bottom: none;
        }

        #pills-tab li a {
            border: 1px solid black;
            color: #8c8c8c;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 30px;
            border-radius: 0px;
        }

        #pills-tab .active {
            background-color: white;
            color: #000;
            border-radius: 0px;
            border-bottom: none;
        }

        .tab-content .active {color: black;}

        .date-inp {
            width: 20%;
            display: inline;
            border: 1px solid black;
            text-align: center;
        }

        .hotel-select {
            width: 20%;
            display: inline;
            border: 1px solid black;
            text-align: center;
        }

        .date-search-form{
            background: #f0f0f0;
            width: 100%;
            padding: 10px;
            text-align: center;
        }

        .date-search-form .btn {
            background: white;
            display: inline;
            width: 10%;
            border: 1px solid black;
            border-radius: 5px;
        }

        .reservation-title {
            margin-top: 30px;
            border-bottom: 1px solid #c8c8c8;
            padding-bottom: 20px;
        }

        .my-reservations-table {
            margin-top: 20px;
            text-align: center;
            width: 100%;
            
        }

        .my-reservations-table thead th {
            font-weight: 400;
            padding-bottom: 5px;
        }

        .my-reservations-table tbody {
            font-size: 0.8em;
            padding-bottom: 5px;
        }

        .my-reservations-table tbody tr:hover {
            cursor: pointer;
            transform: scale(1.01);
            transition: 0.5s;
        }



        /*reservation modal*/
        #reservationModal .modal-content {
            border-radius: 20px;
        }

        .reservation-modal-title {
            text-align: center;
            margin: 0 auto;
            padding: 20px;
            font-weight: 400;
        }

        #modifyReservation .reservation-modify-table {
            margin: 0 auto;
        }

        #modifyReservation .reservation-modify-table tr td {
            padding: 15px 0;
        }

        #modifyReservation .reservation-modify-table strong {
            padding-left: 30px;
            box-sizing: border-box;
        }

        #modifyReservation input, #modifyReservation select {
            width: 100%;
        }

        #reservationModal .btn-close {
            position: absolute;
            top: 40px;
            right: 40px;
        }

        #modifyBtn, #updateBtn {
            width: 50%;
            display: block;
            margin: 10px auto;
        }
        
        .btn { border-radius: 0;}

    </style>

    <!-- ???????????? ?????? ?????? ????????? ?????? ???????????? -->
     <section>

        <div class="container">

            <div class="row">

                <div class="col-sm-12 col-md-10 col-lg-9 reservations">

                    <ul class="nav nav-pills mb-3 resv-select" id="pills-tab" role="tablist">
                        <li class="nav-item col-sm-12 col-md-6" role="presentation">
                          <a class="nav-link active" id="pills-hotel-tab" data-bs-toggle="pill" data-bs-target="#reservationsHotel" type="button" role="tab" aria-controls="pills-hotel" aria-selected="true">HOTEL</a>
                        </li>
                        <li class="nav-item col-sm-12 col-md-6" role="presentation">
                          <a class="nav-link" id="pills-dining-tab" data-bs-toggle="pill" data-bs-target="#reservationsDining" type="button" role="tab" aria-controls="pills-dining" aria-selected="false">DINE &amp; DRINKS</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        
                        <!--hotel toggle begin-->
                        <div class="tab-pane fade show active" id="reservationsHotel" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">

                            <h4 class="reservation-title">??? ?????? ????????????</h4>

                            <table class="my-reservations-table hotel-reservations">
                                <thead>
                                    <tr>
                                        <th class="col-md-2">????????????</th>
                                        <th class="col-md-2">????????????</th>
                                        <th class="col-md-2">????????????</th>
                                        <th class="col-md-1">??????</th>
                                        <th class="col-md-1">?????????</th>
                                        <th class="col-md-2">?????????</th>
                                        <th class="col-md-2">????????????</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${roomList.size() > 0}">
                                    <c:forEach var="reserv" items="${roomList}">
                                        <tr data-resv-num="${reserv.reservationCode}">
                                            <td>${reserv.reservationCode}</td>
                                            <td>${reserv.hotelCode}</td>
                                            <td>${reserv.roomCode}</td>
                                            <td>${reserv.capacity}</td>
                                            <td>${reserv.checkOutDate - reserv.checkInDate}???</td>
                                            <td><fmt:formatDate value="${reserv.checkInDate}" pattern="yyyy-MM-dd" /></td>
                                            <td><fmt:formatDate value="${reserv.checkOutDate}" pattern="yyyy-MM-dd" /></td>
                                        </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${roomList.size() == 0}">
                                    	<tr>
                                    		<td colspan="7">
                                    			<h3 class="my-0 mx-auto text-center">?????? ????????? ????????????.</h3>
                                    		</td>
                                    	</tr>
                                    </c:if>
                                </tbody>

                            </table>


                        </div>
                        <!--hotel toggle end-->

                        <!--dining toggle begin-->
                        <div class="tab-pane fade" id="reservationsDining" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">

                            <h4 class="reservation-title">??? ????????? ????????????</h4>

                            <table class="my-reservations-table dining-reservations">
                                <thead>
                                    <tr>
                                        <th class="col-md-2">????????????</th>
                                        <th class="col-md-3">????????????</th>
                                        <th class="col-md-3">????????? ??????</th>
                                        <th class="col-md-1">??????</th>
                                        <th class="col-md-2">?????????</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${diningList.size() > 0}">
                                    <c:forEach var="reserv" items="${diningList}">
                                    <tr data-resv-num="${reserv.reservationCode}">
                                        <td>${reserv.reservationCode}</td>
                                        <td>${reserv.hotelCode}</td>
                                        <td>${reserv.resCode}</td>
                                        <td>${reserv.reservationAmount}</td>
                                        <td><fmt:formatDate value="${reserv.reservationDate}" pattern="yyyy-MM-dd" /></td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${diningList.size() == 0}">
                                    	<tr>
                                    		<td colspan="5">
                                    			<h3 class="my-0 mx-auto text-center">?????? ????????? ????????????.</h3>
                                    		</td>
                                    	</tr>
                                    </c:if>
                                    
                                </tbody>

                            </table>
                        </div>
                        <!--dining toggle end-->

                    </div> <!--end tab contents-->
                    

                </div>

            </div>

        </div>



    </section>






    <%@ include file="./reservationModal.jsp" %>


    <script>

        $(document).ready(function(){

            /**
             * ?????? ????????????
            */
            $('.hotel-reservations tbody').on('click', 'tr', function(e){
                const resvNum = $(this).data('resvNum');
                console.log(resvNum);
                



                $('.reservation-modal-title').text('?????? ?????? ??????');
                $('.hotelForm #reservationCode').val(resvNum);
                $('.hotelForm').attr('hidden', false);
                $('.diningForm').attr('hidden', true);
                $('#reservationModal').modal('show');

            }); // ?????? ???????????? ???????????? ???

            /**
             * ????????? ????????????
            */
            $('.dining-reservations tbody').on('click', 'tr', function(e){
                const resvNum = $(this).data('resvNum');

                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/reservation/getReservDetailDining',
                    contentType: 'application/JSON',
                    data: JSON.stringify(resvNum),
                    success: function(detail){
                        $('.reservation-modal-title').text('????????? ?????? ??????');
                        $('.diningForm #reservationCode').val(resvNum);
                        $('.diningForm #hotelCode').val(detail.hotelCode);
                        $('.diningForm #resCode').val(detail.resCode);
                        $('.diningForm #reservationAmount').val(detail.reservationAmount);
                        
                        const resvDate = new Date(detail.reservationDate);
                        const resvString = resvDate.getFullYear() + '-' + 
                                            (String(resvDate.getMonth() + 1).length === 1 ? '0' + String(resvDate.getMonth() + 1) : String(resvDate.getMonth() + 1)) + '-' + 
                                            (String(resvDate.getDate()).length === 1 ? '0' + String(resvDate.getDate()) : String(resvDate.getDate()));
                        $('.diningForm #reservationDate').val(resvString);
                        $('.diningForm #reservationTime').val(detail.reservationTime);

                        $('.hotelForm').attr('hidden', true);
                        $('.diningForm').attr('hidden', false);
                        $('#reservationModal').modal('show');    
                    }
                });
                
                

            });// ????????? ???????????? ???????????? ???

            // ??????????????????
            $('#reservationModal').on('click', '#modifyBtn', function(){
                const trs = [...$(this)[0].parentNode.children[0].children[0].children];
                trs.forEach(tr => {
                    const $inp = tr.children[1].firstElementChild;
                    if ($inp.getAttribute('id') !== 'reservationCode' && $inp.getAttribute('id') !== 'hotelCode')
                        $inp.removeAttribute('readonly');
                    if ($inp.matches('select') && $inp.getAttribute('id') !== 'hotelCode') {
                        $inp.removeAttribute('onFocus');
                        $inp.removeAttribute('onChange');
                    }
                });
                $(this).text('???????????? ??????');
                $(this).attr('id', 'updateBtn');
            }); //?????????????????? ??????

            // ???????????? ?????? ?????? ???????????????
            $('#reservationModal').on('click', '#updateBtn', function(){
                const trs = [...$(this)[0].parentNode.children[0].children[0].children];
                trs.forEach(tr => {
                    const $inp = tr.children[1].firstElementChild;
                    if ($inp.getAttribute('id') !== 'reservationCode' && $inp.getAttribute('id') !== 'hotelCode')
                        $inp.setAttribute('readonly', true);
                    if ($inp.matches('select') && $inp.getAttribute('id') !== 'hotelCode') {
                        $inp.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex;');
                        $inp.setAttribute('onChange', 'this.selectedIndex = this.initialSelect;');
                    }
                });

                $(this).text('?????? ????????????');
                $(this).attr('id', 'modifyBtn');
            });
            
        });
        
    </script>

<%@ include file="../include/footer.jsp" %>
