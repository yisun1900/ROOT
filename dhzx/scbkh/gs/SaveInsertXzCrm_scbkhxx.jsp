<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String ywyssxz=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
khxm=cf.GB2Uni(request.getParameter("khxm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
ywy=cf.GB2Uni(request.getParameter("ywy"));
ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
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
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));

String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String jiedao=cf.GB2Uni(request.getParameter("jiedao"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));

String qtdh=null;
String xqlx=null;
long fwmj=0;
String hxbm=null;
long fj=0;
String khzyxz=null;
java.sql.Date yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
java.sql.Date xchfsj=null;
qtdh=cf.GB2Uni(request.getParameter("qtdh"));
xqlx=cf.GB2Uni(request.getParameter("xqlx"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fwmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
khzyxz=cf.GB2Uni(request.getParameter("khzyxz"));
ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjzxsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ��װ��ʱ��]����ת����������:"+e);
	return;
}
jzdsmc=cf.GB2Uni(request.getParameter("jzdsmc"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("xchfsj");
try{
	if (!(ls.equals("")))  xchfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xchfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�´λط�ʱ��]����ת����������:"+e);
	return;
}

String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where fwdz='"+fwdz+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("<BR>���ѣ���[���ݵ�ַ]�Ѵ���");
	}


	ls_sql="select count(*)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where lxfs='"+lxfs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>���󣡴�[��ϵ��ʽ]�Ѵ���");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where qtdh='"+qtdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>���󣡴�[�����绰]�Ѵ���");
		return;
	}
	
	String zt="1";//1�����٣�2��ʧ�ܣ�3���ƽ���4���ѽ��գ�5��׼���ƽ�


	String sfxxq=null;//�Ƿ���С�� Y���ǣ�N����

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM yx_lsdcb ";
	ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{   
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		sfxxq="Y";
	}
	else{
		sfxxq="N";
	}

	if (count==0)
	{
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM yx_xxqmd ";
		ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{   
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
	}


	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(scbkhbh))+1,1)";
	ls_sql+=" from  crm_scbkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String scbkhbh=cf.addZero(xh,7);

	conn.setAutoCommit(false);

	ls_sql="insert into crm_scbkhxx (scbkhbh,khxm,cqbm,jiedao,xqbm,louhao,fwdz,lxfs,ywy  ";
	ls_sql+=" ,ywyssxz,xqlx,fwmj,hxbm,fj,khzyxz,yjzxsj,jzdsmc,sfxhf,xchfsj ";
	ls_sql+=" ,lrr,lrsj,lrbm,ssfgs,bz,sfxxq,zt) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?  ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,scbkhbh);
	ps.setString(2,khxm);
	ps.setString(3,cqbm);
	ps.setString(4,jiedao);
	ps.setString(5,xqbm);
	ps.setString(6,louhao);
	ps.setString(7,fwdz);
	ps.setString(8,lxfs);
	ps.setString(9);
	ps.setString(10,ywy);

	ps.setString(11,ywyssxz);
	ps.setString(12,xqlx);
	ps.setLong(13,fwmj);
	ps.setString(14,hxbm);
	ps.setLong(15,fj);
	ps.setString(16,khzyxz);
	ps.setDate(17,yjzxsj);
	ps.setString(18,jzdsmc);
	ps.setString(19,sfxhf);
	ps.setDate(20,xchfsj);

	ps.setString(21,lrr);
	ps.setDate(22,lrsj);
	ps.setString(23,lrbm);
	ps.setString(24,ssfgs);
	ps.setString(25,bz);
	ps.setString(26,sfxxq);
	ps.setString(27,zt);
	ps.executeUpdate();
	ps.close();

	if (count==0)
	{
		ls_sql="insert into yx_xxqmd (dqbm,xqmc,cqbm,dz,lrr,lrsj,fgsbh,zt) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,'1' ) ";//1��δȷ�ϣ�2����ȷ��
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dqbm);
		ps.setString(2,xqbm);
		ps.setString(3,cqbm);
		ps.setString(4,fwdz);
		ps.setString(5,lrr);
		ps.setDate(6,lrsj);
		ps.setString(7,ssfgs);
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