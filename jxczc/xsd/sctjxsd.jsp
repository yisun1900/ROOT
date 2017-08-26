<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xsphs = request.getParameterValues("xsph");
if (xsphs.length>1)
{
	out.println("错误！每次只能删除一条");
	return;
}

String xsph=xsphs[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String xsdzt=null;
	String dqbm=null;
	ls_sql=" SELECT xsdzt,dqbm ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("1"))//0：未提交；2：提交；3：已出库 
	{
		out.print("错误！销售批号["+xsph+"]未提交！");
		return;
	}

	conn.setAutoCommit(false);



	//修改：材料单(jxc_clpsd)＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update jxc_fcxsd set xsdzt='0',xszsl=0,xszje=0,cbzje=0";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//修改：材料单(jxc_clpsd)＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//检查数量录入是否正确
	String clbm=null;
	String clmc=null;
	String nbbm=null;
	String xsfs=null;
	double xssl=0;
	ls_sql=" select clbm,clmc,nbbm,xssl,xsfs ";
	ls_sql+=" from jxc_fcxsmx ";
	ls_sql+=" where xsph='"+xsph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		xssl=rs.getDouble("xssl");
		xsfs=cf.fillNull(rs.getString("xsfs"));

		if (!xsfs.equals("1"))//2：等待出库  ,1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			ls_sql="update jxc_cljgb set dhsl=dhsl-"+xssl;
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