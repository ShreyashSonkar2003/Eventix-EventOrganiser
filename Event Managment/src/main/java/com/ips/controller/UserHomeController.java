package com.ips.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ips.dao.EventDao;
import com.ips.pojo.Event;

@Controller
public class UserHomeController {

    @Autowired
    private EventDao eventDao;

    // Buy tickets page
    @GetMapping("/buy-tickets")
    public String buyTicket(@RequestParam(value = "eventId", required = false) Integer eventId,
                            Model model) {

        if (eventId == null) {
            model.addAttribute("msg", "Please select an event first.");
            return "buy-tickets";
        }

        Event event = eventDao.getEventById(eventId);
        if (event == null) {
            model.addAttribute("msg", "Event not found");
            return "error";
        }

        model.addAttribute("event", event);
        return "buy-tickets";
    }

    // Schedule page
    @GetMapping("/schedule")
    public String showSchedulePage(Model model) {
        List<Event> events = eventDao.getAllEvents();
        model.addAttribute("events", events);

        System.out.println("DEBUG /schedule events: " + events.size());
        return "schedule";
    }

    // About page
    @GetMapping("/about")
    public String showAboutPage() {
        return "about";
    }
}
