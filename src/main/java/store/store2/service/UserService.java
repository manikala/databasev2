package store.store2.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import store.store2.dto.UserDTO;

// security
public interface UserService extends UserDetailsService {
    boolean save(UserDTO userDTO );
}
