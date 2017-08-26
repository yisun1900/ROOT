<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String dbph=cf.GB2Uni(request.getParameter("dbph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double dbsl = 0;
ls=request.getParameter("dbsl");
try{
	if (!(ls.equals("")))  dbsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dbsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
String xsfs=request.getParameter("xsfs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dbdzt="";
	ls_sql=" SELECT dbdzt ";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
	}
	rs.close();
	ps.close();

	//0��δ�ύ��1���ύ�ȴ���ˣ�2�����ͨ���ȴ����⣻3���ѳ���ȴ���⣻7�����δͨ����9��������
	if (!dbdzt.equals("0") )
	{
		out.print("���󣡵�����["+dbph+"]״̬����ȷ��ӦΪ��0��δ�ύ����");
		return;
	}

	int count=0;
	ls_sql=" select count(*) ";
	ls_sql+=" from jxc_dbmx ";
	ls_sql+=" where clbm='"+clbm+"'  and dbph='"+dbph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ѯ�������
	int dbxh=0;
	ls_sql="select NVL(max(dbxh),0)+1 ";
	ls_sql+=" from  jxc_dbmx";
	ls_sql+=" where dbph='"+dbph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (count==0)
	{
		ls_sql="insert into jxc_dbmx (dbph,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,dbsl,cksl,ckje,dbxh,xsfs,dbdj,dbje,cbdj,cbje)";
		ls_sql+=" select       ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?   ,0   ,0   ,?   ,?   ,jxc_cljgb.xsj,jxc_cljgb.xsj*?,jxc_cljgb.cbj,jxc_cljgb.cbj*?";
		ls_sql+=" from  jxc_cljgb,jxc_clbm";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
		ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dbph);
		ps.setDouble(2,dbsl);
		ps.setInt(3,dbxh);
		ps.setString(4,xsfs);
		ps.setDouble(5,dbsl);
		ps.setDouble(6,dbsl);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jxc_dbmx set dbsl=?,dbje=dbdj*?,cbje=cbdj*?";
		ls_sql+=" where clbm='"+clbm+"'  and dbph='"+dbph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dbsl);
		ps.setDouble(2,dbsl);
		ps.setDouble(3,dbsl);
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