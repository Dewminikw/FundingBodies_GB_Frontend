
<%@page import="model.Funders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donate Us</title>
 <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, textarea, label { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      font-style: bold;
      color: #666;
      line-height: 33px;
      }
      h1 {
      position: absolute;
      margin:0;
      font-size: 60px;
      color: #fff;
      z-index: 2;
      line-height: 83px;
      top:30px;
      }
      legend {
      padding: 8px;      
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      color: #fff;
      background-color: #1c87c9;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 20px;
      }
      form {
      width: 60%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 8px #006622; 
      }
      .banner {
      position: relative;
      height: 350px;
      background-image: url("images/backImg.jpg");  
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }
      .banner::after {
      content: "";
      background-color: rgba(0, 0, 0, 0.4); 
      position: absolute;
      width: 100%;
      height: 100%;
      }
      input, select, textarea {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }
      input {
      width: calc(100% - 10px);
      padding: 5px;
      }
      input[type="date"] {
      padding: 4px 5px;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color:  #006622;
      }
      .checkbox input[type=checkbox] {
      display:inline-block;
      height:15px;
      width:15px;
      margin-right:5px;
      vertical-align:text-top;
      }
      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 3px 0  #006622;
      color: #006622;
      }
      .item {
      position: relative;
      margin: 10px 0;
      }
      .item span {
      color: red;
      }
      .week {
      display:flex;
      justfiy-content:space-between;
      }
      .colums {
      display:flex;
      justify-content:space-between;
      flex-direction:row;
      flex-wrap:wrap;
      }
      .colums div {
      width:48%;
      }
      input[type=radio], input[type=checkbox]  {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin: 5px 20px 15px 0;
      cursor: pointer;
      }
      .question span {
      margin-left: 30px;
      }
      .question-answer label {
      display: block;
      }
      label.radio:before {
      content: "";
      position: absolute;
      left: 0;
      width: 17px;
      height: 17px;
      border-radius: 50%;
      border: 2px solid #ccc;
      }
      input[type=radio]:checked + label:before, label.radio:hover:before {
      border: 2px solid  #006622;
      }
      label.radio:after {
      content: "";
      position: absolute;
      top: 6px;
      left: 5px;
      width: 8px;
      height: 4px;
      border: 3px solid  #006622;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      .flax {
      display:flex;
      justify-content:space-around;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      }
      btnSave {
      width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background:  #1c87c9;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }
      btnSave:hover {
      background:  #0692e8;
      }
      @media (min-width: 568px) {
      .name-item, .city-item {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .name-item input, .name-item div {
      width: calc(50% - 20px);
      }
      .name-item div input {
      width:97%;}
      .name-item div label {
      display:block;
      padding-bottom:5px;
      }
      }
    </style>
    
    <script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/funder.js"></script>
</head>
<body>
<div class="testbox">
    <form id="formDonation" name="formDonation" method="post" action="funder.jsp">
      <div class="banner">
        <h1>Donate Us</h1>
      </div>
      <br/>

      <br/>
    
      <fieldset>
       <legend>Donation Form</legend>
        <div class="colums">
          <div class="item">
            <label for="name">Name<span>*</span></label>
            <input id="name" type="text" name="name" class="form-control form-control-sm"/>
          </div>
          <div class="item">
            <label for="email">Email Address<span>*</span></label>
            <input id="email" type="text"   name="email" class="form-control form-control-sm"/>
          </div>
          <div class="item">
            <label for="id">Project ID<span>*</span></label>
            <input id="projectID" type="text" name="projectID" class="form-control form-control-sm"/>
          </div>
          <div class="item">
            <label for="amount">Amount<span>*</span></label>
            <input id="amount" type="text"   name="amount" class="form-control form-control-sm"/>
          </div>
		<div class="item">        
            <label for="cardNo">Card Number<span>*</span></label>
            <input id="cardNo" type="text" name="cardNo" placeholder ="xxxx xxxx xxxx xxxx" max="16" class="form-control form-control-sm"/>
          </div>
        
          	<div class="item">
            <label for="date">Expiration Date On The Card<span>*</span></label>
			<input id="expd" type="text" name="expd" placeholder="12 / 2025" >
          	</div>
       
           <div class="item">
            <label for="cvv">CVV<span>*</span></label>
            <input id="cvv" type="text"   name="cvv" placeholder="xxx"/>
          </div>
          
          <div class="item">
            <label for="comment">Comments</label>
            <input id="comments" type="text"  name="comments" class="form-control form-control-sm"/>
          </div>
         
      </fieldset>
     
      <input id="btnSave" name="btnSave" type="button" value="Save" class="btn-block"> 
		<input type="hidden" id="hidDonationIDSave" name="hidDonationIDSave" value="">
    </form>
    <div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>

			
				<br>
				<div id="divFunderGrid">

					<%
					Funders fundersObj = new Funders();
					out.print(fundersObj.readDonations());
					%>
				</div>
    </div>
</body>
</html>


