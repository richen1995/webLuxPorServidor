/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Richard
 */
public class CustomGmail {
    
    public void enviarGmail(String correo_receptor, String asunto, String sms){
        
        try{
        Properties objProperties = new Properties();
        objProperties.setProperty("mail.smtp.host", "smtp.gmail.com");
        objProperties.setProperty("mail.smtp.starttls.enable", "true");
        objProperties.setProperty("mail.smtp.port", "587");
//        objProperties.setProperty("mail.smtp.port", "465");
//        objProperties.setProperty("mail.smtp.port", "2525");
        objProperties.setProperty("mail.smtp.auth", "true");
        
        Session objSession = Session.getInstance(objProperties);
        String correoemisor     = "richen1995@gmail.com"; 
        String clavemisor = "semestre";
        
        //Cuerpo del mensaje
        MimeMessage objMimeMessage = new MimeMessage(objSession);
        objMimeMessage.setFrom(new InternetAddress(correoemisor));
        objMimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(correo_receptor));
//        objMimeMessage.setSubject("Asunto Prueba");
//        objMimeMessage.setText("Mensaje de Prueba");
        objMimeMessage.setSubject(asunto);
        objMimeMessage.setText(sms);
        
        //Transportar Mensaje
        Transport objTransportar = objSession.getTransport("smtp");
        objTransportar.connect(correoemisor, clavemisor);
        objTransportar.sendMessage(objMimeMessage, objMimeMessage.getRecipients(Message.RecipientType.TO));
        objTransportar.close();
        
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
