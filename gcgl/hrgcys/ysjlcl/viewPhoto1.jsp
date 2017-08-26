<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ysjlh=request.getParameter("ysjlh");

String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/imggcys/";


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
					ls_sql=" delete from crm_heyszp";
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
				ls_sql=" delete from crm_heyszp";
				ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				out.println("成功删除图片："+filename[i]);
			}
		}

		/*int zpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_heyszp";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql="update crm_gcfxysjl set zpsl=?";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zpsl);
		ps.executeUpdate();
		ps.close();*/
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>验收记录号：<%=ysjlh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="22%">文件名称</td>
  <td width="10%">照片对应项目</td>
  <td width="30%">照片说明</td>
  <td width="44%">照片</td>
</tr>
<%

	String yszpmc=null;
	String zpxm=null;
	String zplx=null;
	String zpsm=null;
	ls_sql="SELECT yszpmc,zpxm,zplx,zpsm";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ls_sql+=" order by yszpmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);
		zpxm=cf.fillNull(rs.getString(2));
		zplx=cf.fillNull(rs.getString("zplx"));
		zpsm=cf.fillNull(rs.getString("zpsm"));

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=yszpmc%></td>
		  <td><%=zpxm%></td>
		  <td><%=zpsm%></td>
		  <td > 
			<div align="center"><A HREF="ViewImage.jsp?zhaopian=/imggcys/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/imggcys/<%=yszpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("上载照片失败，Exception:" + e);
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
</table>
</form>
</CENTER>
</body>
</html>