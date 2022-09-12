<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Edit Rule</title>
    
    <sj:head/>
    
  </head>
  <body>
    
    <s:form action="editRule">
      <div class="form-floating mb-3">
        <s:textfield type="number" min="1" onchange="checkIfEmpty()" cssClass="form-control" id="floatingRule" name="ruleValue" placeholder="Rule"/>
        <label for="floatingRule"><s:property value="ruleName" /></label>
        <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="ruleName" />
      </div>
      <s:hidden name="dbId"/>
      <s:submit id="ruleSubmitBtn" cssClass="btn btn-primary w-100" value="Submit"/>
    </s:form>

  <script>
    function checkIfEmpty() {
      if(document.getElementById("floatingRule").value==="") { 
            document.getElementById('ruleSubmitBtn').disabled = true; 
        } else { 
            document.getElementById('ruleSubmitBtn').disabled = false;
        }
    }
  </script>
  </body>
</html>