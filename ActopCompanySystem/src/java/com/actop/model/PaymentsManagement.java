/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Employers;
import com.actop.db.Payments;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class PaymentsManagement {

    public byte[] convertToBytes(String word) {
        byte[] convertedText = null;
        if (word != null) {
            convertedText = word.getBytes();
        }

        return convertedText;
    }

    public Payments savePayment(Employers emp, String payment, Date approvedDate, String paymentApprovedBy,
            Date payedDate, Date pDate, String paymentStates, String paymentTypes, String paymentFor) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Payments p = new Payments();
        try {
            p.setEmployers(emp);
            p.setPayment(convertToBytes(payment));
            p.setPaymentApproved(approvedDate);
            p.setPaymentApprovedBy(convertToBytes(paymentApprovedBy));
            p.setPaymentDate(pDate);
            p.setPaymentFor(convertToBytes(paymentFor));
            p.setPaymentPayed(payedDate);
            p.setPaymentStates(convertToBytes(paymentStates));
            p.setPaymentTypes(convertToBytes(paymentTypes));
            s.save(p);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return p;
    }
    public List<Payments> getAllPayments(){
        Session s = Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Payments.class);
        List<Payments> l=c.list();
        s.flush();
        s.close();
        return l;
    }

}
