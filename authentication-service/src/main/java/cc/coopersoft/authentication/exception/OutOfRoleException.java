package cc.coopersoft.authentication.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNAUTHORIZED)
public class OutOfRoleException extends RuntimeException {

    public OutOfRoleException(String message) {
        super(message);
    }
}
