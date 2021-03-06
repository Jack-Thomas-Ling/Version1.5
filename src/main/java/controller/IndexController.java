package controller;


import io.swagger.annotations.ApiOperation;
import model.Topic;
import model.User;
import model.UserDetailed;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.ForumService;
import service.UserService;

import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/test")

public class IndexController {

    @Autowired
    private UserService userService;
    @Autowired
    private ForumService forumService;

    @RequestMapping(value = "/index1",method = RequestMethod.GET)
    @ApiOperation(value = "index1",httpMethod = "GET")

    public String getToIndex(){
        return "test";
    }

    @RequestMapping(value = "/showinfo")
    public String showInfo(Model model){
        List<User> list=userService.getAllUsers();
        model.addAttribute("users",list);

        return "showInfo";
    }

    @RequestMapping(value = "/showtopic")
    public String showTopic(Model model){
        List<Topic> list=forumService.getAllTopics();
        model.addAttribute("topics",list);

    return "showTopic" ;

    }

    //RESTful风格
    //查看详细信息，根据用户user_id

    @RequestMapping(value = "/insertinfo", method = RequestMethod.GET)
    public String insertInfo(
            @RequestParam("userId") int userId,
            @RequestParam("eMail") String eMail,
            @RequestParam("imagePath") String imagePath,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("userSignature") String userSignature,
            @RequestParam("sex") String sex
    ) {

        userService.updateByPrimaryKey(userId, eMail, imagePath, phoneNumber, userSignature,
                sex);
        System.out.println("已经接收到参数：");
        return "showInfo";
    }

    /*
   public String insertInfo(@RequestParam("userId") int userId,
                            @RequestParam("eMail") String eMail){
       userService.updateByPrimaryKey1(userId,eMail);

       System.out.println("已经接收到参数 userId: "+userId+" eMail: "+eMail);
       return "showInfo";

    }
*/
    //进入修改页面
    @RequestMapping(value = "/enter", method = RequestMethod.GET)
    public String enter() {
        return "insertUserInfo";
    }


    @RequestMapping(value = "showdetail/{id}", method = RequestMethod.GET)
    public String showDetail(@PathVariable("id") int id ,Model model){

        UserDetailed userDetailed=userService.getDetailById(id);
        model.addAttribute("userDetail",userDetailed);
        return "showUserDetailedInfo";
    }


}
