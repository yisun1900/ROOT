<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
double dj=0;
String clgw=null;
String xmzy=null;
String lrr=null;
java.sql.Date jhccsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhccsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}

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
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String zt=request.getParameter("zt");
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String xcmgc=cf.GB2Uni(request.getParameter("xcmgc"));
String sfpsjs=cf.GB2Uni(request.getParameter("sfpsjs"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pdgcmc=null;
	String jjppmc=null;
	String jjgys=null;
	if (!pdgc.equals(""))
	{
		ls_sql="select gysmc,ppmc,gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+pdgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pdgcmc=rs.getString("gysmc");
			jjppmc=rs.getString("ppmc");
			jjgys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (pdgcmc==null)
		{
			out.println("������ʧ�ܣ�[�Ҿ߹�������]Ϊ�ա�");
			return;
		}
		if (jjppmc==null)
		{
			out.println("������ʧ�ܣ�[�Ҿ�Ʒ��]Ϊ�ա�");
			return;
		}
		if (jjgys==null)
		{
			out.println("������ʧ�ܣ�[�Ҿ߹�Ӧ��]Ϊ�ա�");
			return;
		}
	}

	String xcmgcmc=null;
	String xcmppmc=null;
	String xcmgys=null;
	if (!xcmgc.equals(""))
	{
		ls_sql="select gysmc,ppmc,gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+xcmgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xcmgcmc=rs.getString("gysmc");
			xcmppmc=rs.getString("ppmc");
			xcmgys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (xcmgcmc==null)
		{
			out.println("������ʧ�ܣ�[�Ͳ��Ź�������]Ϊ�ա�");
			return;
		}
		if (xcmppmc==null)
		{
			out.println("������ʧ�ܣ�[�Ͳ���Ʒ��]Ϊ�ա�");
			return;
		}
		if (xcmgys==null)
		{
			out.println("������ʧ�ܣ�[�Ͳ��Ź�Ӧ��]Ϊ�ա�");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="insert into jc_jjdd ( ddbh,khbh,dj,clgw,ztjjgw,xmzy,lrr,lrsj,dwbh,bz ";
	ls_sql+=" ,jhccsj,pdgc,pdgcmc,jjgys,jjppmc,xcmgc,xcmgcmc,xcmgys,xcmppmc,sfpsjs ";
	ls_sql+=" ,fgsbh,qddm,jzsjs,khjl    ,jjzkl,clzt,sfydy,sfjs ";
	ls_sql+=" ,jjje,xcmje,cpjjje,htze          ,zqjjje,zqxcmje,zqcpjjje,wdzje,cbze   ";
	ls_sql+=" ,jjzjje,xcmzjje,cpjjzjje,zjhze   ,zqjjzjje,zqxcmzjje,zqcpjjzjje,zqzjhze) ";
	ls_sql+=" ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?     ,10,'01','N','N'";
	ls_sql+=" ,0,0,0,0  ,0,0,0,0,0 ";
	ls_sql+=" ,0,0,0,0  ,0,0,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setDouble(3,dj);
	ps.setString(4,clgw);
	ps.setString(5,ztjjgw);
	ps.setString(6,xmzy);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,dwbh);
	ps.setString(10,bz);

	ps.setDate(11,jhccsj);
	ps.setString(12,pdgc);
	ps.setString(13,pdgcmc);
	ps.setString(14,jjgys);
	ps.setString(15,jjppmc);
	ps.setString(16,xcmgc);
	ps.setString(17,xcmgcmc);
	ps.setString(18,xcmgys);
	ps.setString(19,xcmppmc);
	ps.setString(20,sfpsjs);

	ps.setString(21,fgsbh);
	ps.setString(22,qddm);
	ps.setString(23,jzsjs);
	ps.setString(24,khjl);
	ps.executeUpdate();
	ps.close();

	if (zt.equals("4"))//2:��װ�ͻ�;4:�Ǽ�װ�ͻ�
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String zxdm=null;
		ls_sql="SELECT zxdm";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdm=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (zxdm==null)
		{
			zxdm=dwbh;
		}


		if (count==0)
		{
			ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,khjl,xxlysm,sjs,lrsj,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,wtkhbz,khjsbz,wdzgce,qye,zjjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,zqsuijin,zqzjxsuijin,sjsbh,ywyssxz) ";
			ls_sql+=" select ?,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,?,ssfgs,khjl,xxlysm,sjs,?,?,bz  ,'4','N','4','N'   ,'N','Y','N','0','0','Y'  ,'N','N','1','0','0','0','0','1',?,'1','N','N','N',0,0,'0','N',0,0,0,0,0,sjsbh,ywyssxz ";
			ls_sql+=" from  crm_zxkhxx";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,zxdm);
			ps.setDate(3,lrsj);
			ps.setString(4,lrr);
			ps.setString(5,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set sfjczjz='1'";//1���ǣ�2����
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("����ʧ��,��������: " + e);
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