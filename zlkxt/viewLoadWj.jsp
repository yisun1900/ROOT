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


%>
<body bgcolor="#FFFFFF">
<CENTER><B>设计资料（客户：<%=khxm%>）</B><BR><HR>
<form method="post" action="viewLoadWj.jsp" name="editform">
<input type="hidden" name="khbh" value="<%=khbh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="10%"> 
	<font color="#000099">下载</font>
  </td>
  <td width="7%"> 
	<font color="#000099">存放目录</font>
  </td>
  <td width="25%"> 
	<font color="#000099">文件名称</font>
  </td>
  <td width="25%"> 
	<font color="#000099">图片</font>
  </td>
  <td width="33%"> 
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

		String wjmc1="&nbsp;";
		String ml1="/zlkxt/files/sjzlk/"+ml+"/";

		if ((wjmc.indexOf(".jpg")!=-1) || (wjmc.indexOf(".JPG")!=-1))
		{
			wjmc1="<img src=\""+ml1+"/"+wjmc+"\" width=\"200\">";
			wjmc1="<A HREF=\"ViewImage.jsp?zhaopian="+ml1+java.net.URLEncoder.encode(wjmc,"UTF-8")+"\" target=\"_blank\">"+wjmc1+"</A>";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td>
			<a href="<%=ml1%><%=wjmc%>" >点击右键下载</a>
		  </td>
		  <td><%=ml%></td>
		  <td><%=wjmc%></td>
		  <td><%=wjmc1%></td>
		  <td align="left"><%=wjsm%></td>
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
</table>
</form>
</CENTER>
</body>
</html>
