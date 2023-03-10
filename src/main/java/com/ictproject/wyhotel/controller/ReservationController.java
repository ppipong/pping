package com.ictproject.wyhotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.NotMemberVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.RoomVO;
import com.ictproject.wyhotel.reservation.service.IReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private IReservationService service;
	
	/**
	 * 작 성 일 : 2022/12/29
	 * 작 성 자 : 백 건 욱
	 * */

	// 예약하기 페이지 이동
	@GetMapping("/reservationPage")
	public void reservationPage() {}
	
	// 예약 검색기록 띄우기
	@PostMapping("/reservationPage")
	public void roomResult(@ModelAttribute("reservation") ReservationVO reservation,
							Model model) {
		
		if (reservation.getCategory().equals("hotels")) {
			model.addAttribute("resultList", service.getRoomList(reservation));
		} else {			
			model.addAttribute("resultList", service.getDiningList(reservation));
		}
		
		System.out.println(model.getAttribute("resultList"));
		
	}
	
	// 방 상세정보
	@ResponseBody
	@GetMapping("/roomDetail")
	public RoomVO getRoomDetail(String roomCode) {
		
		return service.getRoomDetail(roomCode);
	}
	
	// 결제페이지 이동
	@PostMapping("/payment")
	public void movePaymentPage(@ModelAttribute("reservation") ReservationVO reservation,
								Model model) {
		
		String category = reservation.getCategory();
		
		if (category.equals("dinings")) {
			model.addAttribute("list", service.getDiningList(reservation));
			reservation = service.cleansingData(reservation);
		} else {
			model.addAttribute("list", service.getRoomList(reservation));
			reservation = service.cleansingData(reservation);
			System.out.println("daterange after cleansing: " + reservation.getDaterange());
		}
	}
	
	// 비회원 추가
	@ResponseBody
	@PostMapping("/createNmemCode")
	public String createNmemCode(@RequestBody NotMemberVO nmember) {
		
		return service.createNmemCode(nmember);
	}
	
	// 다이닝 예약
	@PostMapping("/diningReserv")
	public String dinigReserv(DiningReservationVO diningReserv, String strDate) {
		
		service.reservDining(diningReserv, strDate);
		return "redirect:/";
	}
	
	// 회원 비회원예약 선택 페이지
	@GetMapping("/reservCheck")
	public void reservCheck() {}
	
	// 비회원 로그인
	@PostMapping("/nmemLogin")
	public String nMemLogin(String reservationCode, String email, 
							HttpSession session, RedirectAttributes ra) {
		
		if (service.nMemLogin(reservationCode, email)) {
			session.setAttribute("member", reservationCode.substring(10));
			System.out.println("memberCode: " + session.getAttribute("member"));
			return "redirect:/reservation/myReservations";
		} else { 
			ra.addFlashAttribute("msg", "nMemLoginFail");
			return "redirect:/reservation/reservCheck";
		}
	}
	
	// 예약확인 페이지
	@GetMapping("/myReservations")
	public void myReservations(HttpSession session, Model model) {
		
		
		model.addAttribute("roomList", service.getReservRoomList(session));
		model.addAttribute("diningList", service.getReservDiningList(session));
		
		System.out.println(service.getReservRoomList(session));
		System.out.println(service.getReservDiningList(session));
		
	}
	
	// reservation detail (dining)
	@ResponseBody
	@PostMapping("/getReservDetailDining")
	public DiningReservationVO getReservDetailDining(@RequestBody String resvNum, HttpSession session) {
		
		return service.getReservDetailDining(resvNum, session);
	}

}
