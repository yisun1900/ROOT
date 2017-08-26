<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql=" delete from cw_sjsjsmx ";
	ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (lx.equals("1"))//签单提成
	{
		ls_sql=" update crm_khxx set sjstcbl=null,qdsyjsje=null,sjsjsjlh=null,sjsjsbz='0'";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (lx.equals("2"))//结算提成
	{
		ls_sql=" update crm_khxx set sjswgtcbl=null,wgtcje=null,wgjsjlh=null,sjsjsbz='1'";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (lx.equals("3"))//设计客户
	{
		ls_sql=" update crm_khxx set sjswgtcbl=null,wgtcje=null,wgjsjlh=null,sjsjsbz='0'";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	
	int qdzs=0;
	double qdze=0;
	double qdtcze=0;
	ls_sql="select count(*),sum(qye),sum(qdtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='1' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdzs=rs.getInt(1);
		qdze=rs.getDouble(2);
		qdtcze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	int jsgds=0;
	double khjsze=0;
	double yjsje=0;
	double wgtcze=0;
	ls_sql="select count(*),sum(khjsje),sum(qdtcje),sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='2' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsgds=rs.getInt(1);
		khjsze=rs.getDouble(2);
		yjsje=rs.getDouble(3);
		wgtcze=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	double sjf=0;
	double sjftcze=0;
	ls_sql="select sum(qye),sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='3' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjf=rs.getDouble(1);
		sjftcze=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double jsze=qdtcze+wgtcze+sjftcze;

	ls_sql="update cw_sjsjsjl set qdzs=?,qdze=?,qdtcze=?,jsgds=?,khjsze=?,yjsje=?,wgtcze=?,sjf=?,sjftcze=?,jsze=?";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,qdzs);
	ps.setDouble(2,qdze);
	ps.setDouble(3,qdtcze);
	ps.setInt(4,jsgds);
	ps.setDouble(5,khjsze);
	ps.setDouble(6,yjsje);
	ps.setDouble(7,wgtcze);
	ps.setDouble(8,sjf);
	ps.setDouble(9,sjftcze);
	ps.setDouble(10,jsze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>