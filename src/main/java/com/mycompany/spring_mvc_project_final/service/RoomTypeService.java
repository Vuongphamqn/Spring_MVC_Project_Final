/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import com.mycompany.spring_mvc_project_final.repository.RoomTypeRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class RoomTypeService {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    public List<RoomTypeEntity> getRoomTypes() {
        List<RoomTypeEntity> roomTypes = (List) roomTypeRepository.findAll();
        return roomTypes;
    }
    
    public RoomTypeEntity findRoomTypeById(int id) {
        Optional<RoomTypeEntity> optional = roomTypeRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new RoomTypeEntity();
        }
    }
}
