<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String psdh=request.getParameter("psdh");
String[] clbm=request.getParameterValues("clbm");
String[] gdj=request.getParameterValues("gdj");
String[] pssl=request.getParameterValues("pssl");

double psje=0;
double sjckdj=0;
double sjpssl=0;
double sumpssl=0;
double sumpsje=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
/***********************************************************\
|		修改材料配送数量										|
\***********************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		try
			{
			sjckdj = Double.parseDouble(gdj[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[配送单价]数字格式不正确，请您确认");
			return;
			}
		try
			{
			sjpssl = Double.parseDouble(pssl[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[配送数量]数字格式不正确，请您确认");
			return;
			}

			psje=sjckdj*sjpssl;


/*******************************************************\
|		更新配送数量，金额，初始化审核数量，金额与出库相同		|
\*******************************************************/
		ls_sql="update cl_psdmx set gdj="+sjckdj+",pssl="+sjpssl+",psje="+psje;
		ls_sql+=" where psdh='"+psdh+"' and clbm='"+cf.GB2Uni(clbm[i])+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
/************************************************************
|		查询删除后出库的数量									|
*************************************************************/
	ls_sql=" SELECT sum(pssl),sum(psje) ";
	ls_sql+=" FROM cl_psdmx ";
    ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumpssl=rs.getDouble(1);
		sumpsje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		更新材料出库单中的数量									|
*************************************************************/
	ls_sql="update cl_psd set pszsl="+sumpssl+",pszje="+sumpsje;
	ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>