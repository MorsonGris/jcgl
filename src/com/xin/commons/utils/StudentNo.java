package com.xin.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.xin.bean.Student;

public class StudentNo {
	public static String getNo(Student stu){
		String No= null;
		if(stu != null){
    		int n = Integer.valueOf(stu.getStudentNo());
    		No = String.valueOf((n+1));
    	}else{
    		Date date = new Date();
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        	No = sdf.format(date)+"01";
    	}
		return No;
	}
}
