<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String khbh="";
	String sxhtsfysh="";
	String sfjs="";
	ls_sql =" select khbh,sxhtsfysh,sfjs";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
	}
	rs.close();
	ps.close();

	if (!sxhtsfysh.equals("N"))
	{
		out.println("<BR>错误！手写合同已审核");
		return;
	}

	if (!sfjs.equals("N") && !sfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
	{
		out.println("<BR>错误，已结算不能再修改");
		return;
	}

	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"' and sxbz='2' and cbj=0";//1：非手写；2：手写
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
		out.println("<BR>提醒，有些项目结算价为0");
//		return;
	}

	conn.setAutoCommit(false);


	//对增减项处理＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getzjxbh="";
	ls_sql="select zjxbh,sfjs";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getzjxbh=rs1.getString(1);
		sfjs=cf.fillNull(rs1.getString("sfjs"));


		if (!sfjs.equals("N") && !sfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
		{
			conn.rollback();
			out.println("<BR>错误，增减项编号["+getzjxbh+"]已结算不能再修改");
			return;
		}

		ls_sql="update jc_zczjxmx ";
		ls_sql+=" set zjcbje=jc_zczjxmx.zjsl*(select jc_zcddmx.cbj from jc_zcddmx where jc_zcddmx.xh=jc_zczjxmx.xh)";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//主材增减项（jc_zczjx）:增减项总额
		double zjxcbze=0;
		ls_sql="select sum(zjcbje) ";
		ls_sql+=" from jc_zczjxmx ";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxcbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_zczjx set zjxcbze="+zjxcbze;
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="update jc_jcdd set cbje="+zjxcbze;
		ls_sql+=" where  gjz='"+getzjxbh+"' and lx='4' and czlx='2'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	//对增减项处理＝＝＝＝＝＝＝＝＝＝＝＝结束



	double zjxcbze=0;
	ls_sql="select sum(zjxcbze)";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxcbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double cbze=0;
	ls_sql =" select sum(cbj*sl)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set sxhtsfysh='Y',sxhtshr='"+yhmc+"',sxhtshsj=SYSDATE,cbze="+cbze+",zjxcbze="+zjxcbze;
	ls_sql+=" where  ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set cbje="+cbze;
	ls_sql+=" where  gjz='"+ddbh+"' and lx='4' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材毛利计算＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double zxmle=0;
	double zxhtjz=0;
	ls_sql="SELECT zxmle,zxhtjz";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zxmle=rs.getDouble(1);//最新毛利额
		zxhtjz=rs.getInt(2);//最新合同净值
	}
	rs.close();
	ps.close();

	
	double zczxje=0;
	double zczxcb=0;
	ls_sql="SELECT sum(hkze+zjhze),sum(cbze+ycf+qtf+zjxcbze+zjxycf+zjxqtf)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zczxje=rs.getDouble(1);//主材销售额
		zczxcb=rs.getInt(2);//主材成本额
	}
	rs.close();
	ps.close();

	double zczxml=0;//主材最新毛利
	if (zczxje!=0)
	{
		zczxml=cf.round((zczxje-zczxcb)*100/zczxje,2);
	}

	double khzxml=0;//客户最新毛利
	if ((zczxje+zxhtjz)!=0)
	{
		khzxml=cf.round((zczxje-zczxcb+zxmle)*100/(zczxje+zxhtjz),2);
	}

	ls_sql="update crm_khqye set zczxje=?,zczxcb=?,zczxml=?,khzxml=?";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zczxje);
	ps.setDouble(2,zczxcb);
	ps.setDouble(3,zczxml);
	ps.setDouble(4,khzxml);
	ps.executeUpdate();
	ps.close();
	
	//主材毛利计算＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>