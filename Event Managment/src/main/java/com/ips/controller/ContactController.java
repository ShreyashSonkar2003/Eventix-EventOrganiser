package com.ips.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactController {

    @PostMapping("/contact")
    public String handleContact(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("subject") String subject,
            @RequestParam("message") String message
    ) {
        // Log the contact submission
        System.out.println("Controller hit! Name: " + name + ", Email: " + email 
                           + ", Subject: " + subject + ", Message: " + message);
        return "redirect:/contact?success=true";
    }

    @GetMapping("/contact")
    public String showContactPage() {
        return "contact";
    }
}
