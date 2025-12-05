package com.ips.dao;

import com.ips.pojo.Event;
import java.util.List;

public interface EventDao {

    boolean addEvent(Event e);

    boolean updateEvent(Event e);

    boolean deleteEvent(Event e);

    Event getEventById(int id);

    List<Event> getAllEvents();

    int getTotalEvents();
}
