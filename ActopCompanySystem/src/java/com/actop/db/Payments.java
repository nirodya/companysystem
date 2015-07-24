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
import org.hibernate.annotations.ColumnTransformer;

/**
 * Payments generated by hbm2java
 */
@Entity
@Table(name = "payments", catalog = "actop_system"
)
public class Payments implements java.io.Serializable {

    private Integer idPayments;
    private Employers employers;
    private byte[] paymentTypes;
    private byte[] paymentFor;
    private byte[] payment;
    private Date paymentDate;
    private byte[] paymentStates;
    private Date paymentPayed;
    private Set<PaymentApproval> paymentApprovals = new HashSet<PaymentApproval>(0);

    public Payments() {
    }

    public Payments(Employers employers) {
        this.employers = employers;
    }

    public Payments(Employers employers, byte[] paymentTypes, byte[] paymentFor, byte[] payment, Date paymentDate, byte[] paymentStates, Date paymentPayed, Set<PaymentApproval> paymentApprovals) {
        this.employers = employers;
        this.paymentTypes = paymentTypes;
        this.paymentFor = paymentFor;
        this.payment = payment;
        this.paymentDate = paymentDate;
        this.paymentStates = paymentStates;
        this.paymentPayed = paymentPayed;
        this.paymentApprovals = paymentApprovals;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "ID_PAYMENTS", unique = true, nullable = false)
    public Integer getIdPayments() {
        return this.idPayments;
    }

    public void setIdPayments(Integer idPayments) {
        this.idPayments = idPayments;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYERS_ID_EMPLOYERS", nullable = false)
    public Employers getEmployers() {
        return this.employers;
    }

    public void setEmployers(Employers employers) {
        this.employers = employers;
    }

    @Column(name = "PAYMENT_TYPES")
    @ColumnTransformer(
            read = "AES_DECRYPT(encryptedBody, 'Actop@123456')",
            write = "AES_ENCRYPT(?, 'Actop@123456')")
    public byte[] getPaymentTypes() {
        return this.paymentTypes;
    }

    public void setPaymentTypes(byte[] paymentTypes) {
        this.paymentTypes = paymentTypes;
    }

    @Column(name = "PAYMENT_FOR")
    @ColumnTransformer(
            read = "AES_DECRYPT(encryptedBody, 'Actop@123456')",
            write = "AES_ENCRYPT(?, 'Actop@123456')")
    public byte[] getPaymentFor() {
        return this.paymentFor;
    }

    public void setPaymentFor(byte[] paymentFor) {
        this.paymentFor = paymentFor;
    }

    @Column(name = "PAYMENT")
    @ColumnTransformer(
            read = "AES_DECRYPT(encryptedBody, 'Actop@123456')",
            write = "AES_ENCRYPT(?, 'Actop@123456')")
    public byte[] getPayment() {
        return this.payment;
    }

    public void setPayment(byte[] payment) {
        this.payment = payment;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "PAYMENT_DATE", length = 19)
    public Date getPaymentDate() {
        return this.paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Column(name = "PAYMENT_STATES")
    @ColumnTransformer(
            read = "AES_DECRYPT(encryptedBody, 'Actop@123456')",
            write = "AES_ENCRYPT(?, 'Actop@123456')")
    public byte[] getPaymentStates() {
        return this.paymentStates;
    }

    public void setPaymentStates(byte[] paymentStates) {
        this.paymentStates = paymentStates;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "PAYMENT_PAYED", length = 19)
    public Date getPaymentPayed() {
        return this.paymentPayed;
    }

    public void setPaymentPayed(Date paymentPayed) {
        this.paymentPayed = paymentPayed;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "payments")
    public Set<PaymentApproval> getPaymentApprovals() {
        return this.paymentApprovals;
    }

    public void setPaymentApprovals(Set<PaymentApproval> paymentApprovals) {
        this.paymentApprovals = paymentApprovals;
    }

}
