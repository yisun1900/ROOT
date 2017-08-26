<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>出现场照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String kcjlh=request.getParameter("kcjlh");

String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/tsgl/images";


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
	//		out.println("filename="+ls+"\\"+filename[i]);
			filename[i]=cf.GB2Uni(filename[i]);
			lsFile=new java.io.File(ls+"/"+filename[i]);
			if (lsFile.exists())
			{
				if (lsFile.delete())
				{
					ls_sql=" delete from crm_xckczp";
					ls_sql+=" where  kcjlh='"+kcjlh+"' and xczpmc='"+filename[i]+"'";
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
				ls_sql=" delete from crm_xckczp";
				ls_sql+=" where  kcjlh='"+kcjlh+"' and xczpmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				out.println("成功删除图片："+filename[i]);
			}
		}
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>验收记录号：<%=kcjlh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="kcjlh" value="<%=kcjlh%>" >
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

	String xczpmc=null;
	ls_sql="SELECT xczpmc";
	ls_sql+=" FROM crm_xckczp";
	ls_sql+=" where  kcjlh='"+kcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xczpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="15%"> 
			<div align="center"><input name="filename" type=checkbox value="<%=xczpmc%>"></div>
		  </td>
		  <td width="25%"> 
			<div align="center"><%=xczpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="ViewImage.jsp?zhaopian=/tsgl/images/<%=java.net.URLEncoder.encode(xczpmc,"UTF-8")%>" target="_blank"><img src="/tsgl/images/<%=xczpmc%>" width="300"></A></div>
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