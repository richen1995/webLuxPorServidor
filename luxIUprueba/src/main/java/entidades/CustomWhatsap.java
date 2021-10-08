/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

/**
 *
 * @author Richard
 */
public class CustomWhatsap {
    
    // Replace these placeholders with your Account Sid and Auth Token
   public static final String ACCOUNT_SID = "AC8e625ac8f1f808a40d30f57d5fe581de";
   public static final String AUTH_TOKEN = "a2f86c27152ea89d09b911c213112824";
  

   public void Whatsapp(String sms, String numcel) {
        char [] extraerNum = numcel.toCharArray();
        String num = "";
        for (int i = 0; i < extraerNum.length; i++) {
            if(Character.isDigit(extraerNum[i]) && i > 0){
                num += extraerNum[i];
            }    
        }
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
               new com.twilio.type.PhoneNumber("whatsapp:+593" + num),
               new com.twilio.type.PhoneNumber("whatsapp:+14155238886"),
               sms)
               //"Hello from your friendly neighborhood Java application!")
           .create();
   }
   
}

