/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Employers;
import com.actop.db.Leave;
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

    public void saveLeave1(String leaveType, int nuofdays, Date sdate,Date edate, Employers employer) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Leave lv = new Leave();
        try {
            System.out.println(edate);
            System.out.println(sdate);
            lv.setLeaveType(convertToBytes(leaveType));
            lv.setNoOfDays(convertToBytes(nuofdays+""));
            lv.setStartDate(sdate);
            lv.setEndDate(edate);
            lv.setEmployers(employer);
            s.save(lv);
            
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        
    }
//    public void saveLeave1(String leaveType, int nuofdays, Date sdate,
//            Date edate, String substitute, Date subsapprvdatetime, String approvedby, Date apprvdatetime, Employers employer) {
//        Session s = Connection.getSessionFactory().openSession();
//        Transaction t = s.beginTransaction();
//        Leave lv = new Leave();
//        try {
//            lv.setLeaveType(convertToBytes(leaveType));
//            lv.setNoOfDays(convertToBytes(nuofdays+""));
//            lv.setStartDate(sdate);
//            lv.setEndDate(edate);
//            lv.setSubstitute(convertToBytes(substitute));
//            lv.setSubstituteApprove(subsapprvdatetime);
//            lv.setApprovedBy(convertToBytes(approvedby));
//            lv.setApprovedDate(apprvdatetime);
//            lv.setEmployers(employer);
//            s.save(lv);
//        } catch (Exception e) {
//            t.rollback();
//            e.printStackTrace();
//        }
//        t.commit();
//        s.flush();
//        s.close();
//        
//    }

    public List<Leave> getAllLeaves(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Leave.class);
        List<Leave> leave=c.list();
        s.flush();
        s.close();
        return leave;
    }

    
}
