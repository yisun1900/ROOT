<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String lx=cf.GB2Uni(request.getParameter("lx"));
java.sql.Date jasj=null;
ls=request.getParameter("jasj");
try{
	if (!(ls.equals("")))  jasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jasj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结案时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_tsjl set clzt='3',jasj=? where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jasj);
	ps.executeUpdate();
	ps.close();

	String tsyybm=null;
	String sfjslx=null;
	String jsxbm=null;
	String zzjgbm=null;

	//投诉问题回访明细（crm_tswthfmx）
	ls_sql="select tsyybm";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbm.tsyybm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tsyybm=rs1.getString("tsyybm");

		sfjslx=request.getParameter("sfjslx"+tsjlh+tsyybm);
		jsxbm=request.getParameter("jsxbm"+tsjlh+tsyybm);
		zzjgbm=request.getParameter("zzjgbm"+tsjlh+tsyybm);

		if (lx.equals("2"))//1：投诉；2：报修
		{
			if (sfjslx==null || sfjslx.equals(""))
			{
				conn.rollback();
				out.println("错误！请选择【是否及时联系】");
				return;
			}
		}
		if (zzjgbm==null || zzjgbm.equals(""))
		{
			conn.rollback();
			out.println("错误！请选择【结案客户是否满意】");
			return;
		}
		if (jsxbm==null || jsxbm.equals(""))
		{
			conn.rollback();
			out.println("错误！请选择【解决问题及时性】");
			return;
		}

		ls_sql ="update crm_tsbm set sfjslx=?,zzjgbm=?,jsxbm=?";
		ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfjslx);
		ps.setString(2,zzjgbm);
		ps.setString(3,jsxbm);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>