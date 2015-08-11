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
import com.actop.db.Other;
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
import org.hibernate.criterion.Order;
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
    
    public PaymentApproval approvePayment(int id, String note, Integer status){
        Session s = Connection.getSessionFactory().openSession();
        PaymentApproval approval=(PaymentApproval) s.load(PaymentApproval.class, id);
        Transaction t = s.beginTransaction();
        try {
            approval.setApprovedtime(new Date());
            approval.setNote(note);
            approval.setStatus(status);
            s.update(approval);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approval;
    }
    
    public PaymentApproval getPaymentApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        PaymentApproval paymentApproval=(PaymentApproval) s.load(PaymentApproval.class, id);
        s.flush();
        s.close();
        return paymentApproval;
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
    
    public PromotionApproval approvePromotion(int id, String note, Integer status){
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        PromotionApproval approval=(PromotionApproval) s.load(PromotionApproval.class, id);
        try {
            approval.setDatetime(new Date());
            approval.setNote(note);
            approval.setStatus(status);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approval;
    }
    
    public PromotionApproval getPromotionApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        PromotionApproval promotionapproval=(PromotionApproval) s.load(PromotionApproval.class, id);
        s.flush();
        s.close();
        return promotionapproval;
    }

    public ProjectsApproval saveProjectApproval(Date date, DepartmentsHasDesignation dhd, String note,
            Projects projects, Integer status) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectsApproval approval = new ProjectsApproval();
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
    public ProjectsApproval getProjectApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        ProjectsApproval projectapproval=(ProjectsApproval) s.load(ProjectsApproval.class, id);
        s.flush();
        s.close();
        return projectapproval;
    }
    public ProjectsApproval approveProject(int id, String note, Integer status){
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectsApproval approval=(ProjectsApproval) s.load(ProjectsApproval.class, id);
        try {
            approval.setApprovedtime(new Date());
            approval.setNote(note);
            approval.setStatus(status);
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
            String note, ProjectTasks ptask, Integer status) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectTasksApproval approval = new ProjectTasksApproval();
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
    public ProjectTasksApproval getProjectTaskApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        ProjectTasksApproval projectTaskapproval=(ProjectTasksApproval) s.load(ProjectTasksApproval.class, id);
        s.flush();
        s.close();
        return projectTaskapproval;
    }
    public ProjectTasksApproval approveProjectTask(int id, String note, Integer status){
        Session s=Connection.getSessionFactory().openSession();
        ProjectTasksApproval approval=(ProjectTasksApproval) s.load(ProjectTasksApproval.class, id);
        Transaction t=s.beginTransaction();
        try {
            approval.setApprovedtime(new Date());
            approval.setNote(note);
            approval.setStatus(status);
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
            EmployersHasAllowances emp, String note, Integer status) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        AllowanceApproval approval = new AllowanceApproval();
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
    public AllowanceApproval getAllowanceApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        AllowanceApproval allowanceApproval=(AllowanceApproval) s.load(AllowanceApproval.class, id);
        s.flush();
        s.close();
        return allowanceApproval;
    }
    
    public AllowanceApproval approveAllowance(int id, String note, Integer status){
        Session s=Connection.getSessionFactory().openSession();
        AllowanceApproval approval=(AllowanceApproval) s.load(AllowanceApproval.class, id);
        Transaction t=s.beginTransaction();
        try {
           approval.setApprovedtime(new Date());
           approval.setNote(note);
           approval.setStatus(status);
           s.update(t);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approval;
    }

    public OtherApprovals saveOtherApproval(Date date, DepartmentsHasDesignation dhd, String note, Other other,
            Integer status) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        OtherApprovals approvals = new OtherApprovals();
        try {
            approvals.setApprovedtime(date);
            System.out.println(dhd.getIdDepartmentsHasDesignation() + "");
            approvals.setDepartmentsHasDesignation(dhd);
            approvals.setNote(note);
            approvals.setOther(other);
            approvals.setStatus(status);
            s.save(approvals);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approvals;
    }
    public OtherApprovals getOtherApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        OtherApprovals otherApproval=(OtherApprovals) s.load(OtherApprovals.class, id);
        s.flush();
        s.close();
        return otherApproval;
    }
    public OtherApprovals approveOther(int id, String note, Integer status){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        OtherApprovals approvals=(OtherApprovals) s.load(OtherApprovals.class, id);
        try {
            approvals.setApprovedtime(new Date());
            approvals.setNote(note);
            approvals.setStatus(status);
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        }
        t.commit();
        s.flush();
        s.close();
        return approvals;
    }

    public List<PaymentApproval> checkPayementApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(PaymentApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("departmentsHasDesignationHasPaymentsId"));
        List<PaymentApproval> approvals = c.list();
        s.close();
        return approvals;
    }
    
    public LeaveApproval getLeaveApproval(int id){
        Session s=Connection.getSessionFactory().openSession();
        LeaveApproval la=(LeaveApproval) s.load(LeaveApproval.class, id);
        s.close();
        return la;
    }

    public List<LeaveApproval> checkLeaveApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(LeaveApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("leaveHasDepartmentsHasDesignationId"));
        List<LeaveApproval> approvals = c.list();
        s.close();
        return approvals;
    }

    public List<ProjectsApproval> checkProjectsApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(ProjectsApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("projectsHasDepartmentsHasDesignationId"));
        List<ProjectsApproval> approvals = c.list();
        s.close();
        return approvals;
    }

    public List<PromotionApproval> checkPromotionApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(PromotionApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("promotionsHasDepartmentsHasDesignationId"));
        List<PromotionApproval> approvals = c.list();
        s.close();
        return approvals;
    }

    public List<ProjectTasksApproval> checkProjectTaskApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(ProjectTasksApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("projectTasksHasDepartmentsHasDesignationId"));
        List<ProjectTasksApproval> approvals = c.list();
        s.close();
        return approvals;
    }

    public List<OtherApprovals> checkOtherApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(OtherApprovals.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("otherHasDepartmentsHasDesignationId"));
        List<OtherApprovals> approvals = c.list();
        s.close();
        return approvals;
    }

    public List<AllowanceApproval> checkAllowanceApproval(DepartmentsHasDesignation dhd, boolean checkOnly) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(AllowanceApproval.class);
        c.add(Restrictions.eq("departmentsHasDesignation", dhd));
        if (checkOnly) {
            c.add(Restrictions.eq("status", 0));
        }
        c.addOrder(Order.desc("employersHasAllowancesHasDepartmentsHasDesignationId"));
        List<AllowanceApproval> approvals = c.list();
        s.close();
        return approvals;
    }

}
