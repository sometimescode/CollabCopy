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

    <link rel="stylesheet" href="../css/general.css">

    <title>Admin - Change Book Shelf</title>

    <sj:head/>

    <style>
      .book-cover {
        width:148px;
        height:200px;
      }
    </style>
  </head>
  <body class="admin">
    <s:include value="../../pages/adminMenu.jsp" />

    <div class="container">
      <div class="card border-0 shadow my-5">
        <div class="card-body p-5">

          <h1>Change Shelf</h1>
          <s:property value="title"/>
          <p>Currently at shelf: <s:property value="shelfId"/></p>
          <div class="row">
            <div class="col-sm-12 col-md-8">
              <div class="p-4">
                <s:form action="changeShelfSelect">
                  <div class="form-floating mb-3">
                    <s:select cssClass="form-control form-select" id="floatingShelf" name="shelfId" placeholder="Shelf" headerKey="<s:property value='shelfId'/>" list="shelfList"/>
                    <label for="floatingShelf">Shelf ID</label>
                    <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="shelfId" />
                    <s:textfield name="dbId" hidden="true"/>
                    <s:textfield name="title" hidden="true"/>
                  </div>
                  <s:submit cssClass="btn btn-primary w-100" value="Submit"/>
                </s:form>
              </div>
            </div>
          </div>
      
        </div>
      </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </script>
  </body>
</html>
    

