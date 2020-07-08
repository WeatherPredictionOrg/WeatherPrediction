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
