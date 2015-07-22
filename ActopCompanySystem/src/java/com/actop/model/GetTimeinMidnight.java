/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.model;

import java.util.Calendar;

/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
public class GetTimeinMidnight {
    public long retrieveTime(){
        Calendar fromMidnight = Calendar.getInstance();
        fromMidnight.set(Calendar.HOUR, 0);
        fromMidnight.set(Calendar.MINUTE, 0);
        fromMidnight.set(Calendar.SECOND, 0);
        fromMidnight.set(Calendar.MILLISECOND, 0);
        return fromMidnight.getTimeInMillis();
    }
}
