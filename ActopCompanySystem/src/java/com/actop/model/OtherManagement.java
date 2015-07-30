/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Employers;
import com.actop.db.Other;
import com.actop.db.OtherTypes;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class OtherManagement {
    public byte[] convertToBytes(String word){
        byte[] convertedText=word.getBytes();
        return convertedText;
    }
    public Other saveOther(Integer claim, Date approvedDate, String approvedBy, Date payedDate, Employers emp,
            String exp, Date inDate, String informTo, String location, String note, String otherType, Date outDate, 
            String reason, Integer status){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        Other o=new Other();
        try {
            o.setClaim(claim);
            o.setClaimApproved(approvedDate);
            o.setClaimApprovedBy(convertToBytes(approvedBy));
            o.setClaimPayed(payedDate);
            o.setEmployers(emp);
            o.setExpenses(convertToBytes(exp));
            o.setInDate(inDate);
            o.setInformTo(convertToBytes(informTo));
            o.setLocation(convertToBytes(location));
            o.setNote(note);
            o.setOtherType(convertToBytes(otherType));
            o.setOutDate(outDate);
            o.setReson(convertToBytes(reason));
            o.setStates(status);
            s.save(o);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return o;
    }
    public OtherTypes saveOtherTypes(String type){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        OtherTypes ot=new OtherTypes();
        try {
            ot.setOtherType(type);
            s.save(ot);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return ot;
    }
    public List<OtherTypes> getAllOtherTypes(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(OtherTypes.class);
        return c.list();
    }
    
}
