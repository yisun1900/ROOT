<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String khbh=null;
String wjqk=null;
double sqdj=0;
String clgw=null;
String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date jhccsj=null;
String dwbh=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
wjqk=cf.GB2Uni(request.getParameter("wjqk"));
ls=request.getParameter("sqdj");
try{
	if (!(ls.equals("")))  sqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收取定金]类型转换发生意外:"+e);
	return;
}
clgw=cf.GB2Uni(request.getParameter("clgw"));
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
String xmzy=cf.GB2Uni(request.getParameter("xmzy"));
String zt=request.getParameter("zt");
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

String wjsgsbz=null;
if (wjqk.equals("1"))//1：客户自购；2：公司购买
{
	wjsgsbz="N";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into jc_mmydd ( yddbh,khbh,wjqk,sqdj,clgw,lrr,lrsj,dwbh,jhccsj,bz ";
	ls_sql+=" ,wjsgsbz,xmzy,ztjjgw,fgsbh,qddm,jzsjs,khjl";
	ls_sql+=" ,wdzje,htje,mmhtje,wjhtje,blhtje,zqmmhtje,zqwjhtje,zqblhtje,fwf";
	ls_sql+=" ,zjhmmje,zjhwjje,zjhblje,zjhze,zqzjhmmje,zqzjhwjje,zqzjhblje,zqzjhze   ,mmzkl,wjzkl,blzkl,sfjs,aztz,sfydy   ,clzt) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?";
	ls_sql+=" ,0,0,0,0,0,0,0,0,0";
	ls_sql+=" ,0,0,0,0,0,0,0,0 ";
	ls_sql+=" ,10,10,10,'N','N','N' ,'01' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,khbh);
	ps.setString(3,wjqk);
	ps.setDouble(4,sqdj);
	ps.setString(5,clgw);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,dwbh);
	ps.setDate(9,jhccsj);
	ps.setString(10,bz);

	ps.setString(11,wjsgsbz);
	ps.setString(12,xmzy);
	ps.setString(13,ztjjgw);
	ps.setString(14,fgsbh);
	ps.setString(15,qddm);
	ps.setString(16,jzsjs);
	ps.setString(17,khjl);

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