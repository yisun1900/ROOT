<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String ls=null;
String ckph=request.getParameter("ckph");
String ddbh=request.getParameter("ddbh");
String sshr=cf.GB2Uni(request.getParameter("sshr"));
String shqk=cf.GB2Uni(request.getParameter("shqk"));

java.sql.Date sshsj=null;
ls=request.getParameter("sshsj");
try{
	if (!(ls.equals("")))  sshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实送货时间]类型转换发生意外:"+e);
	return;
}

String[] zcbm=request.getParameterValues("zcbm");
String[] xh=request.getParameterValues("xh");
String[] shslStr=request.getParameterValues("shsl");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lsclzt="";
	String clzt="";
	String ddshbz="";
	String ddlx="";
	String khbh="";
	ls_sql =" select lsclzt,clzt,ddshbz,ddlx,khbh";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lsclzt=cf.fillNull(rs.getString("lsclzt"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (ddlx.equals("4"))
	{
		if (!clzt.equals("18") && !clzt.equals("20"))//18：已出库; 20：部分送货
		{
			out.println("<BR>错误，存盘失败！订单状态不正确"+clzt);
			return;
		}
	}
	else{
		if (ddshbz.equals("1"))////等待送货通知标志  1：不需待电；2：待电未通知；3：待电已通知
		{
			if (!clzt.equals("13") && !clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))//13：工厂已接收;15：确定送货时间;17：已通知送货; 20：部分送货
			{
				out.println("<BR>错误，存盘失败！订单状态不正确");
				return;
			}
		}
		else{
			if (!clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))//15：确定送货时间;17：已通知送货; 20：部分送货
			{
				out.println("<BR>错误，存盘失败！订单状态不正确");
				return;
			}
		}
	}


	String ckdzt="";
	String sfth="";
	ls_sql="select ckdzt,sfth";
	ls_sql+=" from  jxc_ckd";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		sfth=cf.fillNull(rs.getString("sfth"));
	}
	rs.close();
	ps.close();

	if (!ckdzt.equals("9"))
	{
		out.println("<BR>错误，出库单状态不正确");
		return;
	}

	if (!sfth.equals("N"))
	{
		out.println("<BR>错误，出库单已送货");
		return;
	}
	
	
	String shdbh=null;
	int count=0;
	ls_sql="select NVL(max(substr(shdbh,10,2)),0)";
	ls_sql+=" from  jc_zcshd";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	shdbh=ddbh+cf.addZero(count+1,2);

	conn.setAutoCommit(false);

	ls_sql="delete from jc_zcshd ";
	ls_sql+=" where shdbh='"+shdbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_zcshmx ";
	ls_sql+=" where shdbh='"+shdbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_zcshd (shdbh,ddbh,khbh,shr,shsj,lrr,lrsj,dwbh,bz,ckph)";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shdbh);
	ps.setString(2,ddbh);
	ps.setString(3,khbh);
	ps.setString(4,sshr);
	ps.setDate(5,sshsj);
	ps.setString(6,yhmc);
	ps.setString(7,dwbh);
	ps.setString(8,shqk);
	ps.setString(9,ckph);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xh.length ;i++ )
	{
		double shsl=0;

		shsl=Double.parseDouble(shslStr[i]);

		if (shsl==0)
		{
			continue;
		}
		
		ls_sql="insert into jc_zcshmx (shdbh,xh,ddbh,khbh,zcbm,shsl,bz)";
		ls_sql+=" select                   ?,xh,ddbh,khbh,zcbm,?,?";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shdbh);
		ps.setDouble(2,shsl);
		ps.setString(3,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();
		
		ls_sql =" select sum(shsl)";
		ls_sql+=" from jc_zcshmx";
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_zcddmx set shsl="+shsl;
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	double getsl=0;
	double getshsl=0;
	ls_sql =" select sum(sl),sum(shsl)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" and lx='1'";//1：合同项；2：增项 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsl=rs.getDouble(1);
		getshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	String setclzt="";
	if (getshsl==0)
	{
		setclzt=lsclzt;
	}
	else if (getshsl==getsl)
	{
		setclzt="19";//19：已送货
	}
	else{
		setclzt="20";//20：部分送货
	}

	
	if (!clzt.equals("20") && !clzt.equals("19"))//20：部分送货
	{
		ls_sql="update jc_zcdd set lsclzt='"+clzt+"'";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update jc_zcdd set sshr=?,sshsj=?,shqk=?,clzt='"+setclzt+"'";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sshr);
	ps.setDate(2,sshsj);
	ps.setString(3,shqk);
	ps.executeUpdate();
	ps.close();

	ls_sql =" update  jxc_ckd set sfth='Y'";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>SQL=" + ls_sql);
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
