<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");
if (khbh.length>1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfjczjz="";
	String getsgd="";
	ls_sql="select sfjczjz,sgd";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfjczjz=cf.fillNull(rs.getString(1));
		getsgd=cf.fillNull(rs.getString("sgd"));
	}
	else{
		out.println("错误！咨询客户信息不存在");
		return;
	}
	rs.close();
	ps.close();

	String fjtcbz="";
	String zjxxh="";
	ls_sql="select fjtcbz,zjxxh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
	}
	rs.close();
	ps.close();
	
	
	if (fjtcbz.equals("Y"))//Y：是；N：否
	{
		out.println("错误！该客户已经分解套餐主材，不能再删除");
		return;
	}

	if (!zjxxh.equals(""))
	{
		out.println("错误！已有增减项，不能再删除");
		return;
	}

	String qyrq=null;
	String yjjzsj=null;
	String tdyjjzsj=null;
	String htshbz=null;
	String pdclzt=null;
	double sfke=0;

	ls_sql="select sfke,qyrq,yjjzsj,tdyjjzsj,htshbz,pdclzt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfke=rs.getDouble("sfke");
		qyrq=rs.getString("qyrq");
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！客户信息不存在");
		return;
	}
	rs.close();
	ps.close();


	if (!yjjzsj.equals("") || !tdyjjzsj.equals(""))
	{
		out.println("错误！业绩已结转，不能再删除");
		return;
	}

	if (sfke!=0)
	{
		out.println("错误！财务已收款，不能再删除，若需删除可先删除收款信息");
		return;
	}

	if (!htshbz.equals("N"))
	{
		out.println("错误！合同已审核，不能再删除");
		return;
	}

	if (!pdclzt.equals("1") && getsgd.equals(""))
	{
		out.println("错误！已派单，不能再删除");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_hthxx set sybz='N',khbh=null where khbh='"+khbh[0]+"'";;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly where khlx='1' and khbh='"+khbh[0]+"'";;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (count>0)
	{
		ls_sql="update crm_khxx set zt='4',hth=null,qyrq=null,jyjdrq=null,kgrq=null,jgrq=null ";
		ls_sql+=" ,wdzgce=0,qye=0,zqgczjf=0,zhgczjf=0,zqsuijin=0,suijin=0,zqguanlif=0,guanlif=0,zqqtsf=0,zhqtsf=0,zqwjrqyexm=0,zhwjrqyexm=0,zqsjf=0,sjf=0,zqljzjx=0,zhljzjx=0,zjxje=0,zhzjxje=0,zqzjxsuijin=0,zjxsuijin=0,zqzjxguanlif=0,zjxguanlif=0,zqqtsfzjx=0,zhqtsfzjx=0,zqwjrzjx=0,zhwjrzjx=0,zqzjxsjf=0,zhzjxsjf=0,glf=0,zkl=10,zqhtzcbj=0,zhhtzcbj=0,cdzwjmje=0,glfjmje=0,sjjmje=0,suijinbfb=null,glfbfb=null ";
		ls_sql+=" where khbh='"+khbh[0]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set zxzt='1',sfjczjz='1' where khbh='"+khbh[0]+"'";//1：是；2：否
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="delete from crm_khxx where khbh='"+khbh[0]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set zxzt='1',sfjczjz='0' where khbh='"+khbh[0]+"'";//1：是；2：否
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="delete from cw_khfkfa where khbh='"+khbh[0]+"'";;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cw_jzfkjh where khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khqye where khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_tckhqye where khbh='"+khbh[0]+"'";
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
