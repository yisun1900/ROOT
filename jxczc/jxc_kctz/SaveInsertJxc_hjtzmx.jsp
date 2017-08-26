<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tzph = request.getParameter("tzph");
String lsh = request.getParameter("lsh");
String xhjbh = request.getParameter("xhjbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;


try {
	conn=cf.getConnection();    //得到连接
	

	String clzt = "";
	ls_sql=" select clzt";
	ls_sql+=" from jxc_hjtzjl ";
	ls_sql+=" where tzph='"+tzph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("0"))//0:未提交；9：提交
	{
		out.println("错误！已提交");
		return;
	}

	String clbm = null;
	String clmc = null;
	String ppmc = null;
	String xh = null;
	String nbbm = null;
	String scph = null;
	double kcsl=0;
	String hjbh = null;
	String hwbh = null;
	ls_sql=" select clbm,clmc,ppmc,xh,nbbm,scph,kcsl,hjbh,hwbh";
	ls_sql+=" from jxc_kcb ";
	ls_sql+=" where lsh='"+lsh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		scph=cf.fillNull(rs.getString("scph"));
		kcsl=rs.getDouble("kcsl");
		hjbh=cf.fillNull(rs.getString("hjbh"));
		hwbh=cf.fillNull(rs.getString("hwbh"));
	}
	rs.close();
	ps.close();

	int tzxh=0;
	ls_sql=" select max(NVL(tzxh,0))";
	ls_sql+=" from jxc_hjtzmx ";
	ls_sql+=" where tzph='"+tzph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		tzxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	tzxh++;

	conn.setAutoCommit(false);

	ls_sql="delete from jxc_hjtzmx ";
	ls_sql+=" where tzph='"+tzph+"' and ylsh='"+lsh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close(); 

	ls_sql="insert into jxc_hjtzmx (tzph,tzxh,clbm,clmc,ppmc,xh,nbbm,scph,tzsl,ylsh,yhjbh,yhwbh,xlsh,xhjbh,xhwbh)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzph);
	ps.setInt(2,tzxh);
	ps.setString(3,clbm);
	ps.setString(4,clmc);
	ps.setString(5,ppmc);
	ps.setString(6,xh);
	ps.setString(7,nbbm);
	ps.setString(8,scph);
	ps.setDouble(9,kcsl);
	ps.setString(10,lsh);
	ps.setString(11,hjbh);
	ps.setString(12,hwbh);
	ps.setString(13,"");
	ps.setString(14,xhjbh);
	ps.setString(15,"");
	ps.executeUpdate();
	ps.close();


	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql );
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

