<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String sfxmbm=null;
double sfje=0;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
ls=request.getParameter("sfje");
try{
	if (!(ls.equals("")))  sfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�շѽ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String dqbm=cf.executeQuery("select sq_dwxx.dqbm from crm_zxkhxx,sq_dwxx where crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'");
if (dqbm==null || dqbm.equals(""))
{
	out.println("�����޵�������");
	return;
}

try {
	conn=cf.getConnection();

	String sflx=null;
	String sfxmmc=null;
	double sfbfb=0;
	ls_sql="select sflx,sfxmmc";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  sfxmbm='"+sfxmbm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sflx=rs.getString("sflx");
		sfxmmc=rs.getString("sfxmmc");
	}
	rs.close();
	ps.close();

	if (sflx.equals("1"))//1���ٷֱȣ�2���̶����
	{
		double xjqye=0;
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm='1'";//1�������⣻2������
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xjqye=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sfbfb";
		ls_sql+=" from  bj_sfbl";
		ls_sql+=" where  dqbm='"+dqbm+"' and sfxmbm='"+sfxmbm+"' and qsz<"+xjqye+" and "+xjqye+"<=jzz ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sfbfb=rs.getDouble("sfbfb");
		}
		else{
			out.println("<BR>����ʧ�ܣ����շѱ���");
			return;
		}
		rs.close();
		ps.close();

		sfje=xjqye*sfbfb/100;
	
	}

	conn.setAutoCommit(false);

	ls_sql="insert into bj_sfxmmx ( khbh,sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sfxmbm);
	ps.setString(3,sfxmmc);
	ps.setString(4,sflx);
	ps.setDouble(5,sfbfb);
	ps.setDouble(6,sfje);
	ps.setString(7,bz);
	ps.executeUpdate();
	ps.close();


	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double dzbjze=dzbj.getBjje(conn,khbh,"hd");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
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