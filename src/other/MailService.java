package other;


import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
	
	// �]�w�ǰe�l��:�ܦ��H�H��Email�H�c,Email�D��,Email���e
	public void sendMail(String to, String subject, String messageText) {
			
	   try {
		   // �]�w�ϥ�SSL�s�u�� Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.socketFactory.port", "465");
		   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.port", "465");

       // ���]�w gmail ���b�� & �K�X (�N�ǥѧA��Gmail�ӶǰeEmail)
       // �����NmyGmail���i�w���ʸ��C�����ε{���s���v�j���}
	     final String myGmail = "ixlogic.wu@gmail.com";
	     final String myGmail_password = "BBB45678";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(myGmail));
		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		  
		   //�]�w�H�����D��  
		   message.setSubject(subject);
		   //�]�w�H�������e 
		   message.setText(messageText);

		   Transport.send(message);
		   System.out.println("�ǰe���\!");
     }catch (MessagingException e){
	     System.out.println("�ǰe����!");
	     e.printStackTrace();
     }
   }
	

public String genAuthCode() {
		
		char cx[]=new char[62];
		int timer=0;
		
		//�Na~z�N�J
		for(char i='a';i<='z';i++) {
			cx[timer]=i;
			timer++;
		}
		//�NA~Z�N�J
		for(char i='A';i<='Z';i++) {
			cx[timer]=i;
			timer++;
		}
		//�N0~9�N�J
		for(char i='0';i<='9';i++) {
			cx[timer]=i;
			timer++;
		}
		
		//���ͤ@�ӤK��ƶü�
	
		String right=new String();
		for(int i=0;i<8;i++) {
			int eight=(int)(Math.random()*62);
			right+=cx[eight];
		}
		return right;
		
	
	}


}
