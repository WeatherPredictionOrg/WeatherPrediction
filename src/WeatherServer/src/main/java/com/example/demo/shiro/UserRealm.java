package com.example.demo.shiro;
import com.example.demo.enity.User;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 自定义Realm
 * @author wza
 *
 */

public class UserRealm extends AuthorizingRealm{
    @Autowired
    private UserService userSerivce;
    private UserMapper mapper;
    /**
     * 执行授权逻辑
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("————身份认证方法————");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        User user = userSerivce.findByName(token.getUsername());

        if (user == null) {
            //用户名不存在
            return null;//shiro底层会抛出UnKnowAccountException
        }

        //2.判断密码
        return new SimpleAuthenticationInfo(user, user.getPassword(), "");
    }


//User u=this.mapper.findByName(token.getUsername());
//        String password = this.mapper.findByName(token.getUsername()).getPassword();
//        System.out.println(password);
//        if (null == password) {
//            throw new AccountException("用户名不正确");
//        } else if (!password.equals(new String((char[])token.getCredentials()))) {
//            throw new AccountException("密码不正确");
//        } else {
//            System.out.println("身份认证完毕");
//            return new SimpleAuthenticationInfo(token.getPrincipal(), password, this.getName());
//        }
//    }
    /**
     * 执行认证逻辑
     */


        protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
            System.out.println("————身————");
        return null;
    }
}
