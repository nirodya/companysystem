package com.actop.db;
// Generated Jul 23, 2015 9:46:44 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * StatusTypes generated by hbm2java
 */
@Entity
@Table(name="status_types"
    ,catalog="actop_system"
)
public class StatusTypes  implements java.io.Serializable {


     private Integer idStatusTypes;
     private String statusType;

    public StatusTypes() {
    }

    public StatusTypes(String statusType) {
       this.statusType = statusType;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_STATUS_TYPES", unique=true, nullable=false)
    public Integer getIdStatusTypes() {
        return this.idStatusTypes;
    }
    
    public void setIdStatusTypes(Integer idStatusTypes) {
        this.idStatusTypes = idStatusTypes;
    }

    
    @Column(name="STATUS_TYPE", length=45)
    public String getStatusType() {
        return this.statusType;
    }
    
    public void setStatusType(String statusType) {
        this.statusType = statusType;
    }




}


