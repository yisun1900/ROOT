<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String khbh = request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;

	String sfjczjz="";
	ls_sql="select sfjczjz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfjczjz=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	String qyrq=null;
	String yjjzsj=null;
	String tdyjjzsj=null;
	String htshbz=null;
	double sfke=0;

	ls_sql="select sfke,qyrq,yjjzsj,tdyjjzsj,htshbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfke=rs.getDouble("sfke");
		qyrq=rs.getString("qyrq");
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！客户信息不存在");
		return;
	}
	rs.close();
	ps.close();



	String xgjlh=null;
	count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  crm_khxxxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_hthxx set sybz='N',khbh=null where khbh='"+khbh+"'";;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly where khlx='1' and khbh='"+khbh+"'";;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	if (count>0)
	{
		ls_sql="update crm_khxx set zt='4',hth=null,qyrq=null,jyjdrq=null,kgrq=null,jgrq=null ";
		ls_sql+=" ,wdzgce=0,qye=0,zqgczjf=0,zhgczjf=0,zqsuijin=0,suijin=0,zqguanlif=0,guanlif=0,zqqtsf=0,zhqtsf=0,zqwjrqyexm=0,zhwjrqyexm=0,zqsjf=0,sjf=0,zqljzjx=0,zhljzjx=0,zjxje=0,zhzjxje=0,zqzjxsuijin=0,zjxsuijin=0,zqzjxguanlif=0,zjxguanlif=0,zqqtsfzjx=0,zhqtsfzjx=0,zqwjrzjx=0,zhwjrzjx=0,zqzjxsjf=0,zhzjxsjf=0,glf=0,zkl=10,zqhtzcbj=0,zhhtzcbj=0,cdzwjmje=0,glfjmje=0,sjjmje=0,suijinbfb=null,glfbfb=null ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set zxzt='1',sfjczjz='1' where khbh='"+khbh+"'";//1：是；2：否
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="delete from crm_khxx where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set zxzt='1',sfjczjz='0' where khbh='"+khbh+"'";//1：是；2：否
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="delete from cw_khfkfa where khbh='"+khbh+"'";;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cw_jzfkjh where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khqye where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_tckhqye where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql ="insert into crm_khxxxgjl (xgjlh,khbh,xgqnr,xghnr,czlx,lrr,lrsj,lrbm) ";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,"");
	ps.setString(4,khbh);
	ps.setString(5,"删除客户");
	ps.setString(6,yhmc);
	ps.setString(7,lrbm);
	ps.executeUpdate();
	ps.close();

	//删除签单、退单接转信息
	ls_sql="delete from cw_qmjzmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' )";
	ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' )";
	ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' )";
	ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' )";
	ls_sql+=" where jzrq in(select jzrq from cw_qmjzmx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
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
