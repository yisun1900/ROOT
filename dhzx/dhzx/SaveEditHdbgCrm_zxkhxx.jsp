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
String rddqbm=cf.GB2Uni(request.getParameter("rddqbm"));
String hxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
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
String cgdz=null;
String yzxxbz=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
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

String ywy=cf.GB2Uni(request.getParameter("ywy"));
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
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}



String[] xxlybm=request.getParameterValues("xxlybm");


if (cf.isHanzi(khxm)!=2)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[����]���м䲻��������ո�");
	return;
}
if (cf.isHanzi(xqbm)!=2 && cf.isHanzi(xqbm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[С��]���м䲻��������ո�");
	return;
}

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yzxdm=null;
String ysjs=null;
java.sql.Date ysjsfpsj=null;
java.sql.Date yzxdmfpsj=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+wherekhbh+"' and fwdz='"+fwdz+"' ";
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

/*
	//��ϵ��ʽ�����ظ�
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+wherekhbh+"' and lxfs='"+lxfs+"'";
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
		out.println("<P>����ʧ�ܣ���[��ϵ��ʽ]�Ѵ���");
		return;
	}
*/
	//����Ƿ������޸ģ����������������ݵ�ַ������������������������������������������������
	String qdzt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdzt=rs.getString("zt");
	}
	rs.close();
	ps.close();

	if (qdzt!=null)
	{
		String ykhxm=null;
		String yfwdz=null;
		ls_sql="select khxm,fwdz";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ykhxm=rs.getString("khxm");
			yfwdz=rs.getString("fwdz");
		}
		rs.close();
		ps.close();
		if (!ykhxm.equals(khxm))
		{
			out.println("<P>���󣡸ÿͻ���ǩ����װ�򼯳ɵĶ������������޸ġ�������");
			return;
		}
		if (!yfwdz.equals(fwdz))
		{
			out.println("<P>���󣡸ÿͻ���ǩ����װ�򼯳ɵĶ������������޸ġ����ݵ�ַ��");
			return;
		}
	}
	//����Ƿ������޸ģ����������������ݵ�ַ��������������������������������������������������

	
	String kgxqthd="";
	if (!cxhdbm.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if (!cxhdbmxq.equals("") || !cxhdbmzh.equals(""))
			{
				out.println("<BR>���󣡣�����˾�����["+cxhdbm+"]���ɹ��������");
				return;
			}
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmxq+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if ( (!cxhdbm.equals("�޻") && !cxhdbm.equals("")) || !cxhdbmzh.equals(""))
			{
				out.println("<BR>���󣡣���С�������["+cxhdbmxq+"]���ɹ��������");
				return;
			}
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmzh+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if ((!cxhdbm.equals("�޻") && !cxhdbm.equals("")) || !cxhdbmxq.equals(""))
			{
				out.println("<BR>���󣡣���չ������["+cxhdbmzh+"]���ɹ��������");
				return;
			}
		}
	}

	conn.setAutoCommit(false);

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khlx='2' and khbh='"+wherekhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,fwdz=?,lxfs=?,fwlxbm=?,hxbm=?,fwmj=?,fgyqbm=?,zxysbm=?,sfxhf=?,hfrq=?,hdbz=?,khlxbm=?,bz=?,cqbm=?        ,cgdz=?,yzxxbz=?,xqbm=?,nlqjbm=?,zybm=?,fj=?,yjzxsj=?,ywy=?   ,jhjfsj=?,hdr=?,hdsfss=?,jzbz=?,rddqbm=?,hxwzbm=?,ysrbm=?,louhao=?,cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  and zxzt not in('3','4')";
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
	ps.setString(23,ywy);

	ps.setDate(24,jhjfsj);
	ps.setString(25,hdr);
	ps.setString(26,hdsfss);
	ps.setString(27,jzbz);
	ps.setString(28,rddqbm);
	ps.setString(29,hxwzbm);
	ps.setString(30,ysrbm);
	ps.setString(31,louhao);
	ps.setString(32,cxhdbm);
	ps.setString(33,cxhdbmxq);
	ps.setString(34,cxhdbmzh);

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