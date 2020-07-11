package com.example.demo.mapper;

import com.example.demo.enity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    @Select("Select * from member")
    List<User> getUserList();

    @Insert("insert into member(username,password) values(#{username},#{password})")
    void insertUser(String username,String password);

    @Delete("delete from member where username = #{usename}")
    void deleteUser(String username);
}
