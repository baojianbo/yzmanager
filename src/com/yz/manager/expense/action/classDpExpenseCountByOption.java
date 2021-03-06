package com.yz.manager.expense.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.yz.manager.bean.user;
import com.yz.manager.dao.daoUtil;
import com.yz.manager.dao.expenseDao;

public class classDpExpenseCountByOption extends ActionSupport  {


	private static final long serialVersionUID = 4644095476720197939L;
	
	private String department;
	private String userName;
	private String year;	
	private String nature;
	private String gCompany;
	
	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	@Override
	public String execute() throws Exception { 
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		user u=(user)session.getAttribute("us");
        String result="success";
        String cmName="所有公司";
        if(this.getDepartment().equals("0")){
        	double expenseCount[][]=expenseDao.selectClassExpenseCount(u.getDepartment(),"3",this.getYear().trim(),this.getNature(),this.getGCompany());
            request.setAttribute("count1", expenseCount);
            if(!this.getGCompany().equals("0")){
             	cmName=daoUtil.selectGCompanyName(Integer.valueOf(this.getGCompany()).intValue());
             }
             request.setAttribute("cmName", cmName);
            result="result1";
        }else{
        	if(this.getUserName().equals("0")){
        		 double expenseCount[][]=expenseDao.selectClassExpenseCount(this.getDepartment(),"3",this.getYear().trim(),this.getNature(),this.getGCompany());	
        		 request.setAttribute("count2", expenseCount);
        		 request.setAttribute("dp", this.getDepartment());
        		 if(!this.getGCompany().equals("0")){
                  	cmName=daoUtil.selectGCompanyName(Integer.valueOf(this.getGCompany()).intValue());
                  }
                  request.setAttribute("cmName", cmName);
                 result="result1";
             } else {
        		 double expenseCount[][]=expenseDao.selectClassExpenseCount(this.getDepartment(),this.getUserName(),"3",this.getYear().trim(),this.getNature(),this.getGCompany());	
        		 request.setAttribute("count4", expenseCount);
        		 request.setAttribute("dp4", this.getDepartment());
        		 request.setAttribute("us4", daoUtil.selectUser(this.getUserName()));
        		 if(!this.getGCompany().equals("0")){
                  	cmName=daoUtil.selectGCompanyName(Integer.valueOf(this.getGCompany()).intValue());
                  }
                  request.setAttribute("cmName", cmName);
                 result="result2";
             }
        }
		
		return result;
	}

	public String getGCompany() {
		return gCompany;
	}

	public void setGCompany(String company) {
		gCompany = company;
	}
}
