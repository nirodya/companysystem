package com.actop.db;
// Generated Jul 23, 2015 9:46:44 AM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ProjectTasksApproval generated by hbm2java
 */
@Entity
@Table(name="project_tasks_approval"
    ,catalog="actop_system"
)
public class ProjectTasksApproval  implements java.io.Serializable {


     private Integer projectTasksHasDepartmentsHasDesignationId;
     private DepartmentsHasDesignation departmentsHasDesignation;
     private ProjectTasks projectTasks;
     private Date approvedtime;
     private Integer status;
     private String note;

    public ProjectTasksApproval() {
    }

	
    public ProjectTasksApproval(DepartmentsHasDesignation departmentsHasDesignation, ProjectTasks projectTasks) {
        this.departmentsHasDesignation = departmentsHasDesignation;
        this.projectTasks = projectTasks;
    }
    public ProjectTasksApproval(DepartmentsHasDesignation departmentsHasDesignation, ProjectTasks projectTasks, Date approvedtime, Integer status, String note) {
       this.departmentsHasDesignation = departmentsHasDesignation;
       this.projectTasks = projectTasks;
       this.approvedtime = approvedtime;
       this.status = status;
       this.note = note;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="PROJECT_TASKS_has_DEPARTMENTS_has_DESIGNATION_ID", unique=true, nullable=false)
    public Integer getProjectTasksHasDepartmentsHasDesignationId() {
        return this.projectTasksHasDepartmentsHasDesignationId;
    }
    
    public void setProjectTasksHasDepartmentsHasDesignationId(Integer projectTasksHasDepartmentsHasDesignationId) {
        this.projectTasksHasDepartmentsHasDesignationId = projectTasksHasDepartmentsHasDesignationId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="DEPARTMENTS_has_DESIGNATION_ID_DEPARTMENTS_has_DESIGNATION", nullable=false)
    public DepartmentsHasDesignation getDepartmentsHasDesignation() {
        return this.departmentsHasDesignation;
    }
    
    public void setDepartmentsHasDesignation(DepartmentsHasDesignation departmentsHasDesignation) {
        this.departmentsHasDesignation = departmentsHasDesignation;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="PROJECT_TASKS_ID_PROJECT_TASKS", nullable=false)
    public ProjectTasks getProjectTasks() {
        return this.projectTasks;
    }
    
    public void setProjectTasks(ProjectTasks projectTasks) {
        this.projectTasks = projectTasks;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="APPROVEDTIME", length=19)
    public Date getApprovedtime() {
        return this.approvedtime;
    }
    
    public void setApprovedtime(Date approvedtime) {
        this.approvedtime = approvedtime;
    }

    
    @Column(name="STATUS")
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }

    
    @Column(name="NOTE")
    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }




}


