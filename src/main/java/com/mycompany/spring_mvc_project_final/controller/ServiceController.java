/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.RoomService;
import com.mycompany.spring_mvc_project_final.service.RoomTypeService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller
public class ServiceController {

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private BookingDetailService bookingDetailService;

//    Da co roomId
//    1. Add service tu bookingDetail page
//    Chua co services-serviceBookings-Session
//    2. Update quantity
//    Co servies-serviceBookings=session
    @RequestMapping("/view-ServiceBookings")
    public String addServiceBookings(Model model,
            HttpSession session,
            @RequestParam("roomId") int roomId) {

        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        List<ServiceBookingEntity> serviceBookings = (List) session.getAttribute("ServiceBookingsSession");
        List<ServiceEntity> services = new ArrayList<>();
        if (serviceBookings == null) {
            serviceBookings = new ArrayList<>();
            services = (List) serviceService.getServices();
        } else {
            services = serviceService.getServicesByServiceBookings(serviceBookings);
        }

        model.addAttribute("serviceBookings", serviceBookings);
        model.addAttribute("services", services);

        model.addAttribute("room", roomService.findRoomById(roomId));
        session.setAttribute("RoomIdSession", roomId);
        session.setAttribute("ServiceBookingsSession", serviceBookings);
        session.setAttribute("ServicesSession", services);

        headerDrop(model);
        convertDateToString(model, booking);
        return "addServiceBookings";
    }

    @RequestMapping("/addService")
    public String addService(Model model,
            HttpSession session,
            @RequestParam("roomId") int roomId,
            @RequestParam("serviceId") int serviceId) {

//        Get BookingDetail, serviceBookings and services
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        List<ServiceBookingEntity> serviceBookings = (List<ServiceBookingEntity>) session.getAttribute("ServiceBookingsSession");
        List<ServiceEntity> services = (List<ServiceEntity>) session.getAttribute("ServicesSession");

//        check NullPointer-chua su dung
        if (serviceBookings == null) {
            serviceBookings = new ArrayList<>();
            services = (List) serviceService.getServices();
        }

//        check if service is choosen before and serviceId enter from Url
        boolean check = false;
        for (ServiceBookingEntity serviceBooking : serviceBookings) {
            if (serviceBooking.getService().getId() == serviceId) {
                check = true;
                break;
            }
        }

        if (check == false) {
            ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
            serviceBooking.setService(serviceService.findServiceById(serviceId));
            serviceBooking.setServiceBookDate(new Date());
            serviceBooking.setQuantity(0);
            serviceBooking.setPrice(serviceBooking.getQuantity() * serviceBooking.getService().getPrice());

            serviceBookings.add(serviceBooking);

            for (int i = services.size() - 1; i >= 0; i--) {
                if (services.get(i).getId() == serviceId) {
                    services.remove(i);
                    break;
                }
            }
        }

        model.addAttribute("room", roomService.findRoomById(roomId));

        model.addAttribute("services", services);
        model.addAttribute("serviceBookings", serviceBookings);
        model.addAttribute("booking", booking);

        session.setAttribute("ServiceBookingsSession", serviceBookings);
        session.setAttribute("ServicesSession", services);

        headerDrop(model);
        convertDateToString(model, booking);
        return "addServiceBookings";
    }

    @RequestMapping("/remove-ServiceBooking")
    public String removeServiceBooking(Model model,
            HttpSession session,
            @RequestParam("roomId") int roomId,
            @RequestParam("serviceId") int serviceId) {

        //Get BookingDetail, serviceBookingsSession and servicesSession
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        List<ServiceBookingEntity> serviceBookings = (List<ServiceBookingEntity>) session.getAttribute("ServiceBookingsSession");
        List<ServiceEntity> services = (List<ServiceEntity>) session.getAttribute("ServicesSession");

        for (int i = serviceBookings.size() - 1; i >= 0; i--) {
            if (serviceBookings.get(i).getService().getId() == serviceId) {
                serviceBookings.remove(i);
                break;
            }
        }

        boolean check = false;
        for (ServiceEntity service : services) {
            if (service.getId() == serviceId) {
                check = true;
                break;
            }
        }

        if (check == false) {
            ServiceEntity service2 = serviceService.findServiceById(serviceId);
            services.add(service2);
            session.setAttribute("ServiceBookingsSession", serviceBookings);
            session.setAttribute("ServicesSession", services);
        }
        model.addAttribute("room", roomService.findRoomById(roomId));

        model.addAttribute("services", services);
        model.addAttribute("serviceBookings", serviceBookings);
        model.addAttribute("booking", booking);

        headerDrop(model);
        convertDateToString(model, booking);
        return "addServiceBookings";
    }

    @RequestMapping("/updateQuantity/{roomId}/{serviceId}")
    public String updateQuantityServiceBooking(Model model,
            HttpSession session,
            @PathVariable("roomId") int roomId,
            @PathVariable("serviceId") int serviceId,
            @RequestParam("quantity") int quantity) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        List<ServiceBookingEntity> serviceBookings = (List) session.getAttribute("ServiceBookingsSession");
        List<ServiceEntity> services = new ArrayList<>();
        if (serviceBookings == null) {
            serviceBookings = new ArrayList<>();
            services = (List) serviceService.getServices();
        } else {
            services = serviceService.getServicesByServiceBookings(serviceBookings);
        }
        if (serviceBookings.size() > 0) {
            for (ServiceBookingEntity serviceBooking : serviceBookings) {
                if (serviceBooking.getService().getId() == serviceId) {
                    serviceBooking.setQuantity(quantity);
                    serviceBooking.setPrice(serviceBooking.getQuantity() * serviceBooking.getService().getPrice());
                    List<BookingDetailEntity> bookingDetails = booking.getBookingDetails();
                    for (BookingDetailEntity bookingDetail : bookingDetails) {
                        if (bookingDetail.getRoom().getId() == roomId) {
                            serviceBooking.setBookingDetail(bookingDetail);
                        }
                    }
                    break;
                }
            }
        }
        model.addAttribute("serviceBookings", serviceBookings);
        model.addAttribute("services", services);

        model.addAttribute("room", roomService.findRoomById(roomId));
        session.setAttribute("RoomIdSession", roomId);
        session.setAttribute("ServiceBookingsSession", serviceBookings);
        session.setAttribute("ServicesSession", services);

        headerDrop(model);
        convertDateToString(model, booking);
        return "addServiceBookings";
    }

    @RequestMapping("/add-service-bookings")
    @Transactional
    public String updateServiceBookings(Model model,
            HttpSession session,
            @RequestParam("roomId") int roomId) {
        BookingEntity booking = (BookingEntity) session.getAttribute("BookingSession");
        List<ServiceBookingEntity> serviceBookings = (List) session.getAttribute("ServiceBookingsSession");
        List<BookingDetailEntity> bookingDetails = booking.getBookingDetails();
        for (BookingDetailEntity bookingDetail : bookingDetails) {
            if (bookingDetail.getRoom().getId() == roomId) {
                bookingDetail.setServiceBookings(serviceBookings);
                bookingDetail.setUnitPrice(bookingService.getUnitPrice(roomId, booking.getCheckIn(), booking.getCheckOut(), serviceBookings));
                break;
            }
        }
        booking.setBookingDetails(bookingDetails);
        booking.setTotalPrice(bookingService.getTotalPrice(bookingDetails));
        session.setAttribute("BookingSession", booking);

        return "redirect:/view-booking";
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
