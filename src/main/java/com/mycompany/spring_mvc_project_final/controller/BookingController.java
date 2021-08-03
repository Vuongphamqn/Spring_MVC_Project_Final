/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.GuestEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.CreditCardService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.RoomTypeService;
import com.mycompany.spring_mvc_project_final.service.UserService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

/**
 *
 * @author Administrator
 */
@Controller
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private UserService userService;

    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    public JavaMailSender emailSender;
    
//    Enable Validation
    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @RequestMapping("/add-bookingDetail")
    @Transactional
    public String addBookingDetail(Model model,
            HttpSession session,
            @RequestParam("roomId") int roomId) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");

        List<ServiceBookingEntity> serviceBookings = new ArrayList<>();
        booking = bookingService.addBookingDetail(booking.getCheckIn(), booking.getCheckOut(), roomId, booking, serviceBookings);

        model.addAttribute("booking", booking);
        model.addAttribute("nights", bookingService.getNights(booking.getCheckIn(), booking.getCheckOut()));
        if (booking.getBookingDetails().size() > 0) {
            model.addAttribute("status", "exist");
        }
        
        session.setAttribute("BookingSession", booking);
        headerDrop(model);
        convertDateToString(model, booking);
        return "booking";
    }

    @RequestMapping("/remove-BookingDetail")
    @Transactional
    public String removeBookingDetail(Model model,
            HttpSession session,
            @RequestParam("roomId") int roomId) {

        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        booking = bookingService.deleteBookingDetail(roomId, booking);
        
        model.addAttribute("booking", booking);
        model.addAttribute("nights", bookingService.getNights(booking.getCheckIn(), booking.getCheckOut()));
        if (booking.getBookingDetails().size() > 0) {
            model.addAttribute("status", "exist");
        }

        session.setAttribute("BookingSession", booking);
        headerDrop(model);
        convertDateToString(model, booking);
        return "booking";
    }

    @RequestMapping("/view-booking")
    @Transactional
    public String viewBooking(Model model,
            HttpSession session) {

        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");

        model.addAttribute("booking", booking);
        model.addAttribute("nights", bookingService.getNights(booking.getCheckIn(), booking.getCheckOut()));
        if (booking.getBookingDetails().size() > 0) {
            model.addAttribute("status", "exist");
        }

        session.removeAttribute("RoomIdSession");
        session.removeAttribute("ServiceBookingsSession");
        session.removeAttribute("ServicesSession");

        headerDrop(model);
        convertDateToString(model, booking);
        return "booking";
    }

    @RequestMapping("/confirm")
    @Transactional
    public String confirmBooking(Model model,
            HttpSession session) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");

        model.addAttribute("booking", booking);
        model.addAttribute("nights", bookingService.getNights(booking.getCheckIn(), booking.getCheckOut()));
        model.addAttribute("guest", new GuestEntity());

        headerDrop(model);
        convertDateToString(model, booking);
        return "confirm";
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String submitInforBooking(Model model,
            HttpSession session,
            @Valid @ModelAttribute("guest") GuestEntity guest,
            BindingResult result) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        if (result.hasErrors()) {
            model.addAttribute("guest", guest);
            model.addAttribute("booking", booking);
            model.addAttribute("nights", bookingService.getNights(booking.getCheckIn(), booking.getCheckOut()));

            headerDrop(model);
            convertDateToString(model, booking);
            return "confirm";
        } else {
            List<BookingEntity> bookings = new ArrayList<>();
            guest.setBooking(booking);
            session.setAttribute("EmailSession", guest.getEmail());
            List<GuestEntity> guests = new ArrayList<>();
            guests.add(guest);
            booking.setGuests(guests);

            model.addAttribute("creditCard", new CreditCardEntity());

            headerDrop(model);
            convertDateToString(model, booking);
            return "creditCard";
        }
    }

    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    @Transactional
    public String payment(Model model,
            HttpSession session,
            @Valid @ModelAttribute("creditCard") CreditCardEntity creditCard,
            BindingResult result) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        PaymentEntity payment = new PaymentEntity();
        List<PaymentEntity> payments = (List) new ArrayList<PaymentEntity>();
        String messages = "";
        if (result.hasErrors()) {
            model.addAttribute("creditCard", creditCard);

            headerDrop(model);
            return "creditCard";
        } else {
            List<CreditCardEntity> creditCards = (List) creditCardService.getCreditCards();
            for (CreditCardEntity creditCard1 : creditCards) {
                if (creditCard.getName().equalsIgnoreCase(creditCard1.getName())
                        && creditCard.getCardNumber().equalsIgnoreCase(creditCard1.getCardNumber())
                        && creditCard.getCvcCode().equalsIgnoreCase(creditCard1.getCvcCode())
                        && creditCard.getExpDate().compareTo(creditCard1.getExpDate()) == 0
                        && booking.getTotalPrice() <= creditCard1.getBalance()) {
                    creditCard1.setBalance(creditCard1.getBalance() - booking.getTotalPrice());

                    payment.setAmount(booking.getTotalPrice());
                    payment.setBooking(booking);
                    payment.setCreditCard(creditCard1);
                    payment.setPaymentDate(new Date());
                    payment.setDescription("Payment for " + creditCard1.getName());

                    payments.add(payment);

                    creditCard1.setPayments(payments);

                    booking.setBookingStatus(BookingStatus.ACCEPTED);
                    booking.setPayments(payments);
//                    note
                    Random rd = new Random();
                    String bookingNumber = String.valueOf(rd.nextInt(99999));
                    booking.setBookingNumber(bookingNumber);
//                    note
                    bookingService.saveBooking(booking);

                    creditCardService.saveCreditCard(creditCard1);
                    messages = "Payment success."
                            + "\n Check your email to view detail!";
                    model.addAttribute("messages", messages);

                    headerDrop(model);
                    return "redirect:/sendEmail";
                } else {
                    messages = "Please check your CreditCard Information or your Balance!";
                    model.addAttribute("messages", messages);
                    model.addAttribute("statuscredit", "fail");
                    
                    headerDrop(model);
                    return "final_result";
                }
            }
            model.addAttribute("messages", messages);
            model.addAttribute("statuscredit", "fail");

            headerDrop(model);
            return "final_result";
        }
    }

    @RequestMapping("/sendEmail")
    public String sendSimpleEmail(Model model,
            HttpSession session,
            @RequestParam("messages") String messages) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        String email = (String) session.getAttribute("EmailSession");

        // Create a Simple MailMessage.
        SimpleMailMessage message = new SimpleMailMessage();
        String content = "http://localhost:8080/Spring_MVC_Project_Final/" + booking.getBookingNumber();

        message.setTo(email);
        message.setSubject("Booking Hotel Information");
        message.setText(content);

        // Send Message!
        this.emailSender.send(message);

        model.addAttribute("messages", messages);
        session.removeAttribute("BookingSession");
        session.removeAttribute("EmailSession");
        
        headerDrop(model);
        return "final_result";
    }

    @RequestMapping(value = "/creditCard")
    public String creditCardPage(Model model) {
        model.addAttribute("creditCard", new CreditCardEntity());

        headerDrop(model);
        return "creditCard";
    }
    
    //-----------------Base method
    public void headerDrop(Model model) {
        model.addAttribute("roomTypeHeaders", roomTypeService.getRoomTypes());
        model.addAttribute("roomHeaders", roomService.getRooms());
    }
    
    public void convertDateToString(Model model, BookingEntity booking) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String checkInString = simpleDateFormat.format(booking.getCheckIn());
        String checkOutString = simpleDateFormat.format(booking.getCheckOut());
        model.addAttribute("checkIn", checkInString);
        model.addAttribute("checkOut", checkOutString);
    }
}
