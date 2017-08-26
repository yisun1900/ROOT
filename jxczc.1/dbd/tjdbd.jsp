<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String dbph=request.getParameter("dbph");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String dbdzt="";
	ls_sql=" SELECT dbdzt ";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
	}
	rs.close();
	ps.close();

	//0：未提交；1：提交等待审核；2：审核通过等待出库；3：已出库等待入库；7：审核未通过；9：入库完成
	if (!dbdzt.equals("0") )
	{
		out.print("错误！调拨单["+dbph+"]已提交！");
		return;
	}

	conn.setAutoCommit(false);



	//修改：材料单(jxc_clpsd)＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double dbzsl=0;
	double dbzje=0;
	double cbzje=0;
	ls_sql=" SELECT sum(dbsl),sum(dbje),sum(cbje)";
	ls_sql+=" FROM jxc_dbmx ";
	ls_sql+=" where dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbzsl=rs.getDouble(1);
		dbzje=rs.getDouble(2);
		cbzje=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_db set dbdzt='1',dbzsl="+dbzsl+",dbzje="+dbzje+",cbzje="+cbzje;
	ls_sql+=" where dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//修改：材料单(jxc_clpsd)＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//检查数量录入是否正确
	String clbm=null;
	String clmc=null;
	String nbbm=null;
	String xsfs=null;
	double dbsl=0;
	ls_sql=" select clbm,clmc,nbbm,dbsl,xsfs ";
	ls_sql+=" from jxc_dbmx ";
	ls_sql+=" where dbph='"+dbph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		dbsl=rs.getDouble("dbsl");
		xsfs=cf.fillNull(rs.getString("xsfs"));

		if (dbsl<=0)
		{
			rs.close();
			ps.close();

			conn.rollback();
			out.print("错误！材料["+clbm+"："+clmc+"]数量必须大于零！");
			return;
		}

		if (!xsfs.equals("1"))//2：等待出库  ,1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			ls_sql="update jxc_cljgb set dhsl=dhsl+"+dbsl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
	}
	rs.close();
	ps.close();



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("提交成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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