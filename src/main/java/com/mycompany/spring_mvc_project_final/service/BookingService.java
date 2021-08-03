/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.lowagie.text.*;
//import com.lowagie.text.pdf.*;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailRepository;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private ServiceService serviceService;

    public BookingEntity addBookingDetail(Date checkIn, Date checkOut, int roomId, BookingEntity booking, List<ServiceBookingEntity> serviceBookings) {
        RoomEntity room = roomService.findRoomById(roomId);

        List<BookingDetailEntity> bookingDetails = booking.getBookingDetails();
        if (bookingDetails == null) {
            bookingDetails = new ArrayList<>();
        }

        if (room != null && !checkIfRoomBelongToBooking(roomId, booking)) {
            BookingDetailEntity bookingDetail = new BookingDetailEntity();

            bookingDetail.setRoom(room);
            bookingDetail.setBooking(booking);
            bookingDetail.setDiscount(getDiscount(checkIn, checkOut, roomId));
            bookingDetail.setUnitPrice(getUnitPrice(roomId, checkIn, checkOut, serviceBookings));
            bookingDetail.setServiceBookings(serviceBookings);

            bookingDetails.add(bookingDetail);
        }
//        Set property for booking
        booking.setBookingDate(new Date());
        booking.setCheckIn(checkIn);
        booking.setCheckOut(checkOut);
        booking.setBookingStatus(BookingStatus.PENDING);
        booking.setTotalPrice(getTotalPrice(bookingDetails));
        booking.setBookingDetails(bookingDetails);

        return booking;
    }

    public BookingEntity deleteBookingDetail(int roomId, BookingEntity booking) {

        List<BookingDetailEntity> bookingDetails = booking.getBookingDetails();

        for (BookingDetailEntity bookingDetail : bookingDetails) {
            if (bookingDetail.getRoom().getId() == roomId) {
                bookingDetails.remove(bookingDetail);
                break;
            }
        }
        booking.setTotalPrice(getTotalPrice(bookingDetails));
        booking.setBookingDetails(bookingDetails);

        return booking;
    }

    public boolean checkIfRoomBelongToBooking(int roomId, BookingEntity booking) {
        boolean check = false;
        List<BookingDetailEntity> bookingDetails = booking.getBookingDetails();
        if (bookingDetails != null) {
            for (BookingDetailEntity bookingDetail : bookingDetails) {
                if (bookingDetail.getRoom().getId() == roomId) {
                    check = true;
                    break;
                }
            }
        }
        return check;
    }

    public int getDiscount(Date checkIn, Date checkOut, int roomId) {
        int discount = 0;
        Date bookingDate = new Date();

        List<PromotionEntity> promotions = (List) (roomService.findRoomById(roomId).getRoomType().getPromotions());
        for (PromotionEntity promotion : promotions) {
            Date startDate = promotion.getStartDate();
            Date endDate = promotion.getEndDate();
            if (bookingDate.after(startDate) && bookingDate.before(checkOut)) {
                discount = promotion.getDiscount();
            }
        }
        return discount;
    }

    public int getNights(Date checkIn, Date checkOut) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        c1.setTime(checkIn);
        c2.setTime(checkOut);
        int nights = 0;

        // Math for calculate the number of day between 2 Date
        return nights = (int) (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);
    }

    public double getUnitPrice(int roomId, Date checkIn, Date checkOut, List<ServiceBookingEntity> serviceBookings) {
        double unitPrice = 0;
        double serviceBookingPrice = 0;
        for (ServiceBookingEntity serviceBooking : serviceBookings) {
            serviceBookingPrice += serviceBooking.getPrice();
        }
        return unitPrice = (getNights(checkIn, checkOut))
                * (roomService.findRoomById(roomId).getPrice()
                * (100 - getDiscount(checkIn, checkOut, roomId)) / 100 + serviceBookingPrice);
    }

    public double getTotalPrice(List<BookingDetailEntity> bookingDetails) {
        double totalPrice = 0;
        for (BookingDetailEntity bookingDetail : bookingDetails) {
            totalPrice += bookingDetail.getUnitPrice();
        }
        return totalPrice;
    }

//    <--------------------------------------
    public List<BookingEntity> getBookings() {
        return (List<BookingEntity>) bookingRepository.findAll();
    }

    //add booking: 
    public void saveBooking(BookingEntity booking) {
        bookingRepository.save(booking);
    }

    public BookingEntity findBookingById(int id) {
        Optional<BookingEntity> optional = bookingRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new BookingEntity();
        }
    }

    public boolean deleteBooking(int id) {
        bookingRepository.deleteById(id);
        return bookingRepository.existsById(id);
    }

    //Change status: 
    public void changeBookingStatus(int id, BookingStatus status) {
        BookingEntity booking = findBookingById(id);
        booking.setBookingStatus(status);
        bookingRepository.save(booking);

    }
//    ------------------------------------------------->

}
