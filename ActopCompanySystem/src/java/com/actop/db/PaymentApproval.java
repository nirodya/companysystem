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
 * PaymentApproval generated by hbm2java
 */
@Entity
@Table(name="payment_approval"
    ,catalog="actop_system"
)
public class PaymentApproval  implements java.io.Serializable {


     private Integer departmentsHasDesignationHasPaymentsId;
     private DepartmentsHasDesignation departmentsHasDesignation;
     private Payments payments;
     private Date approvedtime;
     private Integer status;
     private String note;

    public PaymentApproval() {
    }

	
    public PaymentApproval(DepartmentsHasDesignation departmentsHasDesignation, Payments payments) {
        this.departmentsHasDesignation = departmentsHasDesignation;
        this.payments = payments;
    }
    public PaymentApproval(DepartmentsHasDesignation departmentsHasDesignation, Payments payments, Date approvedtime, Integer status, String note) {
       this.departmentsHasDesignation = departmentsHasDesignation;
       this.payments = payments;
       this.approvedtime = approvedtime;
       this.status = status;
       this.note = note;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="DEPARTMENTS_has_DESIGNATION_has_PAYMENTS_ID", unique=true, nullable=false)
    public Integer getDepartmentsHasDesignationHasPaymentsId() {
        return this.departmentsHasDesignationHasPaymentsId;
    }
    
    public void setDepartmentsHasDesignationHasPaymentsId(Integer departmentsHasDesignationHasPaymentsId) {
        this.departmentsHasDesignationHasPaymentsId = departmentsHasDesignationHasPaymentsId;
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
    @JoinColumn(name="PAYMENTS_ID_PAYMENTS", nullable=false)
    public Payments getPayments() {
        return this.payments;
    }
    
    public void setPayments(Payments payments) {
        this.payments = payments;
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

    
    @Column(name="note")
    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }




}

