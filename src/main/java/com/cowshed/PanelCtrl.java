 package com.cowshed;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.NotFoundException;

@Controller
public class PanelCtrl {

	@RequestMapping("adminLogin")
	public ModelAndView adminLogin(@RequestParam("uname") String uname, @RequestParam("pass") String pass) {
		if(uname.equals("admin") && pass.equals("admin123")) {
			return new ModelAndView("AdminPanel");
		}
		return null;
		
	}
	
	@RequestMapping("panelIn")
	public ModelAndView qrReader(@RequestParam("file") String fName) throws NotFoundException, IOException, SQLException {
	
		PanalDao pd = new PanalDao();
//		VisitorPojo vp = new VisitorPojo();
			
		String context = pd.QrReader(fName);    //Qr code scanner 
		
		String res = pd.entryIn(context);	
		
		
		return new ModelAndView("Panel","msg",res);
	}
	
	
	@RequestMapping("panelOut")
	public ModelAndView panelOut(@RequestParam("file") String fName2) throws NotFoundException, IOException, NumberFormatException, SQLException {
		PanalDao pd = new PanalDao();
		String context = pd.QrReader(fName2);
		String res = pd.exitOut(Integer.parseInt(context));
		
		return new ModelAndView("Panel","msg2",res);
	}
	
	
	
	@RequestMapping("selectDate")
	public ModelAndView selectDate(@RequestParam("date") String date) {
		
	
		 return new ModelAndView("AdminPanel","date1",date);
	}
	

}
