package com.actop.db;
// Generated Jul 24, 2015 12:22:50 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OtherTypes generated by hbm2java
 */
@Entity
@Table(name="other_types"
    ,catalog="actop_system"
)
public class OtherTypes  implements java.io.Serializable {


     private Integer idOtherTypes;
     private String otherType;

    public OtherTypes() {
    }

    public OtherTypes(String otherType) {
       this.otherType = otherType;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_OTHER_TYPES", unique=true, nullable=false)
    public Integer getIdOtherTypes() {
        return this.idOtherTypes;
    }
    
    public void setIdOtherTypes(Integer idOtherTypes) {
        this.idOtherTypes = idOtherTypes;
    }

    
    @Column(name="OTHER_TYPE", length=45)
    public String getOtherType() {
        return this.otherType;
    }
    
    public void setOtherType(String otherType) {
        this.otherType = otherType;
    }




}


