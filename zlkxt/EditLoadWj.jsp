<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看隐蔽工程验收照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String khxm=null;

String[] filename=request.getParameterValues("filename");//传递的删除文件名


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();
	
	ls_sql="SELECT khxm";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
	}
	rs.close();
	ps.close();

	//执行删除操作
	if (filename!=null)
	{
		for (int i=0;i<filename.length ;i++ )
		{
			filename[i]=cf.GB2Uni(filename[i]);

			String ml=null;
			ls_sql="SELECT ml";
			ls_sql+=" FROM crm_sjzlk";
			ls_sql+=" where  khbh='"+khbh+"' and wjmc='"+filename[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ml=cf.fillNull(rs.getString("ml"));
			}
			rs.close();
			ps.close();

			if (ml!=null)
			{
				ls_sql=" delete from crm_sjzlk";
				ls_sql+=" where  khbh='"+khbh+"' and wjmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

			String ls=getServletContext().getRealPath("");
			String dirStr=ls+"/zlkxt/files/sjzlk/"+ml+"/";

			java.io.File lsFile=null;
			lsFile=new java.io.File(dirStr+"/"+filename[i]);

			if (lsFile.exists())
			{
				if (lsFile.delete())
				{
					out.println("<P>成功删除："+filename[i]);
				}
				else{
					out.println("<BR>！！！！删除失败："+filename[i]);
				}
			}
			else{
				out.println("<P>成功删除："+filename[i]);
			}
		}
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>设计资料（客户：<%=khxm%>）</B><BR><HR>
<form method="post" action="EditLoadWj.jsp" name="editform">
<input type="hidden" name="khbh" value="<%=khbh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="6%"> 
	<font color="#000099">选择文件</font>
  </td>
  <td width="10%"> 
	<font color="#000099">下载</font>
  </td>
  <td width="7%"> 
	<font color="#000099">存放目录</font>
  </td>
  <td width="30%"> 
	<font color="#000099">文件名称</font>
  </td>
  <td width="47%"> 
	<font color="#000099">文件说明</font>
  </td>
</tr>
<%

	String wjmc=null;
	String ml=null;
	String wjsm=null;
	ls_sql="SELECT wjmc,ml,wjsm";
	ls_sql+=" FROM crm_sjzlk";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wjmc=cf.fillNull(rs.getString("wjmc"));
		ml=cf.fillNull(rs.getString("ml"));
		wjsm=cf.fillNull(rs.getString("wjsm"));

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td> 
			<input name="filename" type=checkbox value="<%=wjmc%>">
		  </td>
		  <td>
			<a href="/zlkxt/files/sjzlk/<%=ml%>/<%=wjmc%>" >点击右键下载</a>
		  </td>
		  <td> 
			<div ><%=ml%>
		  </td>
		  <td> 
			<div ><%=wjmc%>
		  </td>
		  <td align="left"> 
			<%=wjsm%>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("上载版库照片失败，Exception:" + e);
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
	<td colspan="5" > 
	<input type=button value='删除选中的信息' onclick="f_onclick(editform)">
	</td>
	</tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if ( confirm("确实要继续吗?") )	{
		FormName.submit();
		return true;
	}
} 
//-->
</script>