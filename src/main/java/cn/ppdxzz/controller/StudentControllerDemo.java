package cn.ppdxzz.controller;

import cn.ppdxzz.domain.StudentDemo;
import cn.ppdxzz.service.StudentServiceDemo;
import cn.ppdxzz.utils.LoadUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class StudentControllerDemo {
    private final StudentServiceDemo studentServiceDemo;

    @Autowired
    public StudentControllerDemo(StudentServiceDemo studentServiceDemo) {
        this.studentServiceDemo = studentServiceDemo;
    }

    @RequestMapping("add_student")
    public String addStudent(StudentDemo studentDemo,MultipartFile img) {
        //1. 上传功能 相当于将图片放到指定路径 然后给地址
        String photo = LoadUtil.uploadPhoto(img);
        System.out.println("图片:"+photo);
        studentDemo.setPhoto(photo);
        //2. 添加功能
        boolean flag = studentServiceDemo.addStudent(studentDemo);
        if(flag){
            //添加成功就跳转到主页
            return "redirect:listpage";
        }
        return "add";
    }


    @RequestMapping("listpage")
    public String listAllStudents(@RequestParam(name = "currentPage", required = true, defaultValue = "1")     Integer currentPage,
                                  @RequestParam(name = "pageSize", required = true, defaultValue = "3") Integer pageSize
            , Model model){

        PageInfo<StudentDemo> page = studentServiceDemo.queryStudentsByPage(currentPage, pageSize);
        //将分页结果加载到域中
        model.addAttribute("page",page);
        //跳转到页面展示
        return "stulistpage";
    }

    /**
     * 用于用户不想添加图片从而返回主页
     *
     * @return
     */
    @RequestMapping("to_main")
    public String returnMain() {

        return "main";
    }

    @RequestMapping("to_add")
    public String ToAdd() {

        return "add";
    }

}