<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String psdh=cf.GB2Uni(request.getParameter("psdh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String[] clbm=request.getParameterValues("clbm");
String[] psslstr=request.getParameterValues("pssl");
double pssl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//try {
	conn=cf.getConnection();

	String pszt=null;
	String khbh=null;
	ls_sql=" SELECT pszt,khbh ";
	ls_sql+=" FROM cl_psd ";
    ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszt=cf.fillNull(rs.getString("pszt"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();
	
	if (!pszt.equals("1"))//1：未提交；2：已提交；3：已配送
	{
		out.print("错误！已提交，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		
		if (psslstr[i]==null || psslstr[i].trim().equals(""))
		{
			pssl =0;
		}
		else
		{
		pssl = Double.parseDouble(psslstr[i].trim());
		}
		/*if (pssl==0)
		{
			ls_sql="delete from cl_psdmx ";
			ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}*/

	
			ls_sql="update cl_psdmx set pssl="+pssl+",psje=gdj*"+pssl;
			ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		

		
	}

	double pszsl=0;
	double pszje=0;
	ls_sql=" SELECT sum(pssl),sum(psje) ";
	ls_sql+=" FROM cl_psdmx ";
	ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszsl=rs.getDouble(1);
		pszje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update cl_psd set pszsl="+pszsl+",pszje="+pszje;
	ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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

/*
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
*/

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

/*}
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
}*/
%>