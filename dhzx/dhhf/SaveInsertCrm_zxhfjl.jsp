<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String hfjlh=request.getParameter("hfjlh");
String lfbz=cf.GB2Uni(request.getParameter("lfbz"));
String ctbz=cf.GB2Uni(request.getParameter("ctbz"));
java.sql.Date lfsj=null;
java.sql.Date ctsj=null;
ls=request.getParameter("lfsj");
try{
	if (!(ls.equals("")))  lfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ctsj");
try{
	if (!(ls.equals("")))  ctsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ctsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ƽ��ͼʱ��]����ת����������:"+e);
	return;
}


String cxgtbz=cf.GB2Uni(request.getParameter("cxgtbz"));
java.sql.Date cxgtsj=null;
ls=request.getParameter("cxgtsj");
try{
	if (!(ls.equals("")))  cxgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxgtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч��ͼʱ��]����ת����������:"+e);
	return;
}
String csgtbz=cf.GB2Uni(request.getParameter("csgtbz"));
java.sql.Date csgtsj=null;
ls=request.getParameter("csgtsj");
try{
	if (!(ls.equals("")))  csgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����csgtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʩ��ͼʱ��]����ת����������:"+e);
	return;
}


String sjszysp=request.getParameter("sjszysp");
String sjsfw=request.getParameter("sjsfw");
String qtryfw=request.getParameter("qtryfw");
String gcbj=request.getParameter("gcbj");
String gsztyx=request.getParameter("gsztyx");
String xwgjfm=request.getParameter("xwgjfm");

String yqghdm=request.getParameter("yqghdm");
String yqghsjs=request.getParameter("yqghsjs");

String clfs=request.getParameter("clfs");
String hfcs=request.getParameter("hfcs");

String sfjxhf=request.getParameter("sfjxhf");
java.sql.Date xchfrq=null;
ls=request.getParameter("xchfrq");
try{
	if (!(ls.equals("")))  xchfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xchfrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�´λط�����]����ת����������:"+e);
	return;
}
java.sql.Date yylfsj=null;
ls=request.getParameter("yylfsj");
try{
	if (!(ls.equals("")))  yylfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yylfsj������");
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
	out.println("<BR>����xclfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԤԼ����ʱ��]����ת����������:"+e);
	return;
}

String hfbm=request.getParameter("hfbm");
String hfr=cf.GB2Uni(request.getParameter("hfr"));
String khhfqk=cf.GB2Uni(request.getParameter("khhfqk"));
String yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));

String sjsgtnl=cf.GB2Uni(request.getParameter("sjsgtnl"));
String zxkhyxbm=cf.GB2Uni(request.getParameter("zxkhyxbm"));

String[] txry=request.getParameterValues("txry");

String ssfgs=null;
String yzxdm=null;
String ysjs=null;
String yzxzt=null;
String ysfxhf=null;
java.sql.Date yhfrq=null;
String ysbyybm=null;
String ykhfwjlh=null;

int count=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ssfgs,zxdm,sjs,zxzt,sfxhf,hfrq,sbyybm,khfwjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yzxdm=rs.getString("zxdm");
		ysjs=rs.getString("sjs");

		yzxzt=rs.getString("zxzt");
		ysfxhf=rs.getString("sfxhf");
		yhfrq=rs.getDate("hfrq");
		ysbyybm=cf.fillNull(rs.getString("sbyybm"));
		ykhfwjlh=cf.fillNull(rs.getString("khfwjlh"));
	}
	rs.close();
	ps.close();

	
	String khfwjlh=null;//�ͻ������¼��
	ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	khfwjlh=khbh+cf.addZero(count+1,3);

	
	conn.setAutoCommit(false);

	//�������ѯ�ͻ������¼��crm_zxkhfwjl��++++++++++++++++++++++++++++
	ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,sbyybm,sbyyxs,czlx,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,ysbyybm,ykhfwjlh,lrr,lrsj,lrbm)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'B',?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),?)";//B���ͻ��ط�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khfwjlh);
	ps.setString(2,khbh);
	ps.setString(3,ssfgs);
	ps.setString(4,yzxdm);
	ps.setString(5,ysjs);
	ps.setString(6,"");
	ps.setString(7,khhfqk);
	ps.setString(8,yzxzt);
	ps.setString(9,yzxzt);
	ps.setString(10,ysfxhf);
	ps.setDate(11,yhfrq);
	ps.setString(12,yzxdm);
	ps.setString(13,ysjs);
	ps.setString(14,ysbyybm);
	ps.setString(15,ykhfwjlh);
	ps.setString(16,hfr);
	ps.setString(17,hfbm);
	ps.executeUpdate();
	ps.close();

	String txrymc="";
	if (txry!=null)
	{
		for (int i=0;i<txry.length ;i++ )
		{
			String getyhmc=null;
			ls_sql="select yhmc";
			ls_sql+=" from  sq_yhxx";
			ls_sql+=" where ygbh='"+txry[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getyhmc=cf.fillNull(rs.getString("yhmc"));

				txrymc+=getyhmc+"��";
			}
			rs.close();
			ps.close();

			long xh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  sq_txxxb";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xh=rs.getLong(1);
			}
			rs.close();
			ps.close();

			xh++;

			ls_sql="insert into sq_txxxb (xh,ygbh,yhmc,txfs,txlx,txgjz,txnr,ckzt,lrr,lrsj)  ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,SYSDATE) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,txry[i]);
			ps.setString(3,getyhmc);
			ps.setString(4,"1");//1��ϵͳ��2���绰��3�����棻4�����ţ�9��ȫ��
			ps.setString(5,"01");//01����ѯ�طã�02����ʩ���̻طã�03��Ͷ�߱��޻طã�04��Ͷ�߱��ޣ�
			ps.setString(6,hfjlh);
			ps.setString(7,khhfqk);
			ps.setString(8,"1");//1��δ�鿴��2���鿴
			ps.setString(9,hfr);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="insert into crm_zxhfjl ( hfjlh,khbh,ssfgs,zxdm,sjs,khhfqk,lfbz,lfsj,ctbz,ctsj    ,yqghdm,yqghsjs,sjszysp,sjsgtnl,sjsfw,qtryfw,gcbj,gsztyx,xwgjfm,sfjxhf  ,xchfrq,zxkhyxbm,yylfsj,xclfsj,hfsj,hfr,hfbm,clfs,hfcs,khfwjlh  ,cxgtbz,cxgtsj,csgtbz,csgtsj,txry) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?                                                   ,?,?,?,?,?,?,?,?,?,?                                                    ,?,?,?,?,TRUNC(SYSDATE),?,?,?,?,?                               ,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjlh);
	ps.setString(2,khbh);
	ps.setString(3,ssfgs);
	ps.setString(4,yzxdm);
	ps.setString(5,ysjs);
	ps.setString(6,khhfqk);
	ps.setString(7,lfbz);
	ps.setDate(8,lfsj);
	ps.setString(9,ctbz);
	ps.setDate(10,ctsj);

	ps.setString(11,yqghdm);
	ps.setString(12,yqghsjs);
	ps.setString(13,sjszysp);
	ps.setString(14,sjsgtnl);
	ps.setString(15,sjsfw);
	ps.setString(16,qtryfw);
	ps.setString(17,gcbj);
	ps.setString(18,gsztyx);
	ps.setString(19,xwgjfm);
	ps.setString(20,sfjxhf);

	ps.setDate(21,xchfrq);
	ps.setString(22,zxkhyxbm);
	ps.setDate(23,yylfsj);
	ps.setDate(24,xclfsj);
	ps.setString(25,hfr);
	ps.setString(26,hfbm);
	ps.setString(27,clfs);
	ps.setString(28,hfcs);
	ps.setString(29,khfwjlh);

	ps.setString(30,cxgtbz);
	ps.setDate(31,cxgtsj);
	ps.setString(32,csgtbz);
	ps.setDate(33,csgtsj);
	ps.setString(34,txrymc);
	ps.executeUpdate();
	ps.close();

	ls_sql =" update crm_zxkhxx set lfbz=?,lfsj=?,ctbz=?,ctsj=?,sjszysp=?,sjsfw=?,qtryfw=?,gcbj=?,gsztyx=?,xwgjfm=?   ,yqghdm=?,yqghsjs=?,sfxhf=?,hfrq=?  ,hfjlh=?,zxhfsj=TRUNC(SYSDATE),khfwjlh=?,yzxxbz=? ,cxgtbz=?,cxgtsj=?,csgtbz=?,csgtsj=?,zxkhyxbm=?,yylfsj=?,xclfsj=?,sjsgtnl=?,hfcs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lfbz);
	ps.setDate(2,lfsj);
	ps.setString(3,ctbz);
	ps.setDate(4,ctsj);
	ps.setString(5,sjszysp);
	ps.setString(6,sjsfw);
	ps.setString(7,qtryfw);
	ps.setString(8,gcbj);
	ps.setString(9,gsztyx);
	ps.setString(10,xwgjfm);

	ps.setString(11,yqghdm);
	ps.setString(12,yqghsjs);
	ps.setString(13,sfjxhf);
	ps.setDate(14,xchfrq);
	ps.setString(15,hfjlh);
	ps.setString(16,khfwjlh);
	ps.setString(17,yzxxbz);
	ps.setString(18,cxgtbz);
	ps.setDate(19,cxgtsj);
	ps.setString(20,csgtbz);
	ps.setDate(21,csgtsj);
	ps.setString(22,zxkhyxbm);
	ps.setDate(23,yylfsj);
	ps.setDate(24,xclfsj);
	ps.setString(25,sjsgtnl);
	ps.setString(26,hfcs);
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