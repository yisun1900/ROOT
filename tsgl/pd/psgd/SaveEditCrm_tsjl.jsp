<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sfhsgd=request.getParameter("sfhsgd");
String pdsgd=request.getParameter("pdsgd");
String hsgdyy =cf.GB2Uni(request.getParameter("hsgdyy"));
String ysgd =cf.GB2Uni(request.getParameter("ysgd"));

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String wxsgd="";
	ls_sql="select sgdmc";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+pdsgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxsgd=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	if (sfhsgd.equals("Y"))//Y����ʩ���ӣ�N����
	{
		if (wxsgd.equals(ysgd))
		{
			out.println("����ѡ�񡾻�ʩ���ӡ����벻Ҫѡ��ԭʩ���ӡ�");
			return;
		}
	}
	else{
		if (!wxsgd.equals(ysgd))
		{
			out.println("����ѡ�񡾲���ʩ���ӡ�����ά��ʩ���ӡ�����ԭʩ����");
			return;
		}
	}

	ls_sql="update crm_tsjl set sfhsgd=?,hsgdyy=?,pdsgd=?,wxsgd=?";//0��δ����1��������4���ѽ��գ�5���ѳ��ֳ���6���ѳ�������7���������ͨ����2���ڴ���3���᰸��9:������
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfhsgd);
	ps.setString(2,hsgdyy);
	ps.setString(3,pdsgd);
	ps.setString(4,wxsgd);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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