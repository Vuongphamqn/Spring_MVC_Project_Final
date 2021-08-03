/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class BookingSessionDetail {
    int roomId;
    List<Integer> serviceIds;

    public BookingSessionDetail(int roomId) {
        this.roomId = roomId;
        this.serviceIds = new ArrayList<Integer>();
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public List<Integer> getServiceIds() {
        return serviceIds;
    }

    public void setServiceIds(List<Integer> serviceIds) {
        this.serviceIds = serviceIds;
    }
    
    
}
