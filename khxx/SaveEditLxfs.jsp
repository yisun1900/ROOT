<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String email=cf.GB2Uni(request.getParameter("email"));
String khlxfs=cf.GB2Uni(request.getParameter("khlxfs"));

String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//联系方式不能重复
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+khbh+"' and lxfs='"+lxfs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<P>提醒！此[联系方式]已存在");
	}



	conn.setAutoCommit(false);


	ls_sql="update crm_zxkhxx set lxfs=?,email=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lxfs);
	ps.setString(2,email);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set lxfs=?,email=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lxfs);
	ps.setString(2,email);
	ps.executeUpdate();
	ps.close();

	//增加：客户联系方式＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="delete from crm_khlxfs ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	java.util.StringTokenizer rowArray=new java.util.StringTokenizer(khlxfs,"*");
	int row=rowArray.countTokens();
	for (int i=0;i<row;i++ )
	{
		String rowStr=rowArray.nextToken();
		java.util.StringTokenizer colArray=new java.util.StringTokenizer(rowStr,"^");
		int col=colArray.countTokens();

		String lxr="";
		String lx="";
		String dhqh="";
		String qhdh="";
		String dhhm="";
		String fenji="";

		if (col>0)
		{
			lxr=colArray.nextToken();
		}
		if (col>1)
		{
			lx=colArray.nextToken();
		}
		if (col>2)
		{
			dhqh=colArray.nextToken();
		}
		if (col>3)
		{
			qhdh=colArray.nextToken();
		}
		if (col>4)
		{
			dhhm=colArray.nextToken();
		}
		if (col>5)
		{
			fenji=colArray.nextToken();
		}

		ls_sql="insert into crm_khlxfs ( khbh,qhdh,lxr,dhhm,fj,dhqh,lx,bz ) ";
		ls_sql+=" values ( '"+khbh+"','"+qhdh+"','"+lxr+"','"+dhhm+"','"+fenji+"','"+dhqh+"','"+lx+"','' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	//增加：客户联系方式＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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