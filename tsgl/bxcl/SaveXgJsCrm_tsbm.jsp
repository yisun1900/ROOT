<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String zrbm=cf.GB2Uni(request.getParameter("zrbm"));

String clzt=cf.GB2Uni(request.getParameter("clzt"));


String jsr=cf.GB2Uni(request.getParameter("jsr"));
String jssm=cf.GB2Uni(request.getParameter("jssm"));
java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhcxcsj=null;
ls=request.getParameter("jhcxcsj");
try{
	if (!(ls.equals("")))  jhcxcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhcxcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ����ֳ�ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhcfasj=null;
ls=request.getParameter("jhcfasj");
try{
	if (!(ls.equals("")))  jhcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhcfasj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�������ʱ]����ת����������:"+e);
	return;
}
java.sql.Date jhjjsj=null;
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ����ʱ��]����ת����������:"+e);
	return;
}

String sfhsgd=request.getParameter("sfhsgd");
String pdsgd=request.getParameter("pdsgd");
String hsgdyy =cf.GB2Uni(request.getParameter("hsgdyy"));
String ysgd =cf.GB2Uni(request.getParameter("ysgd"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt="";
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

	if (!getclzt.equals("2") && !getclzt.equals("4") && !getclzt.equals("D"))//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���6���ѳ��ֳ��ȴ���������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�9���������ͨ����A���������δͨ����3���ѽ����B:�ط�δ�����5���᰸
	{
		out.println("���󣡴���״̬����ȷ");
		return;
	}

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

	if (sfhsgd.equals("Y"))//Y����ʩ���ӣ�N��ԭʩ���ӣ�T������ʩ����
	{
		if (wxsgd.equals(ysgd))
		{
			out.println("����ѡ�񡾻�ʩ���ӡ����벻Ҫѡ��ԭʩ���ӡ�");
			return;
		}
	}
	else if (sfhsgd.equals("Y"))//Y����ʩ���ӣ�N��ԭʩ���ӣ�T������ʩ����
	{
		if (!wxsgd.equals(ysgd))
		{
			out.println("����ѡ�񡾲���ʩ���ӡ�����ά��ʩ���ӡ�����ԭʩ����");
			return;
		}
	}
	else{
		wxsgd="";
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_tsjl set zrbmclzt=?,sfhsgd=?,hsgdyy=?,pdsgd=?,wxsgd=?";//0��δ����1��������4���ѽ��գ�5���ѳ��ֳ���6���ѳ�������7���������ͨ����2���ڴ���3���᰸��9:������
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,sfhsgd);
	ps.setString(3,hsgdyy);
	ps.setString(4,pdsgd);
	ps.setString(5,wxsgd);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set jssm=?,jsr=?,jssj=?,jhcxcsj=?,jhcfasj=?,jhjjsj=?,clzt=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jssm);
	ps.setString(2,jsr);
	ps.setDate(3,jssj);
	ps.setDate(4,jhcxcsj);
	ps.setDate(5,jhcfasj);
	ps.setDate(6,jhjjsj);
	ps.setString(7,clzt);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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

