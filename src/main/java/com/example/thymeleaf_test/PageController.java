package com.example.thymeleaf_test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by IntelliJ IDEA.
 * User: whydda
 * Date: 2019-10-02
 * Time: 오후 3:45
 */
@Controller
public class PageController {
    @GetMapping({"", "/", "/error", "/*"})
    public String index(){
        return "index";
    }
}
