/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.ConvenientService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.RoomTypeService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private ConvenientService convenientService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private BookingService bookingService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN")
                || roles.contains("ROLE_SELLER") || roles.contains("ROLE_MANAGER"))) {
            return "redirect:/admin/home";
        }
        headerDrop(model);
        return "home";
    }

    @RequestMapping(value = {"/room-type-list"}, method = RequestMethod.GET)
    @Transactional
    public String roomTypeList(Model model) {
        List<RoomTypeEntity> roomTypes = roomTypeService.getRoomTypes();
        for (RoomTypeEntity roomType : roomTypes) {
            Hibernate.initialize(roomType.getConvenients());
        }
        model.addAttribute("roomTypes", roomTypes);

        headerDrop(model);
        return "room_type_list";
    }

    @RequestMapping(value = {"/room-type-detail/{id}"}, method = RequestMethod.GET)
    public String roomTypeDetail(Model model,
            @PathVariable("id") int id) {
        model.addAttribute("roomType", roomTypeService.findRoomTypeById(id));

        headerDrop(model);
        return "room_type_detail";
    }

    @RequestMapping(value = {"/room-list"}, method = RequestMethod.GET)
    @Transactional
    public String roomList(Model model) {
        List<RoomEntity> rooms = roomService.getRooms();
        for (RoomEntity room : rooms) {
            Hibernate.initialize(room.getRoomType().getConvenients());
        }
        model.addAttribute("rooms", rooms);
        //roomListView or roomLisrSearch
        model.addAttribute("statusrequire", "view");

        headerDrop(model);
        return "room_list";
    }

    @RequestMapping(value = {"/room-detail/{id}"}, method = RequestMethod.GET)
    @Transactional
    public String roomDetail(Model model,
            @PathVariable("id") int id) {
        model.addAttribute("services", serviceService.getServices());
        RoomEntity room = roomService.findRoomById(id);
        Hibernate.initialize(room.getRoomType().getConvenients());
        model.addAttribute("room", room);
        
        headerDrop(model);
        return "room_detail";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @Transactional
    public String roomListSearch(Model model,
            HttpSession session,
            @RequestParam(value = "checkIn", required = false) @DateTimeFormat(pattern = "dd-MM-yyyy") Date checkInSearch,
            @RequestParam(value = "checkOut", required = false) @DateTimeFormat(pattern = "dd-MM-yyyy") Date checkOutSearch,
            @RequestParam("roomTypeId") int roomTypeId) {

        // Getbooking
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        if (booking == null) {
            booking = new BookingEntity();
            booking.setCheckIn(checkInSearch);
            booking.setCheckOut(checkOutSearch);
        }
        Date checkIn = booking.getCheckIn();
        Date checkOut = booking.getCheckOut();

        int discount = 0;
        //get rooms search
        List<RoomEntity> roomSearchs = roomService.getRoomsByCheckInCheckOutDateRoomType(checkIn, checkOut, roomTypeId);

        //get convenients and discount for each room
        for (RoomEntity room : roomSearchs) {
            Hibernate.initialize(room.getRoomType().getConvenients());
            discount = bookingService.getDiscount(checkIn, checkOut, room.getId());
        }
        
        session.setAttribute("BookingSession", booking);

        model.addAttribute("roomType", roomTypeService.findRoomTypeById(roomTypeId).getName());
        model.addAttribute("rooms", roomSearchs);
        model.addAttribute("discount", discount);
        //roomList view or roomListSearch to display Date,...
        model.addAttribute("statusrequire", "search");
        // Display button Your Booking
        if (booking.getBookingDetails() != null && booking.getBookingDetails().size() > 0) {
            model.addAttribute("status", "exist");
        }
        convertDateToString(model, checkIn, checkOut);
        headerDrop(model);
        return "room_list";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        headerDrop(model);
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        headerDrop(model);
        return "403Page";
    }

    @RequestMapping("/contacts")
    public String contactsPage(Model model) {
        headerDrop(model);
        return "contacts";
    }

    @RequestMapping("/aboutus")
    public String aboutusPage(Model model) {
        headerDrop(model);
        return "about";
    }

    //-----------------Base method
    public void headerDrop(Model model) {
        model.addAttribute("roomTypeHeaders", roomTypeService.getRoomTypes());
        model.addAttribute("roomHeaders", roomService.getRooms());
    }
    
    public void convertDateToString(Model model, Date checkIn, Date checkOut) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String checkInString = simpleDateFormat.format(checkIn);
        String checkOutString = simpleDateFormat.format(checkOut);
        model.addAttribute("checkIn", checkInString);
        model.addAttribute("checkOut", checkOutString);
    }
}
