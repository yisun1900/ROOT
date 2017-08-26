<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<table width="98%" border="1" align="center">
  <tr>
    <td colspan="4"><div align="center">交底申请录入</div></td>
  </tr>
  <tr>
    <td><div align="right">交底类型</div></td>
    <td>      <select name="select">
      </select>    </td>
    <td><div align="right">交底时间</div></td>
    <td><input type="text" name="textfield2" /></td>
  </tr>
  <tr>
    <td><div align="right">参与人员</div></td>
    <td><input type="text" name="textfield" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right">交底内容</div></td>
    <td>      <textarea name="textarea"></textarea>    </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><div align="center">
      <input type="submit" name="Submit" value="提交" />
    </div></td>
  </tr>
</table>
</body>
</html>
