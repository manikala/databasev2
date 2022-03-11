package store.store2.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import store.store2.myobj.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findFirstByName (String name);
}
