/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.actop.web;

import com.actop.db.Employers;
import com.actop.model.AttendanceManagement;
import com.actop.model.AuthenticateKey;
import com.actop.model.UserManagement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import org.json.JSONException;
import org.json.JSONObject;


/**
 *
 * @author Nirodya Gamage (ACTOP Technologies)
 */
@WebService(serviceName = "CompanyManagementWebService")
public class CompanyManagementWebService {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "saveAttendance")
    public String saveAttendance(String req, String key) throws JSONException, ParseException {
        AuthenticateKey ak=new AuthenticateKey();
        if (ak.authenticate(key)) {
            JSONObject jSONObject = new JSONObject(req);
            String rawattendanceDate = jSONObject.getString("rawattendanceDate");
            String rawdattime = jSONObject.getString("rawdattime");
            String rawemp=jSONObject.getString("rawemp");
            DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
            Date dattime = dateFormat.parse(rawdattime);
            DateFormat dateFormat2 = new SimpleDateFormat("yyyy-mm-dd");
            Date attendanceDate = dateFormat2.parse(rawattendanceDate);
            UserManagement management=new UserManagement();
            Employers e=management.loadEmployer(Integer.parseInt(rawemp));
            AttendanceManagement am=new AttendanceManagement();
            am.saveAttendance(attendanceDate, dattime, e);
            return "Saved";
        }
        return "Authentication Failed";
    }
}
