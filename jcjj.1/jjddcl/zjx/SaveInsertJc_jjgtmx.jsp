<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtxh=null;
String ddbh=null;
String gtmc=null;
String jjazwz=null;
String guige=null;
String jjlx=null;
String bclx=null;
String bcys=null;
double bcbfje=0;
double pjbfje=0;
double zj=0;
String bz=null;
gtxh=cf.GB2Uni(request.getParameter("gtxh"));
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
gtmc=cf.GB2Uni(request.getParameter("gtmc"));
jjazwz=cf.GB2Uni(request.getParameter("jjazwz"));
guige=cf.GB2Uni(request.getParameter("guige"));
jjlx=cf.GB2Uni(request.getParameter("jjlx"));
bclx=cf.GB2Uni(request.getParameter("bclx"));
bcys=cf.GB2Uni(request.getParameter("bcys"));
ls=request.getParameter("bcbfje");
try{
	if (!(ls.equals("")))  bcbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bcbfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ĳ��ֽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("pjbfje");
try{
	if (!(ls.equals("")))  pjbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pjbfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ֽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zj");
try{
	if (!(ls.equals("")))  zj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ܼ�]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
		jjzkl=rs.getDouble("jjzkl");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00��¼��δ���
	{
		out.println("��������������ɣ�������¼��");
		return;
	}


	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������



	String bcpp=null;
	ls_sql="select bcpp";
	ls_sql+=" from  jc_jjbjbj";
	ls_sql+=" where  bclx='"+bclx+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bcpp=rs.getString("bcpp");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into jc_jjgtmx ( gtxh,ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bz   ,zqbcbfje,zqpjbfje,zqzj,bcbfje,pjbfje,zj,sl,zjhsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,ROUND(?,"+jcddmxblxs+"),ROUND(?,"+jcddmxblxs+"),ROUND(?,"+jcddmxblxs+"),0,1 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,gtmc);
	ps.setString(4,jjazwz);
	ps.setString(5,guige);
	ps.setString(6,jjlx);
	ps.setString(7,bcpp);
	ps.setString(8,bclx);
	ps.setString(9,bcys);
	ps.setString(10,bz);

	ps.setDouble(11,bcbfje);
	ps.setDouble(12,pjbfje);
	ps.setDouble(13,zj);
	ps.setDouble(14,bcbfje*jjzkl/10);
	ps.setDouble(15,pjbfje*jjzkl/10);
	ps.setDouble(16,zj*jjzkl/10);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_gtzjxmx (zjxxh,gtxh,ddbh,lx,ysl,xsl)";
	ls_sql+=" values('"+zjxxh+"','"+gtxh+"','"+ddbh+"','2',0,1)  ";//1��������Ŀ��2��������Ŀ
	ps= conn.prepareStatement(ls_sql);
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>