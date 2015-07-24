/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Clients;
import com.actop.db.Employers;
import com.actop.db.ProjectTaskStates;
import com.actop.db.ProjectTasks;
import com.actop.db.Projects;
import com.actop.db.TaskDetails;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class ProjectsManagement {

    public byte[] convertToBytes(String word) {
        byte[] convertedText = null;
        if (word != null) {
            convertedText = word.getBytes();
        }
        return convertedText;
    }

    public Clients saveClients(String address, String cantactPersonDepartment, String contactNo,
            String contactPerson, String contactPersonDesignation, String contactPersonEmail,
            String contactPersonNo, String email, String name) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Clients c = new Clients();
        try {
            c.setAddress(convertToBytes(address));
            c.setCantactPersonDepartment(convertToBytes(cantactPersonDepartment));
            c.setContactNo(convertToBytes(contactNo));
            c.setContactPerson(convertToBytes(contactPerson));
            c.setContactPersonDesignation(convertToBytes(contactPersonDesignation));
            c.setContactPersonEmail(convertToBytes(contactPersonEmail));
            c.setContactPersonNo(convertToBytes(contactPersonNo));
            c.setEmail(convertToBytes(email));
            c.setName(convertToBytes(name));
            s.save(c);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return c;
    }

    public List<Clients> getAllClients() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(Clients.class);
        List<Clients> l = c.list();
        s.flush();
        s.close();
        return l;
    }

    public Clients loadClients(int id) {
        Session s = Connection.getSessionFactory().openSession();
        Clients c = (Clients) s.load(Clients.class, id);
        s.flush();
        s.close();
        return c;
    }

    public Projects saveProject(Date actualenddate, Date actualstartdate, String clientNote, Clients client,
            Employers employer, Date endDate, String projectDescription, String projectManager, String projectName,
            String projectstatus, String projectType, Date startDate) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Projects p = new Projects();
        try {
            p.setActualEndDate(actualenddate);
            p.setActualStartDate(actualstartdate);
            p.setClientNote(convertToBytes(clientNote));
            p.setClients(client);
            p.setEmployers(employer);
            p.setEndDate(endDate);
            p.setProjectDescription(convertToBytes(projectDescription));
            p.setProjectManager(convertToBytes(projectManager));
            p.setProjectName(convertToBytes(projectName));
            p.setProjectStatus(convertToBytes(projectstatus));
            p.setProjectType(convertToBytes(projectType));
            p.setStartDate(startDate);
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
    public Projects loadProjects(int pid){
        Session s = Connection.getSessionFactory().openSession();
        Projects p=(Projects) s.load(Projects.class, pid);
        s.flush();
        s.close();
        return p;
    }
    public List<Projects> getAllProjects(){
        Session s = Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Projects.class);
        List<Projects> l=c.list();
        s.flush();
        s.close();
        return l;
    }

    public ProjectTasks saveProjectTasks(Employers emp, Date projectTaskAssign, String projectTaskAssingBy,
            Date projectTaskEnd, String projectTaskNote, Integer priority, Date projectTaskStart, 
            String projectTaskStates, String projectTaskType, Projects projects) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectTasks projectTasks = new ProjectTasks();
        try {
            projectTasks.setEmployers(emp);
            projectTasks.setProjectTaskAssing(projectTaskAssign);
            projectTasks.setProjectTaskAssingBy(convertToBytes(projectTaskAssingBy));
            projectTasks.setProjectTaskEnd(projectTaskEnd);
            projectTasks.setProjectTaskNote(projectTaskNote);
            projectTasks.setProjectTaskPriority(priority);
            projectTasks.setProjectTaskStart(projectTaskStart);
            projectTasks.setProjectTaskStates(convertToBytes(projectTaskStates));
            projectTasks.setProjectTaskType(convertToBytes(projectTaskType));
            projectTasks.setProjects(projects);
            s.save(projectTasks);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return projectTasks;
    }
    
    public ProjectTasks loadProjectTasks(int taskid){
        Session s=Connection.getSessionFactory().openSession();
        ProjectTasks projectTasks=(ProjectTasks) s.load(ProjectTasks.class, taskid);
        s.flush();
        s.close();
        return projectTasks;
    }

    public ProjectTaskStates saveProjectTaskStatus(ProjectTasks projectTasks, String topic, 
            String topicActualTime, Date topicEnd, String topicEstimateTime, String topicNote, 
            Date topicStartDate, String topicStates) {
        Session s = Connection.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProjectTaskStates projectTaskStates = new ProjectTaskStates();
        try {
            projectTaskStates.setProjectTasks(projectTasks);
            projectTaskStates.setTopic(convertToBytes(topic));
            projectTaskStates.setTopicActualTime(convertToBytes(topicActualTime));
            projectTaskStates.setTopicEnd(topicEnd);
            projectTaskStates.setTopicEstimateTime(convertToBytes(topicEstimateTime));
            projectTaskStates.setTopicNote(topicNote);
            projectTaskStates.setTopicStart(topicStartDate);
            projectTaskStates.setTopicStates(convertToBytes(topicStates));
            s.save(projectTaskStates);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return projectTaskStates;
    }
    
    public TaskDetails saveTaskDetails(ProjectTaskStates prostatus, String actualTime, String calculatedTime, 
            Date detailsDate, Date detailsEndDate, String detailsNote, Date detailsStartDate, String detailsTopic){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        TaskDetails details=new TaskDetails();
        try {
           details.setProjectTaskStates(prostatus);
           details.setTaskDetailsActualTime(convertToBytes(actualTime));
           details.setTaskDetailsCalculateTime(convertToBytes(calculatedTime));
           details.setTaskDetailsDate(detailsDate);
           details.setTaskDetailsEnd(detailsEndDate);
           details.setTaskDetailsNote(convertToBytes(detailsNote));
           details.setTaskDetailsStart(detailsStartDate);
           details.setTaskDetailsTopic(convertToBytes(detailsTopic));
           s.save(details);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return details;
    }

}
