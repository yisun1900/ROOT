<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=request.getParameter("ckph");
String[] clbm=request.getParameterValues("clbm");
String[] leixing=request.getParameterValues("leixing");
String[] gdj=request.getParameterValues("gdj");
String[] cksl=request.getParameterValues("cksl");

double ckje=0;
double sjckdj=0;
double sjcksl=0;
double sumcksl=0;
double sumckje=0;
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
|		�޸Ĳ��ϳ�������										|
\***********************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		try
			{
			sjckdj = Double.parseDouble(gdj[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[���ⵥ��]���ָ�ʽ����ȷ������ȷ��");
			return;
			}
		try
			{
			sjcksl = Double.parseDouble(cksl[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[��������]���ָ�ʽ����ȷ������ȷ��");
			return;
			}

			ckje=sjckdj*sjcksl;


/*******************************************************\
|		���³�������������ʼ���������������������ͬ		|
\*******************************************************/
		ls_sql="update cl_ckmx set gdj="+sjckdj+",cksl="+sjcksl+",ckje="+ckje;
		ls_sql+=" where ckph='"+ckph+"' and clbm='"+cf.GB2Uni(clbm[i])+"' and leixing='"+cf.GB2Uni(leixing[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
/************************************************************
|		��ѯɾ������������									|
*************************************************************/
	ls_sql=" SELECT sum(cksl),sum(ckje) ";
	ls_sql+=" FROM cl_ckmx ";
    ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumcksl=rs.getDouble(1);
		sumckje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²��ϳ��ⵥ�е�����									|
*************************************************************/
	ls_sql="update cl_ckd set ckzsl="+sumcksl+",ckzje="+sumckje;
	ls_sql+=" where ckph='"+ckph+"' ";
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