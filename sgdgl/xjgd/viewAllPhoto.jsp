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



%>
<body bgcolor="#FFFFFF">
<CENTER>
  <B>巡检记录号：<%=xjjlh%></B><BR>
  <hr>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="5%">序号</td>
  <td width="22%">文件名称</td>
  <td width="10%">照片关键字</td>
  <td width="15%">照片说明</td>
  <td width="10%">客户可看照片标志</td>
  <td width="10%">审核标志</td>
  <td width="10%">审核人</td>
  <td width="10%">审核时间</td>
  <td width="10%">审核说明</td>
  <td width="44%">照片</td>
</tr>

<%

	int row=0;
	String xjzpmc=null;
	String getzpgjz=null;
	String getzpsm=null;
	String zpml=null;
	String kkzpbz=null;
	String zpshbz=null;
	String shr=null;
	String shsj=null;
	String shsm=null;



	ls_sql="SELECT xjzpmc,zpgjz,zpsm,zpml,DECODE(kkzpbz,'0','不可看','1','可看') kkzpbz,DECODE(zpshbz,'Y','合格','B','不合格','C','不合格重拍','N','未审核') zpshbz,shr,shsj,shsm";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" order by lx,xjzpmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xjzpmc=rs.getString("xjzpmc");
		getzpgjz=rs.getString("zpgjz");
		getzpsm=rs.getString("zpsm");
		zpml=rs.getString("zpml");
		kkzpbz=cf.fillHtml(rs.getString("kkzpbz"));
		zpshbz=cf.fillHtml(rs.getString("zpshbz"));
		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shsm=cf.fillHtml(rs.getString("shsm"));

		row++;

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=row%></td>
		  <td><%=xjzpmc%></td>
		  <td><%=getzpgjz%></td>
		  <td><%=getzpsm%></td>
		  <td><%=kkzpbz%></td>
		  <td><%=zpshbz%></td>
		  <td><%=shr%></td>
		  <td><%=shsj%></td>
		  <td><%=shsm%></td>
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
</table>
</form>
</CENTER>
</body>
</html>
