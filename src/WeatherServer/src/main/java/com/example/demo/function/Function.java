//java调用python里的预测函数获取预测后数据
//作者：黎佩瑜，王迪

package com.example.demo.function;

import java.io.*;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;
import org.springframework.boot.SpringApplication;

import com.example.demo.WeatherServerApplication;
import com.example.demo.enity.PredictedData;

public class Function {
	public static void main(String[] args) {
		getJsonRun("2011-01-01","2011-01-03");
	}
    public static String getJsonRun(String date1,String date2) {
    	ArrayList<PredictedData> preDataJsonList = null;
    	JSONObject jsonObject=new JSONObject();
    	PredictedData preData=new PredictedData();
    	String str="python E:\\\\Lib\\\\site-packages\\\\weather_model.py "+date1+" "+date2;
		Process proc;
        try {
        	//"python E:\\Lib\\site-packages\\weather_model.py 2011-01-01 2011-01-03"
            proc = Runtime.getRuntime().exec(str);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            line=in.readLine();
            String[] temp;
            while ((line = in.readLine()) != null) {
            	System.out.println(line);
            	temp=line.split(" ");
            	preData.setDate(temp[1]);
            	preData.setMin(Double.parseDouble(temp[3]));
            	preData.setMax(Double.parseDouble(temp[5]));
            	//preDataJsonList.add(preData);
            }
            in.close();
            proc.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //return getEvaluatedOptionsJson(preDataJsonList);
        return "trying";
	}
    public static String getEvaluatedOptionsJson(ArrayList<PredictedData> checkItemIds) {
        if (checkItemIds.isEmpty()) {
            return null;
        }
        JSONArray jsonArray = new JSONArray();
        for (PredictedData item : checkItemIds) {
            jsonArray.put(item.getJSONObject());
        }
        return jsonArray.toString();
    }
}
