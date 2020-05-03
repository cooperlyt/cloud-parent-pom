package cc.coopersoft.authentication.dto;

import cc.coopersoft.authentication.entity.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao extends CrudRepository<Role,String> {

    List<Role> findBySystemIsFalse();
}
