/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Allowances;
import com.actop.db.Departments;
import com.actop.db.DepartmentsHasDesignation;
import com.actop.db.Designation;
import com.actop.db.Employers;
import com.actop.db.EmployersHasAllowances;
import com.actop.db.UserLogin;
import java.io.Serializable;
import java.math.MathContext;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author U Computers
 */
public class UserManagement {
    
    public byte[] convertToBytes(String word){
        byte[] convertedText=word.getBytes();
        return convertedText;
    }
    
    public Employers saveEmployers(String sFullName, String sCallingName, String address1, String address2, 
            Date appointedDate, String appointedType, String bloodGroup, String branch, String callingName, 
            String city, String district, String epf, String extensionNo, String homeNo, 
            String imgPath, String licenseNo, String mobileNo, String nic, String officeEmail, String officeNo, 
            String passport, String paymetsBank, String paymetsBankAccountNumber, String paymetsBankBranch, 
            String paymetsBankPersonName, String personalEmail, String reportBy, Date resigningDate, String salary){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        Employers e=new Employers();
        try {
            e.setAddress1(convertToBytes(address1));
            e.setAddress2(convertToBytes(address2));
            e.setAppointedDate(appointedDate);
            e.setAppointedType(convertToBytes(appointedType));
            e.setBloodGroup(convertToBytes(bloodGroup));
            e.setBranch(convertToBytes(branch));
            e.setCallingName(convertToBytes(callingName));
            e.setCity(convertToBytes(city));
            e.setDistrict(convertToBytes(district));
            e.setEpf(convertToBytes(epf));
            e.setExtensionNo(convertToBytes(extensionNo));
            e.setFullName(convertToBytes(sFullName));
            e.setHomeNo(convertToBytes(homeNo));
            e.setImgPath(convertToBytes(imgPath));
            e.setLicenseNo(convertToBytes(licenseNo));
            e.setMobileNo(convertToBytes(mobileNo));
            e.setNic(convertToBytes(nic));
            e.setOfficeEmail(convertToBytes(officeEmail));
            e.setOfficeNo(convertToBytes(officeNo));
            e.setPassport(convertToBytes(passport));
            e.setPaymetsBank(convertToBytes(paymetsBank));
            e.setPaymetsBankAccountNumber(convertToBytes(paymetsBankAccountNumber));
            e.setPaymetsBankBranch(convertToBytes(paymetsBankBranch));
            e.setPaymetsBankPersonName(convertToBytes(paymetsBankPersonName));
            e.setPersonalEmail(convertToBytes(personalEmail));
            e.setReportBy(convertToBytes(reportBy));
            e.setResigningDate(resigningDate);
            e.setSalary(convertToBytes(salary));
            e.setStatus(1);
            s.save(e);
            
        } catch (Exception ex) {
            t.rollback();
            ex.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return e;
    }
    public Employers updateEmployers(int empID,String sFullName, String sCallingName, String address1, String address2, 
            Date appointedDate, String appointedType, String bloodGroup, String branch, String callingName, 
            String city, String district, String epf, String extensionNo, String homeNo, 
            String imgPath, String licenseNo, String mobileNo, String nic, String officeEmail, String officeNo, 
            String passport, String paymetsBank, String paymetsBankAccountNumber, String paymetsBankBranch, 
            String paymetsBankPersonName, String personalEmail, String reportBy, Date resigningDate, String salary){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        Employers e=(Employers) s.load(Employers.class, empID);
        try {
            
            e.setAddress1(convertToBytes(address1));
            e.setAddress2(convertToBytes(address2));
            e.setAppointedDate(appointedDate);
            e.setAppointedType(convertToBytes(appointedType));
            e.setBloodGroup(convertToBytes(bloodGroup));
            e.setBranch(convertToBytes(branch));
            e.setCallingName(convertToBytes(callingName));
            e.setCity(convertToBytes(city));
            e.setDistrict(convertToBytes(district));
            e.setEpf(convertToBytes(epf));
            e.setExtensionNo(convertToBytes(extensionNo));
            e.setFullName(convertToBytes(sFullName));
            e.setHomeNo(convertToBytes(homeNo));
            
            e.setLicenseNo(convertToBytes(licenseNo));
            e.setMobileNo(convertToBytes(mobileNo));
            e.setNic(convertToBytes(nic));
            e.setOfficeEmail(convertToBytes(officeEmail));
            e.setOfficeNo(convertToBytes(officeNo));
            e.setPassport(convertToBytes(passport));
            e.setPaymetsBank(convertToBytes(paymetsBank));
            e.setPaymetsBankAccountNumber(convertToBytes(paymetsBankAccountNumber));
            e.setPaymetsBankBranch(convertToBytes(paymetsBankBranch));
            e.setPaymetsBankPersonName(convertToBytes(paymetsBankPersonName));
            e.setPersonalEmail(convertToBytes(personalEmail));
            e.setReportBy(convertToBytes(reportBy));
            e.setResigningDate(resigningDate);
            e.setSalary(convertToBytes(salary));
            e.setStatus(1);
            s.save(e);
            
        } catch (Exception ex) {
            t.rollback();
            ex.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return e;
    }
    public UserLogin saveUserLogin(String answer1, String answer2, Employers employer, 
            String pw, String securityq1, String securityq2, String un){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        UserLogin ul=new UserLogin();
        try {
            ul.setAnswer1(convertToBytes(answer1));
            ul.setAnswer2(convertToBytes(answer2));
            ul.setEmployers(employer);
            ul.setPw(convertToBytes(pw));
            ul.setSecurityq1(convertToBytes(securityq1));
            ul.setSecurityq2(convertToBytes(securityq2));
            ul.setUn(convertToBytes(un));
            s.save(ul);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return ul;
    }
    public UserLogin loadUserLoginfromEmployer(Employers emp){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(UserLogin.class);
        c.add(Restrictions.eq("employers", emp));
        UserLogin ul=(UserLogin) c.uniqueResult();
        return ul;
    }
    public UserLogin updateUserLogin(String answer1, String answer2, Employers employer, 
            String pw, String securityq1, String securityq2, String un, int ulid){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        UserLogin ul=(UserLogin) s.load(UserLogin.class, ulid);
        try {
            ul.setAnswer1(convertToBytes(answer1));
            ul.setAnswer2(convertToBytes(answer2));
            ul.setEmployers(employer);
            ul.setPw(convertToBytes(pw));
            ul.setSecurityq1(convertToBytes(securityq1));
            ul.setSecurityq2(convertToBytes(securityq2));
            ul.setUn(convertToBytes(un));
            s.save(ul);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return ul;
    }
    public boolean checkUser(String un){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(UserLogin.class);
        c.add(Restrictions.eq("un", convertToBytes(un)));
        UserLogin ul=(UserLogin) c.uniqueResult();
        s.flush();
        s.close();
        if(ul!=null){
            return false;
        }else{
            return true;
        }
    }
    public UserLogin checkLogin(String un, String pw){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(UserLogin.class);
        c.add(Restrictions.eq("un", convertToBytes(un)));
        c.add(Restrictions.eq("pw", convertToBytes(pw)));
        UserLogin ul=(UserLogin) c.uniqueResult();
        s.flush();
        s.close();
        return ul;
    }
    public List<Employers> getAllEmployers(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Employers.class);
        List<Employers> employerses=c.list();
        s.flush();
        s.close();
        return employerses;
    }
    public Employers loadEmployer(int id){
        Session s=Connection.getSessionFactory().openSession();
        Employers e=(Employers) s.get(Employers.class, id);
        s.flush();
        s.close();
        return e;
    }
    public Departments saveDepartment(String dep){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        Departments d=new Departments();
        try {
            d.setDepartment(convertToBytes(dep));
            s.save(d);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return d;
    }
    public Departments loadDepartment(int id){
        Session s=Connection.getSessionFactory().openSession();
        Departments d=(Departments) s.load(Departments.class, id);
        s.flush();
        s.close();
        return d;
    }
    public List<Departments> getAllDepartments(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Departments.class);
        List<Departments> departmentses=c.list();
        s.flush();
        s.close();
        return departmentses;
    }
    public Allowances saveAllowances(Double max, String type, Double min){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        Allowances a=new Allowances();
        try {
            a.setAllowanceMaximum(max);
            a.setAllowanceType(convertToBytes(type));
            a.setAllownceMinimum(min);
            a.setStatus(1);
            s.save(a);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return a;
    }
    public List<Allowances> getAllAllowance(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Allowances.class);
        List<Allowances> allowanceses=c.list();
        s.flush();
        s.close();
        return allowanceses;
    }
    public Allowances loadAllowance(int id){
        Session s=Connection.getSessionFactory().openSession();
        Allowances a=(Allowances) s.load(Allowances.class, id);
        s.flush();
        s.close();
        return a;
    }
    public Designation saveDesignation(Double basic, String designation, Date promoPeriod){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        Designation d=new Designation();
        try {
            d.setBasicSalary(basic);
            d.setDesignation(convertToBytes(designation));
            d.setPromotionPeriod(promoPeriod);
            d.setStatus(1);
            s.save(d);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return d;
    }
    
    public Designation loadDesignation(int id){
        Session s=Connection.getSessionFactory().openSession();
        Designation d=(Designation) s.load(Designation.class, id);
        s.flush();
        s.close();
        return d;
    }
    public List<Designation> getDesignations(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Designation.class);
        List<Designation> designations=c.list();
        return designations;
    }
    public DepartmentsHasDesignation saveDepartmentHasDesignation(Departments department, 
            Designation designation, Employers emp){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(DepartmentsHasDesignation.class);
        c.add(Restrictions.eq("employers", emp));
        DepartmentsHasDesignation departmentsHasDesignation;
        departmentsHasDesignation=(DepartmentsHasDesignation) c.uniqueResult();
        if(departmentsHasDesignation==null){
        Transaction t=s.beginTransaction();
        departmentsHasDesignation=new DepartmentsHasDesignation();
        try {
            departmentsHasDesignation.setDepartments(department);
            departmentsHasDesignation.setDesignation(designation);
            departmentsHasDesignation.setEmployers(emp);
            s.save(departmentsHasDesignation);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        }
        s.flush();
        s.close();
        return departmentsHasDesignation;
    }
    public DepartmentsHasDesignation getDepartmentHasDesignation(Employers emp){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(DepartmentsHasDesignation.class);
        c.add(Restrictions.eq("employers", emp));
        DepartmentsHasDesignation departmentsHasDesignation;
        departmentsHasDesignation=(DepartmentsHasDesignation) c.uniqueResult();
        s.flush();
        s.close();
        return departmentsHasDesignation;
    }
    public DepartmentsHasDesignation loadDepartmentsHasDesignation(int id){
        Session s=Connection.getSessionFactory().openSession();
        DepartmentsHasDesignation dhd=(DepartmentsHasDesignation) s.load(DepartmentsHasDesignation.class, id);
        s.flush();
        s.close();
        return dhd;
    }
    public List<DepartmentsHasDesignation> getDesignationFromDept(Departments dept){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(DepartmentsHasDesignation.class);
        c.add(Restrictions.eq("departments", dept));
        ArrayList<Designation> designations=new ArrayList<>();
        List<DepartmentsHasDesignation> l=c.list();
        s.flush();
        s.close();
        return l;
    }
    public EmployersHasAllowances saveEmployerHasAllowance(Allowances allowance, Designation designation, Employers emp){
        Session s=Connection.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        EmployersHasAllowances eha=new EmployersHasAllowances();
        try {
            eha.setAllowances(allowance);
            eha.setDesignation(designation);
            eha.setEmployers(emp);
            s.save(eha);
        } catch (Exception e) {
            t.rollback();
            e.printStackTrace();
        }
        t.commit();
        s.flush();
        s.close();
        return eha;
    }
    public List<EmployersHasAllowances> getEmployerHasAllowances(){
        Session s=Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(EmployersHasAllowances.class);
        List<EmployersHasAllowances> allowanceses=c.list();
        s.flush();
        s.close();
        return allowanceses;
    }

    public static void main(String[] args) {
        UserManagement management=new UserManagement();
        management.saveDepartment("IT");
        management.saveDepartment("HR");
        management.saveDepartment("Finance");
    }

}
