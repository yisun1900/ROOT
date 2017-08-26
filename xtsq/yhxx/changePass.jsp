<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改用户口令</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String) session.getAttribute("yhdlm");
String yhmc=null;
String yhkl=null;
String mmxgsj=null;
String yhqx=null;
String fgsmc=null;
String dwmc=null;
String mmsyzq=null;
String wenti=null;
String daan=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sq_yhxx.yhmc,sq_yhxx.yhkl,a.dwmc fgsmc,b.dwmc dwmc,mmsyzq,wenti,daan";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where sq_yhxx.ssfgs=a.dwbh and sq_yhxx.dwbh=b.dwbh and sq_yhxx.yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=rs.getString("yhmc");
		yhkl=rs.getString("yhkl");
		fgsmc=rs.getString("fgsmc");
		dwmc=rs.getString("dwmc");
		mmsyzq=rs.getString("mmsyzq");
		wenti=cf.fillNull(rs.getString("wenti"));
		daan=cf.fillNull(rs.getString("daan"));
	}
	rs.close();
	ps.close();

	if (yhmc==null)
	{
		ls_sql="select yhmc,yhkl,gysmc";
		ls_sql+=" FROM jxc_ppgysdzb ";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhmc=rs.getString("yhmc");
			yhkl=rs.getString("yhkl");
			fgsmc=rs.getString("gysmc");
			dwmc=rs.getString("gysmc");
		}
		rs.close();
		ps.close();
	}

	ls_sql="select ROUND(SYSDATE-mmxgsj) mmxgsj";
	ls_sql+=" FROM sq_yhxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmxgsj=rs.getString("mmxgsj");
	}
	rs.close();
	ps.close();
	if (mmxgsj==null)
	{
		mmxgsj="0";
	}

	ls_sql="select count(*)";
	ls_sql+=" FROM v_sqxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and cdbh='010204'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhqx=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (yhqx.equals("0"))
	{
		out.println("错误！未授权修改口令，请联系管理员，可能未做任何授权");

		String xtrzip=request.getRemoteHost();

		ls_sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+yhdlm+"','"+yhmc+"',SYSDATE,'警告！非法侵入[修改用户口令]："+yhmc+"') ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		session.setAttribute("yhdlm",null);
		return;
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



<body bgcolor="#FFFFFF">
<form method="post" action="SaveChangePass.jsp" name="insertform" target="_blank">
          
<%
	if (yhkl.equals("111111"))
	{
		%>
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr bgcolor="#FFFFFF"> 
			  <td colspan="4" height="89" align="center"> 
				<p>修改『<b>用户名及口令</b>』</p>
				
				<p><b><font color="#FF0000">提醒：您目前的口令是[111111]，必须修改才能登陆系统；</font></b></p>
				<p><b><font color="#FF0000">密码长度不小于6位，需数字字母混合使用；</font></b></p>
				<p><b><font color="#FF00CC">密码使用[<%=mmsyzq%>]天必须修改，目前已使用[<%=mmxgsj%>]天</font></b></p>			  </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td height="28" colspan="2" bgcolor="#CCFFFF" align="center"><font color="#0000CC"><b>目前的用户名及口令</b></font></td>
			  <td colspan="2" height="28" bgcolor="#FFFFCC" align="center"><font color="#0000CC"><b>新的用户名及口令</b></font></td>
			</tr>
			<tr bgcolor="#FFFFFF">
			  <td height="27" align="right" bgcolor="#CCFFFF"><font color="#0000FF">所属公司</font></td>
			  <td bgcolor="#CCFFFF"><%=fgsmc%></td>
			  <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">所属部门</font></td>
			  <td bgcolor="#FFFFCC"><%=dwmc%></td>
		    </tr>
			
			<tr bgcolor="#FFFFFF"> 
			  <td align="right" width="17%" bgcolor="#CCFFFF"><font color="#0000CC">目前</font><font color="#0000FF">用户登陆名</font></td>
			  <td width="33%" bgcolor="#CCFFFF"> 
			  <input type="text" name="yhdlm" value="<%=yhdlm%>" readonly size="20">			  </td>
			  <td width="17%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>输入新用户登陆名</td>
			  <td width="33%" bgcolor="#FFFFCC"> 
				<input type="text" name="newyhdlm" value="<%=yhdlm%>" maxlength="16" size="20">
				（<font color="#FF0000"><b>可修改</b></font>） </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td align="right" bgcolor="#CCFFFF"></td>
			  <td bgcolor="#CCFFFF"> 
				<input type="hidden" name="oldpass" value="<%=yhkl%>">			  </td>
			  <td width="17%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>输入新新口令</td>
			  <td width="33%" bgcolor="#FFFFCC"> 
				<input type="password" name="newpass" maxlength="50" size="20">			  </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td align="right" bgcolor="#CCFFFF"><font color="#0000FF">用户姓名</font></td>
			  <td bgcolor="#CCFFFF"> 
				<input type="text" name="yhmc" value="<%=yhmc%>" readonly size="20">			  </td>
			  <td width="17%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>重输新口令</td>
			  <td width="33%" bgcolor="#FFFFCC"> 
				<input type="password" name="newpass1" maxlength="50" size="20">			  </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td colspan="4" height="46" align="center"> 
				<input type="button" value="修改『用户名及口令』" onClick="submit_onclick(insertform)">			  </td>
			</tr>
		  </table>
		<%
	}
	else{
		%>
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr bgcolor="#FFFFFF"> 
			  <td colspan="4" height="89" align="center"> 
				<p>修改『<b>用户名及口令</b>』</p>
				<p><b><font color="#FF0000">密码长度不小于6位，需数字字母混合使用；</font></b></p>
				<p><b><font color="#FF00CC">密码使用[<%=mmsyzq%>]天必须修改，目前已使用[<%=mmxgsj%>]天</font></b></p>			  </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td height="28" colspan="2" bgcolor="#CCFFFF" align="center"><font color="#0000CC"><b>目前的用户名及口令</b></font></td>
			  <td colspan="2" height="28" bgcolor="#FFFFCC" align="center"><font color="#0000CC"><b>新的用户名及口令</b></font></td>
			</tr>
			<tr bgcolor="#FFFFFF">
			  <td height="27" align="right" bgcolor="#CCFFFF"><font color="#0000FF">所属公司</font></td>
			  <td bgcolor="#CCFFFF"><%=fgsmc%></td>
			  <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">所属部门</font></td>
			  <td bgcolor="#FFFFCC"><%=dwmc%></td>
		    </tr>
			
			<tr bgcolor="#FFFFFF"> 
			  <td align="right" width="17%" bgcolor="#CCFFFF"><font color="#0000CC">目前</font><font color="#0000FF">用户登陆名</font></td>
			  <td width="33%" bgcolor="#CCFFFF"> 
			  <input type="text" name="yhdlm" value="<%=yhdlm%>" readonly size="20">			  </td>
			  <td width="17%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>输入新用户登陆名</td>
			  <td width="33%" bgcolor="#FFFFCC"> 
				<input type="text" name="newyhdlm" value="<%=yhdlm%>" maxlength="16" size="20">
				（<font color="#FF0000"><b>可修改</b></font>） </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>输入目前的口令			  </td>
			  <td bgcolor="#CCFFFF"> 
				<input type="password" name="oldpass" maxlength="50" size="20" >			  </td>
			  <td width="17%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>输入新新口令</td>
			  <td width="33%" bgcolor="#FFFFCC"> 
				<input type="password" name="newpass" maxlength="50" size="20">			  </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td align="right" bgcolor="#CCFFFF"><font color="#0000FF">用户姓名</font></td>
			  <td bgcolor="#CCFFFF"> 
				<input type="text" name="yhmc" value="<%=yhmc%>" readonly size="20">			  </td>
			  <td width="17%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>重输新口令</td>
			  <td width="33%" bgcolor="#FFFFCC"> 
				<input type="password" name="newpass1" maxlength="50" size="20">			  </td>
			</tr>
			<tr bgcolor="#FFFFFF"> 
			  <td colspan="4" height="46" align="center"> 
				<input type="button" value="修改『用户名及口令』" onClick="submit_onclick(insertform)">			  </td>
			</tr>
		  </table>
		<%
	}
%>
			<BR>
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr bgcolor="#FFFFFF"> 
			  <td colspan="4" height="47" align="center"> 
				<p><font color="#0000FF" size="5"><b>注意：下述问题和答案为忘记密码时，找回密码使用</b></font></p>			  </td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
			  <td width="10%" height="27" align="right" bgcolor="#CCFFFF">提问问题</td>
			  <td width="40%" bgcolor="#CCFFFF"><input type="text" name="wenti" value="<%=wenti%>" maxlength="50" size="35"></td>
			  <td width="10%" align="right" bgcolor="#FFFFCC">答案</td>
			  <td width="40%" bgcolor="#FFFFCC"><input type="text" name="daan" value="<%=daan%>" maxlength="50" size="35"></td>
		    </tr>
			<tr bgcolor="#FFFFFF"> 
			  <td colspan="4" height="46" align="center"> 
				<input type="button" value="修改『问题和答案』" onClick="f_do(insertform)">			  </td>
			</tr>
		  </table>

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.oldpass)=="") {
		alert("请输入[目前的口令]！");
		FormName.oldpass.select();
		return false;
	}

	if(	javaTrim(FormName.newyhdlm)=="") {
		alert("请输入[新用户登陆名]！");
		FormName.newyhdlm.select();
		return false;
	}
	
	if (FormName.yhdlm.value!=FormName.newyhdlm.value)
	{
		if (FormName.newyhdlm.value.length<5)
		{
			alert("[新用户登陆名]不能小于5位！");
			FormName.newyhdlm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.newpass)=="") {
		alert("请输入[新口令]！");
		FormName.newpass.select();
		return false;
	}
	if(	javaTrim(FormName.newpass1)=="") {
		alert("请重输[新口令]！");
		FormName.newpass1.select();
		return false;
	}
	if (FormName.newpass1.value!=FormName.newpass.value)
	{
		alert("两次输的口令不一致！");
		FormName.newpass1.select();
		return false;
	}
	if (FormName.oldpass.value==FormName.newpass.value)
	{
		alert("新旧口令不能相同！");
		FormName.newpass.select();
		return false;
	}

	if (FormName.newyhdlm.value==FormName.newpass.value)
	{
		alert("【用户登陆名】与【口令】不能相同！");
		FormName.newpass.select();
		return false;
	}

	if (FormName.newpass.value.length<6)
	{
		alert("[口令]要不小于6位！");
		FormName.newpass.select();
		return false;
	}

	FormName.action="SaveChangePass.jsp"
	FormName.submit();
	return true;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wenti)=="") {
		alert("请输入[问题]！");
		FormName.wenti.select();
		return false;
	}

	if(	javaTrim(FormName.daan)=="") {
		alert("请输入[答案]！");
		FormName.daan.select();
		return false;
	}
	

	FormName.action="SaveWentiDa.jsp"
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
