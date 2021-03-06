package com.actop.db;
// Generated Jul 24, 2015 12:22:50 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * InterfacesHasUserLogin generated by hbm2java
 */
@Entity
@Table(name="interfaces_has_user_login"
    ,catalog="actop_system"
)
public class InterfacesHasUserLogin  implements java.io.Serializable {


     private Integer idInterfacesHasUserLogin;
     private Interfaces interfaces;
     private UserLogin userLogin;
     private Integer permissionType;
     private Integer permissionSave;
     private Integer permissionUpdate;
     private Integer permissionDelete;
     private Integer permissionSearch;

    public InterfacesHasUserLogin() {
    }

	
    public InterfacesHasUserLogin(Interfaces interfaces, UserLogin userLogin) {
        this.interfaces = interfaces;
        this.userLogin = userLogin;
    }
    public InterfacesHasUserLogin(Interfaces interfaces, UserLogin userLogin, Integer permissionType, Integer permissionSave, Integer permissionUpdate, Integer permissionDelete, Integer permissionSearch) {
       this.interfaces = interfaces;
       this.userLogin = userLogin;
       this.permissionType = permissionType;
       this.permissionSave = permissionSave;
       this.permissionUpdate = permissionUpdate;
       this.permissionDelete = permissionDelete;
       this.permissionSearch = permissionSearch;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ID_INTERFACES_has_User_Login", unique=true, nullable=false)
    public Integer getIdInterfacesHasUserLogin() {
        return this.idInterfacesHasUserLogin;
    }
    
    public void setIdInterfacesHasUserLogin(Integer idInterfacesHasUserLogin) {
        this.idInterfacesHasUserLogin = idInterfacesHasUserLogin;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="INTERFACES_ID_INTERFACES", nullable=false)
    public Interfaces getInterfaces() {
        return this.interfaces;
    }
    
    public void setInterfaces(Interfaces interfaces) {
        this.interfaces = interfaces;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="User_Login_ID_User_Login", nullable=false)
    public UserLogin getUserLogin() {
        return this.userLogin;
    }
    
    public void setUserLogin(UserLogin userLogin) {
        this.userLogin = userLogin;
    }

    
    @Column(name="PERMISSION_TYPE")
    public Integer getPermissionType() {
        return this.permissionType;
    }
    
    public void setPermissionType(Integer permissionType) {
        this.permissionType = permissionType;
    }

    
    @Column(name="PERMISSION_SAVE")
    public Integer getPermissionSave() {
        return this.permissionSave;
    }
    
    public void setPermissionSave(Integer permissionSave) {
        this.permissionSave = permissionSave;
    }

    
    @Column(name="PERMISSION_UPDATE")
    public Integer getPermissionUpdate() {
        return this.permissionUpdate;
    }
    
    public void setPermissionUpdate(Integer permissionUpdate) {
        this.permissionUpdate = permissionUpdate;
    }

    
    @Column(name="PERMISSION_DELETE")
    public Integer getPermissionDelete() {
        return this.permissionDelete;
    }
    
    public void setPermissionDelete(Integer permissionDelete) {
        this.permissionDelete = permissionDelete;
    }

    
    @Column(name="PERMISSION_SEARCH")
    public Integer getPermissionSearch() {
        return this.permissionSearch;
    }
    
    public void setPermissionSearch(Integer permissionSearch) {
        this.permissionSearch = permissionSearch;
    }




}


