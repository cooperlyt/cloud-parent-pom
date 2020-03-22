package cc.coopersoft.authentication.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.FORBIDDEN, reason = "密码验证失败")
public class PasswordErrorException extends RuntimeException{
}
