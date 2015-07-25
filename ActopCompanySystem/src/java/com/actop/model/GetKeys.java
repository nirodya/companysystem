package com.actop.model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class GetKeys {

    /**
     *
     */
    public final static String mysqlKey="AES_DECRYPT(encryptedBody, '"+GetKeys.getKey()+"')";
    

    public static String getKey(){
        String key = null;
        Properties props = new Properties();
        InputStream is = GetKeys.class.getResourceAsStream("/hibernateKeys.properties");
        if (is == null) {
            
        } else {
            try {
                props.load(is);
                is.close();
                key = props.getProperty("com.actop.mysqlkey");
            } catch (IOException ex) {
                Logger.getLogger(GetKeys.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return key;
    }
}
