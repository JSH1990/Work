package com.chicchic.mini_project.controller;


import com.chicchic.mini_project.dao.ArticleDAO;
import com.chicchic.mini_project.dao.MyPageDAO;
import com.chicchic.mini_project.vo.ArticleVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@RestController

public class MyPageController {


    @GetMapping("/getImage/{id}") // 댓글 수정 전 내용 가져오기
    public ResponseEntity<List<ArticleVO>> getImage(@PathVariable("id") String id) {
        MyPageDAO dao = new MyPageDAO();
        List<ArticleVO> list = dao.getImage(id);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping("/updateImage") // 이미지 수정
    public ResponseEntity<Boolean> updateImage(@RequestBody Map<String, String> regData) {
        String getId = regData.get("id");
        String getImage = regData.get("image");
        MyPageDAO dao = new MyPageDAO();
        boolean isTrue = dao.updateImage(getId, getImage);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @GetMapping("/MyPage/{id}/{view}")
    public ResponseEntity<List<ArticleVO>> myHistoryList(@PathVariable("id") String id, @PathVariable("view") int view){
        System.out.println(id);
        MyPageDAO dao = new MyPageDAO();
        List<ArticleVO> list = dao.myHistory(id, view);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
}
