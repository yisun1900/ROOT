<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
long fwmj=0;
String fgyqbm=null;
String zxysbm=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
fwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fwmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڽ������]����ת����������:"+e);
	return;
}
fgyqbm=cf.GB2Uni(request.getParameter("fgyqbm"));
zxysbm=cf.GB2Uni(request.getParameter("zxysbm"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�����]����ת����������:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String cqbm=null;
String jiedao=null;
String cgdz=null;
String yzxxbz=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
jiedao=cf.GB2Uni(request.getParameter("jiedao"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));

java.sql.Date yjzxsj=null;
String zybm=request.getParameter("zybm");
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
int fj=0;

ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjzxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ��װ��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}

String jzbz=cf.GB2Uni(request.getParameter("jzbz"));

java.sql.Date jhjfsj=null;
String hdr=null;
hdr=cf.GB2Uni(request.getParameter("hdr"));
ls=request.getParameter("jhjfsj");
try{
	if (!(ls.equals("")))  jhjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhjfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}

String louhao=cf.GB2Uni(request.getParameter("louhao"));
String email=cf.GB2Uni(request.getParameter("email"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}

String yxtxdz=cf.GB2Uni(request.getParameter("yxtxdz"));
String sshybm=cf.GB2Uni(request.getParameter("sshybm"));
String gmyx=cf.GB2Uni(request.getParameter("gmyx"));
String xxlysm=cf.GB2Uni(request.getParameter("xxlysm"));

java.sql.Date jhctsj=null;
ls=request.getParameter("jhctsj");
try{
	if (!(ls.equals("")))  jhctsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhctsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ƽ��ͼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhcxgtsj=null;
ls=request.getParameter("jhcxgtsj");
try{
	if (!(ls.equals("")))  jhcxgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhcxgtsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���Ч��ͼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhcsgtsj=null;
ls=request.getParameter("jhcsgtsj");
try{
	if (!(ls.equals("")))  jhcsgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhcsgtsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ʩ��ͼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhzbjsj=null;
ls=request.getParameter("jhzbjsj");
try{
	if (!(ls.equals("")))  jhzbjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhzbjsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ������ӱ���ʱ��]����ת����������:"+e);
	return;
}
String khzyxz=cf.GB2Uni(request.getParameter("khzyxz"));
String djbbh=cf.GB2Uni(request.getParameter("djbbh"));
String xqlx=cf.GB2Uni(request.getParameter("xqlx"));

String[] xxlybm=request.getParameterValues("xxlybm");


String clpp=cf.GB2Uni(request.getParameter("clpp"));
String cph=cf.GB2Uni(request.getParameter("cph"));
String czms=cf.GB2Uni(request.getParameter("czms"));
String gnyq=cf.GB2Uni(request.getParameter("gnyq"));
String hyzk=cf.GB2Uni(request.getParameter("hyzk"));
String sfdkzx=cf.GB2Uni(request.getParameter("sfdkzx"));
String hznl=cf.GB2Uni(request.getParameter("hznl"));
String lrtz=cf.GB2Uni(request.getParameter("lrtz"));
String lfbz=cf.GB2Uni(request.getParameter("lfbz"));
java.sql.Date lfsj=null;
ls=request.getParameter("lfsj");
try{
	if (!(ls.equals("")))  lfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date yylfsj=null;
ls=request.getParameter("yylfsj");
try{
	if (!(ls.equals("")))  yylfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yylfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԤԼ����ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date xclfsj=null;
ls=request.getParameter("xclfsj");
try{
	if (!(ls.equals("")))  xclfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xclfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�´�����ʱ��]����ת����������:"+e);
	return;
}



if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[����]���м䲻��������ո�");
	return;
}
if (cf.isHanzi(xqbm)!=2 && cf.isHanzi(xqbm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[С��]���м䲻��������ո�");
	return;
}
String khlxfs=cf.GB2Uni(request.getParameter("khlxfs"));
String sfyckh=cf.GB2Uni(request.getParameter("sfyckh"));
String pdqybm=cf.GB2Uni(request.getParameter("pdqybm"));

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+khbh+"' and fwdz='"+fwdz+"' ";
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
		out.println("���ѣ��˷��ݵ�ַ�Ѵ���");
	}

	//��ϵ��ʽ�����ظ�
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+khbh+"' and lxfs='"+lxfs+"'";
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
		out.println("<P>���ѣ���[��ϵ��ʽ]�Ѵ���");
	}


	//����Ƿ������޸ģ����������������ݵ�ַ������������������������������������������������
	String qdzt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdzt=rs.getString("zt");
	}
	rs.close();
	ps.close();

	String ykhxm=null;
	String yfwdz=null;
	ls_sql="select khxm,fwdz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ykhxm=rs.getString("khxm");
		yfwdz=rs.getString("fwdz");
	}
	rs.close();
	ps.close();

	if (qdzt!=null)
	{
		if (!ykhxm.equals(khxm))
		{
			out.println("<P>���ѣ��ÿͻ���ǩ����װ�򼯳ɵĶ���");
		}
		if (!yfwdz.equals(fwdz))
		{
			out.println("<P>���ѣ��ÿͻ���ǩ����װ�򼯳ɵĶ���");
		}
	}

	int fkjl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkjl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (fkjl>0)
	{
		if (!ykhxm.equals(khxm))
		{
			out.println("<P>���ѣ��ÿͻ��Ѹ���������޸ġ�������");
		}
		if (!yfwdz.equals(fwdz))
		{
			out.println("<P>���ѣ��ÿͻ��Ѹ���������޸ġ����ݵ�ַ��");
		}
	}

	//����Ƿ������޸ģ����������������ݵ�ַ��������������������������������������������������

	
	//����Ƿ�ǩ��ƺ�ͬ����ǩ�ײ������飬����������޸Ŀͻ���������Ϣ	
	String qsjhtbz="";
	String qtchtbz="";
	ls_sql="select qsjhtbz,qtchtbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		
		qsjhtbz=cf.fillNull(rs.getString("qsjhtbz"));
		qtchtbz=cf.fillNull(rs.getString("qtchtbz"));
	}
	rs.close();
	ps.close();
	
	if (qsjhtbz.equals("Y"))
	{
		out.println("���ѣ���ǩ��ƺ�ͬ���������޸�����");
	}
	if (qtchtbz.equals("Y"))
	{
		out.println("���ѣ���ǩ�ײͺ�ͬ���������޸�����");
	}



	conn.setAutoCommit(false);

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khlx='2' and khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,fwdz=?,lxfs=?,fwlxbm=?,hxbm=?,fwmj=?,fgyqbm=?,zxysbm=?,sfxhf=?   ,hfrq=?,hdbz=?,khlxbm=?,bz=?,cqbm=?,cgdz=?,yzxxbz=?,xqbm=?,nlqjbm=?,zybm=?   ,fj=?,yjzxsj=?,jhjfsj=?,hdr=?,hdsfss=?,jzbz=?,ysrbm=?,louhao=?,email=?,yxtxdz=?   ,sshybm=?,gmyx=?,xxlysm=?,jhctsj=?,jhcxgtsj=?,jhcsgtsj=?,jhzbjsj=?,khzyxz=?,jiedao=?,djbbh=?   ,xqlx=?,clpp=?,cph=?,czms=?,gnyq=?,hyzk=?,sfdkzx=?,hznl=?,lrtz=?,yylfsj=?   ,xclfsj=? ,lfbz=?,lfsj=?,sfyckh=?,pdqybm=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,fwlxbm);
	ps.setString(6,hxbm);
	ps.setLong(7,fwmj);
	ps.setString(8,fgyqbm);
	ps.setString(9,zxysbm);
	ps.setString(10,sfxhf);

	ps.setDate(11,hfrq);
	ps.setString(12,hdbz);
	ps.setString(13,khlxbm);
	ps.setString(14,bz);
	ps.setString(15,cqbm);
	ps.setString(16,cgdz);
	ps.setString(17,yzxxbz);
	ps.setString(18,xqbm);
	ps.setString(19,nlqjbm);
	ps.setString(20,zybm);

	ps.setInt(21,fj);
	ps.setDate(22,yjzxsj);
	ps.setDate(23,jhjfsj);
	ps.setString(24,hdr);
	ps.setString(25,hdsfss);
	ps.setString(26,jzbz);
	ps.setString(27,ysrbm);
	ps.setString(28,louhao);
	ps.setString(29,email);
	ps.setString(30,yxtxdz);

	ps.setString(31,sshybm);
	ps.setString(32,gmyx);
	ps.setString(33,xxlysm);
	ps.setDate(34,jhctsj);
	ps.setDate(35,jhcxgtsj);
	ps.setDate(36,jhcsgtsj);
	ps.setDate(37,jhzbjsj);
	ps.setString(38,khzyxz);
	ps.setString(39,jiedao);
	ps.setString(40,djbbh);

	ps.setString(41,xqlx);
	ps.setString(42,clpp);
	ps.setString(43,cph);
	ps.setString(44,czms);
	ps.setString(45,gnyq);
	ps.setString(46,hyzk);
	ps.setString(47,sfdkzx);
	ps.setString(48,hznl);
	ps.setString(49,lrtz);
	ps.setDate(50,yylfsj);

	ps.setDate(51,xclfsj);
	ps.setString(52,lfbz);
	ps.setDate(53,lfsj);
	ps.setString(54,sfyckh);
	ps.setString(55,pdqybm);

	ps.executeUpdate();
	ps.close();

	//���ӣ��ͻ���ϵ��ʽ����������������������������ʼ
	ls_sql="delete from crm_khlxfs ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	java.util.StringTokenizer rowArray=new java.util.StringTokenizer(khlxfs,"*");
	int row=rowArray.countTokens();
	for (int i=0;i<row;i++ )
	{
		String rowStr=rowArray.nextToken();
		java.util.StringTokenizer colArray=new java.util.StringTokenizer(rowStr,"^");
		int col=colArray.countTokens();

		String lxr="";
		String lx="";
		String dhqh="";
		String qhdh="";
		String dhhm="";
		String fenji="";

		if (col>0)
		{
			lxr=colArray.nextToken();
		}
		if (col>1)
		{
			lx=colArray.nextToken();
		}
		if (col>2)
		{
			dhqh=colArray.nextToken();
		}
		if (col>3)
		{
			qhdh=colArray.nextToken();
		}
		if (col>4)
		{
			dhhm=colArray.nextToken();
		}
		if (col>5)
		{
			fenji=colArray.nextToken();
		}

		ls_sql="insert into crm_khlxfs ( khbh,qhdh,lxr,dhhm,fj,dhqh,lx,bz ) ";
		ls_sql+=" values ( '"+khbh+"','"+qhdh+"','"+lxr+"','"+dhhm+"','"+fenji+"','"+dhqh+"','"+lx+"','' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	//���ӣ��ͻ���ϵ��ʽ������������������������������

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