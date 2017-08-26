<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String psdzt=null;
	ls_sql=" SELECT psdzt ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0"))//0：等待提交；2：等待出库；3：已出库；5：部分出库
	{
		out.print("错误！配送单["+psph+"]已提交");
		return;
	}

	conn.setAutoCommit(false);

	//检查数量录入是否正确
	String clbm=null;
	String clmc=null;
	String nbbm=null;
	double pssl=0;
	ls_sql=" select clbm,clmc,nbbm,pssl ";
	ls_sql+=" from jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		pssl=rs.getDouble("pssl");

		if (pssl<=0)
		{
			rs.close();
			ps.close();

			conn.rollback();
			out.print("错误！材料["+clbm+"："+clmc+"]数量必须大于零！");
			return;
		}

		ls_sql="update jxc_cljgb set dhsl=dhsl+"+pssl;
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	double pszsl=0;
	double pszje=0;
	double cbze=0;
	ls_sql=" SELECT sum(pssl),sum(psje),sum(cbj*pssl) ";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszsl=rs.getDouble(1);
		pszje=rs.getDouble(2);
		cbze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_clpsd set psdzt='2',pszsl="+pszsl+",pszje="+pszje+",cbze="+cbze;
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>