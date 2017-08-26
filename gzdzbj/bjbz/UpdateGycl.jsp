<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String yhdlm=(String)session.getAttribute("yhdlm");
String xzgycl = request.getParameter("xzgycl");
String[] wybh = request.getParameterValues("wybh");
String gycl = cf.GB2Uni(request.getParameter("gycl"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String scbz=null;
String czlx=null;

String xmbh=null;
String xmmc=null;

try {
	conn=cf.getConnection();    //得到连接

	if (xzgycl.equals("a"))
	{
		out.println("替换工艺："+dzbjzjmc+"工艺材料简介<BR>");
	}
	else if (xzgycl.equals("b"))
	{
		out.println("替换工艺："+dzbjzgjmc+"工艺材料简介<BR>");
	}
	else if (xzgycl.equals("c"))
	{
		out.println("替换工艺："+dzbjgjmc+"工艺材料简介<BR>");
	}
	else if (xzgycl.equals("all"))
	{
		out.println("替换工艺：全部<BR>");
	}

	conn.setAutoCommit(false);

	for (int i=0;i<wybh.length ;i++ )
	{
		ls_sql="select xmbh,xmmc";
		ls_sql+=" from bj_jzbjb";
		ls_sql+= " where wybh='"+wybh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmbh=rs.getString("xmbh");
			xmmc=rs.getString("xmmc");
		}
		rs.close();
		ps.close();

		if (xzgycl.equals("a"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set agycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (xzgycl.equals("b"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set bgycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (xzgycl.equals("c"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set cgycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (xzgycl.equals("all"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set agycl='"+gycl+"',bgycl='"+gycl+"',cgycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()==1)
		{
			out.println("<BR>序号【"+(i+1)+"】：编号为【"+xmbh+"】的项目【"+xmmc+"】被修改");
		}
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
