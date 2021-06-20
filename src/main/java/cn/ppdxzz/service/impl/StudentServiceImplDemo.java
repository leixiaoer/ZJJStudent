package cn.ppdxzz.service.impl;


import cn.ppdxzz.dao.StudentDaoDemo;
import cn.ppdxzz.domain.Student;
import cn.ppdxzz.domain.StudentDemo;
import cn.ppdxzz.service.StudentServiceDemo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author ZLF
 */
@Service
public class StudentServiceImplDemo implements StudentServiceDemo {

    /**
     * 调用dao层
     */
    @Autowired
    private StudentDaoDemo studentDaoDemo;

    /**
     * 添加学生信息
     * @param studentDemo
     * @return
     */
    @Override
    public boolean addStudent(StudentDemo studentDemo){

        return studentDaoDemo.addStudent(studentDemo);
    }


    /**
     * 分页查询
     * @param currentPage
     * @param pageSize
     * @return
     */
    @Override
    public PageInfo<StudentDemo> queryStudentsByPage(int currentPage, int pageSize) {
        //传入参数：当前页和每页条数
        PageHelper.startPage(currentPage,pageSize);
        //查询数据
        List<StudentDemo> students = studentDaoDemo.queryAllStudents();
        //通过包装获取分页所需的其他值
        PageInfo<StudentDemo> pageInfo = new PageInfo<>(students);


        return pageInfo;
    }


}
