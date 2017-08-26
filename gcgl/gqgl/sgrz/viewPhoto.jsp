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
String djjlh=request.getParameter("djjlh");

String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/gcgl/gcjdgz/images";

String ysjlh=cf.executeQuery("SELECT ysjlh FROM crm_gcjddjjl where djjlh='"+djjlh+"' ");


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	if ((dir.isDirectory())&&(filename!=null))//执行删除操作
	{
		for (int i=0;i<filename.length ;i++ )
		{
			filename[i]=cf.GB2Uni(filename[i]);
			lsFile=new java.io.File(ls+"/"+filename[i]);
			if (lsFile.exists())
			{
				if (lsFile.delete())
				{
					ls_sql=" delete from crm_gcyszp";
					ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					out.println("成功删除图片："+filename[i]);
				}
				else{
					out.println("<BR>！！！！删除图片失败："+filename[i]);
				}
			}
			else{
				ls_sql=" delete from crm_gcyszp";
				ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				out.println("成功删除图片："+filename[i]);
			}
		}
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>验收记录号：<%=ysjlh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="djjlh" value="<%=djjlh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="15%"> 
	<div align="center"><font color="#000099">选择文件</font></div>
  </td>
  <td width="25%"> 
	<div align="center"><font color="#000099">文件名称</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">照片</font></div>
  </td>
</tr>
<%

	String yszpmc=null;
	ls_sql="SELECT yszpmc";
	ls_sql+=" FROM crm_gcyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="15%"> 
			<div align="center"><input name="filename" type=checkbox value="<%=yszpmc%>"></div>
		  </td>
		  <td width="25%"> 
			<div align="center"><%=yszpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="/gcgl/gcjdgz/ViewImage.jsp?zhaopian=/gcgl/gcjdgz/images/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/gcgl/gcjdgz/images/<%=yszpmc%>" width="300"></A></div>
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
	<td colspan="3" height="2"> 
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