/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import com.mycompany.spring_mvc_project_final.repository.RoomRepository;
import com.mycompany.spring_mvc_project_final.repository.RoomTypeRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class RoomService {

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    public List<RoomEntity> getRooms() {
        return (List) roomRepository.findAll();
    }

    public RoomEntity findRoomById(int id) {
        Optional<RoomEntity> optional = roomRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new RoomEntity();
        }
    }

    public List<RoomEntity> getRoomsByCheckInCheckOutDateRoomType(Date checkIn, Date checkOut, int roomTypeId) {
        List<RoomTypeEntity> roomTypes = (List) roomTypeRepository.findAll();
        return roomRepository.findRoomsInvalidBySearch(checkIn, checkOut, roomTypeId);
    }
}
