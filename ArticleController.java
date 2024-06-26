package com.chicchic.mini_project.controller;

import com.chicchic.mini_project.dao.ArticleDAO;
import com.chicchic.mini_project.vo.ArticleVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class ArticleController {
    // GET : 게시글
    @GetMapping("/article/{anum}/{view}")
    public ResponseEntity<List<ArticleVO>> articleList(@PathVariable("anum") int anum, @PathVariable("view") int view) {
        System.out.println(anum);
        ArticleDAO dao = new ArticleDAO();
        List<ArticleVO> list = dao.articleList(anum, view);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/smallArticle/{anum}") // 작은 게시글목록
    public ResponseEntity<List<ArticleVO>> smallArticleList(@PathVariable("anum") int anum) {
        System.out.println(anum + "카테고리");
        ArticleDAO dao = new ArticleDAO();
        List<ArticleVO> list = dao.smallArticleList(anum);
        System.out.println(list);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/articles/{num}")
    public ResponseEntity<List<ArticleVO>> article(@PathVariable("num") int num) {
        System.out.println(num);
        ArticleDAO dao = new ArticleDAO();
        List<ArticleVO> list = dao.article(num);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping("/newArticle") // 글작성
    public ResponseEntity<Boolean> newArticle(@RequestBody Map<String, String> regData) {
        String getId = regData.get("id");
        int getBnum = Integer.parseInt(regData.get("bnum"));
        String getTitle = regData.get("title");
        String getText = regData.get("text");
        String getPwd = regData.get("pwd");
        String getImg = regData.get("image");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.newArticle(getId, getBnum, getTitle, getText, getPwd, getImg);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    // 공지사항, 새소식 글작성
    @PostMapping("/NewNotice") // 글작성
    public ResponseEntity<Boolean> newNotice(@RequestBody Map<String, String> regData) {
        int getBnum = Integer.parseInt(regData.get("bnum"));
        String getId = regData.get("id");
        String getTitle = regData.get("title");
        String getText = regData.get("text");
        String getPwd = regData.get("pwd");
        String getImg = regData.get("image");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.newNotice(getBnum, getId, getTitle, getText, getPwd, getImg);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @GetMapping("/articleDelete/{anum}") // 글삭제
    public ResponseEntity<List<ArticleVO>> deleteArticle(@PathVariable("anum") int anum) {
        ArticleDAO dao = new ArticleDAO();
        dao.delete(anum);
        System.out.println(anum);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/update") // 글 수정
    public ResponseEntity<Boolean> updateArticle(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));
        int getBnum = Integer.parseInt(regData.get("bnum"));
        String getTitle = regData.get("title");
        String getText = regData.get("text");
        String getPwd = regData.get("pwd");
        String getImg = regData.get("img");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.update(getAnum, getBnum, getTitle, getText, getPwd, getImg);
        System.out.println("글수정 완료");
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @PostMapping("/comment") // 댓글작성
    public ResponseEntity<Boolean> newComment(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));
        String getId = regData.get("id");
        String getText = regData.get("text");
        String getPwd = regData.get("pwd");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.newComment(getAnum, getId, getText, getPwd);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }
    @GetMapping("/showComment/{anum}") // 댓글 목록
    public ResponseEntity<List<ArticleVO>> commentList(@PathVariable("anum") int anum) {
        System.out.println(anum + "댓글");
        ArticleDAO dao = new ArticleDAO();
        List<ArticleVO> list = dao.commentList(anum);
        System.out.println(list);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/commentDelete/{commentNum}") // 댓글삭제
    public ResponseEntity<List<ArticleVO>> deleteComment(@PathVariable("commentNum") int commentNum) {
        ArticleDAO dao = new ArticleDAO();
        dao.deleteComment(commentNum);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/viewComment/{commentNum}") // 댓글 수정 전 내용 가져오기
    public ResponseEntity<List<ArticleVO>> viewComment(@PathVariable("commentNum") int commentNum) {
        System.out.println(commentNum + "댓글수정");
        ArticleDAO dao = new ArticleDAO();
        List<ArticleVO> list = dao.viewComment(commentNum);
        System.out.println(list);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping("/updateComment") // 댓글수정
    public ResponseEntity<Boolean> updateComment(@RequestBody Map<String, String> regData) {
        int getCommentNum = Integer.parseInt(regData.get("commentNum"));
        String getText = regData.get("text");
        String getPwd = regData.get("pwd");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.updateComment(getCommentNum, getText, getPwd);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @PostMapping("/viewCount")
    public ResponseEntity<Boolean> view(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));

        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.view(getAnum);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @PostMapping("/newLike")
    public ResponseEntity<Boolean> like(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));
        String getId = regData.get("id");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.like(getAnum, getId);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @PostMapping("/disLike")
    public ResponseEntity<Boolean> dislike(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));
        String getId = regData.get("id");
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.dislike(getAnum, getId);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }


    @GetMapping("/deleteLike/{anum}") //
    public ResponseEntity<List<ArticleVO>> deleteLike(@PathVariable("anum") int anum) {
        ArticleDAO dao = new ArticleDAO();
        dao.deleteLike(anum);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/countLike/{anum}/{id}")
    public ResponseEntity<Integer> countLike(@PathVariable("id") String id, @PathVariable("anum") int anum) {
        ArticleDAO dao = new ArticleDAO();
        int count = dao.countLike(id, anum);
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    @PostMapping("/plusLike") // 좋아요 증가
    public ResponseEntity<Boolean> plusLike(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.plusLike(getAnum);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @PostMapping("/minusLike") // 좋아요 감소
    public ResponseEntity<Boolean> minusLike(@RequestBody Map<String, String> regData) {
        int getAnum = Integer.parseInt(regData.get("anum"));
        ArticleDAO dao = new ArticleDAO();
        boolean isTrue = dao.minusLike(getAnum);
        return new ResponseEntity<>(isTrue, HttpStatus.OK);
    }

    @GetMapping("/deleteCommentAll/{anum}") // 댓글전체삭제
    public ResponseEntity<List<ArticleVO>> deleteCommentAll(@PathVariable("anum") int anum) {
        ArticleDAO dao = new ArticleDAO();
        dao.deleteCommentAll(anum);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/isUser/{anum}/{id}")
    public ResponseEntity<Integer> isUser(@PathVariable("id") String id, @PathVariable("anum") int anum) {
        ArticleDAO dao = new ArticleDAO();
        int count = dao.isUser(id, anum);
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    @GetMapping("/commentMatch/{commentNum}/{id}/{anum}")
    public ResponseEntity<Integer> commentMatch(@PathVariable("id") String id, @PathVariable("commentNum") int commentNum, @PathVariable("anum") int anum) {
        ArticleDAO dao = new ArticleDAO();
        int count = dao.commentMatch(id, commentNum, anum);
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    @GetMapping("/searchArticle/{text}")
    public ResponseEntity<List<ArticleVO>> searchArticle(@PathVariable("text") String text) {
        ArticleDAO dao = new ArticleDAO();
        System.out.println("게시글 검색");
        List<ArticleVO> list = dao.searchArticle(text);
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

}