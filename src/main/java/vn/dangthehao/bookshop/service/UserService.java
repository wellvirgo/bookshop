package vn.dangthehao.bookshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> fetchUsers() {
        return this.userRepository.findAll();
    }

    public User fetchUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }
}
