package vn.dangthehao.bookshop.service;

import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.Role;
import vn.dangthehao.bookshop.repository.RoleRepository;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role fetchRoleByRoleName(String roleName) {
        return this.roleRepository.findByRoleName(roleName);
    }
}
