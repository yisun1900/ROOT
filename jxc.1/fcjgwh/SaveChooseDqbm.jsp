<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String	dqbm=request.getParameter("dqbm");
String[] clbm = request.getParameterValues("clbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//���ϵͳ��ʼ������

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where clbm='"+clbm[i]+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			ls_sql=" insert into jxc_cljgb (clbm,dqbm,gysmc,sftjcp,sfyh,cbj,jsbl,jqpjcbj,lsj,xsj  ";
			ls_sql+=" ,dfgsjg,dgzjg,zxqdl,sfcy,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj ";
			ls_sql+=" ,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
			ls_sql+=" ,lrr,lrsj,lrbm,ssfgs) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,clbm[i]);
			ps.setString(2,dqbm);
			ps.setString(3,"0");
			ps.setString(4,"N");
			ps.setString(5,"Y");
			ps.setDouble(6,0);
			ps.setDouble(7,0);
			ps.setDouble(8,0);
			ps.setDouble(9,0);
			ps.setDouble(10,0);

			ps.setDouble(11,0);
			ps.setDouble(12,0);
			ps.setDouble(13,0);
			ps.setString(14,"N");
			ps.setDouble(15,0);
			ps.setDouble(16,0);
			ps.setString(17,"N");
			ps.setString(18,"");
			ps.setString(19,"");
			ps.setDouble(20,0);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setString(25,"1");
			ps.setDouble(26,0);
			ps.setDouble(27,0);
			ps.setDouble(28,0);
			ps.setDouble(29,0);
			ps.setDouble(30,0);

			ps.setString(31,lrr);
			ps.setString(32,lrbm);
			ps.setString(33,ssfgs);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("<BR>����ʧ��,��������: " + e);
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