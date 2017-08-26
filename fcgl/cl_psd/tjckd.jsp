<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String psdh=cf.GB2Uni(request.getParameter("psdh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double pszsl = 0;
double pszje = 0;
String pszt="3";

try {
	conn=cf.getConnection();


	String khbh=null;
	ls_sql=" SELECT khbh FROM cl_psd where (psdh='"+psdh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh = rs.getString(1);
	}
	rs.close();
	ps.close();

	double wdzgce = 0;
	double zjxje = 0;
	ls_sql=" SELECT wdzgce,zjxje FROM crm_khxx where (khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		wdzgce = rs.getDouble("wdzgce");
		zjxje = rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();

	double phzje = 0;
	ls_sql=" SELECT sum(psje) ";
	ls_sql+=" FROM cl_psd,cl_psdmx ";
	ls_sql+=" where cl_psd.psdh=cl_psdmx.psdh and cl_psd.khbh='"+khbh+"' and lx='1'";//1：配货；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		phzje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double thzje = 0;
	ls_sql=" SELECT sum(psje) ";
	ls_sql+=" FROM cl_psd,cl_psdmx ";
	ls_sql+=" where cl_psd.psdh=cl_psdmx.psdh and cl_psd.khbh='"+khbh+"' and lx='2'";//1：配货；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		thzje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	// 配送比例公式应调整为：（配送累计金额－退货累计金额）/工程费，其中工程费＝合同原造价＋增减项折前造价

	double psbl=cf.round((phzje-thzje)*100/(wdzgce+zjxje),1);


	if (psbl>25 || psbl<18)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("材料配送比例提醒！当前配送比例<%=psbl%>%，合同原造价＋增减项折前造价『<%=(wdzgce+zjxje)%>』，配送累计金额－退货累计金额『<%=(phzje-thzje)%>』");
		window.close();
		//-->
		</SCRIPT>
		<%
	}


	ls_sql=" SELECT sum(pssl),sum(psje) FROM cl_psdmx where (psdh='"+psdh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pszsl = rs.getDouble(1);
		pszje = rs.getDouble(2);
	}
	rs.close();
	ps.close();

/*******************************************************************************\
|		提交时初始化审核总数量，审核中金额为出库总数量，出库总金额						|
\*******************************************************************************/
	ls_sql="update cl_psd set pszt='2',pszsl="+pszsl+",pszje="+pszje;
	ls_sql+=" where  (psdh='"+psdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提交成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>