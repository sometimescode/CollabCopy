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
    
    <link rel="stylesheet" href="../../css/general.css">

    <title>Admin - Book Information</title>
    
    <sj:head/>

    <style>
      .book-details-cover {
        width: 100%;
      }
    </style>
  </head>
  <body class="admin">
    <s:include value="../../pages/adminMenu.jsp" />

    <div class="container">
      <div class="card border-0 shadow my-5">
        <div class="card-body p-5">

          <div class="d-flex flex-row-reverse">
            <s:url action="getBookEntryByISBN" namespace="/admin/book" var="urlTag" >
              <s:param name="ISBN"><s:property value="bookEntryBean.ISBN"/></s:param>
            </s:url>
            <div class="p-2 bd-highlight">
              <s:a cssClass="float-end btn btn-primary" href="%{urlTag}">Back</s:a>
            </div>
          </div>
          
          <hr>

          <h1>Add Book Copy</h1>
          <div class="row">
            <div class="col-sm-12 col-md-4">
              <div class="border p-4">
                <s:if test="bookEntryBean.cover != null">
                  <img src="data:image/jpeg;base64,${bookEntryBean.cover}" class="img-fluid book-details-cover"/>
                </s:if>
              </div>
            </div>
            <div class="col-sm-12 col-md-8">
              <div class="p-4">
                <s:form action="addBookCopy">
                  <div class="card-header">
                    Serial Id (ISBN-ID)
                  </div>
                  <div class="input-group mb-3">
                    <div class="form-floating flex-grow-1">
                        <s:textfield cssClass="form-control" id="floatingSerialIdHead" name="bookEntryBean.ISBN" placeholder="ISBN" readonly="true"/>
                        <label for="floatingSerialIdHead">ISBN</label>
                    </div>
                    <span class="input-group-text">-</span>
                    <div class="form-floating flex-grow-1">
                      <s:textfield type="number" cssClass="form-control" id="floatingSerialIdCount" name="bookCopyLatestSerialCount" placeholder="COUNT" readonly="true"/>
                      <label for="floatingSerialIdCount">ID</label>
                  </div>
                  </div>
                  <s:hidden name="bookEntryBean.cover"/>
                  <div class="form-floating mb-3">
                    <s:textfield cssClass="form-control" id="floatingPurchasePrice" name="bookCopyBean.purchasePrice" placeholder="Purchase Price"/>
                    <label for="floatingPurchasePrice">Purchase Price</label>
                    <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookCopyBean.purchasePrice" />
                  </div>
                  <div class="form-floating mb-3">
                    <div class="form-check form-switch">
                      <s:checkbox cssClass="form-check-input" id="flexSwitchCheckDefault" name="toggleAutoGenerateCopies"/>
                      <label class="form-check-label" for="flexSwitchCheckDefault">Generate Multiple Book Copies</label>
                    </div>
                  </div>
                  <div id="generateCopiesDiv" class="form-floating mb-3" style="display:none;">
                    <s:textfield cssClass="form-control" id="floatingCopiesCount" name="copiesToGenerate" placeholder="Copies to Generate"/>
                    <label for="floatingCopiesCount">No. of Copies To Generate</label>
                    <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="copiesToGenerate" />
                  </div>
                  <s:if test="!validationString.isEmpty()">
                    <p class="text-danger"><i class="bi bi-info-square-fill"></i> <s:property escapeHtml="false" value="validationString"/><p>
                  </s:if> 
                  <s:submit cssClass="btn btn-primary" value="Submit"/>
                </s:form>
              </div>
            </div>
          </div>

          <hr>

        </div>
      </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
      $(document).ready(function(){
        if($("#flexSwitchCheckDefault").is(":checked")) {
              $("#generateCopiesDiv").show(300);
          } else {
              $("#generateCopiesDiv").hide(300);
          }

        $("#flexSwitchCheckDefault").click(function() {
          if($(this).is(":checked")) {
              $("#generateCopiesDiv").show(300);
          } else {
              $("#generateCopiesDiv").hide(300);
          }
        });
      });
    </script>
  </body>
</html>