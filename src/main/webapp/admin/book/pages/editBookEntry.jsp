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

          <div class="d-flex flex-row-reverse">
            <s:url action="getBookEntryByISBN" namespace="/admin/book" var="urlTag" >
              <s:param name="ISBN"><s:property value="bookEntryBean.ISBN"/></s:param>
            </s:url>
            <div class="p-2 bd-highlight">
              <s:a cssClass="float-end btn btn-primary" href="%{urlTag}">Back</s:a>
            </div>
          </div>
          
          <hr>

          <h1>Edit Book Details</h1>
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
                  <s:form action="editBookEntry" method="post" enctype="multipart/form-data">
                    <s:textfield name="bookEntryBean.cover" hidden="true"/>
                    <s:textfield name="bookEntryBean.ISBN" hidden="true"/>
                    <div class="form-floating mb-3">
                      <s:textfield cssClass="form-control" id="floatingTitle" name="bookEntryBean.title" placeholder="Title"/>
                      <label for="floatingTitle">Title</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.title" />
                    </div>
                    <div class="form-floating mb-3">
                      <s:textfield cssClass="form-control" id="floatingAuthors" name="bookEntryBean.authors" placeholder="Author(s)"/>
                      <label for="floatingAuthors">Author(s)</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.authors" />
                    </div>
                    <div class="form-floating mb-3">
                      <s:textfield cssClass="form-control" id="floatingISBN" name="bookEntryBean.ISBN" placeholder="ISBN" disabled="true"/>
                      <label for="floatingISBN">ISBN</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.ISBN" />
                    </div>
                    <div class="form-floating mb-3">
                      <s:textfield cssClass="form-control" id="floatingPageCount" name="bookEntryBean.pageCount" placeholder="Page Count"/>
                      <label for="floatingPageCount">Page Count</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.pageCount" />
                    </div>
                    <div class="form-floating mb-3">
                      <s:textfield cssClass="form-control" id="floatingPublisher" name="bookEntryBean.publisher" placeholder="Publisher"/>
                      <label for="floatingPublisher">Publisher</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.publisher" />
                    </div>
                    <div class="form-floating mb-3">
                      <sj:datepicker cssClass="form-control" placeholder="Published Date" id="floatingPublishedDate" name="bookEntryBean.publishedDate" changeMonth="true" changeYear="true" showOn="focus"/>
                      <label for="floatingPublishedDate">Published Date</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.publishedDate" />
                    </div>
                    <div class="form-floating mb-3">
                      <s:select cssClass="form-control form-select" id="floatingGenre" name="bookEntryBean.genre" placeholder="Genre" emptyOption="true" list="genreList"/>
                      <label for="floatingGenre">Genre</label>
                      <s:fielderror cssClass="text-danger col-form-label-sm" fieldName="bookEntryBean.genre" />
                    </div>

                    <div class="form-check form-switch mb-3">
                        <s:checkbox cssClass="form-check-input" id="newCoverUploadCheckbox" name="newCoverUpload"/>
                        <label class="form-check-label" for="newCoverUploadCheckbox">Upload New Cover Image</label>              
                    </div>
                    <s:if test="newCoverUpload">
                      <div id="newCoverUploadDiv" class="mb-3">
                        <div id="newCoverPreview">
                          <div class="card text-center">
                            <div class="card-header">
                              New Cover Preview
                            </div>
                            <div class="card-body">
                              <img id="coverImagePreview" src="http://localhost:8080/app/images/no_cover.jpg" class="book-cover" alt="New Book Cover">
                            </div>
                          </div>
                        </div>
                        <label for="newCoverFileUpload">Update Cover Image: </label>
                        <s:file cssClass="form-control" id="newCoverFileUpload" name="upload" label="File"/>
                        <div class="card-footer text-muted">
                          You will not be able to revert to the previous image after replacing it.
                        </div>
                        <s:if test="!fileValidationString.isEmpty()">
                          <ul class="text-danger col-form-label-sm">
                            <li><span><s:property value="fileValidationString"/><span></li>
                          </ul>
                        </s:if> 
                      </div>
                    </s:if>
                    <s:else>
                      <div id="newCoverUploadDiv" class="mb-3" style="display: none;">
                        <div id="newCoverPreview">
                          <div class="card text-center">
                            <div class="card-header">
                              New Cover Preview
                            </div>
                            <div class="card-body">
                              <img id="coverImagePreview" src="http://localhost:8080/app/images/no_cover.jpg" class="book-cover" alt="New Book Cover">
                            </div>
                          </div>
                        </div>
                        <label for="newCoverFileUpload">Update Cover Image: </label>
                        <s:file cssClass="form-control" id="newCoverFileUpload" name="upload" label="File"/>
                        <div class="card-footer text-muted">
                          You will not be able to revert to the previous image after replacing it.
                        </div>
                        <s:if test="!fileValidationString.isEmpty()">
                          <ul class="text-danger col-form-label-sm">
                            <li><span><s:property value="fileValidationString"/><span></li>
                          </ul>
                        </s:if> 
                      </div>
                    </s:else>
                    <s:submit cssClass="btn btn-primary w-100" value="Edit"/>
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
        console.log("loaded");
        $("#newCoverUploadCheckbox").click(function() {
          console.log("clicked");
          if($(this).is(":checked")) {
              $("#newCoverUploadDiv").show(300);
          } else {
              $("#newCoverUploadDiv").hide(200);
          }
        });

        function readURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
              $('#coverImagePreview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          } else {
            $('#coverImagePreview').attr('src', '');
          }
        }

        $("#newCoverFileUpload").change(function() {
          readURL(this);
        });

      });
    </script>
  </body>
</html>