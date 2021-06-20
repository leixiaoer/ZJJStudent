package cn.ppdxzz.dao;


import cn.ppdxzz.domain.Student;
import cn.ppdxzz.domain.StudentDemo;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ZLF
 */
@Repository
public interface StudentDaoDemo {
    /**
     * 添加学生
     *
     * @param studentDemo
     * @return
     */
    @Insert("INSERT INTO stu(stuName, birthday, address,photo) VALUES (#{stuName},#{birthday},#{address},#{photo})")
    public boolean addStudent(StudentDemo studentDemo);

    /**
     * 分页查询数据展示
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageInfo<StudentDemo> queryStudentsByPage(int currentPage, int pageSize);

    /**
     * 查询所有操作
     * @return
     */
    @Select("select * from stu")
    public List<StudentDemo> queryAllStudents();
}
