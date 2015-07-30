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
import com.actop.db.LeaveApproval;
import com.actop.db.OtherApprovals;
import com.actop.db.PaymentApproval;
import com.actop.db.Payments;
import com.actop.db.ProjectTasks;
import com.actop.db.ProjectTasksApproval;
import com.actop.db.Projects;
import com.actop.db.ProjectsApproval;
import com.actop.db.PromotionApproval;
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
    public List<PaymentApproval> checkPayementApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(PaymentApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<PaymentApproval> approvals=c.list();
        s.close();
        return approvals;
    }
    public List<LeaveApproval> checkLeaveApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(LeaveApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<LeaveApproval> approvals=c.list();
        s.close();
        return approvals;
    }
    public List<ProjectsApproval> checkProjectsApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(ProjectsApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<ProjectsApproval> approvals=c.list();
        s.close();
        return approvals;
    }
    public List<PromotionApproval> checkPromotionApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(PromotionApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<PromotionApproval> approvals=c.list();
        s.close();
        return approvals;
    }
    public List<ProjectTasksApproval> checkProjectTaskApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(ProjectTasksApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<ProjectTasksApproval> approvals=c.list();
        s.close();
        return approvals;
    }
    public List<OtherApprovals> checkOtherApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(OtherApprovals.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<OtherApprovals> approvals=c.list();
        s.close();
        return approvals;
    }
    public List<AllowanceApproval> checkAllowanceApproval(DepartmentsHasDesignation dhd){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(AllowanceApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        c.add(Restrictions.eq("status", 0));
        List<AllowanceApproval> approvals=c.list();
        s.close();
        return approvals;
    }

}
