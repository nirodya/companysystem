/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Employers;
import com.actop.db.Promotions;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class PromotionManagement {

    public byte[] convertToBytes(String word) {
        byte[] convertedText = null;
        if (word != null) {
            convertedText = word.getBytes();
        }

        return convertedText;
    }
//    public DepartmentsHasDesignation getDesignationAndDepartments(Employers emp){
//        Session s=Connection.getSessionFactory().openSession();
//        Criteria c=s.createCriteria(DepartmentsHasDesignation.class);
//        c.add(Restrictions.eq("employers", emp));
//        
//        s.flush();
//        s.close();
//    }

    public Promotions savePromotion(String beforepromotion, Employers emp, String promotBy, Date applyDate,
            Date approvedate, String promotionApprovedBy, Date promoeffectiveDate, String promotionFor,
            String promotionStates) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Promotions p = new Promotions();
        try {
            System.out.println("awasave");
            p.setBeforePromotion(convertToBytes(beforepromotion));
            p.setEmployers(emp);
            p.setPromotBy(convertToBytes(promotBy));
            p.setPromotionApplyDate(applyDate);
            p.setPromotionApproved(approvedate);
            p.setPromotionApprovedBy(convertToBytes(promotionApprovedBy));
            p.setPromotionEffectiveDate(promoeffectiveDate);
            p.setPromotionFor(convertToBytes(promotionFor));
            p.setPromotionStates(convertToBytes(promotionStates));
            s.save(p);

            System.out.println("awasave2");
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return p;
    }

    public List<Promotions> getallPromotions() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(Promotions.class);
        List<Promotions> promotionses = c.list();
        s.flush();
        s.close();
        return promotionses;
    }

    public Promotions promoteEmployer(int pid, String promotBy, Date approvedDate, String promotionApprovedBy, Date effectiveDate, String promotionStates) {
        Session s = Connection.getSessionFactory().openSession();
        Promotions p = (Promotions) s.load(Promotions.class, pid);
        Transaction t = s.beginTransaction();
        try {
            p.setPromotBy(convertToBytes(promotBy));
            p.setPromotionApproved(approvedDate);
            p.setPromotionApprovedBy(convertToBytes(promotionApprovedBy));
            p.setPromotionEffectiveDate(effectiveDate);
            p.setPromotionStates(convertToBytes(promotionStates));
            s.update(p);
        } catch (Exception e) {
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return p;
    }

    public Promotions getPromotion(int id) {
        Session s = Connection.getSessionFactory().openSession();
        Promotions p = (Promotions) s.load(Promotions.class, id);
        s.flush();
        s.close();
        return p;
    }

}
