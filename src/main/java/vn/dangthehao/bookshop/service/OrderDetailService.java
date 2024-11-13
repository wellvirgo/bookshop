package vn.dangthehao.bookshop.service;

import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.OrderDetail;
import vn.dangthehao.bookshop.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailService(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    public OrderDetail saveOrderDetail(OrderDetail orderDetail) {
        return this.orderDetailRepository.save(orderDetail);
    }

}
