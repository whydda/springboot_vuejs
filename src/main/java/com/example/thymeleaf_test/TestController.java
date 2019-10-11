package com.example.thymeleaf_test;

import com.example.thymeleaf_test.params.CommonMap;
import com.example.thymeleaf_test.params.ResponseMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: whydda
 * Date: 2019-10-02
 * Time: 오후 3:45
 */
@RestController
public class TestController {
    @GetMapping("/user/info")
    public Map<String, Object> userInfo() throws Exception {
        List<String> list = Arrays.asList("산에가기", "바다가기", "신라호텔뷔페가기");
        return new ResponseMap().ok("성공하였습니다.", list);
    }
}
