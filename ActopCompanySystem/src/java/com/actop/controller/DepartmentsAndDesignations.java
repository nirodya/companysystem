/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.controller;

import com.actop.db.Departments;
import com.actop.db.Designation;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class DepartmentsAndDesignations {
    private Departments departments;
    private Designation designation;

    public DepartmentsAndDesignations(Departments departments, Designation designation) {
        this.departments = departments;
        this.designation = designation;
    }
    

    /**
     * @return the departments
     */
    public Departments getDepartments() {
        return departments;
    }

    /**
     * @param departments the departments to set
     */
    public void setDepartments(Departments departments) {
        this.departments = departments;
    }

    /**
     * @return the designation
     */
    public Designation getDesignation() {
        return designation;
    }

    /**
     * @param designation the designation to set
     */
    public void setDesignation(Designation designation) {
        this.designation = designation;
    }
}
