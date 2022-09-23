package com.hello.redis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Counter {

    @Autowired
    StringRedisTemplate redisTemplate;

    @GetMapping("/hello")
    public String count(){

        Long increment = redisTemplate.opsForValue().increment("count-people");

        return String.format("Hello，Redis，这是第%d次访问了",increment);
    }
}
