/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Integer> {

    @Query(value = " select * from room r\n"
            + "where room_type_id = ?3\n"
            + "AND id NOT IN \n"
            + "(select room.id from room\n"
            + " join booking_detail bd on bd.room_id = r.id\n"
            + " join booking b on b.id = bd.booking_id\n"
            + " join room_type rt on rt.id = r.room_type_id\n"
            + " where \n"
            + " ((b.check_out > ?1 AND b.check_in < ?1)\n"
            + " OR(b.check_out > ?2 AND b.check_in < ?2)\n"
            + " )\n"
            + " and rt.id = ?3)", nativeQuery = true)
    List<RoomEntity> findRoomsInvalidBySearch(Date checkIn, Date checkOut, int roomTypeId);
}
