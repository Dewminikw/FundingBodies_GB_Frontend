$(document).ready(function()
{ 
if ($("#alertSuccess").text().trim() == "") 
 { 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 
$(document).on("click", "#btnSave", function(event)
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateFunderForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidDonationIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "FundingAPI", 
 type : type, 
 data : $("#formDonation").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onFunderSaveComplete(response.responseText, status); 
 } 
 }); 
});

function onFunderSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divPaymentGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 } 
 $("#hidDonationIDSave").val(""); 
 $("#formDonation")[0].reset(); 
}

$(document).on("click", ".btnUpdate", function(event)
{ 
$("#hidDonationIDSave").val($(this).data("funid")); 
 $("#name").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#email").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#projectID").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#amount").val($(this).closest("tr").find('td:eq(3)').text()); 
 $("#cardNo").val($(this).closest("tr").find('td:eq(4)').text()); 
 $("#expd").val($(this).closest("tr").find('td:eq(5)').text()); 
 $("#cvv").val($(this).closest("tr").find('td:eq(6)').text());
 $("#comments").val($(this).closest("tr").find('td:eq(7)').text());  
});

$(document).on("click", ".btnRemove", function(event)
{ 
 $.ajax( 
 { 
 url : "FundingAPI", 
 type : "DELETE", 
 data : "funderID=" + $(this).data("funid"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onFunderDeleteComplete(response.responseText, status); 
 } 
 }); 
});

function onFunderDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divPaymentGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}
function validateFunderForm() 
{
	//NAME
	if ($("#name").val().trim() == "")
	{
	return "Insert Name.";
	}
	
	// EMAIL
	if ($("#email").val().trim() == "")
	{
	return "Insert Email.";
	}
	
	// ADDRESS-------------------------------
	if ($("#projectID").val().trim() == "")
	{
	return "Insert Address.";
	}
	
	
	// NAME ON CARD-------------------------------
	if ($("#cardNo").val().trim() == "")
	{
	return "Insert Name on card.";
	}

	// CREDIT CARD NUMBER-------------------------------
	if ($("#cardNo").val().trim() == "")
	{
	return "Insert Credit Card Number.";
	}

	// EXPIRY DATE-------------------------------
	if ($("#expd").val().trim() == "")
	{
	return "Insert Expiry date.";
	}

	// CVV------------------------
	if ($("#cvv").val().trim() == "")
	{
	return "Insert CVV.";
	}
	
	// is numerical value
	var tmpCVV = $("#cvv").val().trim();
	if (!$.isNumeric(tmpCVV))
	{
	return "Insert a numerical value for CVV.";
	}
return true; 
}
