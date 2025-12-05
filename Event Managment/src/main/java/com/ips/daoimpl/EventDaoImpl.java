package com.ips.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.ips.dao.EventDao;
import com.ips.pojo.Event;

@Component
public class EventDaoImpl implements EventDao {

    @Autowired
    private HibernateTemplate hTemplate;

    @Autowired
    public void sethTemplate(HibernateTemplate hTemplate) {
        this.hTemplate = hTemplate;
    }

    @Autowired
    private SessionFactory sf;

    @Override
    @Transactional
    public boolean addEvent(Event e) {
        try {
            hTemplate.save(e);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean updateEvent(Event e) {
        try {
            Event existing = hTemplate.get(Event.class, e.getId());
            if (existing != null) {
                existing.setTitle(e.getTitle());
                existing.setDescription(e.getDescription());
                existing.setDate(e.getDate());
                existing.setTime(e.getTime());
                existing.setLocation(e.getLocation());
                existing.setPrice(e.getPrice());
                existing.setSponsor(e.getSponsor());
                existing.setCategory(e.getCategory());
                hTemplate.update(existing);
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean deleteEvent(Event e) {
        try {
            Event existing = hTemplate.get(Event.class, e.getId());
            if (existing != null) {
                hTemplate.delete(existing);
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @SuppressWarnings("deprecation")
    @Override
    public List<Event> getAllEvents() {
        try {
            List<Event> events = (List<Event>) hTemplate.find("from Event");
            return events != null ? events : new ArrayList<>();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    @Override
    @Transactional
    public int getTotalEvents() {
        hTemplate.clear(); // clears Hibernate cache

        List<Long> result = (List<Long>) hTemplate.find("select count(e.id) from Event e");
        return (result != null && !result.isEmpty()) ? result.get(0).intValue() : 0;
    }

    @Override
    public Event getEventById(int id) {
        return hTemplate.get(Event.class, id);
    }
}
