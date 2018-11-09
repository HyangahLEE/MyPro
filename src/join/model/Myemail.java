package join.model;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class Myemail extends Authenticator {
    @Override

    protected PasswordAuthentication getPasswordAuthentication() {

        return new PasswordAuthentication("dlgiddk30@naver.com","giddk19950211");

    }

}