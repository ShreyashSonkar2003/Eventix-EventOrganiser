package com.ips.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.ips.dao.UserInfoDao;
import com.ips.pojo.UserInfo;

@Component
public class UserInfoDaoImpl implements UserInfoDao {

    private HibernateTemplate hTemplate;

    @Autowired
    public void sethTemplate(HibernateTemplate hTemplate) {
        this.hTemplate = hTemplate;
    }

    @Autowired
    private SessionFactory sf;

    @Override
    @Transactional
    public boolean addNewUser(UserInfo u) {
        try {
            hTemplate.save(u);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public UserInfo checkUserCredential(UserInfo u) {
        String hql = "FROM UserInfo WHERE username = :username AND password = :password";

        // Using named parameters to prevent SQL injection
        List<UserInfo> list = (List<UserInfo>) hTemplate.findByNamedParam(
                hql,
                new String[] { "username", "password" },
                new Object[] { u.getUsername(), u.getPassword() }
        );

        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    @Transactional
    public int getTotalUsers() {
        Long count = (Long) sf.getCurrentSession()
                .createQuery("select count(u.id) from UserInfo u")
                .uniqueResult();
        return count.intValue();
    }
}
