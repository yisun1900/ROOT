<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String xsph=cf.GB2Uni(request.getParameter("xsph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double xssl = 0;
double xsje = 0;
ls=request.getParameter("xssl");
try{
	if (!(ls.equals("")))  xssl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xssl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xsje");
try{
	if (!(ls.equals("")))  xsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xsje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���۽��]����ת����������:"+e);
	return;
}
String xsfs=request.getParameter("xsfs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xsdzt=null;
	ls_sql=" SELECT xsdzt ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("0"))//0��δ�ύ��2���ύ��3���ѳ��� 
	{
		out.print("������������["+xsph+"]���ύ���������޸ģ�");
		return;
	}

	int count=0;
	ls_sql=" select count(*) ";
	ls_sql+=" from jxc_fcxsmx ";
	ls_sql+=" where clbm='"+clbm+"'  and xsph='"+xsph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ѯ�������
	int xsxh=0;
	ls_sql="select NVL(max(xsxh),0)+1 ";
	ls_sql+=" from  jxc_fcxsmx";
	ls_sql+=" where xsph='"+xsph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (count==0)
	{
		ls_sql="insert into jxc_fcxsmx (xsph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,xssl,xsj          ,xsje           ,cbj          ,cbje           ,cksl,xsxh,xsfs)";
		ls_sql+=" select         ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,jxc_cljgb.xsj,jxc_cljgb.xsj*?,jxc_cljgb.cbj,jxc_cljgb.cbj*?,0   ,?   ,?";
		ls_sql+=" from  jxc_cljgb,jxc_clbm";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
		ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xsph);
		ps.setDouble(2,xssl);
		ps.setDouble(3,xssl);
		ps.setDouble(4,xssl);
		ps.setInt(5,xsxh);
		ps.setString(6,xsfs);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_fcxsmx set xssl=?,xsje=xsj*?,cbje=cbj*?";
		ls_sql+=" where clbm='"+clbm+"'  and xsph='"+xsph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,xssl);
		ps.setDouble(2,xssl);
		ps.setDouble(3,xssl);
		ps.executeUpdate();
		ps.close();
	}
	


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>