package vn.dangthehao.bookshop.domain.dto;

import vn.dangthehao.bookshop.service.validator.ForgotPassChecked;
import vn.dangthehao.bookshop.service.validator.StrongPassword;

@ForgotPassChecked
public class ForgotPasswordDTO {
    private String email;
    @StrongPassword
    private String password;
    private String confirmPassword;
    private String verificationCode;
    private String confirmVerificationCode;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getConfirmVerificationCode() {
        return confirmVerificationCode;
    }

    public void setConfirmVerificationCode(String confirmVerificationCode) {
        this.confirmVerificationCode = confirmVerificationCode;
    }

}
