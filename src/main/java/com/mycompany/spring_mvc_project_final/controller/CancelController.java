/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

//import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.RoomTypeService;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

//import javax.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
/**
 *
 * @author Administrator
 */
@Controller
public class CancelController {

//    @Autowired
//    public JavaMailSender emailSender;
//    @ResponseBody
    
    @Autowired
    BookingService bookingService;
    
    @Autowired
    RoomTypeService roomTypeService;
    
    @Autowired
    RoomService roomService;
    
    @RequestMapping("/{bookNumber}")
    @Transactional
    public String viewBooked(Model model,
            HttpSession session,
            @PathVariable("bookNumber") String bookNumber) {

        List<BookingEntity> bookings = bookingService.getBookings();
        BookingEntity booking = new BookingEntity();
        for (BookingEntity booking2 : bookings) {
            if (booking2.getBookingNumber().equalsIgnoreCase(bookNumber)) {
                booking = booking2;
            }
        }
        session.setAttribute("BookingSession", booking);
        return "redirect:/review-booking";
    }
    
    @RequestMapping("/review-booking")
    @Transactional
    public String viewBooking(Model model,
            HttpSession session) {

        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");

        String pattern = "dd-MM-yyyy";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String checkInString = simpleDateFormat.format(booking.getCheckIn());
        String checkOutString = simpleDateFormat.format(booking.getCheckOut());
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        model.addAttribute("booking", booking);
        model.addAttribute("checkIn", checkInString);
        model.addAttribute("checkOut", checkOutString);
        model.addAttribute("nights", bookingService.getNights(booking.getCheckIn(), booking.getCheckOut()));
//        model.addAttribute("statusCancel", "yes");
//        if (booking.getBookingDetails().size() > 0) {
//            model.addAttribute("status", "exist");
//        }

        return "review-booking";
    }

}
