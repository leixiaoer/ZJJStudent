package cn.ppdxzz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

/**
 * Description: 学生实体类
 *
 * @Date: 2020/2/17 14:08
 * @Author: PeiChen
 */
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student implements Serializable {
    /**
     * 姓名
     * 性别
     * 学号
     * 班级
     * 联系方式
     * 家庭住址
     * 宿舍号
     * 育人导师
     * 学生状态是否激活：1 激活 0 禁用
     */
    private Integer id;
    private String name;
    private String sex;
    private String sno;
    private String stu_class;
    private String phone;
    private String place;
    private String dorm_id;
    private String teacher;
    private Integer status;

}
