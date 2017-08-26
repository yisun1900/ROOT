<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] dbphs = request.getParameterValues("dbph");
if (dbphs.length>1)
{
	out.println("错误！每次只能删除一条");
	return;
}

String dbph=dbphs[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String dbdzt="";
	String dqbm=null;
	ls_sql=" SELECT dbdzt,dcdq";
	ls_sql+=" FROM jxc_db ";
	ls_sql+=" where  dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
		dqbm=cf.fillNull(rs.getString("dcdq"));
	}
	rs.close();
	ps.close();

	//0：未提交；1：提交等待审核；2：审核通过等待出库；3：已出库等待入库；7：审核未通过；9：入库完成
	if (!dbdzt.equals("1") )
	{
		out.print("错误！调拨单["+dbph+"]未提交");
		return;
	}

	conn.setAutoCommit(false);



	//修改：材料单(jxc_clpsd)＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update jxc_db set dbdzt='0',dbzsl=0,dbzje=0,cbzje=0";
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

		if (!xsfs.equals("1"))//2：等待出库  ,1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			ls_sql="update jxc_cljgb set dhsl=dhsl-"+dbsl;
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
	alert("删除提交成功！");
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