<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String czxh=request.getParameter("czxh");
String khbh=request.getParameter("khbh");
String[] clbm=request.getParameterValues("clbm");
String[] cldlmc=request.getParameterValues("cldlmc");
String[] gdj=request.getParameterValues("gdj");
String[] sqlqsl=request.getParameterValues("sqlqsl");

double ckje=0;
double sjckdj=0;
double sjcksl=0;
double xjsqlqsl=0;
double xjsqlqje=0;
double xjsjje=0;
double khqybfb=0;
String sfjm="0";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
/***********************************************************\
|		�޸Ĳ���������ȡ����										|
\***********************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		sjckdj = Double.parseDouble(gdj[i]);
		sjcksl = Double.parseDouble(sqlqsl[i]);
		ckje=sjckdj*sjcksl;


/*******************************************************\
|		����������ȡ����������ʼ���������������������ͬ		|
\*******************************************************/
		ls_sql="update cl_djjmx set gdj="+sjckdj+",sqlqsl="+sjcksl+",sqlqje="+ckje+",sjsl="+sjcksl+",sjje="+ckje;
		ls_sql+=" where czxh='"+czxh+"' and clbm='"+cf.GB2Uni(clbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	/************************************************************
	|		��ѯɾ������������									|
	*************************************************************/
		ls_sql=" SELECT sum(cl_djjmx.sqlqje),sum(cl_djjmx.sjje) ";
		ls_sql+=" FROM cl_djjmx,cl_djj ";
		ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"' and cl_djjmx.cldlmc='"+cf.GB2Uni(cldlmc[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjsqlqje=rs.getDouble(1);
			xjsjje=rs.getDouble(2);
		}
		rs.close();
		ps.close();


	/************************************************************
	|		���´���ȯ������ϸ								|
	*************************************************************/
		ls_sql="update cl_djjflmx set sqlqje="+xjsqlqje+",sjje="+xjsjje;
		ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cf.GB2Uni(cldlmc[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
/************************************************************
|		��ѯɾ������������									|
*************************************************************/
	ls_sql=" SELECT sum(sqlqsl),sum(sqlqje) ";
	ls_sql+=" FROM cl_djjmx ";
    ls_sql+=" where czxh='"+czxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjsqlqsl=rs.getDouble(1);
		xjsqlqje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²��ϳ��ⵥ�е�����									|
*************************************************************/
	ls_sql="update cl_djj set sqlqsl="+xjsqlqsl+",sqlqje="+xjsqlqje+",sjsl="+xjsqlqsl+",sjje="+xjsqlqje;
	ls_sql+=" where czxh='"+czxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>