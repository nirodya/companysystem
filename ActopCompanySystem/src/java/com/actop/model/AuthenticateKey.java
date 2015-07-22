/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class AuthenticateKey {
    
    public boolean authenticate(String key){
        String rawSelectedNo=key.substring(0, 1);
        String rawSelectedChar=key.substring(1, 2);
        String rawOtherKeypart=key.substring(2);
        GetTimeinMidnight gtm=new GetTimeinMidnight();
        long midnightTimeinMilis=gtm.retrieveTime();
        long calculateKey=0;
        if(rawSelectedChar.equals("0")){
            calculateKey=Long.parseLong(rawOtherKeypart)-Long.parseLong(rawSelectedNo);
        }else if (rawSelectedChar.equals("1")) {
            System.out.println(midnightTimeinMilis);
            System.out.println(rawSelectedNo);
            calculateKey=Long.parseLong(rawOtherKeypart)+Long.parseLong(rawSelectedNo);
        }else if (rawSelectedChar.equals("2")) {
            calculateKey=Long.parseLong(rawOtherKeypart)/Long.parseLong(rawSelectedNo);
        }
        if (calculateKey==midnightTimeinMilis) {
            return true;
        }else{
            return false;
        }
    }
   
}
