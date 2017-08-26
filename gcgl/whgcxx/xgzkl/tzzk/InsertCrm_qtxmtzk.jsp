<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<form method="POST" name="listform" action="" target="_blank">
<CENTER >
  <B><font size="3">其它收费项目打折（不含管理费、税金）(调整记录号：<%=tzjlh%>)</font></B>
<table border="1" cellspacing="0" cellpadding="1" width="60%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70%">其它收费项目</td>
	<td  width="30%">折扣<b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<%

try {
	conn=cf.getConnection();

	String sfxmbm=null;
	double zk=0;
	int row=0;

	ls_sql="SELECT sfxmbm,zk";
	ls_sql+=" FROM crm_qtxmtzk  ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ls_sql+=" order by  sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		zk=rs.getDouble("zk");

		row++;


		%>
		<tr align="center">
			<td>
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:252PX">
				  <option value=''></option>
          <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfkdz='Y' and sfxmlx not in('5','6','7','8','A','B') order by sfxmbm",sfxmbm);
%> 
                </select>			</td>
			<td>
				<input type="text" name="zk" value="<%=zk%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	for (int i=row;i<10 ;i++ )
	{
		%>
		<tr align="center">
			<td>
                <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:252PX">
				  <option value=''></option>
          <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfkdz='Y' and sfxmlx not in('5','6','7','8','A','B') order by sfxmbm","");
%> 
                </select>			</td>
			<td>
				<input type="text" name="zk" value="" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
		</tr>
		<%
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
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
<tr bgcolor="#FFFFFF"> 
      <td colspan="12" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="tzjlh" value="<%=tzjlh%>">
		<input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">      </td>
    </tr>
</table>
</CENTER>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("请输入[调整记录号]！");
		FormName.tzjlh.focus();
		return false;
	}
	FormName.action="SaveInsertCrm_qtxmtzk.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

