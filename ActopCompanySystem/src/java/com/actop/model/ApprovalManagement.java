/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.PaymentApproval;
import com.actop.db.Payments;
import com.actop.db.PromotionApproval;
import com.actop.db.Promotions;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class ApprovalManagement {

    public PaymentApproval savePaymentApproval(Date aptime, DepartmentsHasDesignation depahasdes,
            String note, Payments payment, Integer status) {
        Session s = Connection.getSessionFactory().openSession();
        s.update(depahasdes);
        Transaction t = s.beginTransaction();
        PaymentApproval approval = new PaymentApproval();
//        System.out.println("AWAAA"+depahasdes+""+payment+"");
        try {
            approval.setApprovedtime(aptime);
            approval.setDepartmentsHasDesignation(depahasdes);
            approval.setNote(note);
            approval.setPayments(payment);
            approval.setStatus(status);
            s.save(approval);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approval;
    }

    public PromotionApproval savePromotionApproval(Date date, DepartmentsHasDesignation dhd, String note,
            Promotions promo, Integer status) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        PromotionApproval approval = new PromotionApproval();
        try {
            approval.setDatetime(date);
            approval.setDepartmentsHasDesignation(dhd);
            approval.setNote(note);
            approval.setPromotions(promo);
            approval.setStatus(status);
            s.save(approval);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approval;
    }

}
