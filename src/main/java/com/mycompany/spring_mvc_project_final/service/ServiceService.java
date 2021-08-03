/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ServiceService {

    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private BookingService bookingService;

    public List<ServiceRepository> getServices() {
        return (List) serviceRepository.findAll();
    }

    public ServiceEntity findServiceById(int serviceId) {
        Optional<ServiceEntity> optional = serviceRepository.findById(serviceId);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new ServiceEntity();
        }
    }

    public List<ServiceEntity> getServicesByServiceBookings(List<ServiceBookingEntity> serviceBookings) {
        List<ServiceEntity> services = (List) this.getServices();
        if (serviceBookings != null & serviceBookings.size() > 0) {

            for (ServiceBookingEntity serviceBooking : serviceBookings) {
                for (int i = services.size() - 1; i >= 0; i--) {
                    if (services.get(i).getId() == serviceBooking.getService().getId()) {
                        services.remove(i);
                        break;
                    }
                }
            }
        }
        return services;
    }

}
