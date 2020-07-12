package com.example.demo.mapper;

import com.example.demo.enity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

//@Repository
@Mapper
public interface UserMapper {
    @Select("Select * from member")
    List<User> getUserList();
    
    @Select("Select * from member where username=#{username}")
    String existName(String username);
    
    @Select("Select roles from member where username=#{username}")
    String getRole(String username);
    
    @Update("update member set password=#{password} where username=#{username}")
    void updatePassword(String username,String password);

    @Insert("insert into member(username,password,roles) values(#{username},#{password},#{roles})")
    void insertUser(String username,String password,String roles);

    @Delete("delete from member where username = #{usename}")
    void deleteUser(String username);
}
