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
String bfxzgycl = request.getParameter("bfxzgycl");
String[] wybh = request.getParameterValues("wybh");
String oldgycl = cf.GB2Uni(request.getParameter("oldgycl"));
String newgycl = cf.GB2Uni(request.getParameter("newgycl"));

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

	if (bfxzgycl.equals("a"))
	{
		out.println("替换工艺："+dzbjzjmc+"工艺材料简介<BR>");
	}
	else if (bfxzgycl.equals("b"))
	{
		out.println("替换工艺："+dzbjzgjmc+"工艺材料简介<BR>");
	}
	else if (bfxzgycl.equals("c"))
	{
		out.println("替换工艺："+dzbjgjmc+"工艺材料简介<BR>");
	}
	else if (bfxzgycl.equals("all"))
	{
		out.println("替换工艺：全部<BR>");
	}

	out.println("被替换字符【"+cf.replace(oldgycl," ","&nbsp;")+"】，替换后字符【"+newgycl+"】<BR>");

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

		if (bfxzgycl.equals("a"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set gycl=REPLACE(gycl,'"+oldgycl+"','"+newgycl+"'),lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (bfxzgycl.equals("b"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set bgycl=REPLACE(bgycl,'"+oldgycl+"','"+newgycl+"'),lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (bfxzgycl.equals("c"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set cgycl=REPLACE(cgycl,'"+oldgycl+"','"+newgycl+"'),lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (bfxzgycl.equals("all"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set gycl=REPLACE(gycl,'"+oldgycl+"','"+newgycl+"')";
			ls_sql+= " , bgycl=REPLACE(bgycl,'"+oldgycl+"','"+newgycl+"')";
			ls_sql+= " , cgycl=REPLACE(cgycl,'"+oldgycl+"','"+newgycl+"'),lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
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
