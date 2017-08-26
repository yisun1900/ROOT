<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xgjlh = request.getParameterValues("xgjlh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String scbz=null;
String khbh=null;


String xgqfgsbh=null;
String xgqdwbh=null;
String xgqsjsbh=null;
String xgqsjs=null;
String xgqsjsgh=null;
double xgqwdzgce=0;
double xgqqye=0;
double xgqsuijin=0;
double xgqsuijinbfb=0;
double xgqsjf=0;
double xgqglf=0;
double xgqzkl=0;
double xghzkl=0;
String xgqcxhd=null;
String xgqcxhdbmxq=null;
String xgqcxhdbmzh=null;
String xghcxhdbmxq=null;
String xghcxhdbmzh=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for(int i=0;i<xgjlh.length;i++)
	{   
		ls_sql="select xgqcxhdbmxq,xgqcxhdbmzh,xghcxhdbmxq,xghcxhdbmzh,khbh,scbz,xgqfgsbh,xgqdwbh,xgqsjsbh,xgqsjs,xgqsjsgh,xgqwdzgce,xgqqye,xgqsuijin,xgqsuijinbfb,xgqsjf,xgqglf,xgqzkl,xgqcxhd,xghzkl";
		ls_sql+=" from  crm_qyexgjl";
		ls_sql+=" where xgjlh='"+xgjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xgqcxhdbmxq=cf.fillNull(rs.getString("xgqcxhdbmxq"));
			xgqcxhdbmzh=cf.fillNull(rs.getString("xgqcxhdbmzh"));
			xghcxhdbmxq=cf.fillNull(rs.getString("xghcxhdbmxq"));
			xghcxhdbmzh=cf.fillNull(rs.getString("xghcxhdbmzh"));
			khbh=cf.fillNull(rs.getString("khbh"));
			scbz=rs.getString("scbz");
			xgqfgsbh=cf.fillNull(rs.getString("xgqfgsbh"));
			xgqdwbh=cf.fillNull(rs.getString("xgqdwbh"));
			xgqsjsbh=cf.fillNull(rs.getString("xgqsjsbh"));
			xgqsjs=cf.fillNull(rs.getString("xgqsjs"));
			xgqsjsgh=cf.fillNull(rs.getString("xgqsjsgh"));
			xgqwdzgce=rs.getDouble("xgqwdzgce");
			xgqqye=rs.getDouble("xgqqye");
			xgqsuijin=rs.getDouble("xgqsuijin");
			xgqsuijinbfb=rs.getDouble("xgqsuijinbfb");
			xgqsjf=rs.getDouble("xgqsjf");
			xgqglf=rs.getDouble("xgqglf");
			xgqzkl=rs.getDouble("xgqzkl");
			xgqcxhd=cf.fillNull(rs.getString("xgqcxhd"));
			xghzkl=rs.getDouble("xghzkl");
		}
		else{
			conn.rollback();
			out.println("错误！记录不存在："+xgjlh[i]);
			return;
		}
		rs.close();
		ps.close();

		String xgqzxjwbm=null;
		ls_sql="select zxjwbm";
		ls_sql+=" from  dm_zxjwbm";
		ls_sql+=" where  qd<"+xgqqye+" and "+xgqqye+"<=zd";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xgqzxjwbm=rs.getString("zxjwbm");
		}
		rs.close();
		ps.close();


		if (scbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！记录已被删除："+xgjlh[i]);
			return;
		}


		int count=0;
		String newxgjlh=null;
		ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
		ls_sql+=" from  crm_qyexgjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();
		
		newxgjlh=khbh.trim()+cf.addZero(count,2);
		if (!newxgjlh.equals(xgjlh[i]))
		{
			conn.rollback();
			out.println("["+xgjlh[i]+"]错误！只能删除最新的记录："+newxgjlh);
			return;
		}

		ls_sql=" update crm_khxx set fgsbh=?,dwbh=?,sjsbh=?,sjs=?,sjsgh=?,wdzgce=?,zkl=?,qye=?,pmjj=?,zxjwbm=?   ,suijin=?,suijinbfb=?,sjf=?,glf=?,cxhdbm=?,cxhdbmxq=?,cxhdbmzh=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps=conn.prepareStatement(ls_sql);
		ps.setString(1,xgqfgsbh);
		ps.setString(2,xgqdwbh);
		ps.setString(3,xgqsjsbh);
		ps.setString(4,xgqsjs);
		ps.setString(5,xgqsjsgh);
		ps.setDouble(6,xgqwdzgce);
		ps.setDouble(7,xgqzkl);
		ps.setDouble(8,xgqqye);
		ps.setDouble(9,xgqqye);
		ps.setString(10,xgqzxjwbm);

		ps.setDouble(11,xgqsuijin);
		ps.setDouble(12,xgqsuijinbfb);
		ps.setDouble(13,xgqsjf);
		ps.setDouble(14,xgqglf);
		ps.setString(15,xgqcxhd);
		ps.setString(16,xgqcxhdbmxq);
		ps.setString(17,xgqcxhdbmzh);
		ps.executeUpdate();
		ps.close();


		double suijinbfb=0;
		ls_sql="select suijinbfb";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			suijinbfb=rs.getDouble("suijinbfb");
		}
		rs.close();
		ps.close();

		ls_sql=" update crm_zjxdj set zjxsuijin=jzjje*?/100.0";
		ls_sql+=" where khbh='"+khbh+"'";
		ps=conn.prepareStatement(ls_sql);
		ps.setDouble(1,suijinbfb);
		ps.executeUpdate();
		ps.close();

		double allzjxsuijin=0;

		ls_sql="select sum(zjxsuijin)";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allzjxsuijin=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update crm_khxx set zjxsuijin=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxsuijin);
		ps.executeUpdate();
		ps.close();


		ls_sql="update crm_qyexgjl set scbz='Y',scr='"+yhmc+"',scsj=TRUNC(SYSDATE) where xgjlh='"+xgjlh[i]+"'";//Y:已删除 N：未删除
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();	

	}

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>