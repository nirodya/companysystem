/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.AllowanceApproval;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.EmployersHasAllowances;
import com.actop.db.PaymentApproval;
import com.actop.db.Payments;
import com.actop.db.ProjectTasks;
import com.actop.db.ProjectTasksApproval;
import com.actop.db.Projects;
import com.actop.db.ProjectsApproval;
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
    public ProjectsApproval saveProjectApproval(Date date, DepartmentsHasDesignation dhd, String note, 
            Projects projects, Integer status){
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectsApproval approval=new ProjectsApproval();
        try {
            approval.setApprovedtime(date);
            approval.setDepartmentsHasDesignation(dhd);
            approval.setNote(note);
            approval.setProjects(projects);
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
    public ProjectTasksApproval saveProjectTasksApprovel(Date date, DepartmentsHasDesignation dhd,
            String note, ProjectTasks ptask, Integer status){
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectTasksApproval approval=new ProjectTasksApproval();
        try {
           approval.setApprovedtime(date);
           approval.setDepartmentsHasDesignation(dhd);
           approval.setNote(note);
           approval.setProjectTasks(ptask);
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
    public AllowanceApproval saveAllowanceApproval(Date date, DepartmentsHasDesignation dhd, 
            EmployersHasAllowances emp, String note, Integer status){
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        AllowanceApproval approval=new AllowanceApproval();
        try {
            approval.setApprovedtime(date);
            approval.setDepartmentsHasDesignation(dhd);
            approval.setEmployersHasAllowances(emp);
            approval.setNote(note);
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
