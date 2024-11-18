package vn.dangthehao.bookshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.dangthehao.bookshop.domain.dto.ForgotPasswordDTO;
import vn.dangthehao.bookshop.service.UserService;

@Service
public class ForgotPassValidator implements ConstraintValidator<ForgotPassChecked, ForgotPasswordDTO> {

    private UserService userService;

    public ForgotPassValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(ForgotPasswordDTO forgotPasswordDTO, ConstraintValidatorContext context) {
        boolean valid = true;

        if (!userService.checkEmailExists(forgotPasswordDTO.getEmail())) {
            context.buildConstraintViolationWithTemplate("User with this email is not exist")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        if (!forgotPasswordDTO.getPassword().equals(forgotPasswordDTO.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Confirm password is not match new password")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        return valid;
    }

}
