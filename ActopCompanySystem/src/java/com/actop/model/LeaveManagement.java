/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Employers;
import com.actop.db.Leave;
import com.actop.db.LeaveTypes;
import com.actop.db.SpecialHolidays;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author J.R.K. Wickramasinghe
 */
public class LeaveManagement {

    public byte[] convertToBytes(String word) {
        byte[] convertedText = word.getBytes();
        return convertedText;
    }

    public void saveLeave1(String leaveType, int nuofdays, Date sdate, Date edate, Employers employer, Date stime, Date etime, String substitute) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Leave lv = new Leave();
        try {
            lv.setLeaveType(convertToBytes(leaveType));
            lv.setNoOfDays(convertToBytes(nuofdays + ""));
            lv.setStartDate(sdate);
            lv.setEndDate(edate);
            lv.setEmployers(employer);
            lv.setStarttime(stime);
            lv.setEndtime(etime);
            lv.setSubstitute(convertToBytes(substitute));
            s.save(lv);

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();

    }
    public void saveLeave2(Leave leaveid,String substitute, Date subsapprvdatetime, String approvedby, Date apprvdatetime) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Leave lv = new Leave();
        try {
            lv.setSubstituteApprove(subsapprvdatetime);
            s.save(lv);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        
    }

    public List<Leave> getAllLeaves() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(Leave.class);
        List<Leave> leave = c.list();
        s.flush();
        s.close();
        return leave;
    }

    public List<LeaveTypes> getAllLeaveTypes() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(LeaveTypes.class);
        List<LeaveTypes> leavetypes = c.list();
        s.flush();
        s.close();
        return leavetypes;
    }

    public void saveLeaveType(String ltype) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        LeaveTypes lvtyp = new LeaveTypes();
        try {
            lvtyp.setLeaveType(ltype);
            s.save(lvtyp);

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
    }

    public List<SpecialHolidays> getAllspclLeaveTypes() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(SpecialHolidays.class);
        List<SpecialHolidays> spclleavetypes = c.list();
        s.flush();
        s.close();
        return spclleavetypes;
    }

    public void saveSpclLeaveType(String spclltype,Date sdate,Date edate) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        SpecialHolidays spcllvtyp = new SpecialHolidays();
        try {
            spcllvtyp.setHolidayType(convertToBytes(spclltype));
            spcllvtyp.setStartDate(sdate);
            spcllvtyp.setEndDate(edate);
            s.save(spcllvtyp);

        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
    }

}
