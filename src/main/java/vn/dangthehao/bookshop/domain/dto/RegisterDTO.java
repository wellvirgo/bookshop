package vn.dangthehao.bookshop.domain.dto;

import vn.dangthehao.bookshop.service.validator.RegisterChecked;
import vn.dangthehao.bookshop.service.validator.StrongPassword;

@RegisterChecked
public class RegisterDTO {
    private String email;
    private String firstName;
    private String lastName;
    private String phone;

    @StrongPassword
    private String password;
    private String confirmPassword;

    public RegisterDTO() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

}
