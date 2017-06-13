<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body background="#EAEAEA">
   <div class="container">
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div align="center">
               <img src="/resources/images/logo.png">
            </div>
            <br/><br/>
            <form class="form center-block"  method="post">
               <div class="form-group">
                   <label class="control-label">아이디</label>
                  <input type="text" class="form-control input-lg" placeholder="ID" id="userId" name="userId">
               </div>
               <div class="form-group">
                  <label class="control-label">비밀번호</label>
                  <input type="password" class="form-control input-lg" placeholder="Password" id="userPw" name="userPw">
               </div>
               <button type="button" class="btn btn-warning" id="login"> 로그인 </button>
            </form>
         </div>
      </div>
   </div>
</body>
</html>