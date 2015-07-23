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
 * LeaveApproval generated by hbm2java
 */
@Entity
@Table(name="leave_approval"
    ,catalog="actop_system"
)
public class LeaveApproval  implements java.io.Serializable {


     private Integer leaveHasDepartmentsHasDesignationId;
     private DepartmentsHasDesignation departmentsHasDesignation;
     private Leave leave;
     private Date approvedtime;
     private Integer status;
     private String note;

    public LeaveApproval() {
    }

	
    public LeaveApproval(DepartmentsHasDesignation departmentsHasDesignation, Leave leave) {
        this.departmentsHasDesignation = departmentsHasDesignation;
        this.leave = leave;
    }
    public LeaveApproval(DepartmentsHasDesignation departmentsHasDesignation, Leave leave, Date approvedtime, Integer status, String note) {
       this.departmentsHasDesignation = departmentsHasDesignation;
       this.leave = leave;
       this.approvedtime = approvedtime;
       this.status = status;
       this.note = note;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="LEAVE_has_DEPARTMENTS_has_DESIGNATION_ID", unique=true, nullable=false)
    public Integer getLeaveHasDepartmentsHasDesignationId() {
        return this.leaveHasDepartmentsHasDesignationId;
    }
    
    public void setLeaveHasDepartmentsHasDesignationId(Integer leaveHasDepartmentsHasDesignationId) {
        this.leaveHasDepartmentsHasDesignationId = leaveHasDepartmentsHasDesignationId;
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
    @JoinColumn(name="LEAVE_ID_LEAVE", nullable=false)
    public Leave getLeave() {
        return this.leave;
    }
    
    public void setLeave(Leave leave) {
        this.leave = leave;
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


