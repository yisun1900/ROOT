<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fbr=(String)session.getAttribute("yhmc");

String wtmc=null;
String sfkdx=null;
String yxbz=null;
String fbsj=null;
String wtbh=cf.GB2Uni(request.getParameter("wtbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select wtmc,sfkdx,yxbz,fbsj ";
	ls_sql+=" from  crm_khdcwt";
	ls_sql+=" where  wtbh="+wtbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
	}
	rs.close();
	ps.close();
%>


<html>
<head>
<title>维护数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">客户调查问题－维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>问题名称</td>
      <td colspan="3"> 
        <input type="text" name="wtmc" value="<%=wtmc%>" size="80" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>有效标志</td>
      <td width="34%"><%
	cf.radioToken(out, "yxbz","Y+有效&N+无效",yxbz);
%> </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>是否可多选</td>
      <td width="30%"><%
	cf.radioToken(out, "sfkdx","1+多选&2+单选&3+写说明",sfkdx);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>发布人</td>
      <td width="34%"> 
        <input type="text" name="fbr" value="<%=fbr%>" size="15" readonly>
      <td align="right" width="20%"><font color="#CC0000">*</font>发布时间</td>
      <td width="30%"> 
        <input type="text" name="fbsj" size="15"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4"><b><font color="#0000CC">问题答案</font></b></td>
    </tr>
<%
	String bgcolor="#FFFFFF";
	String dabh=null;
	String damc=null;
	String sfyxsm=null;
	int row=0;
	ls_sql="select dabh,damc,sfyxsm";
	ls_sql+=" from  crm_khdcwtda";
	ls_sql+=" where  wtbh="+wtbh;
	ls_sql+=" order by dabh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dabh=cf.fillNull(rs.getString("dabh"));
		damc=cf.fillNull(rs.getString("damc"));
		sfyxsm=cf.fillNull(rs.getString("sfyxsm"));

		row++;

		if (row%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"> 
		  <td align="right" width="16%">[答案<%=row%>]编号</td>
		  <td width="34%"> 
			<input type="text" name="dabh<%=row%>" value="<%=row%>" size="15" maxlength="8" >
		  </td>
		  <td width="20%" align="right">[答案<%=row%>]允许填写说明</td>
		  <td width="30%"> 
<%
		cf.radioToken(out, "sfyxsm"+row,"Y+允许&N+不允许",sfyxsm);
%>
		</td>
		</tr>
		<tr bgcolor="<%=bgcolor%>"> 
		  <td align="right" width="16%">[答案<%=row%>]名称</td>
		  <td colspan="3"> 
			<input type="text" name="damc<%=row%>" value="<%=damc%>" size="80" maxlength="100" >
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	for (int i=row+1;i<=10 ;i++ )
	{
		if (i%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"> 
		  <td align="right" width="16%">[答案<%=row%>]编号</td>
		  <td width="34%"> 
			<input type="text" name="dabh<%=i%>" value="<%=i%>" size="15" maxlength="8" >
		  </td>
		  <td width="20%" align="right">[答案<%=i%>]允许填写说明</td>
		  <td width="30%"> 
<%
		cf.radioToken(out, "sfyxsm"+i,"Y+允许&N+不允许","N");
%>
		</td>
		</tr>
		<tr bgcolor="<%=bgcolor%>"> 
		  <td align="right" width="16%">[答案<%=row%>]名称</td>
		  <td colspan="3"> 
			<input type="text" name="damc<%=i%>" value="" size="80" maxlength="100" >
		  </td>
		</tr>
		<%
	}
%>


    <tr align="center"> 
      <td colspan="4"> 
		 <input type="hidden" name="wtbh"  value="<%=wtbh%>" >
       <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)
{
	if(	javaTrim(FormName.wtmc)=="") {
		alert("请输入[问题名称]！");
		FormName.wtmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.yxbz)) {
		alert("请选择[有效标志]！");
		FormName.yxbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkdx)) {
		alert("请选择[是否可多选]！");
		FormName.sfkdx[0].focus();
		return false;
	}


	
	
	if(javaTrim(FormName.dabh1)=="")
	{
		alert("请输入[[答案1]编号]！");
		FormName.dabh1.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsm1)) {
		alert("请选择[答案1]允许填写说明]！");
		FormName.sfyxsm1[0].focus();
		return false;
	}
	if(javaTrim(FormName.damc1)=="")
	{
		alert("请输入[[答案1]名称]！");
		FormName.damc1.focus();
		return false;
	}
	
	
	FormName.action="SaveEditCrm_khdcwt.jsp";
	FormName.submit();
	return true;
	
}

//-->
</SCRIPT>

<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
