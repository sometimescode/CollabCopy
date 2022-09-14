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
    </style>
  </head>
  <body class="admin">
    <s:include value="../../pages/adminMenu.jsp" />

    <div class="container">
      <div class="card border-0 shadow my-5">
        <div class="card-body p-5">

          <div class="d-flex flex-row-reverse">
            <div class="p-2 bd-highlight"><a class="btn btn-primary" href="<s:url action='addShelf' namespace='/admin/shelf'/>">Add Shelf</a></div>
          </div>
          
          <hr>

          <h1>Shelves</h1>
          <div class="table-responsive">
            <table id="allShelves" class="display" style="width:100%">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>No. of Entries</th>
                </tr>
              </thead>
              <tbody>
                <s:iterator value="shelves" status="allShelvesStatus">
                  <s:url action="getShelfById" namespace="/admin/shelf" var="urlTag" >
                      <s:param name="shelfId"><s:property value="id"/></s:param>
                      <s:param name="shelfName"><s:property value="shelf_name"/></s:param>
                  </s:url>
                  <tr>
                    <td><s:a href="%{urlTag}"><s:property value="id"/></s:a></td>
                    <td><s:property value="shelf_name"/></td>
                    <td><s:property value="entries_count"/></td>
                  </tr>
                </s:iterator>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <!-- Datatables -->
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

    <!-- Datatables DATE PLUGIN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>

    <!-- Datatables DATE PLUGIN -->
    <script src="https://cdn.datatables.net/plug-ins/1.12.1/sorting/datetime-moment.js"></script>

    <script>
      $(document).ready(function () {
        $.fn.dataTable.moment( 'M/D/YY' );

        $('#allShelves').DataTable({
          order: [[0, 'desc']]
        });
      })
    </script>
  </body>
</html>