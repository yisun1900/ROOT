<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String fgsbh=null;
	ls_sql =" select clzt,fgsbh";
	ls_sql+=" from jc_zcysd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，存盘失败！已完成");
		return;
	}


	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcysdmx";
	ls_sql+=" where ddbh='"+ddbh+"' and sl=0";
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
		out.println("<BR>错误，有的单品未录订货数量");
		return;
	}


	//对小数位处理－－－－－－－－－－－－－－－结束

	double wdzje=0;
	double hkze=0;
	double cxhdje=0;
	double cbze=0;
	double zqclf=0;
	double zhclf=0;
	double ycf=0;
	double qtf=0;
	ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
	ls_sql+=" from jc_zcysdmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzje=rs.getDouble(1);
		hkze=rs.getDouble(2);
		cxhdje=rs.getDouble(3);
		cbze=rs.getDouble(4);
		zqclf=rs.getDouble(5);
		zhclf=rs.getDouble(6);
		ycf=rs.getDouble(7);
		qtf=rs.getDouble(8);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcysd set clzt='01',wdzje="+wdzje+",hkze="+hkze+",htcxhdje="+cxhdje;
	ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf="+ycf+",qtf="+qtf;
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='00'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + e);
	return;
}
finally 
{
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