<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/12 0012
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <html>

  <body>
  <div style="width:300px;height:200px;background-color:green;margin-top:15%;margin-left:40%">
    <div style="width:100%;height:100%;display:flex;justify-content:center;align-items:center">

      <form action="/doLogin.do" method="post">
        <input type="text" name="users" placeholder="请输入账号" /> <br />
        <input type="password" name="pwd" placeholder="请输入密码" /> <br />
        <input type="submit" value="登录"/>
      </form>
    </div>
  </div>
  </body>
  </html>
