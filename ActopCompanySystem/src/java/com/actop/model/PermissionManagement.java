/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import com.actop.connection.Connection;
import com.actop.db.Interfaces;
import com.actop.db.InterfacesHasUserLogin;
import com.actop.db.UserLogin;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class PermissionManagement {

    public byte[] convertToBytes(String word) {
        byte[] convertedText = null;
        if (word != null) {
            convertedText = word.getBytes();
        }

        return convertedText;
    }

    public Interfaces saveInterface(String interfaceName) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(Interfaces.class);
        c.add(Restrictions.eq("interfaceName", interfaceName));
        Interfaces checkinterface = (Interfaces) c.uniqueResult();
        if (checkinterface != null) {
            Transaction t = s.beginTransaction();
            Interfaces i = new Interfaces();
            try {
                i.setInterfaceName(convertToBytes(interfaceName));
                s.save(i);
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
            }
            t.commit();
            return i;
        }
        s.flush();
        s.close();
        return checkinterface;
    }

    public InterfacesHasUserLogin saveInterfacesHasUserLogin(Interfaces interfacedb, Integer delete, Integer save,
            Integer search, Integer permissionType, Integer update, UserLogin uLogin) {
        if (loadPermission(uLogin, interfacedb)) {
            Session s = Connection.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            InterfacesHasUserLogin hasUserLogin = new InterfacesHasUserLogin();
            try {
                hasUserLogin.setInterfaces(interfacedb);
                hasUserLogin.setPermissionDelete(delete);
                hasUserLogin.setPermissionSave(save);
                hasUserLogin.setPermissionSearch(search);
                hasUserLogin.setPermissionType(permissionType);
                hasUserLogin.setPermissionUpdate(update);
                hasUserLogin.setUserLogin(uLogin);
                s.save(hasUserLogin);
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
            }
            t.commit();
            s.flush();
            s.close();
            return hasUserLogin;
        }
        return null;
    }

    public List<Interfaces> getAllInterfaces() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(Interfaces.class);
        List<Interfaces> interfaceses=c.list();
        s.flush();
        s.close();
        return interfaceses;
    }

    public InterfacesHasUserLogin updateInterfacesHasUserLogin(Interfaces interfacedb, Integer delete, Integer save,
            Integer search, Integer permissionType, Integer update, UserLogin uLogin, int id) {
        if (loadPermission(uLogin, interfacedb)) {
            Session s = Connection.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            InterfacesHasUserLogin hasUserLogin = (InterfacesHasUserLogin) s.load(InterfacesHasUserLogin.class, id);
            try {
                hasUserLogin.setInterfaces(interfacedb);
                hasUserLogin.setPermissionDelete(delete);
                hasUserLogin.setPermissionSave(save);
                hasUserLogin.setPermissionSearch(search);
                hasUserLogin.setPermissionType(permissionType);
                hasUserLogin.setPermissionUpdate(update);
                hasUserLogin.setUserLogin(uLogin);
                s.update(hasUserLogin);
            } catch (Exception e) {
                t.rollback();
                e.printStackTrace();
            }
            t.commit();
            s.flush();
            s.close();
            return hasUserLogin;
        }
        return null;
    }

    public List<InterfacesHasUserLogin> getAllPermissions() {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(InterfacesHasUserLogin.class);
        List<InterfacesHasUserLogin> ihuls = c.list();
        s.flush();
        s.close();
        return ihuls;
    }

    public Interfaces loadInterface(String interfaceName) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(Interfaces.class);
        c.add(Restrictions.eq("interfaceName", interfaceName));
        Interfaces i = (Interfaces) c.uniqueResult();
        s.flush();
        s.close();
        return i;
    }

    public boolean loadPermission(UserLogin ul, Interfaces i) {
        Session s = Connection.getSessionFactory().openSession();
        Criteria c = s.createCriteria(UserLogin.class);
        c.add(Restrictions.eq("interfaces", i));
        c.add(Restrictions.eq("userLogin", ul));
        InterfacesHasUserLogin ihul = (InterfacesHasUserLogin) c.uniqueResult();
        return ihul != null;
    }

}
