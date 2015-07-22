package com.actop.db;
// Generated Jul 11, 2015 12:30:16 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ProjectTypes generated by hbm2java
 */
@Entity
@Table(name="project_types"
    ,catalog="actop_system"
)
public class ProjectTypes  implements java.io.Serializable {


     private Integer idProjectTypes;
     private String projectType;

    public ProjectTypes() {
    }

    public ProjectTypes(String projectType) {
       this.projectType = projectType;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_PROJECT_TYPES", unique=true, nullable=false)
    public Integer getIdProjectTypes() {
        return this.idProjectTypes;
    }
    
    public void setIdProjectTypes(Integer idProjectTypes) {
        this.idProjectTypes = idProjectTypes;
    }

    
    @Column(name="PROJECT_TYPE", length=45)
    public String getProjectType() {
        return this.projectType;
    }
    
    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }




}


