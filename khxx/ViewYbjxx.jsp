<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();	

String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String czbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String fgyqbm=null;
String xxlybm=null;
String zxysbm=null;
String zxsj=null;
String qtqk=null;
String sbyybm=null;
String hth=null;
String sjs=null;
String qye=null;
String jcjjqye=null;
String sfyyh=null;
String yhyy=null;
String fzxm=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String skje=null;
String skrq=null;
String zkje=null;
String zkrq=null;
String sjzkrq=null;
String jgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String dwbh=null;
String pdlx=null;
String zpsgd=null;
String zpyy=null;
String pdclzt=null;
String pdsj=null;
String pdr=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String zxhfsj=null;
String hfjlh=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String ybjbz=null;
String ybjyxq=null;
String ybjdjsj=null;
String hdbz=null;
String zt=null;
String khlxbm=null;
String tsbz=null;
String tsjlh=null;
String tkbz=null;
String tdtkxh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wgbz=null;
String ybjbh=null;

String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;

String ybjss=null;
String hdsfss=null;
String sfzhm=null;
String qyxh=null;
String bxbz=null;
String bxjlh=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("ybjbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
Statement stmt1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bxbz,bxjlh,khbh,khxm,xb,fwdz,cqbm,lxfs,fwlxbm,hxbm,fgflbm,zxjwbm,ysbm,czbm,hxmjbm,fwmj,pmjj,fgyqbm,xxlybm,zxysbm,sbyybm,hth,sjs,qye,jcjjqye,sfyyh,yhyy,fzxm,qyrq,kgrq,sjkgrq,skje,skrq,zkje,zkrq,sjzkrq,jgrq,sjjgrq,gcjdbm,dwbh,pdlx,zpsgd,zpyy,pdclzt,pdsj,pdr,sgd,sgbz,zjxm,zxhfsj,hfjlh,sfxhf,hfrq,hflxbm,ybjbz,ybjyxq,ybjdjsj,hdbz,zt,khlxbm,tsbz,tsjlh,tkbz,tdtkxh,lrr,lrsj,bz,wgbz,ybjbh,cgdz,hdsgd,hdsgbz,hdsjs,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfss,sfzhm,qyxh ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where (zt='2') and  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bxbz=cf.fillNull(rs.getString("bxbz"));
		bxjlh=cf.fillNull(rs.getString("bxjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		xxlybm=cf.fillNull(rs.getString("xxlybm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		jcjjqye=cf.fillNull(rs.getString("jcjjqye"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		fzxm=cf.fillNull(rs.getString("fzxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		skje=cf.fillNull(rs.getString("skje"));
		skrq=cf.fillNull(rs.getDate("skrq"));
		zkje=cf.fillNull(rs.getString("zkje"));
		zkrq=cf.fillNull(rs.getDate("zkrq"));
		sjzkrq=cf.fillNull(rs.getDate("sjzkrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		pdlx=cf.fillNull(rs.getString("pdlx"));
		zpsgd=cf.fillNull(rs.getString("zpsgd"));
		zpyy=cf.fillNull(rs.getString("zpyy"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		ybjbz=cf.fillNull(rs.getString("ybjbz"));
		ybjyxq=cf.fillNull(rs.getDate("ybjyxq"));
		ybjdjsj=cf.fillNull(rs.getDate("ybjdjsj"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		zt=cf.fillNull(rs.getString("zt"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		tsbz=cf.fillNull(rs.getString("tsbz"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		tkbz=cf.fillNull(rs.getString("tkbz"));
		tdtkxh=cf.fillNull(rs.getString("tdtkxh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		wgbz=cf.fillNull(rs.getString("wgbz"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
		hdsjs=cf.fillNull(rs.getString("hdsjs"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		qyxh=cf.fillNull(rs.getString("qyxh"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:12">
<div align="center">客户信息</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">客户编号</div>
    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="17%"> 
      <div align="right">联系方式</div>
    </td>
    <td width="33%"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">客户姓名</td>
    <td width="33%"><%=khxm%></td>
    <td width="17%" align="right">性别</td>
    <td width="33%"><%
	cf.radioToken(out, "M+男&W+女",xb,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">所属城区</td>
    <td width="33%" bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%></td>
    <td width="17%" align="right">房屋地址</td>
    <td width="33%"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">信息来源</td>
    <td width="33%" bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm",xxlybm,true);
%> </td>
    <td width="17%" align="right">签约序号</td>
    <td width="33%"><%=qyxh%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%" align="right">设计师</td>
    <td width="33%"><%=sjs%></td>
    <td width="17%" align="right">工程担当</td>
    <td width="33%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%"> 
      <div align="right">派单处理状态</div>
    </td>
    <td width="33%"> <%
	cf.selectToken(out,"1+申请派单&2+派单&3+拒绝派单&4+接受派单&5+保持原派&6+同意改派",pdclzt,true);
%> </td>
    <td width="17%"> 
      <div align="right">参观样板间编号</div>
    </td>
    <td width="33%"><%=ybjbh%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%"> 
      <div align="right">派单人</div>
    </td>
    <td width="33%"> <%=pdr%> </td>
    <td width="17%"> 
      <div align="right">派单时间</div>
    </td>
    <td width="33%"><%=pdsj%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="17%"> 
      <div align="right">施工队</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="17%"> 
      <div align="right">施工班组</div>
    </td>
    <td width="33%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">工程签约额</div>
    </td>
    <td width="33%"><%=qye%> </td>
    <td width="17%"> 
      <div align="right">集成家居签约额</div>
    </td>
    <td width="33%"><%=jcjjqye%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">是否有优惠</td>
    <td width="33%"><%
	cf.radioToken(out, "Y+是&N+否",sfyyh,true);
%></td>
    <td width="17%" align="right">每平米均价</td>
    <td width="33%"><%=pmjj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">优惠原因</td>
    <td colspan="3"><%=yhyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">合同号</div>
    </td>
    <td width="33%"><%=hth%> </td>
    <td width="17%"> 
      <div align="right">附赠项目</div>
    </td>
    <td width="33%"><%=fzxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">签约日期</div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"> <%=qyrq%> </td>
    <td width="17%"> 
      <div align="right">中款金额</div>
    </td>
    <td width="33%"><%=zkje%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">应开工日期</td>
    <td width="33%"><%=kgrq%></td>
    <td width="17%" align="right">实际开工日期</td>
    <td width="33%"><%=sjkgrq%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">首款日期</div>
    </td>
    <td width="33%"><%=skrq%> </td>
    <td width="17%"> 
      <div align="right">首款金额</div>
    </td>
    <td width="33%"> <%=skje%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">中期款日期</div>
    </td>
    <td width="33%"> <%=zkrq%> </td>
    <td width="17%"> 
      <div align="right">中期款实付日期</div>
    </td>
    <td width="33%"> <%=sjzkrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">应竣工日期</div>
    </td>
    <td width="33%"> <%=jgrq%> </td>
    <td width="17%"> 
      <div align="right">实际竣工日期</div>
    </td>
    <td width="33%"> <%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">工程进度</div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"> <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",gcjdbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">完工标志</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+已完工&N+未完工",wgbz,true);
%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">最新回访时间</div>
    </td>
    <td width="33%" bgcolor="#CCCCFF"> <%=zxhfsj%> </td>
    <td width="17%"> 
      <div align="right">最新回访记录号</div>
    </td>
    <td width="33%"> <%=hfjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">是否需回访</div>
    </td>
    <td width="33%"> <%
	cf.radioToken(out, "Y+需回访&N+不需回访",sfxhf,true);
%> </td>
    <td width="17%"> 
      <div align="right">应回访日期</div>
    </td>
    <td width="33%"> <%=hfrq%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">回访类型</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",hflxbm,true);
%> </td>
    <td width="17%"> 
      <div align="right"></div>
    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">样板间有效期</div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"> <%=ybjyxq%> </td>
    <td width="17%"> 
      <div align="right">样板间登记时间</div>
    </td>
    <td width="33%"> <%=ybjdjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">样板间标志</td>
    <td width="33%" bgcolor="#FFFFCC"><%
	cf.selectToken(out,"Y+是&N+否",ybjbz,true);
%></td>
    <td width="17%" align="right">材质</td>
    <td width="33%"><%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" bgcolor="#FFFFCC"> 
      <div align="right">油色</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">装修价位</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">户型</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">风格</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right">面积编码</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">房屋面积</div>
    </td>
    <td width="33%"><%=fwmj%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">投诉标志</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+有投诉&N+无投诉",tsbz,true);
%> </td>
    <td width="17%"> 
      <div align="right">投诉记录号</div>
    </td>
    <td width="33%"><%=tsjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">报修标志</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+有报修&N+无报修",bxbz,true);
%> </td>
    <td width="17%"> 
      <div align="right">报修记录号</div>
    </td>
    <td width="33%"><%=bxjlh%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%"> 
      <div align="right">退单标志</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+已退单&N+未退单",tkbz,true);
%> </td>
    <td width="17%"> 
      <div align="right">退单序号</div>
    </td>
    <td width="33%"><%=tdtkxh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">客户类型</div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
    <td width="17%"> 
      <div align="right">回单标志</div>
    </td>
    <td width="33%"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">参观地址</td>
    <td width="33%"><%=cgdz%></td>
    <td width="17%" align="right">回单设计师</td>
    <td width="33%"><%=hdsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">回单施工队</td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd ",hdsgd,true);
%> </td>
    <td width="17%" align="right">回单班组</td>
    <td width="33%"> <%=hdsgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">签约店面</div>
    </td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2') order by dwbh",dwbh,true);
%> </td>
    <td width="17%"> 
      <div align="right"></div>
    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">信息录入人</div>
    </td>
    <td width="33%"><%=lrr%> </td>
    <td width="17%"> 
      <div align="right">录入时间</div>
    </td>
    <td width="33%"><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">样板间是否属实</td>
    <td width="33%"><%=ybjss%></td>
    <td width="17%" align="right">回单是否属实</td>
    <td width="33%"><%=hdsfss%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>
<P><div align="center">购买集成家居信息 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">产品</td>
	<td  width="15%">供应商</td>
	<td  width="10%">供应商电话</td>
	<td  width="7%">实际费用</td>
	<td  width="9%">应安装日期</td>
	<td  width="9%">实安装日期</td>
	<td  width="25%">货物验收情况</td>
	<td  width="7%">安装</td>
</tr>

<%
	ls_sql="SELECT dm_cpbm.cpmc,sq_dwxx.dwmc,sq_dwxx.dwdh,crm_dgqk.sjfy,crm_dgqk.yazrq ,crm_dgqk.sazrq,ysqk,DECODE(crm_dgqk.azbz,'N','未安装','Y','已安装') as crm_dgqk_azbz  ";
	ls_sql+=" FROM crm_dgqk,dm_cpbm,sq_dwxx  ";
    ls_sql+=" where crm_dgqk.cpbm=dm_cpbm.cpbm and crm_dgqk.gys=sq_dwxx.dwbh";
    ls_sql+=" and crm_dgqk.khbh='"+khbh+"'";
    ls_sql+=" order by crm_dgqk.khbh,crm_dgqk.cpbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>

<P><div align="center">派单记录 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">施工队</td>
	<td  width="8%">施工班组</td>
	<td  width="10%">回复时间</td>
	<td  width="8%">回复人</td>
	<td  width="10%">回复结论</td>
	<td  width="24%">拒绝原因</td>
	<td  width="22%">核实情况</td>
	<td  width="10%">领导审批</td>
</tr>

<%
	ls_sql="SELECT sgdmc sgd,pd_pdjl.sgbz,hfsj,hfr,DECODE(hfjl,'0','未回复','3','拒绝派单','4','接受派单','5','保持原派'),jjyy,hsqk,DECODE(ldspjl,'0','未审批','Y','同意改派','N','保持原派')";
	ls_sql+=" FROM pd_pdjl,sq_sgd";
    ls_sql+=" where pd_pdjl.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and pd_pdjl.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


<P><div align="center">工程回访记录 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="11%">回访类型</td>
	<td  width="27%">回访内容</td>
	<td  width="11%">回访时间</td>
	<td  width="6%">回访人</td>
	<td  width="10%">反馈部门</td>
	<td  width="8%">处理状态</td>
	<td  width="22%">相关部门处理情况</td>
</tr>

<%
	ls_sql="SELECT crm_hfjl.hfjlh ,dm_hflxbm.hflxmc,DECODE(sjshfnr,null,'',sjshfnr,'设：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>质：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>施：'||sgdhfnr) as hfnr,crm_hfjl.hfsj,crm_hfjl.hfr,sq_dwxx.dwmc,DECODE(clzt,'0','不需处理','Y','已处理','N','未处理'),xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,sq_dwxx,crm_gchffkbm   ";
    ls_sql+=" where crm_gchffkbm.dwbh=sq_dwxx.dwbh(+) and crm_hfjl.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=" and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+) and crm_hfjl.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfjlh","1");//列参数对象加入Hash表
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表
	spanColHash.put("hfnr","1");//列参数对象加入Hash表
	spanColHash.put("hfsj","1");//列参数对象加入Hash表
	spanColHash.put("hfr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


<%
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	String slfsmc=null;
	String tslxmc=null;
	String tsyymc=null;
	String tsnr=null;
	String slsj=null;
	String clzt=null;
	String zzjgmc=null;

	ls_sql="SELECT crm_tsjl.tsjlh,slfsmc,tslxmc,tsyymc,tsnr,crm_tsjl.slsj,DECODE(clzt,0,'非客服登记',1,'客服受理',2,'处理投诉',3,'结案') clzt,zzjgmc ";
	ls_sql+=" FROM crm_tsjl,dm_zzjgbm,dm_slfsbm,dm_tslxbm,dm_tsyybm  ";
    ls_sql+=" where crm_tsjl.zzjgbm=dm_zzjgbm.zzjgbm(+) and crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm ";
    ls_sql+=" and crm_tsjl.khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		%>
		<P><div align="center">投诉报修记录 </div>
		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="4%">记录号</td>
			<td  width="7%">受理方式</td>
			<td  width="8%">投诉报修大类</td>
			<td  width="12%">投诉报修小类</td>
			<td  width="37%">投诉报修内容</td>
			<td  width="10%">受理时间</td>
			<td  width="8%">处理状态</td>
			<td  width="7%">满意度</td>
		</tr>
		<%
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		slfsmc=cf.fillNull(rs.getString("slfsmc"));
		tslxmc=cf.fillNull(rs.getString("tslxmc"));
		tsyymc=cf.fillNull(rs.getString("tsyymc"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slsj=cf.fillNull(rs.getString("slsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		zzjgmc=cf.fillNull(rs.getString("zzjgmc"));
		%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center"><%=tsjlh%></td>
            <td align="center"><%=slfsmc%></td>
            <td align="center"><%=tslxmc%></td>
            <td align="center"><%=tsyymc%></td>
            <td><%=tsnr%></td>
            <td align="center"><%=slsj%></td>
            <td align="center"><%=clzt%></td>
            <td align="center"><%=zzjgmc%></td>
          </tr>
		</table>


		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">涉及部门</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">处理情况</font></div>
            </td>
            <td width="16%"> 
              <div align="center"><font color="#006666">处理时间</font></div>
            </td>
            <td width="10%"> 
              <div align="center"><font color="#006666">处理人</font></div>
            </td>
          </tr>
			<%

			String dwmc=null;
			String clqk=null;
			String clsj=null;
			String clr=null;

			stmt1 = conn.createStatement();

			ls_sql="select dwmc,clqk,clsj,clr";
			ls_sql+=" from  crm_tsclqk,sq_dwxx";
			ls_sql+=" where crm_tsclqk.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"'";
			rs1 =stmt1.executeQuery(ls_sql);
			while (rs1.next())
			{
				dwmc=cf.fillNull(rs1.getString("dwmc"));
				clqk=cf.fillNull(rs1.getString("clqk"));
				clsj=cf.fillNull(rs1.getString("clsj"));
				clr=cf.fillNull(rs1.getString("clr"));
				%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=dwmc%></td>
					<td><%=clqk%></td>
					<td align="center"><%=clsj%></td>
					<td align="center"><%=clr%></td>
				  </tr>
				  <%
			}
			rs1.close();
			%> 
        </table>
		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">回访时间</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">客户回访情况</font></div>
            </td>
            <td width="26%"> 
              <div align="center"><font color="#006666">回访中出现的新问题</font></div>
            </td>
          </tr>
          <%
			String khhfqk=null;
			String cxxwt=null;
			String hfsj=null;

			ls_sql="select hfsj,khhfqk,cxxwt";
			ls_sql+=" from  crm_tshfjl";
			ls_sql+=" where tsjlh='"+tsjlh+"'";
			rs1 =stmt1.executeQuery(ls_sql);
			while (rs1.next())
			{
				khhfqk=cf.fillNull(rs1.getString("khhfqk"));
				cxxwt=cf.fillNull(rs1.getString("cxxwt"));
				hfsj=cf.fillNull(rs1.getString("hfsj"));
				%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center" ><%=hfsj%></td>
					<td ><%=khhfqk%></td>
					<td ><%=cxxwt%></td>
				  </tr>
				  <%
			}
			rs1.close();
			%>
        </table>
<%
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 


<P><div align="center">退单 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">退单序号</td>
	<td  width="10%">退单类型</td>
	<td  width="30%">退单原因</td>
	<td  width="10%">应退金额</td>
	<td  width="10%">实退金额</td>
	<td  width="10%">是否返券</td>
	<td  width="10%">是否已认证</td>
	<td  width="10%">录入时间</td>
</tr>

<%
	ls_sql="SELECT TO_CHAR(tdtkxh) tdtkxh,dm_yylxbm.yylxmc,tkyy,crm_tdtkdj.ytje,crm_tdtkdj.stje,DECODE(sffj,'Y','是','N','否'),DECODE(sfyrz,'Y','是','N','否'),lrsj  ";
	ls_sql+=" FROM crm_tdtkdj,dm_yylxbm,sq_sgd  ";
    ls_sql+=" where crm_tdtkdj.yylxbm=dm_yylxbm.yylxbm and crm_tdtkdj.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tdtkdj.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

<P><div align="center">增减项 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">增减项序号</td>
	<td  width="6%">类型</td>
	<td  width="9%">增减金额</td>
	<td  width="50%">增减项原因</td>
	<td  width="10%">录入人</td>
	<td  width="12%">录入时间</td>
</tr>

<%
	ls_sql="SELECT TO_CHAR(zjxxh) zjxxh,DECODE(crm_zjxdj.fylxbm,'01','增项','02','减项'),crm_zjxdj.zjje,dm_zjxyybm.zjxyymc,lrr,lrsj  ";
	ls_sql+=" FROM crm_zjxdj,dm_zjxyybm,sq_sgd  ";
    ls_sql+=" where crm_zjxdj.zjxyybm=dm_zjxyybm.zjxyybm and crm_zjxdj.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

<P><div align="center">产品报价信息 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">项目名称</td>
	<td  width="6%">购买数量</td>
	<td  width="6%">计量单位</td>
	<td  width="5%">单价</td>
	<td  width="6%">总价</td>
	<td  width="6%">录入人</td>
	<td  width="9%">录入时间</td>
</tr>

<%
	ls_sql="SELECT crm_cpbjb.xmmc as crm_cpbjb_xmmc,crm_gmcpmx.gmsl as crm_gmcpmx_gmsl,crm_gmcpmx.jldw as crm_gmcpmx_jldw,TO_CHAR(crm_gmcpmx.dj) as crm_gmcpmx_dj,crm_gmcpmx.zj as crm_gmcpmx_zj,crm_gmcpmx.lrr as crm_gmcpmx_lrr,crm_gmcpmx.lrsj as crm_gmcpmx_lrsj  ";
	ls_sql+=" FROM crm_cpbjb,crm_gmcpmx";
    ls_sql+=" where crm_gmcpmx.xmbh=crm_cpbjb.xmbh ";
    ls_sql+=" and crm_gmcpmx.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gmcpmx.khbh,crm_gmcpmx.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


</body>
</html>
