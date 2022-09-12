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

    <!-- Datatables CSS -->
    <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/general.css">

    <title>Admin</title>

    <sj:head/>

    <style>
      table a {
        text-decoration: none;
      }

      .form-control-border-override {
        border: none;
        border-bottom: 1px solid #ced4da;
      }

      .no-border {
        border: none;
      }
    </style>
  </head>
  <body class="admin">
    <s:include value="adminMenu.jsp" />

    <div class="container">
      <div class="card border-0 shadow my-5">
        <div class="card-body p-5">

          <h1>Rules</h1>

          <div class="row">
            <div class="col-sm-12 p-4">

              <s:set var="rule" value="rules.get('Max Borrow Limit')" />
                
              <div class="row input-group mb-3">
                <div class="col-3">
                  <span class="input-group-text"><s:property value="#rule.ruleName"/></span>
                </div>
                <div class="col-2">
                  <div class="form-control form-control-border-override"><s:property value="#rule.ruleValue"/></div>
                  <!-- <s:textfield cssClass="form-control" name="ruleValue" readonly="true"/> -->
                </div>
                <div class="col-5">
                  <div class="form-control no-border"><s:property value="#rule.ruleDenomination"/></div>
                </div>
                <div class="col-2">
                  <s:url action="ruleForm" namespace="/admin/rule" var="ruleAjaxTag" >
                    <s:param name="dbId"><s:property value="#rule.dbId"/></s:param>
                  </s:url>
                  <sj:a id="ruleAjax1"
                  cssClass="ruleAjax btn btn-primary w-100"
                  href="%{ruleAjaxTag}"
                  targets="result"
                  indicator="indicator"
                  data-bs-toggle="modal" 
                  data-bs-target="#staticBackdrop"
                  data-modal-header-title="%{#rule.ruleName}"
                  >Edit</sj:a>
                </div>
                <div class="col-12">
                  <div class="card-footer text-muted">
                    <s:property value="#rule.ruleDescription"/>
                  </div>
                </div>
              </div>

              <s:set var="rule" value="rules.get('Max Borrow Duration')" />
                
              <div class="row input-group mb-3">
                <div class="col-3">
                  <span class="input-group-text"><s:property value="#rule.ruleName"/></span>
                </div>
                <div class="col-2">
                  <div class="form-control form-control-border-override"><s:property value="#rule.ruleValue"/></div>
                  <!-- <s:textfield cssClass="form-control" name="ruleValue" readonly="true"/> -->
                </div>
                <div class="col-5">
                  <div class="form-control no-border"><s:property value="#rule.ruleDenomination"/></div>
                </div>
                <div class="col-2">
                  <s:url action="ruleForm" namespace="/admin/rule" var="ruleAjaxTag" >
                    <s:param name="dbId"><s:property value="#rule.dbId"/></s:param>
                  </s:url>
                  <sj:a id="ruleAjax2"
                  cssClass="ruleAjax btn btn-primary w-100"
                  href="%{ruleAjaxTag}"
                  targets="result"
                  indicator="indicator"
                  data-bs-toggle="modal" 
                  data-bs-target="#staticBackdrop"
                  data-modal-header-title="%{#rule.ruleName}"
                  >Edit</sj:a>
                </div>
                <div class="col-12">
                  <div class="card-footer text-muted">
                    <s:property value="#rule.ruleDescription"/>
                  </div>
                </div>
              </div>

              <s:set var="rule" value="rules.get('Late Fee')" />
                
              <div class="row input-group mb-3">
                <div class="col-3">
                  <span class="input-group-text"><s:property value="#rule.ruleName"/></span>
                </div>
                <div class="col-2">
                  <div class="form-control form-control-border-override"><s:property value="#rule.ruleValue"/></div>
                  <!-- <s:textfield cssClass="form-control" name="ruleValue" readonly="true"/> -->
                </div>
                <div class="col-5">
                  <div class="form-control no-border"><s:property value="#rule.ruleDenomination"/></div>
                </div>
                <div class="col-2">
                  <s:url action="ruleForm" namespace="/admin/rule" var="ruleAjaxTag" >
                    <s:param name="dbId"><s:property value="#rule.dbId"/></s:param>
                  </s:url>
                  <sj:a id="ruleAjax3"
                  cssClass="ruleAjax btn btn-primary w-100"
                  href="%{ruleAjaxTag}"
                  targets="result"
                  indicator="indicator"
                  data-bs-toggle="modal" 
                  data-bs-target="#staticBackdrop"
                  data-modal-header-title="%{#rule.ruleName}"
                  >Edit</sj:a>
                </div>
                <div class="col-12">
                  <div class="card-footer text-muted">
                    <s:property value="#rule.ruleDescription"/>
                  </div>
                </div>
              </div>

              <s:set var="rule" value="rules.get('Max Reservation Duration')" />
                
              <div class="row input-group mb-3">
                <div class="col-3">
                  <span class="input-group-text"><s:property value="#rule.ruleName"/></span>
                </div>
                <div class="col-2">
                  <div class="form-control form-control-border-override"><s:property value="#rule.ruleValue"/></div>
                  <!-- <s:textfield cssClass="form-control" name="ruleValue" readonly="true"/> -->
                </div>
                <div class="col-5">
                  <div class="form-control no-border"><s:property value="#rule.ruleDenomination"/></div>
                </div>
                <div class="col-2">
                  <s:url action="ruleForm" namespace="/admin/rule" var="ruleAjaxTag" >
                    <s:param name="dbId"><s:property value="#rule.dbId"/></s:param>
                  </s:url>
                  <sj:a id="ruleAjax4"
                  cssClass="ruleAjax btn btn-primary w-100"
                  href="%{ruleAjaxTag}"
                  targets="result"
                  indicator="indicator"
                  data-bs-toggle="modal" 
                  data-bs-target="#staticBackdrop"
                  data-modal-header-title="%{#rule.ruleName}"
                  >Edit</sj:a>
                </div>
                <div class="col-12">
                  <div class="card-footer text-muted">
                    <s:property value="#rule.ruleDescription"/>
                  </div>
                </div>
              </div>

              <s:set var="rule" value="rules.get('Failure to Pick Up Fee')" />
                
              <div class="row input-group mb-3">
                <div class="col-3">
                  <span class="input-group-text"><s:property value="#rule.ruleName"/></span>
                </div>
                <div class="col-2">
                  <div class="form-control form-control-border-override"><s:property value="#rule.ruleValue"/></div>
                  <!-- <s:textfield cssClass="form-control" name="ruleValue" readonly="true"/> -->
                </div>
                <div class="col-5">
                  <div class="form-control no-border"><s:property value="#rule.ruleDenomination"/></div>
                </div>
                <div class="col-2">
                  <s:url action="ruleForm" namespace="/admin/rule" var="ruleAjaxTag" >
                    <s:param name="dbId"><s:property value="#rule.dbId"/></s:param>
                  </s:url>
                  <sj:a id="ruleAjax5"
                  cssClass="ruleAjax btn btn-primary w-100"
                  href="%{ruleAjaxTag}"
                  targets="result"
                  indicator="indicator"
                  data-bs-toggle="modal" 
                  data-bs-target="#staticBackdrop"
                  data-modal-header-title="%{#rule.ruleName}"
                  >Edit</sj:a>
                </div>
                <div class="col-12">
                  <div class="card-footer text-muted">
                    <s:property value="#rule.ruleDescription"/>
                  </div>
                </div>
              </div>

              <s:set var="rule" value="rules.get('Max Strikes')" />
                
              <div class="row input-group mb-3">
                <div class="col-3">
                  <span class="input-group-text"><s:property value="#rule.ruleName"/></span>
                </div>
                <div class="col-2">
                  <div class="form-control form-control-border-override"><s:property value="#rule.ruleValue"/></div>
                  <!-- <s:textfield cssClass="form-control" name="ruleValue" readonly="true"/> -->
                </div>
                <div class="col-5">
                  <div class="form-control no-border"><s:property value="#rule.ruleDenomination"/></div>
                </div>
                <div class="col-2">
                  <s:url action="ruleForm" namespace="/admin/rule" var="ruleAjaxTag" >
                    <s:param name="dbId"><s:property value="#rule.dbId"/></s:param>
                  </s:url>
                  <sj:a id="ruleAjax6"
                  cssClass="ruleAjax btn btn-primary w-100"
                  href="%{ruleAjaxTag}"
                  targets="result"
                  indicator="indicator"
                  data-bs-toggle="modal" 
                  data-bs-target="#staticBackdrop"
                  data-modal-header-title="%{#rule.ruleName}"
                  >Edit</sj:a>
                </div>
                <div class="col-12">
                  <div class="card-footer text-muted">
                    <s:property value="#rule.ruleDescription"/>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Edit Rule</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="text-center">
              <img id="indicator" src="../images/Blocks-1s-200px.gif" alt="Loading..." style="display:none"/> 
            </div>
  
            <div id="result">

            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <script>
      var myModalEl = document.getElementById('staticBackdrop')
      myModalEl.addEventListener('hidden.bs.modal', function (event) {
        $("#result").empty();
      })

      $('.ruleAjax').on('click', function () {
          var $el = $(this);
          $("#staticBackdropLabel").text("Edit Rule: " + $el.data('modal-header-title'));
      });
    </script>
  </body>
</html>