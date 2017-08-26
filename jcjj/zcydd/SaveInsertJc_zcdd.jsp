<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%

String ls=null;
String ddbh=null;
String khbh=null;
String clgw=null;
String xmzy=null;
java.sql.Date jhclsj=null;
String xclbz=null;
String lrr=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
String zt=request.getParameter("zt");
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));

ls=request.getParameter("jhclsj");
try{
	if (!(ls.equals("")))  jhclsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhclsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划测量时间]类型转换发生意外:"+e);
	return;
}
xclbz=cf.GB2Uni(request.getParameter("xclbz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
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

String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zczkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppmc=null;
	String gys=null;
	String sfyyh=null;
	java.sql.Date yhkssj=null;
	java.sql.Date yhjzsj=null;
	String yhnr=null;

	ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc,sfyyh,yhkssj,yhjzsj,yhnr ";
	ls_sql+=" from jxc_ppxx,jxc_ppgysdzb";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+fgsbh+"' and jxc_ppxx.ppmc='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppmc = rs.getString("scsmc");			    
		gys = rs.getString("gysmc");			    
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=rs.getDate("yhkssj");
		yhjzsj=rs.getDate("yhjzsj");
		yhnr=cf.fillNull(rs.getString("yhnr"));
	}
	rs.close();
	ps.close();

	if (gys==null)
	{
		out.println("<BR>！！！错误，[品牌]："+ppbm+"无对应的：供应商");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,xclbz,jhclsj,lrr,lrsj,dwbh   ,bz,ppbm,zcdlbm,zcxlbm   ,hkze,wdzje,cbze,htcxhdje,zjxcxhdje,zqzjhze,zjhze,zjxcbze,sfjs,clzt,ddlx   ,gys,ppmc,fgsbh,qddm,jzsjs,zczkl,dzyy,sfyyh,yhkssj,yhjzsj,yhnr,khjl  ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf,jjsjs,sfck,ycksl,yckje,zsje,zjxzsje,sfkgsl,qtycf,sfjrht,jmje,htyjjrje,zjxyjjrje,sskje ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?  ,0,0,0,0,0,0,0,0,'N','00','1'   ,?,?,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,0,0,0,0   ,0,0,0,0,?,'1',0,0,0,0,'N',0,'N',0,0,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setString(3,clgw);
	ps.setString(4,ztjjgw);
	ps.setString(5,xmzy);
	ps.setString(6,xclbz);
	ps.setDate(7,jhclsj);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,dwbh);

	ps.setString(11,bz);
	ps.setString(12,ppbm);
	ps.setString(13,zcdlbm);
	ps.setString(14,zcxlbm);

	ps.setString(15,gys);
	ps.setString(16,ppmc);
	ps.setString(17,fgsbh);
	ps.setString(18,qddm);
	ps.setString(19,jzsjs);
	ps.setDouble(20,zczkl);
	ps.setString(21,dzyy);
	ps.setString(22,sfyyh);
	ps.setDate(23,yhkssj);
	ps.setDate(24,yhjzsj);
	ps.setString(25,yhnr);
	ps.setString(26,khjl);
	ps.setString(27,jjsjs);
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
			ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,khjl,xxlysm,sjs,lrsj,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,wtkhbz,khjsbz,wdzgce,qye,zjjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,zqsuijin,zqzjxsuijin,sjsbh,ywyssxz,clgw,xjf,hxbm,bjjb,fwmj,fjtcbz,zhhtzcbj,zqhtzcbj,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,zqqtsf,zhqtsf,SJHTSJF) ";
			ls_sql+=" select ?,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,?,ssfgs,khjl,xxlysm,sjs,?,?,bz  ,'4','N','4','N'   ,'N','Y','N','0','0','Y'  ,'N','N','1','0','0','0','0','1',?,'1','N','N','N',0,0,'0','N',0,0,0,0,0,sjsbh,ywyssxz,clgw,xjf,hxbm,bjjb,fwmj,'M',0,0,0,0,0,0,0,0,0,0";
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