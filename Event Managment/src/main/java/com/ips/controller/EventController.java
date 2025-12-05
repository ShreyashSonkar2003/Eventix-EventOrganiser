package com.ips.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ips.dao.EventDao;
import com.ips.dao.UserInfoDao;
import com.ips.pojo.Event;

@Controller
public class EventController {

    @Autowired
    private EventDao eventDao;
    
    @Autowired
    private UserInfoDao uDao;

    @GetMapping("/dashboard")
    public String adminDashboard(Model model) {
        System.out.println(">>> /dashboard controller called");

        int totalEvents = eventDao.getTotalEvents();
        int totalUsers = uDao.getTotalUsers();

        System.out.println(">>> totalEvents from DAO = " + totalEvents);
        System.out.println(">>> totalUsers from DAO  = " + totalUsers);

        model.addAttribute("totalEvents", totalEvents);
        model.addAttribute("totalUsers", totalUsers);

        return "admin-home";
    }

    @GetMapping("/logout")
    public String logoutPage() {
        return "login";
    }
    
    @GetMapping("/back")
    public String back() {
        return "admin-home";
    }

    @GetMapping("/manageevents")
    public String manageEvents(Model model) {
        List<Event> events = eventDao.getAllEvents();
        model.addAttribute("allevents", events);
        return "manageevents";
    }

    @PostMapping("/saveEvents")
    public String saveEvents(Event e, 
                             @RequestParam("b1") String op, 
                             RedirectAttributes ra) {
        String msg;

        switch (op) {
            case "Add Event":
                msg = eventDao.addEvent(e) ? "Event Added Successfully" : "Event Could Not Be Added";
                break;
            case "Update Event":
                msg = eventDao.updateEvent(e) ? "Event Updated Successfully" : "Event Could Not Be Updated";
                break;
            case "Delete Event":
                msg = eventDao.deleteEvent(e) ? "Event Deleted Successfully" : "Event Could Not Be Deleted";
                break;
            default:
                msg = "Invalid Operation";
        }

        ra.addFlashAttribute("msg", msg);
        return "redirect:/manageevents";
    }
}
