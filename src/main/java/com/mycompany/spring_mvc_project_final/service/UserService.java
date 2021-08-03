/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    public List<UserEntity> getUsers() {
        return (List) userRepository.findAll();
    }
    
    public void save(UserEntity user) {
        userRepository.save(user);
    }
    
}
