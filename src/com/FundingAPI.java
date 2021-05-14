package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Funders;

/**
 * Servlet implementation class FundingAPI
 */
@WebServlet("/FundingAPI")
public class FundingAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Funders fundersObj = new Funders();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FundingAPI() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//doGet(request, response);
		System.out.println("Insert Successful");
		String output = fundersObj.insertDonations(
				request.getParameter("name"), 
				request.getParameter("email"),
				request.getParameter("projectID"), 
				request.getParameter("amount"),
				request.getParameter("cardNo"), 
				request.getParameter("expd"), 
				request.getParameter("cvv"),
				request.getParameter("comments"));
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		System.out.println("got here");
		Map paras = getParasMap(request); 
		 String output = fundersObj.updateDonation(
		paras.get("hidDonationIDSave").toString(), 
		paras.get("name").toString(), 
		paras.get("email").toString(), 
		paras.get("projectID").toString(), 
		paras.get("amount").toString(),
		paras.get("cardNo").toString(), 
		paras.get("expd").toString(), 
		paras.get("cvv").toString(),
		paras.get("comments").toString()); 
		response.getWriter().write(output); 
	}

	private Map getParasMap(HttpServletRequest request) {
	
		 Map<String, String> map = new HashMap<String, String>(); 
			try
			 { 
			 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
			 String queryString = scanner.hasNext() ? 
			 scanner.useDelimiter("\\A").next() : ""; 
			 scanner.close(); 
			 String[] params = queryString.split("&"); 
			 for (String param : params) 
			 { 
			String[] p = param.split("=");
			 map.put(p[0], p[1]); 
			 } 
			 } 
			catch (Exception e) 
			 { 
			 } 
			return map; 
	}
	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		String output = fundersObj.deleteDonation(paras.get("funderID").toString());
		response.getWriter().write(output);
		
	}

}

