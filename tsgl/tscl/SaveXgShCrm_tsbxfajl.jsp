<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shsm=null;
String shr=null;
java.sql.Date shsj=null;


shsm=cf.GB2Uni(request.getParameter("shsm"));
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
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

String shjl=request.getParameter("shjl");



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

	if ( !getclzt.equals("9") && !getclzt.equals("A"))//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���6���ѳ��ֳ��ȴ���������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�9���������ͨ����A���������δͨ����3���ѽ����B:�ط�δ�����5���᰸
	{
		out.println("���󣡴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	String clzt="";
	if (shjl.equals("Y"))
	{
		clzt="9";//9���������ͨ��
	}
	else {
		clzt="A";//A���������δͨ��
	}

	ls_sql="update crm_tsbxfajl set shsm=?,shr=?,shsj=?,shjl=?,sfpfkh=?,khpfze=?,sfnbcf=?,nbcfze=?  ";
	ls_sql+=" where cfajlh='"+cfajlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shsm);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shjl);
	ps.setString(5,sfpfkh);
	ps.setDouble(6,khpfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set shsm=?,shr=?,shsj=?,clzt=?,sfpfkh=?,khpfze=?,sfnbcf=?,nbcfze=? ";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shsm);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,clzt);
	ps.setString(5,sfpfkh);
	ps.setDouble(6,khpfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and sfpfkh='2'";
	ls_sql+=" and clzt in('9','3','B','C','5')";
	//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���D���ѽ��ղ����������6���ѳ��ֳ��ȴ�������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�
	//9���������ͨ����A���������δͨ����3���ѽ����B���ڴ���C���ط�δ�����5���᰸
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String ddsfpfkh="";
	if (count>0)
	{
		ddsfpfkh="2";//1�������⸶��2�������⸶��3��¼���⸶��4�����⸶
	}
	else{
		ddsfpfkh="1";
	}

	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and sfnbcf='2'";
	ls_sql+=" and clzt in('9','3','B','C','5')";
	//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���D���ѽ��ղ����������6���ѳ��ֳ��ȴ�������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�
	//9���������ͨ����A���������δͨ����3���ѽ����B���ڴ���C���ط�δ�����5���᰸
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String ddsfnbcf="";
	if (count>0)
	{
		ddsfnbcf="2";//1�����账����2������������3��¼�봦����4�����ѷ�
	}
	else{
		ddsfnbcf="1";
	}

	ls_sql="update crm_tsjl set zrbmclzt=?,sfpfkh=?,sfnbcf=?";//0��δ����1��������4���ѽ��գ�5���ѳ��ֳ���6���ѳ�������7���������ͨ����2���ڴ���3���᰸��9:������
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,ddsfpfkh);
	ps.setString(3,ddsfnbcf);
	ps.executeUpdate();
	ps.close();

	if (shjl.equals("Y"))
	{
		ls_sql="update crm_tsjl set clzt='7' ";//7���������ͨ��
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_tsjl set clzt='6' ";//6���ѳ�����
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

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