package com.example.demo.enity;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.json.JSONObject;

import com.alibaba.fastjson.annotation.JSONField;

public class MapData {
	@JSONField(ordinal = 1)
	String pos;
	@JSONField(ordinal = 2)
	double min;
	@JSONField(ordinal = 3)
	double avg;
	@JSONField(ordinal = 4)
	double max;
	
	public String getPos() {
		return pos;
	}
	public double getMin() {
		return min;
	}
	public double getAvg() {
		return avg;
	}
	public double getMax() {
		return max;
	}
	public void setPos(String pos) {
		this.pos=pos;
	}
	public void setMin(double min) {
		this.min=min;
	}
	public void setAvg(double avg) {
		this.avg=avg;
	}
	public void setMax(double max) {
		this.max=max;
	}
	public MapData() {
    	super();
    }
    public JSONObject getJSONObject() {
    	
        LinkedHashMap<String, Object> map = new LinkedHashMap<>();       
        map.put("min", min);        
        map.put("avg",avg); 
        map.put("max",max);
        map.put("pos", pos);
        
        JSONObject obj = new JSONObject(map);
        return obj;
    }
	
}
