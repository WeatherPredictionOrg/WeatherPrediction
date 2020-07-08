<<<<<<< HEAD:src/WeatherServer/src/main/java/com/example/demo/enity/PredictedData.java
package com.example.demo.enity;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

public class PredictedData {
    String date;
    double min;
    double max;
    double average;
    public String getDate() {
    	return date;
    }
    public double getMin() {
    	return min;
    }
    public double getMax() {
    	return max;
    }
    public double getAverage() {
    	return average;
    }
    public void setDate(String date) {
    	this.date=date;
    }
    public void setMin(double min) {
    	this.min=min;
    }
    public void setMax(double max) {
    	this.max=max;
    }
    public void setAverage(double average) {
    	this.average=average;
    }
    public PredictedData() {
    	super();
    }
    public JSONObject getJSONObject() {
        Map<String, Object> map = new HashMap<>();
        map.put("date", date);
        map.put("min", min);
        map.put("max",max);
        map.put("avg",average);
        JSONObject obj = new JSONObject(map);
        return obj;
    }

}
=======
package com.example.demo.enity;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

public class PredictedData {
    String date;
    double min;
    double max;
    public String getDate() {
    	return date;
    }
    public double getMin() {
    	return min;
    }
    public double getMax() {
    	return max;
    }
    public void setDate(String date) {
    	this.date=date;
    }
    public void setMin(double min) {
    	this.min=min;
    }
    public void setMax(double max) {
    	this.max=max;
    }
    public PredictedData() {
    	super();
    }
    public JSONObject getJSONObject() {
        Map<String, Object> map = new HashMap<>();
        map.put("date", date);
        map.put("min", min);
        map.put("max",max);
        JSONObject obj = new JSONObject(map);
        return obj;
    }

}
>>>>>>> cc07d83a60cc6fb9e367e0a4e4043817d162b39c:src/WeatherServer/src/main/java/com/example/demo/enity/PredictedData.java
