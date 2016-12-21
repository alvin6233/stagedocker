package com.alvin.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by alvin on 16/12/21.
 */

@RestController
public class StageController {
    @GetMapping("/sayPing")
    public String say(String ping){
        return "hello,"+ping;
    }
}
