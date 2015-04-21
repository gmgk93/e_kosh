package ekosh;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mail {


public static void main(String[] args) {

    mail client = new mail();

    try {
        client.sendMail();
    } catch (AddressException ae) {
        ae.printStackTrace();
    } catch (MessagingException me) {
        me.printStackTrace();
    }

}

/**
 * Sends an email
 * 
 * @param none
 */
private void sendMail() throws AddressException, MessagingException {

    // Get a Properties object
    Properties props = System.getProperties();

    // ******************** FOR PROXY ******************

    // props.setProperty("proxySet","true");
    // props.setProperty("socksProxyHost","9.10.11.12");
    // props.setProperty("socksProxyPort","80");
    // props.setProperty("socksProxyVersion","5");

    props.setProperty("mail.smtp.host", "smtp.gmail.com");

    // ******************** FOR SSL ******************
    //final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    //props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
    //props.setProperty("mail.smtp.socketFactory.fallback", "false");
    //props.setProperty("mail.smtp.port", "465");
    //props.setProperty("mail.smtp.socketFactory.port", "465");

    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.starttls.required", "true");

    props.put("mail.smtp.auth", "true");
    props.put("mail.debug", "true");
    props.put("mail.store.protocol", "pop3");
    props.put("mail.transport.protocol", "smtp");
    final String username = "ishanv291@gmail.com";
    final String password = "ishaN3030";
    Session session = Session.getDefaultInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

    // -- Create a new message --
    Message msg = new MimeMessage(session);
    msg.setFrom(new InternetAddress("sender@gmail.com"));
    msg.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse("recipient@yahoo.com", false));
    msg.setSubject("Hello");
    msg.setSentDate(new Date());

    // **************** Without Attachments ******************
    msg.setText("How are you");


    Transport.send(msg);
    System.out.println("Message sent.");
}
}
