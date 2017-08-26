<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看工程巡检照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String xjjlh=request.getParameter("xjjlh");

String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/yblimg/xjgd";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	String zpml="";
	ls_sql="SELECT zpml";
	ls_sql+=" FROM kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpml=cf.fillNull(rs.getString("zpml"));
	}
	rs.close();
	ps.close();

	if ((dir.isDirectory())&&(filename!=null))//执行删除操作
	{
		for (int i=0;i<filename.length ;i++ )
		{
	//		out.println("filename="+ls+"\\"+filename[i]);

			lsFile=new java.io.File(ls+"/"+zpml+"/"+cf.GB2Uni(filename[i]));
			lsFile.delete();

			ls_sql=" delete from kp_xjgdjlzp";
			ls_sql+=" where  xjjlh='"+xjjlh+"' and xjzpmc='"+cf.GB2Uni(filename[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			out.println("成功删除图片："+cf.GB2Uni(filename[i]));
		}

		int zpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM kp_xjgdjlzp";
		ls_sql+=" where xjjlh='"+xjjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql="update kp_xjgdjl set zpsl=?";
		ls_sql+=" where xjjlh='"+xjjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zpsl);
		ps.executeUpdate();
		ps.close();
	}


%>
<body bgcolor="#FFFFFF">
<CENTER>
  <B>巡检记录号：<%=xjjlh%></B><BR>
  <hr>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="xjjlh" value="<%=xjjlh%>" >

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="4%">选择文件</td>
  <td width="22%">文件名称</td>
  <td width="10%">照片关键字</td>
  <td width="30%">照片说明</td>
  <td width="44%">照片</td>
</tr>
<%

	String xjzpmc=null;
	String getzpgjz=null;
	String getzpsm=null;
	ls_sql="SELECT xjzpmc,zpgjz,zpsm";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" order by  xjzpmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xjzpmc=rs.getString("xjzpmc");
		getzpgjz=rs.getString("zpgjz");
		getzpsm=rs.getString("zpsm");

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td> 
			<input name="filename" type="checkbox" value="<%=xjzpmc%>">
		  </td>
		  <td><%=xjzpmc%></td>
		  <td><%=getzpgjz%></td>
		  <td> 
			<input type="text" name="zpsm" size="39" maxlength="50" value="<%=getzpsm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			<input type="hidden" name="xjzpmc" value="<%=xjzpmc%>">
		  </td>
		  <td> 
			<A HREF="/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/<%=zpml%>/<%=java.net.URLEncoder.encode(xjzpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="300"></A>
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
	<tr bgcolor="#FFFFFF">
	<td colspan="5"  > 
		<input type=button value='删除选中的信息' onclick="f_del(editform)">
		<input type=button value='修改照片说明' onclick="f_xg(editform)">
	</td>
	</tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_del(FormName)
{
	if ( confirm("确实要继续吗?") )	
	{
		FormName.action="viewPhoto.jsp";
		FormName.submit();
		return true;
	}
} 

function f_xg(FormName)
{

	FormName.action="SaveEditKp_xjgdjlzp.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>