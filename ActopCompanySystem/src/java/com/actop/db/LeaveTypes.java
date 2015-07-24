package com.actop.db;
// Generated Jul 24, 2015 12:22:50 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LeaveTypes generated by hbm2java
 */
@Entity
@Table(name="leave_types"
    ,catalog="actop_system"
)
public class LeaveTypes  implements java.io.Serializable {


     private Integer idLeaveTypes;
     private String leaveType;

    public LeaveTypes() {
    }

    public LeaveTypes(String leaveType) {
       this.leaveType = leaveType;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_LEAVE_TYPES", unique=true, nullable=false)
    public Integer getIdLeaveTypes() {
        return this.idLeaveTypes;
    }
    
    public void setIdLeaveTypes(Integer idLeaveTypes) {
        this.idLeaveTypes = idLeaveTypes;
    }

    
    @Column(name="LEAVE_TYPE", length=45)
    public String getLeaveType() {
        return this.leaveType;
    }
    
    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }




}


