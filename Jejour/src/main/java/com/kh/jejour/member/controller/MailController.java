package com.kh.jejour.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jejour.member.model.service.MemberService;

@Controller
public class MailController {
	
	@Autowired
	MemberService MemberService;
	
	@Autowired
	JavaMailSender mailSender;

	
	// 이메일인증 페이지 이동하기
	@RequestMapping("/member/certifyForm.do")
	public String emailcertify() {


		return "member/emailCertify";
	}
	
	
	// mailSending 코드
    @RequestMapping("/member/auth.do")
    public ModelAndView mailSending(HttpServletRequest request,
    								HttpServletResponse response_email,
    								@RequestParam String email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "dlgkstjq623@gamil.com";
        String tomail = email; // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "<span style='font-size:18px; font-weight:bold;'>안녕하세요 회원님 저희 Jejour 홈페이지를 찾아주셔서 감사합니다! <br><br>"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        "<span style='font-size:18px; font-weight:bold;'>회원님의 인증번호는</span> "
        + "<span style='color:red; font-size:22px; font-weight:bold;'>" +dice+ "</span>"
        + "<span style='font-size:18px; font-weight:bold;'>입니다. 정확하게 입력해주세요!</span> <br><br>"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "<span style='color:green; font-size:18px; font-weight:bold;'>받으신 인증번호를 홈페이지에 입력해 주셔야 "
        + "<span style='color:red; font-size:22px; font-weight:bold;'>다음단계</span>로 넘어갑니다.</span>"; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            
            String contents = content + "<img src=\"http://192.168.20.77:8088/jejour/resources/images/jejulogo.png\">";
           
            messageHelper.setText(contents, true); // 메일 내용
            
            

            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/emailReturn");   //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("email", email);

        System.out.println("mv : " + mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }
    
    @RequestMapping(value="/member/injeung.do{dice}", method = RequestMethod.POST)
    public ModelAndView join_injeung(String email_injeung,
    								 String email,
    								 String dice,
    								 HttpServletResponse response_equals) throws IOException {

        
        System.out.println("마지막 : email_injeung : " + email_injeung);
        
        System.out.println("마지막 : dice : " + dice);
        
        System.out.println("마지막 : email : " + email);
        
     
        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("/member/emailValue");
        
        mv.addObject("email_injeung",email_injeung);
        mv.addObject("email",email);
        
        if (email_injeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
           
            mv.addObject("email_injeung",email_injeung);
            mv.addObject("email", email);
            mv.addObject("auth", email_injeung.equals(dice));
            
            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
            
            
        }else if (email_injeung != dice) {
            
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("member/emailReturn");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
            
        }    
    
        return mv;
        
    }

    
}
