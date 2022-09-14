<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="css/general.css">

    <title>Test Space</title>
    
  </head>
  <body>
    <div class="container">
      <div class="input-group mb-3">
        <div class="form-floating">
            <input type="text" class="form-control" name="code1" placeholder="Code 1">
            <label for="code1">Code 1</label>
        </div>
        <span class="input-group-text"><i class="fas fa-times"></i></span>
      </div>
      
      <div class="input-group mb-3">
        <span class="input-group-text">Serial ID</span>
        <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)" readonly="true">
        <span class="input-group-text">-</span>
        <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
      </div>

      <div class="input-group mb-3 w-100">
        <span class="input-group-text w-10">Serial ID</span>
        <div class="form-floating w-50">
          <input type="text" class="form-control" id="floatingSerialIds" placeholder="Serial Id" readonly="true"/>
          <label for="floatingSerialIds">ISBN</label>
        </div>
        <span class="input-group-text w-5">-</span>
        <div class="form-floating w-35">
          <input type="number" class="form-control" id="floatingSerialId" placeholder="Serial Id"/>
          <label for="floatingSerialId">Counter</label>
        </div>
      </div>

      <div class="input-group">
        <input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
        <span class="input-group-text">$</span>
        <span class="input-group-text">0.00</span>
      </div>

      <img id="blah" alt="your image" />

      Max Borrow Limit: <s:property value="interceptorRules.getMaxBorrowLimit()"></s:property>
      Max Borrow Duration: <s:property value="interceptorRules.getMaxBorrowDuration()"></s:property>
      Late Fee: <s:property value="interceptorRules.getLateFee()"></s:property>
      Max Reservation Duration: <s:property value="interceptorRules.getMaxReservationDuration()"></s:property>
      Failure to Pick Up Fee: <s:property value="interceptorRules.getFailureToPickUpFee()"></s:property>
      Max Strikes: <s:property value="interceptorRules.getMaxStrikes()"></s:property>

<input type="file" 
    onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
      <s:form action="doUpload" method="post" enctype="multipart/form-data">
        <s:file name="upload" label="File"/>
        <s:submit/>
      </s:form>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>