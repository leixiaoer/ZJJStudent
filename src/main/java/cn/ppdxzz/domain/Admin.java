package cn.ppdxzz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

/**
 * Description:管理员实体类
 *
 * @Date: 2020/2/10 15:13
 * @Author: PeiChen
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Admin implements Serializable {
    /**
     * id主键自增
     * 用户名
     * 密码
     * 姓名
     * 学/工号
     * 手机号
     * 是否开启权限
     * 描述
     */
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String uid;
    private String phone;
    private int power;
    private String description;
}
