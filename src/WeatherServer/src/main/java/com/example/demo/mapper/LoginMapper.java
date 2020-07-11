package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.annotation.Bean;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

//@Repository
@Mapper
public interface LoginMapper {

    @Insert("insert into member(username,password) values(#{user_name},#{password})")
    void addUser(String user_name, String password);

    @Select("select distinct role from member where name = #{username}")
    String getUserRoleByName(String username);

    @Select("select distinct password from member where name = #{username}")
    String getUserPasswordByName(String username);
}
