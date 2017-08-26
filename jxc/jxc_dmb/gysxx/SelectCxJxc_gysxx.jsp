<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_gysxxCxList.jsp" name="selectform">
<div align="center">供应商信息查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属地区</td>
  <td ><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where  dqbm='"+dqbm+"'","");
	}
%>
  </select></td>
  <td align="right">是否合作</td>
  <td ><input type="radio" name="sfhz" value="Y">
    合作
      <input type="radio" name="sfhz" value="N">
      不合作 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商编码</td>
  <td ><input type="text" name="gysbm" size="20" maxlength="8" ></td>
   <td align="right">供应商名称</td>
  <td width="32%"><input type="text" name="gysmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商类型</td>
  <td colspan="3"><input type="radio" name="gyslx" value="0">
    代销品供货商
      <input type="radio" name="gyslx" value="1">
      库存供货商
      <input type="radio" name="gyslx" value="2">
      共用供货商 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应材料类型</td> 
  <td width="32%">
	<input type="radio" name="cllx" value="1">主材
    <input type="radio" name="cllx" value="2">辅材
    <input type="radio" name="cllx" value="3">主材及辅材  </td>
  <td align="right" width="18%">供应商地址</td> 
  <td width="32%"><input type="text" name="gysdz" size="20" maxlength="100" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">供应商电话</td> 
  <td width="32%"> 
    <input type="text" name="gysdh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">E-Mail</td> 
  <td width="32%"> 
    <input type="text" name="email" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">用户登录名</td> 
  <td width="32%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16" >  </td>
  <td align="right" width="18%">用户口令</td> 
  <td width="32%"> 
    <input type="text" name="yhkl" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">用户名称</td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">财务代码</td> 
  <td width="32%"> 
    <input type="text" name="cwdm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">可登陆系统标志</td>
  <td width="32%">
	<input type="radio" name="kdlxtbz" value="Y">可登陆
    <input type="radio" name="kdlxtbz" value="N">不可登陆  </td>
  <td align="right">是否锁定</td>
  <td width="32%">
	<input type="radio" name="sfsd" value="Y">锁定
    <input type="radio" name="sfsd" value="N">未锁定  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">已经登陆失败次数</td> 
  <td width="32%"><input type="text" name="lxdlsbcs" size="20" maxlength="8" ></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="lxdlsbcs2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">密码修改时间</td> 
  <td width="32%"> 
    <input type="text" name="mmxgsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="mmxgsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">密码使用周期</td>
  <td><input type="text" name="mmsyzq" size="20" maxlength="8" >
    天 </td>
  <td align="right">到</td>
  <td><input type="text" name="mmsyzq2" size="20" maxlength="8" >
天 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">允许登陆失败次数</td> 
  <td width="32%"> 
    <input type="text" name="yxdlsbcs" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="yxdlsbcs2" size="20" maxlength="8" ></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	if(!(isNumber(FormName.lxdlsbcs, "已经登陆失败次数"))) {
		return false;
	}
	if(!(isDatetime(FormName.mmxgsj, "密码修改时间"))) {
		return false;
	}
	if(!(isNumber(FormName.mmsyzq, "密码使用周期"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "允许登陆失败次数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
