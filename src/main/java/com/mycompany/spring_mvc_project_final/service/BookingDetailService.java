/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class BookingDetailService {

    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @Autowired
    private RoomService roomService;

    //get and add: 
    // Get Booking Detail: 
    public BookingDetailEntity findBookingDetailById(int id) {
        Optional<BookingDetailEntity> optional = bookingDetailRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new BookingDetailEntity();
        }
    }

    public List<BookingDetailEntity> findBookingDetails() {
        return (List<BookingDetailEntity>) bookingDetailRepository.findAll();
    }

    //Save: 
    public void saveBookingDetail(BookingDetailEntity bookingDetail) {
        bookingDetailRepository.save(bookingDetail);

    }

    public BookingDetailEntity getBookingDetailFromSession(int roomId, BookingEntity booking) {
        List<BookingDetailEntity> bookingDetails = booking.getBookingDetails();
        BookingDetailEntity bookingDetail = new BookingDetailEntity();
        if (bookingDetails != null & bookingDetails.size() > 0) {
            for (BookingDetailEntity bookingDetail2 : bookingDetails) {
                if (bookingDetail2.getRoom().getId() == roomId) {
                    bookingDetail = bookingDetail2;
                    break;
                }
            }
        }
        return bookingDetail;
    }
}
