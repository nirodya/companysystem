package com.actop.db;
// Generated Jul 23, 2015 9:46:44 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Leave generated by hbm2java
 */
@Entity
@Table(name="leave"
    ,catalog="actop_system"
)
public class Leave  implements java.io.Serializable {


     private Integer idLeave;
     private Employers employers;
     private byte[] leaveType;
     private byte[] noOfDays;
     private Date startDate;
     private Date endDate;
     private byte[] substitute;
     private Date substituteApprove;
     private Date starttime;
     private Date endtime;
     private Set<LeaveApproval> leaveApprovals = new HashSet<LeaveApproval>(0);

    public Leave() {
    }

	
    public Leave(Employers employers) {
        this.employers = employers;
    }
    public Leave(Employers employers, byte[] leaveType, byte[] noOfDays, Date startDate, Date endDate, byte[] substitute, Date substituteApprove, Date starttime, Date endtime, Set<LeaveApproval> leaveApprovals) {
       this.employers = employers;
       this.leaveType = leaveType;
       this.noOfDays = noOfDays;
       this.startDate = startDate;
       this.endDate = endDate;
       this.substitute = substitute;
       this.substituteApprove = substituteApprove;
       this.starttime = starttime;
       this.endtime = endtime;
       this.leaveApprovals = leaveApprovals;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_LEAVE", unique=true, nullable=false)
    public Integer getIdLeave() {
        return this.idLeave;
    }
    
    public void setIdLeave(Integer idLeave) {
        this.idLeave = idLeave;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="EMPLOYERS_ID_EMPLOYERS", nullable=false)
    public Employers getEmployers() {
        return this.employers;
    }
    
    public void setEmployers(Employers employers) {
        this.employers = employers;
    }

    
    @Column(name="LEAVE_TYPE")
    public byte[] getLeaveType() {
        return this.leaveType;
    }
    
    public void setLeaveType(byte[] leaveType) {
        this.leaveType = leaveType;
    }

    
    @Column(name="NO_OF_DAYS")
    public byte[] getNoOfDays() {
        return this.noOfDays;
    }
    
    public void setNoOfDays(byte[] noOfDays) {
        this.noOfDays = noOfDays;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="START_DATE", length=10)
    public Date getStartDate() {
        return this.startDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="END_DATE", length=10)
    public Date getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    
    @Column(name="SUBSTITUTE")
    public byte[] getSubstitute() {
        return this.substitute;
    }
    
    public void setSubstitute(byte[] substitute) {
        this.substitute = substitute;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="SUBSTITUTE_APPROVE", length=19)
    public Date getSubstituteApprove() {
        return this.substituteApprove;
    }
    
    public void setSubstituteApprove(Date substituteApprove) {
        this.substituteApprove = substituteApprove;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="STARTTIME", length=8)
    public Date getStarttime() {
        return this.starttime;
    }
    
    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="ENDTIME", length=8)
    public Date getEndtime() {
        return this.endtime;
    }
    
    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="leave")
    public Set<LeaveApproval> getLeaveApprovals() {
        return this.leaveApprovals;
    }
    
    public void setLeaveApprovals(Set<LeaveApproval> leaveApprovals) {
        this.leaveApprovals = leaveApprovals;
    }




}


