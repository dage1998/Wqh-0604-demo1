package com.qf.controller;


import com.qf.common.JsonBean;
import com.qf.domain.HouseLog;
import com.qf.service.HouseLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Login")
@ResponseBody
public class LoginController {


    @Autowired
 private HouseLogService houseLogService;

    @RequestMapping("/in")
    public JsonBean loginIn(HouseLog houseLog , HttpServletRequest request){

        HouseLog houseLog111 = new HouseLog();

        houseLog111 = houseLogService.logincount(houseLog);

        if (houseLog111 != null ){
            if (!houseLog111.getPassword().equals(houseLog.getPassword())){
                return new JsonBean(0,"登陆失败,密码错误");
            }
            if (houseLog111.getStatus() != 0){
                return new JsonBean(0,"登陆失败,该账号已冻结");
            }

            //塞入Session
            request.getSession().setAttribute("name",houseLog111.getUsername());
            String name = (String) request.getSession().getAttribute("name");
            return new JsonBean(1,name);
        }else{
            return new JsonBean(2,"该账号不存在，请先注册");
        }

    }


    @RequestMapping("/register")
    public JsonBean registerUser(HouseLog houseLog){
        HouseLog i = houseLogService.logincount(houseLog);
        if (i == null){
            houseLogService.registerUser(houseLog);
        }else{
            return new JsonBean(0,"该用户名已存在");
        }
        return new JsonBean(1,null);
    }

    @RequestMapping(value = "/selectLog")
    public JsonBean selectLog(HouseLog houseLog){

        System.out.println("1111");
        System.out.println(houseLog);
        List<HouseLog> houseLogs = houseLogService.selectLog(houseLog);
        System.out.println(houseLogs);
        if (houseLogs != null){
            return new JsonBean(1,houseLogs);
        }

        return new JsonBean(0,"抱歉,暂无数据！");

    }

    @RequestMapping("/loginOut")
    public JsonBean loginOut(HttpServletRequest request){

        request.getSession().removeAttribute("name");

        return new JsonBean(1,null);
    }
}
