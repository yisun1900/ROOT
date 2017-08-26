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
java.sql.Date jhfcsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
String zt=request.getParameter("zt");
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金]类型转换发生意外:"+e);
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
	out.println("<BR>变量jhccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划初测时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhfcsj");
try{
	if (!(ls.equals("")))  jhfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhfcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划复测时间]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
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
	String ppmc=null;
	String gys=null;

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
			ppmc=rs.getString("ppmc");
			gys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (pdgcmc==null)
		{
			out.println("！存盘失败，[工厂名称]为空。");
			return;
		}
		if (ppmc==null)
		{
			out.println("！存盘失败，[品牌]为空。");
			return;
		}
		if (gys==null)
		{
			out.println("！存盘失败，[供应商]为空。");
			return;
		}
	}

	conn.setAutoCommit(false);


	
	ls_sql="insert into jc_cgdd ( ddbh,khbh,dj,clgw,ztjjgw,xmzy,lrr,lrsj,dwbh,bz  ,jhccsj,jhfcsj,pdgc,pdgcmc,gys,ppmc,sfpsjs,fgsbh,qddm,jzsjs,khjl";
	ls_sql+=" ,clzt,gtbfje,tmbfje,wjhtze,dqhtze,htze  ,zqgtbfje,zqtmbfje,zqwjhtze,zqdqhtze,wdzje,cbze ";
	ls_sql+=" ,gtzjje,tmzjje,wjzjje,dqzjje,zjhze  ,zqgtzjje,zqtmzjje,zqwjzjje,zqdqzjje,zqzjhze,cgzkl,tmzkl,wjzkl,dqzkl,sfydy,sfjs) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,'01',0,0,0,0,0  ,0,0,0,0,0,0 ";
	ls_sql+=" ,0,0,0,0,0  ,0,0,0,0,0,10,10,10,10,'N','N' ) ";
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
	ps.setDate(12,jhfcsj);
	ps.setString(13,pdgc);
	ps.setString(14,pdgcmc);
	ps.setString(15,gys);
	ps.setString(16,ppmc);
	ps.setString(17,sfpsjs);
	ps.setString(18,fgsbh);
	ps.setString(19,qddm);
	ps.setString(20,jzsjs);
	ps.setString(21,khjl);
	ps.executeUpdate();
	ps.close();


	if (zt.equals("4"))//2:家装客户;4:非家装客户
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

			ls_sql="update crm_zxkhxx set sfjczjz='1'";//1：是；2：否
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
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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