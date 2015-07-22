/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class ApplicationKeys {
    int[] nos={1,2,3,4,5,6,7,8,9};
    String[] chars={"+","-","*"};

    public String keygenerator() {
        GetTimeinMidnight gtm=new GetTimeinMidnight();
        long midnightTimeinMilis=gtm.retrieveTime();
        Random r=new Random();
        int selectedno=nos[r.nextInt(nos.length)];
        String selectedChar=chars[r.nextInt(chars.length)];
        String generatedKey = null;
        long calculatedNo = 0;
        if(selectedChar.equals("+")){
            calculatedNo=midnightTimeinMilis+selectedno;
            generatedKey=selectedno+""+0+""+calculatedNo;
        }else if (selectedChar.equals("-")) {
            calculatedNo=midnightTimeinMilis-selectedno;
            generatedKey=selectedno+""+1+""+calculatedNo;
        }else if (selectedChar.equals("*")) {
            calculatedNo=midnightTimeinMilis*selectedno;
            generatedKey=selectedno+""+2+""+calculatedNo;
        }
        return generatedKey;
    }

}