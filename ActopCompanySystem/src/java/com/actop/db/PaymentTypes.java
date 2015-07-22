package com.actop.db;
// Generated Jul 11, 2015 12:30:16 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * PaymentTypes generated by hbm2java
 */
@Entity
@Table(name="payment_types"
    ,catalog="actop_system"
)
public class PaymentTypes  implements java.io.Serializable {


     private Integer idPaymentTypes;
     private String paymentType;

    public PaymentTypes() {
    }

    public PaymentTypes(String paymentType) {
       this.paymentType = paymentType;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_PAYMENT_TYPES", unique=true, nullable=false)
    public Integer getIdPaymentTypes() {
        return this.idPaymentTypes;
    }
    
    public void setIdPaymentTypes(Integer idPaymentTypes) {
        this.idPaymentTypes = idPaymentTypes;
    }

    
    @Column(name="PAYMENT_TYPE", length=45)
    public String getPaymentType() {
        return this.paymentType;
    }
    
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }




}


