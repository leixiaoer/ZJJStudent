package cn.ppdxzz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentDemo {

    private Integer sid;
    private String stuName;//学生姓名
    private Date birthday;//学生生日
    private String address;//学生地址
    private String photo;//学生头像

}
