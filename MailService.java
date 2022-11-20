import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;


public class MailService {
  private static String email = "raucuqua111@gmail.com";
  private static String password = "gcmwycbdfrvorhpp";
public static boolean sendMail(String to, String subject, String content,boolean isBill,String bill){
  Session session = connect();
  try {
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(session);

      // Set From: header field of the header.
      message.setFrom(new InternetAddress("raucuqua111@gmail.com"));

      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

      // Set Subject: header field
      message.setSubject(subject);

      // Now set the actual message
//          message.setText(content,"UTF-8");



      // Create the message part
      BodyPart messageBodyPart = new MimeBodyPart();

      // Now set the actual message
      messageBodyPart.setText(content);

      // Create a multipar message
      Multipart multipart = new MimeMultipart();

      // Set text message part
      multipart.addBodyPart(messageBodyPart);
//      if(isBill) {
//          // Part two is attachment
//          messageBodyPart = new MimeBodyPart();
////          String filename = "BL0001.pdf";
//          File f = new File(bill);
//          DataSource source = new FileDataSource(f);
//          messageBodyPart.setDataHandler(new DataHandler(source));
////          messageBodyPart.setFileName(f.filename);
//          messageBodyPart.setFileName(f.getName());
//          multipart.addBodyPart(messageBodyPart);
//      }
      // Send the complete message parts
      message.setContent(multipart,"UTF-8");



//          System.out.println("sending...");
      // Send message
      Transport.send(message);
      return true;
//          System.out.println("Sent message successfully....");
  } catch (MessagingException mex) {
      mex.printStackTrace();

  }
  return false;
}
  public static boolean sendMail(String to, String subject, String content){
      return sendMail(to,subject,content,false,"");
  }
  public static Session connect(){
      // Assuming you are sending email from through gmails smtp
      String host = "smtp.gmail.com";

      // Get system properties
      Properties properties = System.getProperties();

      // Setup mail server
      properties.put("mail.smtp.host", host);
      //465, 587
      properties.put("mail.smtp.port", "587");
      //ssl to starttls
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.smtp.auth", "true");
     
      // Get the Session object.// and pass username and password
      Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

          protected PasswordAuthentication getPasswordAuthentication() {
              //pass: rau1@haha
              return new PasswordAuthentication(email,password);

          }

      });

      // Used to debug SMTP issues
      session.setDebug(true);
      return session;
     
  }

  public static void main(String[] args) {
      String email = "thuan0373535207@gmail.com";
      String content = "lỗi xuất hiện!";
      MailService.sendMail(email,"lỗi error running 123",content);
  }
}
