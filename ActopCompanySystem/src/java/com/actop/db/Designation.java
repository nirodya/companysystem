package com.actop.db;
// Generated Jul 24, 2015 12:22:50 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Designation generated by hbm2java
 */
@Entity
@Table(name="designation"
    ,catalog="actop_system"
)
public class Designation  implements java.io.Serializable {


     private Integer idDesignation;
     private byte[] designation;
     private Double basicSalary;
     private Date promotionPeriod;
     private Integer status;
     private Set<EmployersHasAllowances> employersHasAllowanceses = new HashSet<EmployersHasAllowances>(0);
     private Set<DepartmentsHasDesignation> departmentsHasDesignations = new HashSet<DepartmentsHasDesignation>(0);

    public Designation() {
    }

    public Designation(byte[] designation, Double basicSalary, Date promotionPeriod, Integer status, Set<EmployersHasAllowances> employersHasAllowanceses, Set<DepartmentsHasDesignation> departmentsHasDesignations) {
       this.designation = designation;
       this.basicSalary = basicSalary;
       this.promotionPeriod = promotionPeriod;
       this.status = status;
       this.employersHasAllowanceses = employersHasAllowanceses;
       this.departmentsHasDesignations = departmentsHasDesignations;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_DESIGNATION", unique=true, nullable=false)
    public Integer getIdDesignation() {
        return this.idDesignation;
    }
    
    public void setIdDesignation(Integer idDesignation) {
        this.idDesignation = idDesignation;
    }

    
    @Column(name="DESIGNATION")
    public byte[] getDesignation() {
        return this.designation;
    }
    
    public void setDesignation(byte[] designation) {
        this.designation = designation;
    }

    
    @Column(name="BASIC_SALARY", precision=22, scale=0)
    public Double getBasicSalary() {
        return this.basicSalary;
    }
    
    public void setBasicSalary(Double basicSalary) {
        this.basicSalary = basicSalary;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="PROMOTION_PERIOD", length=10)
    public Date getPromotionPeriod() {
        return this.promotionPeriod;
    }
    
    public void setPromotionPeriod(Date promotionPeriod) {
        this.promotionPeriod = promotionPeriod;
    }

    
    @Column(name="STATUS")
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="designation")
    public Set<EmployersHasAllowances> getEmployersHasAllowanceses() {
        return this.employersHasAllowanceses;
    }
    
    public void setEmployersHasAllowanceses(Set<EmployersHasAllowances> employersHasAllowanceses) {
        this.employersHasAllowanceses = employersHasAllowanceses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="designation")
    public Set<DepartmentsHasDesignation> getDepartmentsHasDesignations() {
        return this.departmentsHasDesignations;
    }
    
    public void setDepartmentsHasDesignations(Set<DepartmentsHasDesignation> departmentsHasDesignations) {
        this.departmentsHasDesignations = departmentsHasDesignations;
    }




}


