package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            return "memberLogin";
        } else {
            return "index";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "memberLogin";
    }

//    @PostMapping("/login")
//    public String login(@RequestParam("memberEmail") String memberEmail,
//                        @RequestParam("memberPassword") String memberPassword) {
//        boolean loginResult = memberService.login(memberEmail, memberPassword);
//        if (loginResult) {
//            return "memberMain";
//        } else {
//            return "memberLogin";
//        }
//    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session,
                        Model model) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            // 세션에 로그인한 사용자의 이메일을 저장
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            model.addAttribute("modelEmail", memberDTO.getMemberEmail());
            return "memberMain";
        } else {
            return "memberLogin";
        }
    }

    @GetMapping("/members")
    public String findAll(Model model) {
        List<MemberDTO> memberList = memberService.findAll();
        model.addAttribute("memberList", memberList);
        return "memberList";
    }

    @GetMapping("/member")
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "memberDetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, Model model) {
        memberService.delete(id);
        // 1. 삭제 후 목록을 DB에서 가져오고 memberList.jsp로 간다.
//        List<MemberDTO> memberDTOList = memberService.findAll();
//        model.addAttribute("memberList", memberDTOList);
//        return "memberList";
        // 2. redirect 방식을 이용하여 /members 주소 요청
        return "redirect:/members";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        // session 값을 가져오기
        String memberEmail = (String) session.getAttribute("loginEmail");
        // memberEmail로 DB에서 해당 회원의 전체 정보 조회
        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        model.addAttribute("member", memberDTO);
        return "memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.update(memberDTO);
        if (result) {
            // 로그인 회원의 memberDetail.jsp
            return "redirect:/member?id="+memberDTO.getId();
        } else {
            return "index";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/ajax-ex")
    public String ajaxEx() {
        return "ajaxEx";
    }

    @GetMapping("/ajax1")
    public @ResponseBody String ajax1() {
        System.out.println("MemberController.ajax1");
        return "ok";
    }

    @PostMapping("/ajax2")
    public @ResponseBody String ajax2() {
        System.out.println("MemberController.ajax2");
        return "good";
    }

    @GetMapping("/ajax3")
    public @ResponseBody String ajax3(@RequestParam("value1") String value1,
                                      @RequestParam("value2") String value2) {
        System.out.println("MemberController.ajax3");
        System.out.println("value1 = " + value1 + ", value2 = " + value2);
        return "vvv";
    }

    @PostMapping("/ajax4")
    public @ResponseBody String ajax4(@RequestParam("value1") String value1,
                                      @RequestParam("value2") String value2) {
        System.out.println("MemberController.ajax4");
        System.out.println("value1 = " + value1 + ", value2 = " + value2);
        String value3 = "i am return";
        return value3;
    }

    @PostMapping("/ajax5")
    public @ResponseBody MemberDTO ajax5(@RequestParam("value1") String value1,
                                      @RequestParam("value2") String value2) {
        System.out.println("MemberController.ajax5");
        System.out.println("value1 = " + value1 + ", value2 = " + value2);
        String value3 = "i am return";
        MemberDTO memberDTO = memberService.findById(1L);
        return memberDTO;
    }

    @PostMapping("/ajax6")
    public @ResponseBody List<MemberDTO> ajax6(@RequestParam("value1") String value1,
                                         @RequestParam("value2") String value2) {
        System.out.println("MemberController.ajax6");
        System.out.println("value1 = " + value1 + ", value2 = " + value2);
        String value3 = "i am return";
        List<MemberDTO> memberDTOList = memberService.findAll();
        return memberDTOList;
    }



}







