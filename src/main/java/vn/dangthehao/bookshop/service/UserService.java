package vn.dangthehao.bookshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.Role;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.domain.dto.RegisterDTO;
import vn.dangthehao.bookshop.repository.RoleRepository;
import vn.dangthehao.bookshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> fetchUsers() {
        return this.userRepository.findAll();
    }

    public Page<User> fetchUsersWithPagination(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public User fetchUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public void saveUser(User user) {
        this.userRepository.save(user);
    }

    public User fetchUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public boolean checkEmailExists(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User convertRegisterUserToUser(RegisterDTO registerUser) {
        User user = new User();
        user.setFullName(registerUser.getFirstName() + " " + registerUser.getLastName());
        user.setEmail(registerUser.getEmail());
        user.setPassword(registerUser.getPassword());
        user.setPhone(registerUser.getPhone());
        return user;
    }

    public Role getRoleByName(String roleName) {
        return this.roleRepository.findByRoleName(roleName);
    }
}
