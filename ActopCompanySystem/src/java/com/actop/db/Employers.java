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
 * Employers generated by hbm2java
 */
@Entity
@Table(name="employers"
    ,catalog="actop_system"
)
public class Employers  implements java.io.Serializable {


     private Integer idEmployers;
     private byte[] fullName;
     private byte[] callingName;
     private byte[] address1;
     private byte[] address2;
     private byte[] city;
     private byte[] district;
     private byte[] mobileNo;
     private byte[] homeNo;
     private byte[] epf;
     private byte[] imgPath;
     private byte[] salary;
     private Date appointedDate;
     private byte[] appointedType;
     private byte[] reportBy;
     private byte[] nic;
     private byte[] bloodGroup;
     private byte[] passport;
     private byte[] licenseNo;
     private byte[] branch;
     private byte[] officeEmail;
     private byte[] personalEmail;
     private byte[] officeNo;
     private byte[] extensionNo;
     private Integer status;
     private Date resigningDate;
     private byte[] paymetsBank;
     private byte[] paymetsBankBranch;
     private byte[] paymetsBankAccountNumber;
     private byte[] paymetsBankPersonName;
     private Set<Promotions> promotionses = new HashSet<Promotions>(0);
     private Set<Attendance> attendances = new HashSet<Attendance>(0);
     private Set<ProjectTasks> projectTaskses = new HashSet<ProjectTasks>(0);
     private Set<Leave> leaves = new HashSet<Leave>(0);
     private Set<Projects> projectses = new HashSet<Projects>(0);
     private Set<UserLogin> userLogins = new HashSet<UserLogin>(0);
     private Set<DepartmentsHasDesignation> departmentsHasDesignations = new HashSet<DepartmentsHasDesignation>(0);
     private Set<Payments> paymentses = new HashSet<Payments>(0);
     private Set<EmployersHasAllowances> employersHasAllowanceses = new HashSet<EmployersHasAllowances>(0);
     private Set<Other> others = new HashSet<Other>(0);

    public Employers() {
    }

    public Employers(byte[] fullName, byte[] callingName, byte[] address1, byte[] address2, byte[] city, byte[] district, byte[] mobileNo, byte[] homeNo, byte[] epf, byte[] imgPath, byte[] salary, Date appointedDate, byte[] appointedType, byte[] reportBy, byte[] nic, byte[] bloodGroup, byte[] passport, byte[] licenseNo, byte[] branch, byte[] officeEmail, byte[] personalEmail, byte[] officeNo, byte[] extensionNo, Integer status, Date resigningDate, byte[] paymetsBank, byte[] paymetsBankBranch, byte[] paymetsBankAccountNumber, byte[] paymetsBankPersonName, Set<Promotions> promotionses, Set<Attendance> attendances, Set<ProjectTasks> projectTaskses, Set<Leave> leaves, Set<Projects> projectses, Set<UserLogin> userLogins, Set<DepartmentsHasDesignation> departmentsHasDesignations, Set<Payments> paymentses, Set<EmployersHasAllowances> employersHasAllowanceses, Set<Other> others) {
       this.fullName = fullName;
       this.callingName = callingName;
       this.address1 = address1;
       this.address2 = address2;
       this.city = city;
       this.district = district;
       this.mobileNo = mobileNo;
       this.homeNo = homeNo;
       this.epf = epf;
       this.imgPath = imgPath;
       this.salary = salary;
       this.appointedDate = appointedDate;
       this.appointedType = appointedType;
       this.reportBy = reportBy;
       this.nic = nic;
       this.bloodGroup = bloodGroup;
       this.passport = passport;
       this.licenseNo = licenseNo;
       this.branch = branch;
       this.officeEmail = officeEmail;
       this.personalEmail = personalEmail;
       this.officeNo = officeNo;
       this.extensionNo = extensionNo;
       this.status = status;
       this.resigningDate = resigningDate;
       this.paymetsBank = paymetsBank;
       this.paymetsBankBranch = paymetsBankBranch;
       this.paymetsBankAccountNumber = paymetsBankAccountNumber;
       this.paymetsBankPersonName = paymetsBankPersonName;
       this.promotionses = promotionses;
       this.attendances = attendances;
       this.projectTaskses = projectTaskses;
       this.leaves = leaves;
       this.projectses = projectses;
       this.userLogins = userLogins;
       this.departmentsHasDesignations = departmentsHasDesignations;
       this.paymentses = paymentses;
       this.employersHasAllowanceses = employersHasAllowanceses;
       this.others = others;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_EMPLOYERS", unique=true, nullable=false)
    public Integer getIdEmployers() {
        return this.idEmployers;
    }
    
    public void setIdEmployers(Integer idEmployers) {
        this.idEmployers = idEmployers;
    }

    
    @Column(name="FULL_NAME")
    public byte[] getFullName() {
        return this.fullName;
    }
    
    public void setFullName(byte[] fullName) {
        this.fullName = fullName;
    }

    
    @Column(name="CALLING_NAME")
    public byte[] getCallingName() {
        return this.callingName;
    }
    
    public void setCallingName(byte[] callingName) {
        this.callingName = callingName;
    }

    
    @Column(name="ADDRESS1")
    public byte[] getAddress1() {
        return this.address1;
    }
    
    public void setAddress1(byte[] address1) {
        this.address1 = address1;
    }

    
    @Column(name="ADDRESS2")
    public byte[] getAddress2() {
        return this.address2;
    }
    
    public void setAddress2(byte[] address2) {
        this.address2 = address2;
    }

    
    @Column(name="CITY")
    public byte[] getCity() {
        return this.city;
    }
    
    public void setCity(byte[] city) {
        this.city = city;
    }

    
    @Column(name="DISTRICT")
    public byte[] getDistrict() {
        return this.district;
    }
    
    public void setDistrict(byte[] district) {
        this.district = district;
    }

    
    @Column(name="MOBILE_NO")
    public byte[] getMobileNo() {
        return this.mobileNo;
    }
    
    public void setMobileNo(byte[] mobileNo) {
        this.mobileNo = mobileNo;
    }

    
    @Column(name="HOME_NO")
    public byte[] getHomeNo() {
        return this.homeNo;
    }
    
    public void setHomeNo(byte[] homeNo) {
        this.homeNo = homeNo;
    }

    
    @Column(name="EPF")
    public byte[] getEpf() {
        return this.epf;
    }
    
    public void setEpf(byte[] epf) {
        this.epf = epf;
    }

    
    @Column(name="IMG_PATH")
    public byte[] getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(byte[] imgPath) {
        this.imgPath = imgPath;
    }

    
    @Column(name="SALARY")
    public byte[] getSalary() {
        return this.salary;
    }
    
    public void setSalary(byte[] salary) {
        this.salary = salary;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="APPOINTED_DATE", length=10)
    public Date getAppointedDate() {
        return this.appointedDate;
    }
    
    public void setAppointedDate(Date appointedDate) {
        this.appointedDate = appointedDate;
    }

    
    @Column(name="APPOINTED_TYPE")
    public byte[] getAppointedType() {
        return this.appointedType;
    }
    
    public void setAppointedType(byte[] appointedType) {
        this.appointedType = appointedType;
    }

    
    @Column(name="REPORT_BY")
    public byte[] getReportBy() {
        return this.reportBy;
    }
    
    public void setReportBy(byte[] reportBy) {
        this.reportBy = reportBy;
    }

    
    @Column(name="NIC")
    public byte[] getNic() {
        return this.nic;
    }
    
    public void setNic(byte[] nic) {
        this.nic = nic;
    }

    
    @Column(name="BLOOD_GROUP")
    public byte[] getBloodGroup() {
        return this.bloodGroup;
    }
    
    public void setBloodGroup(byte[] bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    
    @Column(name="PASSPORT")
    public byte[] getPassport() {
        return this.passport;
    }
    
    public void setPassport(byte[] passport) {
        this.passport = passport;
    }

    
    @Column(name="LICENSE_NO")
    public byte[] getLicenseNo() {
        return this.licenseNo;
    }
    
    public void setLicenseNo(byte[] licenseNo) {
        this.licenseNo = licenseNo;
    }

    
    @Column(name="BRANCH")
    public byte[] getBranch() {
        return this.branch;
    }
    
    public void setBranch(byte[] branch) {
        this.branch = branch;
    }

    
    @Column(name="OFFICE_EMAIL")
    public byte[] getOfficeEmail() {
        return this.officeEmail;
    }
    
    public void setOfficeEmail(byte[] officeEmail) {
        this.officeEmail = officeEmail;
    }

    
    @Column(name="PERSONAL_EMAIL")
    public byte[] getPersonalEmail() {
        return this.personalEmail;
    }
    
    public void setPersonalEmail(byte[] personalEmail) {
        this.personalEmail = personalEmail;
    }

    
    @Column(name="OFFICE_NO")
    public byte[] getOfficeNo() {
        return this.officeNo;
    }
    
    public void setOfficeNo(byte[] officeNo) {
        this.officeNo = officeNo;
    }

    
    @Column(name="EXTENSION_NO")
    public byte[] getExtensionNo() {
        return this.extensionNo;
    }
    
    public void setExtensionNo(byte[] extensionNo) {
        this.extensionNo = extensionNo;
    }

    
    @Column(name="STATUS")
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="RESIGNING_DATE", length=10)
    public Date getResigningDate() {
        return this.resigningDate;
    }
    
    public void setResigningDate(Date resigningDate) {
        this.resigningDate = resigningDate;
    }

    
    @Column(name="PAYMETS_BANK")
    public byte[] getPaymetsBank() {
        return this.paymetsBank;
    }
    
    public void setPaymetsBank(byte[] paymetsBank) {
        this.paymetsBank = paymetsBank;
    }

    
    @Column(name="PAYMETS_BANK_BRANCH")
    public byte[] getPaymetsBankBranch() {
        return this.paymetsBankBranch;
    }
    
    public void setPaymetsBankBranch(byte[] paymetsBankBranch) {
        this.paymetsBankBranch = paymetsBankBranch;
    }

    
    @Column(name="PAYMETS_BANK_ACCOUNT_NUMBER")
    public byte[] getPaymetsBankAccountNumber() {
        return this.paymetsBankAccountNumber;
    }
    
    public void setPaymetsBankAccountNumber(byte[] paymetsBankAccountNumber) {
        this.paymetsBankAccountNumber = paymetsBankAccountNumber;
    }

    
    @Column(name="PAYMETS_BANK_PERSON_NAME")
    public byte[] getPaymetsBankPersonName() {
        return this.paymetsBankPersonName;
    }
    
    public void setPaymetsBankPersonName(byte[] paymetsBankPersonName) {
        this.paymetsBankPersonName = paymetsBankPersonName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<Promotions> getPromotionses() {
        return this.promotionses;
    }
    
    public void setPromotionses(Set<Promotions> promotionses) {
        this.promotionses = promotionses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<Attendance> getAttendances() {
        return this.attendances;
    }
    
    public void setAttendances(Set<Attendance> attendances) {
        this.attendances = attendances;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<ProjectTasks> getProjectTaskses() {
        return this.projectTaskses;
    }
    
    public void setProjectTaskses(Set<ProjectTasks> projectTaskses) {
        this.projectTaskses = projectTaskses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<Leave> getLeaves() {
        return this.leaves;
    }
    
    public void setLeaves(Set<Leave> leaves) {
        this.leaves = leaves;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<Projects> getProjectses() {
        return this.projectses;
    }
    
    public void setProjectses(Set<Projects> projectses) {
        this.projectses = projectses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<UserLogin> getUserLogins() {
        return this.userLogins;
    }
    
    public void setUserLogins(Set<UserLogin> userLogins) {
        this.userLogins = userLogins;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<DepartmentsHasDesignation> getDepartmentsHasDesignations() {
        return this.departmentsHasDesignations;
    }
    
    public void setDepartmentsHasDesignations(Set<DepartmentsHasDesignation> departmentsHasDesignations) {
        this.departmentsHasDesignations = departmentsHasDesignations;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<Payments> getPaymentses() {
        return this.paymentses;
    }
    
    public void setPaymentses(Set<Payments> paymentses) {
        this.paymentses = paymentses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<EmployersHasAllowances> getEmployersHasAllowanceses() {
        return this.employersHasAllowanceses;
    }
    
    public void setEmployersHasAllowanceses(Set<EmployersHasAllowances> employersHasAllowanceses) {
        this.employersHasAllowanceses = employersHasAllowanceses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="employers")
    public Set<Other> getOthers() {
        return this.others;
    }
    
    public void setOthers(Set<Other> others) {
        this.others = others;
    }




}


