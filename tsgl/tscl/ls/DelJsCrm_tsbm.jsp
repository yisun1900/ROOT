<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("2") && !getclzt.equals("4") && !getclzt.equals("6") && !getclzt.equals("7"))//1��δ���գ�2�����պ�ֱ�ӳ�����������ˣ�4�����պ�ֱ�ӳ���������ˣ�6���ѽ��յȴ���������7���ȴ����ֳ����������8���ѳ��ֳ�����������ˣ�9���ѳ��ֳ���������ˣ�3���ѽ����5���᰸
	{
		out.println("����״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="update crm_tsjl set clzt='1'";//0��δ����1��������2���ڴ���3���᰸��9:������
	ls_sql+=" where tsjlh='"+tsjlh+"' and clzt='2'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//1��δ���գ�2�����պ�ֱ�ӳ�����������ˣ�4�����պ�ֱ�ӳ���������ˣ�6���ѽ��յȴ���������7���ȴ����ֳ����������8���ѳ��ֳ�����������ˣ�9���ѳ��ֳ���������ˣ�3���ѽ����5���᰸
	ls_sql="update crm_tsbm set clzt='1',jsr=null,jssj=null,jssm=null,jhcfasj=null,sjcfasj=null,jhjjsj=null,fashbm=null,fashr=null,jjfa=null";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsjl set zrbmclzt='1'";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
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
}
%>

