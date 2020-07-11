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
		//System.out.println(getJsonRun("2009-01-01","2009-01-03"));
	}
    public static String getJsonRun(String date1,String date2) {
    	ArrayList<PredictedData> preDataJsonList =new ArrayList<PredictedData>();
    	JSONObject jsonObject=new JSONObject();
    	
    	String str="python E:\\\\Lib\\\\site-packages\\\\arima_multi_days.py -start "+date1;
		Process proc;
        try {
            proc = Runtime.getRuntime().exec(str);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            String[] temp;
            while ((line = in.readLine()) != null) {
            	PredictedData preData=new PredictedData();
            	//System.out.println(line);
            	temp=line.split(" ");
            	preData.setDate(temp[0]);
            	preData.setAverage(Double.parseDouble(temp[1]));
            	preData.setMax(Double.parseDouble(temp[2]));
            	preData.setMin(Double.parseDouble(temp[3]));
            	preDataJsonList.add(preData);
            }
            in.close();
            proc.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return getEvaluatedOptionsJson(preDataJsonList);
        
	}
    public static String getEvaluatedOptionsJson(ArrayList<PredictedData> checkItemIds) {
        if (checkItemIds.isEmpty()) {
            return null;
        }
        JSONArray jsonArray = new JSONArray();
        for (PredictedData item : checkItemIds) {
            jsonArray.put(item.getJSONObject());
        }
        //System.out.println(jasonArray);
        return jsonArray.toString();
    }
}
