package cc.coopersoft.authentication.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class UserExistsException extends RuntimeException {

    public UserExistsException(String message) {
        super(message);
    }
}
