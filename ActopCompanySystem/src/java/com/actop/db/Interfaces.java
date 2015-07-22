package com.actop.db;
// Generated Jul 11, 2015 12:30:16 PM by Hibernate Tools 4.3.1


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

/**
 * Interfaces generated by hbm2java
 */
@Entity
@Table(name="interfaces"
    ,catalog="actop_system"
)
public class Interfaces  implements java.io.Serializable {


     private Integer idInterfaces;
     private byte[] interfaceName;
     private Set<InterfacesHasUserLogin> interfacesHasUserLogins = new HashSet<InterfacesHasUserLogin>(0);

    public Interfaces() {
    }

    public Interfaces(byte[] interfaceName, Set<InterfacesHasUserLogin> interfacesHasUserLogins) {
       this.interfaceName = interfaceName;
       this.interfacesHasUserLogins = interfacesHasUserLogins;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_INTERFACES", unique=true, nullable=false)
    public Integer getIdInterfaces() {
        return this.idInterfaces;
    }
    
    public void setIdInterfaces(Integer idInterfaces) {
        this.idInterfaces = idInterfaces;
    }

    
    @Column(name="INTERFACE_NAME")
    public byte[] getInterfaceName() {
        return this.interfaceName;
    }
    
    public void setInterfaceName(byte[] interfaceName) {
        this.interfaceName = interfaceName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="interfaces")
    public Set<InterfacesHasUserLogin> getInterfacesHasUserLogins() {
        return this.interfacesHasUserLogins;
    }
    
    public void setInterfacesHasUserLogins(Set<InterfacesHasUserLogin> interfacesHasUserLogins) {
        this.interfacesHasUserLogins = interfacesHasUserLogins;
    }




}


