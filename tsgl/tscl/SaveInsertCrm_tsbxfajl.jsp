<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjfa=null;
String sjcfar=null;
java.sql.Date sjcfasj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;

jjfa=cf.GB2Uni(request.getParameter("jjfa"));
sjcfar=cf.GB2Uni(request.getParameter("sjcfar"));
ls=request.getParameter("sjcfasj");
try{
	if (!(ls.equals("")))  sjcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjcfasj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʳ�����ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

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

String sfpfkh=request.getParameter("sfpfkh");
String sfnbcf=request.getParameter("sfnbcf");

double khpfze=0;
ls=request.getParameter("khpfze");
try{
	if (!(ls.equals("")))  khpfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khpfze������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��⸶�ܶ�]����ת����������:"+e);
	return;
}
double nbcfze=0;
ls=request.getParameter("nbcfze");
try{
	if (!(ls.equals("")))  nbcfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����nbcfze������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ڲ������ܶ�]����ת����������:"+e);
	return;
}
String clzt=cf.GB2Uni(request.getParameter("clzt"));

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String cfajlh=cf.GB2Uni(request.getParameter("cfajlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String yddclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	String ycfajlh="";
	String getclzt="";
	ls_sql="select clzt,cfajlh";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ycfajlh=cf.fillNull(rs.getString("cfajlh"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("2") && !getclzt.equals("6") && !getclzt.equals("A"))//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���6���ѳ��ֳ��ȴ���������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�9���������ͨ����A���������δͨ����3���ѽ����B:�ط�δ�����5���᰸
	{
		out.println("���󣡴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tsbxfajl ( cfajlh,tsjlh,tsyybm,dwbh,jjfa,sjcfar,sjcfasj,jhjjsj,sfpfkh,khpfze,sfnbcf,nbcfze,lrr,lrsj,lrbm,yddclzt,yzrbmclzt,ycfajlh,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cfajlh);
	ps.setString(2,tsjlh);
	ps.setString(3,tsyybm);
	ps.setString(4,dwbh);
	ps.setString(5,jjfa);
	ps.setString(6,sjcfar);
	ps.setDate(7,sjcfasj);
	ps.setDate(8,jhjjsj);
	ps.setString(9,sfpfkh);
	ps.setDouble(10,khpfze);
	ps.setString(11,sfnbcf);
	ps.setDouble(12,nbcfze);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,yddclzt);
	ps.setString(17,getclzt);
	ps.setString(18,ycfajlh);
	ps.executeUpdate();
	ps.close();


	String ddclzt="";
	if (clzt.equals("7"))//7���ѳ������ȴ���ˣ�8���ѳ������������
	{
		ddclzt="6";//6���ѳ�����
	}
	else{
		ddclzt="7";//7���������ͨ��
	}

	ls_sql="update crm_tsjl set clzt=?,zrbmclzt=?";//0��δ����1��������4���ѽ��գ�5���ѳ��ֳ���6���ѳ�������7���������ͨ����2���ڴ���3���᰸��9:������
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddclzt);
	ps.setString(2,clzt);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set jjfa=?,sjcfar=?,sjcfasj=?,jhjjsj=?,sfpfkh=?,khpfze=?,sfnbcf=?,nbcfze=?,clzt=?,cfajlh=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjfa);
	ps.setString(2,sjcfar);
	ps.setDate(3,sjcfasj);
	ps.setDate(4,jhjjsj);
	ps.setString(5,sfpfkh);
	ps.setDouble(6,khpfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.setString(9,clzt);
	ps.setString(10,cfajlh);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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