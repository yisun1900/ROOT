<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String yhjs=request.getParameter("yhjs");

String ls=null;

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

String khhfqk=cf.GB2Uni(request.getParameter("khhfqk"));
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
	out.println("<BR>[�´�����ʱ��]����ת����������:"+e);
	return;
}

String yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));
String sjsgtnl=cf.GB2Uni(request.getParameter("sjsgtnl"));
String zxkhyxbm=cf.GB2Uni(request.getParameter("zxkhyxbm"));

String[] txry=request.getParameterValues("txry");

String wherehfjlh=cf.GB2Uni(request.getParameter("wherehfjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String nowhfjlh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select hfjlh";
	ls_sql+=" from  crm_zxkhxx where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nowhfjlh=cf.fillNull(rs.getString("hfjlh"));
	}
	else{
		out.println("���󣡲����ڵĿͻ����:"+khbh);
		return;
	}
	ps.close();
	rs.close();


	if (!nowhfjlh.equals(wherehfjlh))
	{
		out.println("����ֻ���޸����µĻطü�¼��"+nowhfjlh);
		return;
	}


	String khfwjlh=null;

	ls_sql="select khfwjlh";
	ls_sql+=" from  crm_zxhfjl";
	ls_sql+=" where hfjlh='"+wherehfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khfwjlh=cf.fillNull(rs.getString("khfwjlh"));
	}
	else{
		out.println("���󣡲����ڵĻطü�¼��"+wherehfjlh);
		return;
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql=" delete from sq_txxxb where txfs='1' and txlx='01' and txgjz='"+wherehfjlh.trim()+"'";
	ps= conn.prepareStatement(ls_sql);
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
			ps.setString(6,wherehfjlh);
			ps.setString(7,khhfqk);
			ps.setString(8,"1");//1��δ�鿴��2���鿴
			ps.setString(9,yhmc);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="update crm_zxhfjl set khhfqk=?,clfs=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?,yqghdm=?,yqghsjs=?   ,sjszysp=?,sjsgtnl=?,sjsfw=?,qtryfw=?,gcbj=?,gsztyx=?,xwgjfm=?,cxgtbz=?,cxgtsj=?,csgtbz=?  ,csgtsj=?,zxkhyxbm=?,yylfsj=?,xclfsj=?";
	ls_sql+=" where  (hfjlh='"+wherehfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khhfqk);
	ps.setString(2,clfs);
	ps.setString(3,lfbz);
	ps.setDate(4,lfsj);
	ps.setString(5,ctbz);
	ps.setDate(6,ctsj);
	ps.setString(7,yqghdm);
	ps.setString(8,yqghsjs);

	ps.setString(9,sjszysp);
	ps.setString(10,sjsgtnl);
	ps.setString(11,sjsfw);
	ps.setString(12,qtryfw);
	ps.setString(13,gcbj);
	ps.setString(14,gsztyx);
	ps.setString(15,xwgjfm);
	ps.setString(16,cxgtbz);
	ps.setDate(17,cxgtsj);
	ps.setString(18,csgtbz);

	ps.setDate(19,csgtsj);
	ps.setString(20,zxkhyxbm);
	ps.setDate(21,yylfsj);
	ps.setDate(22,xclfsj);

	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhfwjl set sbyyxs=?";
	ls_sql+=" where  (khfwjlh='"+khfwjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khhfqk);
	ps.executeUpdate();
	ps.close();

	ls_sql =" update crm_zxkhxx set lfbz=?,lfsj=?,ctbz=?,ctsj=?,sjszysp=?,sjsgtnl=?,sjsfw=?,qtryfw=?,gcbj=?,gsztyx=?   ,xwgjfm=?,yqghdm=?,yqghsjs=?,yzxxbz=?,cxgtbz=?,cxgtsj=?,csgtbz=?,csgtsj=?  ,zxkhyxbm=?,yylfsj=?,xclfsj=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lfbz);
	ps.setDate(2,lfsj);
	ps.setString(3,ctbz);
	ps.setDate(4,ctsj);
	ps.setString(5,sjszysp);
	ps.setString(6,sjsgtnl);
	ps.setString(7,sjsfw);
	ps.setString(8,qtryfw);
	ps.setString(9,gcbj);
	ps.setString(10,gsztyx);

	ps.setString(11,xwgjfm);
	ps.setString(12,yqghdm);
	ps.setString(13,yqghsjs);
	ps.setString(14,yzxxbz);
	ps.setString(15,cxgtbz);
	ps.setDate(16,cxgtsj);
	ps.setString(17,csgtbz);
	ps.setDate(18,csgtsj);

	ps.setString(19,zxkhyxbm);
	ps.setDate(20,yylfsj);
	ps.setDate(21,xclfsj);
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