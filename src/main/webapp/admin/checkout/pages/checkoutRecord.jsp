<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add Checkout Record</title>
  
    <style>
      .read-only-white-form {
        background-color: #fff !important; 
      }
    </style>
  </head>
  <body>
    Create Checkout Record for Checkout Request ID <span class="fw-bold"><s:property value="checkoutRequestId"/></span>

    <hr>
   
    <s:form action="addCheckoutRecord">
      <div class="form-floating mb-3">
        <sj:datepicker cssClass="form-control read-only-white-form" placeholder="Published Date" id="floatingExpectedReturnDate" name="checkoutRecordBean.expectedReturnDate" showOn="focus" minDate="+1d" maxDate="+%{rules.getMaxBorrowDuration()}d" readOnly="true"/>
        <label for="floatingExpectedReturnDate">Expected Return Date</label>
        <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="checkoutRecordBean.expectedReturnDate" />
      </div>
      <s:textfield name="checkoutRecordBean.bookEntryId" hidden="true"/>
      <s:textfield name="checkoutRecordBean.borrowerId" hidden="true"/>
      <s:textfield name="checkoutRecordBean.onlineCheckoutRequestId" hidden="true"/>
      <s:textfield name="checkoutRecordBean.bookCopyId" hidden="true"/>
      <s:submit cssClass="btn btn-primary w-100" value="Create"/>
    </s:form>

  </body>
</html>