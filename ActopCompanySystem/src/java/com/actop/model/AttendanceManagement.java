/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Attendance;
import com.actop.db.Employers;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class AttendanceManagement {

    public Attendance saveAttendance(Date attendanceDate, Date dattime, Employers emp) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Attendance a = new Attendance();
        try {
            a.setAttendanceDate(attendanceDate);
            a.setDateTime(dattime);
            a.setEmployers(emp);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        s.flush();
        s.close();
        return a;
    }
    public List<Attendance> getAllAttendance(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Attendance.class);
        c.addOrder(Order.desc("dateTime"));
        List<Attendance> attendances=c.list();
        s.flush();
        s.close();
        return attendances;
    }
}
