<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
    <style>

        /* reservation page css */
        .reservation-title {
            text-align: center;
            margin: 0 auto;
            padding: 40px 0 30px;
            border-bottom: 1px solid #c8c8c8;
        }

        .reservation-table tr td {
            padding:  20px 0;
        }

        input[name="daterange"] {
            text-align: center;
        }

        .form-control[name="reservationDate"] {text-align: center;}

        #resultRow {
            width: 80%;
            height: 200px;
            margin: 20px auto;
        }

        #resultRow td {
            padding-right: 0;
        }

        #resultDetail {height: 100%;}

        #resultDetail .btn {
            display: block;
            width: 100%;
            height: 60px;
        }

        .img-container {
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 80%;
            margin: 0 auto;
        }

        #room {
            font-size: 2rem;
            font-weight: 500;
            margin-bottom: 40px;
        }

        #showDetails,
        #showDetails p {
            position: absolute;
            bottom: 0px;
            left: 10px;
        }

        #showDetails a {
            text-decoration: none;
            color: inherit;
            font-size: 1.2rem;
            line-height: 2em;
        }

        #price {
            height: 100%;
            font-size: 1.5rem;
            font-weight: 400;
            font-style: italic;
            line-height: 3rem;
            text-align: right;
        }
        .btn { border-radius: 0;}

        /* room detail modal */
        #roomDetailModal .modal-content {
            border-radius: 20px;
        }

        .room-detail-modal-title{
            text-align: center;
            margin: 0 auto;
            padding: 20px;
            font-weight: 400;
        }

        #roomDetailModal .btn-close {
            position: absolute;
            top: 40px;
            right: 40px;
        }
        
        .detail-imgs {
        	margin-left: 25px;
        }
        
        .detail-imgs a img,
        .detail-imgs a,
        .detail-imgs div {
            padding: 0;
            margin: 0;
        }

        .room-discription .btn {
            display: block;
            width: 100%;
        }

        .room-discription #modalRoomPrice {
            position: absolute;
            bottom: 0;
            left: 0;

            font-size: 1.2rem;
            font-style: italic;
        }

        .room-discription #modalReservation {
            position: absolute;
            bottom: 0;
            right: 0;
        }

        #imgWrapper {width: 85%;}
        
    </style>

    <!-- ??????????????? ?????? -->
    <section class="main"> <!-- start main -->
        <div class="container wrapper"> <!-- start fastreservations -->
            <h3 class="reservation-title">?????? / ????????? ??????</h3>
            <form method="post" id="reservForm" name="reservForm">
                <table class="reservation-table table">
                    <thead>
                        <tr>
                            <td>
                                <select class="form-select" aria-label="Default select example" name="category">
                                    <option ${reservation.category == null ? 'selected' : '' }>?????? / ????????? ??????</option>
                                    <option value="hotels" ${reservation.category == 'hotels' ? 'selected' : ''}>??????</option>
                                    <option value="dinings" ${reservation.category == 'dinings' ? 'selected' : ''}>?????????</option>
                                </select>
                            </td>
                            <td>
                                <select class="form-select" aria-label="Default select example" name="hotelCode">
                                    <option ${hotelCode == null ? 'selected' : ''}>????????????</option>
                                    <option value="10" ${reservation.hotelCode == '10' ? 'selected' : ''}>??????WY??????</option>
                                    <option value="20" ${reservation.hotelCode == '20' ? 'selected' : ''}>??????WY??????</option>
                                    <option value="30" ${reservation.hotelCode == '30' ? 'selected' : ''}>??????WY??????</option>
                                </select>
                            </td>
                            <td>
                                <select class="form-select" aria-label="Default select example" name="capacity">
                                    <option>?????????</option>
                                    <option value="1" ${reservation.capacity == '1' ? 'selected' : ''}>1</option>
                                    <option value="2" ${reservation.capacity == '2' ? 'selected' : ''}>2</option>
                                    <option value="3" ${reservation.capacity == '3' ? 'selected' : ''}>3</option>
                                    <option value="4" ${reservation.capacity == '4' ? 'selected' : ''}>4</option>
                                </select>
                            </td>
                            <!-- ????????? ??????, ????????? ?????? ????????? ???????????? ??????  22/12/30 -->
                            <td class="" id="time">
                                <select class="form-select" aria-label="Default select example" name="reservationTime">
                                    <option>????????????</option>
                                    <optgroup label="Lunch">
                                        <option ${reservation.reservationTime == '11:30' ? 'selected' : ''}>11:30</option>
                                        <option ${reservation.reservationTime == '12:00' ? 'selected' : ''}>12:00</option>
                                        <option ${reservation.reservationTime == '12:30' ? 'selected' : ''}>12:30</option>
                                        <option ${reservation.reservationTime == '13:00' ? 'selected' : ''}>13:00</option>
                                        <option ${reservation.reservationTime == '13:30' ? 'selected' : ''}>13:30</option>
                                    </optgroup>
                                    <optgroup label="Dinner">
                                        <option ${reservation.reservationTime == '17:30' ? 'selected' : ''}>17:30</option>
                                        <option ${reservation.reservationTime == '18:00' ? 'selected' : ''}>18:00</option>
                                        <option ${reservation.reservationTime == '18:30' ? 'selected' : ''}>18:30</option>
                                        <option ${reservation.reservationTime == '19:00' ? 'selected' : ''}>19:00</option>
                                        <option ${reservation.reservationTime == '19:30' ? 'selected' : ''}>19:30</option>
                                        <option ${reservation.reservationTime == '20:00' ? 'selected' : ''}>20:00</option>
                                    </optgroup>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="daterange" value="${reservation.daterange == null ? '??????????????? ?????? ???????????????' : reservation.daterange}" class="form-control" />
                            </td>
                            <td>
                                <button type="button" class="btn btn-dark" id="reservBtn">??????</button>
                            </td>
                            <td>
                            	<input type="hidden" name="code" id="code" value="">
                            </td>
                        </tr>
                        
                        
                    </thead>
                </table>
            </form> <!-- end form tag-->
        </div><!-- end fastreservations -->
        <div class="result-wrapper">

            <div id="resultTable" class="container">
                <c:forEach var="result" items="${resultList}">
                <div class="row mt-5">
                    <div class="col-md-4">
                        <div class="my-0 mx-auto" id="imgWrapper">
                            <img src="${pageContext.request.contextPath}/img/bedroom-g34b59e527_1920.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row position-relative" id="resultDetail">
                            <h3 class="col-md-12" id="room">${param.category == 'hotels' ? result.roomGrade : result.resName}</h3>
                            <div class="col-md-12">&ensp;</div>
                            <div class="row" id="showDetails">
                                <div class="col-md-8">
                                    <p>
                                        ${param.category == 'hotels' ? result.roomInfo : result.resInfo}<br>
                                        <c:if test="${param.category == 'hotels'}">
                                            <a href="#" data-room-code="${result.roomCode}" >?????? ????????????&ensp;&ensp;<span class="badge bg-dark">+</span></a>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-12" id="price">
                                            ${param.category == 'hotels' ? result.roomPrice : ''}
                                            <c:if test="${param.category == 'hotels'}">
                                            	 KRW <small> / night</small>
                                            </c:if>
                                        </div>
                                        <div class="col-md-12 pt-3 position-relative">
                                            <c:if test="${param.category == 'hotels'}">
                                                <button type="button" class="btn btn-dark" id="reservationBtn" data-room-code="${result.roomCode}">????????????</button>
                                            </c:if>
                                            <c:if test="${param.category == 'dinings'}">
                                                <button type="button" class="btn btn-dark" id="reservationBtn" data-res-code="${result.resCode}">????????????</button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>


        </div>

        
    </section> <!-- end main -->

    
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script>
        
        console.log('${param.category}');

        // jQuery ??????
        $(function() {

            const today = new Date();
            let month = today.getMonth() + 1;
            let day = today.getDate();
            let year = today.getFullYear();

            // ?????? daterange??? readonly???
            if ('${reservation.category}' === '') {
                $('input[name="daterange"]').attr('readonly', 'true');
                $('#time').addClass('visually-hidden');
            } else if ('${param.category}' === 'hotels') {
                $('input[name="daterange"]').daterangepicker({
                    opens: 'left'
                }, function(start, end, label) {
                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                });
                $('#time').addClass('visually-hidden');
            } else if ('${param.category}' === 'dinings') {
            	$('input[name="daterange"]').daterangepicker({
                    singleDatePicker: true,
                    showDropdowns: true,
                    minYear: today.getFullYear(),
                    maxYear: today.getFullYear() + 1
                }, function(start, end, label) {
                    console.log("Picked date is " + start.format('YYYY-MM-DD'));
                });
                $('#time').removeClass('visually-hidden');
            }

            // hotel/dining select event begin
            $('select[name="category"]').change(function(){


                let endDay;
                let endMoth;
                let endYear;
                let isLeapYear = false;

                // ?????? ??????
                if ((year%4 === 0 && year%100 !== 0) || year%400 === 0)
                    isLeapYear = true;

                switch (month + 1) {
                    case 2 :
                        endDay = (day + 1 > (isLeapYear ? 29 : 28) ? 1 : day + 1);
                        if (endDay > day){
                            endMonth = month;
                            endYear = year;
                        } else {
                            endMonth = (month + 1 > 12 ? 1 : month + 1);
                            if (endMonth < month) endYear = year + 1;
                            else endYear = year;
                        }
                        break;
                    case 4, 6, 9, 11 :
                        endDay = (day + 1 > 30 ? 1 : day + 1);
                        if (endDay > day){
                            endMonth = month;
                            endYear = year;
                        } else {
                            endMonth = (month + 1 > 12 ? 1 : month + 1);
                            if (endMonth < month) endYear = year + 1;
                            else endYear = year;
                        }
                        break;
                    default :
                        endDay = (day + 1 > 31 ? 1 : day + 1);
                        if (endDay > day){
                            endMonth = month;
                            endYear = year;
                        } else {
                            endMonth = (month + 1 > 12 ? 1 : month + 1);
                            if (endMonth < month) endYear = year + 1;
                            else endYear = year;
                        }
                        break;
                }
                


                // ????????? ????????? ???????????????????????? ?????? ??????
                if ($(this).val() === 'dinings') {
                    $('input[name="daterange"]').attr('readonly', false);
                    $('input[name="daterange"]').val(endMonth.toString() + '/' + endDay.toString() + '/' + endYear.toString());
                    $('input[name="daterange"]').daterangepicker({
                        singleDatePicker: true,
                        showDropdowns: true,
                        minYear: today.getFullYear(),
                        maxYear: today.getFullYear() + 1
                    }, function(start, end, label) {
                        console.log("Picked date is " + start.format('YYYY-MM-DD'));
                    });
                    $('#time').removeClass('visually-hidden');
                } else if($(this).val() === 'hotels') {
                    $('input[name="daterange"]').attr('readonly', false);
                    $('input[name="daterange"]').val(month.toString() + '/' + day.toString() + '/' + year.toString() + ' - ' + endMonth.toString() + '/' + endDay.toString() + '/' + endYear.toString());
                    $('input[name="daterange"]').daterangepicker({
                        opens: 'left'
                    }, function(start, end, label) {
                        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                    });
                    $('#time').addClass('visually-hidden');
                } else {
                    $('input[name="daterange"]').attr('readonly', true);
                    $('input[name="daterange"]').val('??????????????? ?????? ???????????????');
                    $('#time').addClass('visually-hidden');
                }
            }); // hotel/dining select event end


            // reservBtn ?????? ?????????
            $('#reservBtn').click(function(){
                $('#reservForm').submit();
            });



            // ?????? ???????????? ?????? ?????? ?????? ?????? ?????????
            $('#resultTable').on('click', 'a', function(e){
                e.preventDefault();

                const roomCode = $(this).data('room-code');

                $.getJSON(
                    '${pageContext.request.contextPath}/reservation/roomDetail?roomCode=' + roomCode,
                    function(roomDetail){
                        $('#modalRoomGrade').text(roomDetail.roomGrade);
                        $('#modalRoomInfo').text(roomDetail.roomInfo);
                        $('#modalRoomPrice').text(roomDetail.roomPrice + ' KRW / night');
                    }
                );
                
                $('#roomDetailModal').modal('show');

            }); // ?????? ?????? ??????


            // ?????? ????????? ??????
            $('#resultTable').on('click', 'button', function(){

                if (document.reservForm.category.value === 'hotels')
                    $('#code').val($(this).data('room-code'));
                else if(document.reservForm.category.value === 'dinings')
                    $('#code').val($(this).data('res-code'));
                console.log($('#code').val());
                console.log(document.reservForm.category.value);

                // ????????? ??????
                if (document.reservForm.category.value === '?????? / ????????? ??????') {
                    alert('?????? ?????? ???????????? ??????????????????');
                    document.reservForm.category.focus();
                } else if (document.reservForm.hotelCode.value === '????????????') {
                    alert('????????? ??????????????????');
                    document.reservForm.hotelCode.focus();
                } else if (document.reservForm.capacity.value === '?????????') {
                    alert('???????????? ??????????????????');
                    document.reservForm.capacity.focus();
                } else if (document.reservForm.category.value === 'dinings' && document.reservForm.reservationTime.value === '????????????') {
                    alert('????????? ??????????????? ??????????????????');
                    document.reservForm.reservationTime.focus();
                } else {
                    document.reservForm.setAttribute('action', '${pageContext.request.contextPath}/reservation/payment');
                    document.reservForm.submit();
                }

                
            });


        }); // jQuery ??????


        </script>    
    
    <%@ include file="../include/footer.jsp" %>
    