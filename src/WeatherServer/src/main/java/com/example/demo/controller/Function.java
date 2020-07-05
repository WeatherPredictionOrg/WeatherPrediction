//java调用python里的预测函数获取预测后数据
//作者：黎佩瑜，王迪

package com.example.demo.controller;

import java.io.*;

import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;

public class Function {
    
    public static void main(String[] args) {
    	
    	Process proc;
        try {
            proc = Runtime.getRuntime().exec("python E:\\Lib\\site-packages\\weather_model.py 2011-01-01 2011-01-03");
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
            in.close();
            proc.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } 
        
    }

}