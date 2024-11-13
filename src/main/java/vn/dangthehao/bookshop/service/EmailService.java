package vn.dangthehao.bookshop.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    private JavaMailSender eMailSender;

    public EmailService(JavaMailSender eMailSender) {
        this.eMailSender = eMailSender;
    }

    public void sendThankMessage(String to, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("dangthehao28@gmail.com");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        this.eMailSender.send(message);
    }
}
