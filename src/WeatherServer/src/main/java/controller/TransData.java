package controller;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TransData {
	    @RequestMapping("/test3")
	    @ResponseBody
	    public String test3(HttpServletRequest request) {
	    	return "";
	    }
}
