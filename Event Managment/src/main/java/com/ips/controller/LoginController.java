package com.ips.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ips.daoimpl.EventDaoImpl;
import com.ips.daoimpl.UserInfoDaoImpl;
import com.ips.pojo.Event;
import com.ips.pojo.UserInfo;

@Controller
public class LoginController {

    @Autowired
    private UserInfoDaoImpl daoimpl;
    
    @Autowired
    private EventDaoImpl edaoImpl;

    // Landing page
    @RequestMapping("/")
    public String indexPage() {
        return "landing";
    }

    // Login page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // Admin dashboard
    @GetMapping("/admin-home")
    public String adminDashboard(HttpSession session) {
        if (session == null || !"admin".equalsIgnoreCase((String) session.getAttribute("role"))) 
            return "login";
        return "admin-home";
    }

    // User dashboard
    @GetMapping("/user-home")
    public String userDashboard(HttpSession session, Model m) {
        if (session == null || !"user".equalsIgnoreCase((String) session.getAttribute("role"))) 
            return "login";
        
        return "user-home";
    }

    // Check user credentials
    @RequestMapping(value = "/checkUser", method = RequestMethod.POST)
    public String checkUserCredential(UserInfo u, Model m, HttpServletRequest request) {
        UserInfo user = daoimpl.checkUserCredential(u);

        if (user != null) {
            // Invalidate old session
            HttpSession session = request.getSession(false);
            if (session != null) session.invalidate();
            session = request.getSession(true);

            // Save user info in session
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRoles());

            // Load events based on role
            List<Event> events = edaoImpl.getAllEvents();
            if ("admin".equalsIgnoreCase(user.getRoles())) {
                session.setAttribute("allevents", events);
                return "admin-home";
            } else {
                m.addAttribute("events", events);
                return "user-home";
            }
        } else {
            m.addAttribute("msg", "Invalid User Credential");
            return "login";
        }
    }

    // Registration page
    @GetMapping("/reg")
    public String regPage() {
        return "reg";
    }

    // Add new user
    @PostMapping("/addNewUser")
    public String addNewUser(@RequestParam("username") String user,
                             @RequestParam("password") String pass,
                             Model m) throws Exception {

        UserInfo u = new UserInfo();
        u.setUsername(user);
        u.setPassword(pass);
        u.setRoles("user");

        if (daoimpl.addNewUser(u)) {
            m.addAttribute("msg", "User registered successfully. You can login now.");
            return "login";
        } else {
            m.addAttribute("msg", "User could not be registered / already exists");
            return "reg";
        }
    }
}
