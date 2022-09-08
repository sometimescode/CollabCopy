package project.app.service;

// using SendGrid's Java Library
// need more emails for dates of return
// admin email is hardcoded
import com.sendgrid.*;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;

import java.io.IOException;

public class EmailNotification {

  private static final String adminEmail = "melcuetara.mac@gmail.com";
  private static final String apiEmail = "librarynotification.service01@gmail.com";
  private static final String API_KEY = "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";

  public static void notifyAdminCheckoutRequest(String bookTitle, String personName, int userId, String userEmail) throws IOException {

    Email from = new Email(apiEmail);
    Email to = new Email(adminEmail);
    String subject = "Book Request";
    String strContent = personName + " (User ID: " + userId + " , User Email: " + userEmail +"), sent a request to checkout the book: " + bookTitle + ". ";
    Content content = new Content("text/plain", strContent);
    
    sendEmail(from, subject, to, content);
  }

  public static void notifyUserApprovedCheckoutRequest(String userEmail, String bookTitle) throws IOException {

    Email from = new Email(apiEmail);
    Email to = new Email(userEmail);
    String subject = "Approved Book Request";
    String strContent = "The admin has approved on your checkout request for the book: " + bookTitle + ". ";
    Content content = new Content("text/plain", strContent);
    
    sendEmail(from, subject, to, content);
  }

  public static void sendEmail(Email from, String subject, Email to, Content content) throws IOException {
    
    Mail mail = new Mail(from, subject, to, content);
    SendGrid sg = new SendGrid(API_KEY);
    Request request = new Request();
    
    try {
      request.setMethod(Method.POST);
      request.setEndpoint("mail/send");
      request.setBody(mail.build());
      Response response = sg.api(request);
      System.out.println("zzzz: f" + response.getStatusCode());
      System.out.println(response.getBody());
      System.out.println(response.getHeaders());
    } catch (IOException ex) {
      throw ex;
    }
  }
}