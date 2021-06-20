package cn.ppdxzz.service;


import cn.ppdxzz.domain.StudentDemo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface StudentServiceDemo {


    /**
     * 添加学生
     *
     * @param studentDemo
     * @return
     */
    public boolean addStudent(StudentDemo studentDemo);


    /**
     * 分页查询数据展示
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageInfo<StudentDemo> queryStudentsByPage(int currentPage, int pageSize);

}
