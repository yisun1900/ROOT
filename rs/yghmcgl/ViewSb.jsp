<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String bianhao=null;
String yhmc=null;
String xb=null;
String csrq=null;

String sfzh=null;
String xzzwbm=null;
String dh=null;
String bgdh=null;
String email=null;
String zcmc=null;


String zyzzzs=null;
String sfzszg=null;
String rzsj=null;
String gznx=null;

String lrr=null;
String lrsj=null;
String sjsbh=null;
String dwbh=null;
String ssfgs=null;
String bz=null;


String sfcjbx=null;
String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String shbxh=null;
String jbxdd=null;
String sbblsj=null;
String sbzrjs=null;
String sbzcjs=null;
String bxtjsj=null;
String bxzcsj=null;
String yjsxe=null;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
String gsjgjj=null;
String grjgjj=null;
String jndbtc=null;
String sbbljlh=null;

String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();


	ls_sql="select ygbh,ygbh,bianhao,yhmc,xb,csrq,sfzh,xzzwbm,dh,bgdh,email,zcmc,zyzzzs,sfzszg,rzsj,gznx,lrr,lrsj,sjsbh,dwbh,ssfgs,bz ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		ygbh=cf.fillHtml(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xb=cf.fillHtml(rs.getString("xb"));
		csrq=cf.fillHtml(rs.getDate("csrq"));
		sfzh=cf.fillHtml(rs.getString("sfzh"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		dh=cf.fillHtml(rs.getString("dh"));
		bgdh=cf.fillHtml(rs.getString("bgdh"));
		email=cf.fillHtml(rs.getString("email"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zyzzzs=cf.fillHtml(rs.getString("zyzzzs"));
		sfzszg=cf.fillHtml(rs.getString("sfzszg"));
		rzsj=cf.fillHtml(rs.getDate("rzsj"));
		gznx=cf.fillHtml(rs.getString("gznx"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		sjsbh=cf.fillHtml(rs.getString("sjsbh"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		ssfgs=cf.fillHtml(rs.getString("ssfgs"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select ygbh,bianhao,yhmc,sfcjbx,ylbx,jylbx,sybx,gsby,syx,shbxh,jbxdd,sbblsj,sbzrjs,sbzcjs,bxtjsj,bxzcsj,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,jndbtc,sbbljlh,bz ";
	ls_sql+=" from  rs_ygsbxx";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		sfcjbx=cf.fillNull(rs.getString("sfcjbx"));
		ylbx=cf.fillNull(rs.getString("ylbx"));
		jylbx=cf.fillNull(rs.getString("jylbx"));
		sybx=cf.fillNull(rs.getString("sybx"));
		gsby=cf.fillNull(rs.getString("gsby"));
		syx=cf.fillNull(rs.getString("syx"));
		shbxh=cf.fillNull(rs.getString("shbxh"));
		jbxdd=cf.fillNull(rs.getString("jbxdd"));
		sbblsj=cf.fillNull(rs.getDate("sbblsj"));
		sbzrjs=cf.fillNull(rs.getString("sbzrjs"));
		sbzcjs=cf.fillNull(rs.getString("sbzcjs"));
		bxtjsj=cf.fillNull(rs.getDate("bxtjsj"));
		bxzcsj=cf.fillNull(rs.getDate("bxzcsj"));
		yjsxe=cf.fillNull(rs.getString("yjsxe"));
		gsjbfe=rs.getDouble("gsjbfe");
		grjbfe=rs.getDouble("grjbfe");
		sfjgjj=cf.fillNull(rs.getString("sfjgjj"));
		gsjgjj=cf.fillNull(rs.getString("gsjgjj"));
		grjgjj=cf.fillNull(rs.getString("grjgjj"));
		jndbtc=cf.fillNull(rs.getString("jndbtc"));
		sbbljlh=cf.fillNull(rs.getString("sbbljlh"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000;
	font-family: "仿宋_GB2312";
}
.STYLE2 {color: #000000; font-family: "仿宋_GB2312"; font-weight: bold; }
.STYLE3 {font-family: "仿宋_GB2312"}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 社保（员工序号：<%=ygbh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1">姓名</td>
    <td width="13%"><%=yhmc%></td>
    <td width="9%" align="right" class="STYLE1">身份证号</td>
    <td width="18%"><%=sfzh%></td>
    <td width="9%" align="right" class="STYLE1">工号</td>
    <td width="13%"><%=bianhao%></td>
    <td width="11%" align="right" class="STYLE1">行政职务</td>
    <td width="18%"><%=xzzwbm%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1"> 手机</td>
    <td><%=dh%> </td>
    <td align="right" class="STYLE1">办公电话</td>
    <td><%=bgdh%> </td>
    <td align="right" class="STYLE1">email</td>
    <td><%=email%></td>
    <td align="right" class="STYLE1">技术职称</td>
    <td><%
  if(zcmc=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc,true);}
%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1"><span class="STYLE3">所属公司</span></td>
    <td><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);%></td>
    <td align="right" class="STYLE1">所属部门</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%></td>
    <td align="right" class="STYLE1">部门小组</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
    <td align="right" class="STYLE1">主要资质证书</td>
    <td><%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs,true);
%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE3">员工状态</td>
    <td><%
	cf.selectToken(out,"M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退",sfzszg,true);
%></td>
    <td align="right" class="STYLE1">入职日期</td>
    <td><%=rzsj%></td>
    <td align="right" class="STYLE1">工作年限</td>
    <td><%=gznx%></td>
    <td align="right" class="STYLE1">出生日期</td>
    <td><%=csrq%></td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="9%" align="right" class="STYLE3">备注</td>
    <td colspan="7"><%=bz%></td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr > 
    <td colspan="8" class="STYLE1" align="center"><b><font color="#0000CC">社保办理情况</font></b></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">社会保险号</td>
    <td width="15%"><%=shbxh%></td>
    <td align="right" width="10%" class="STYLE1">缴保险地点</td>
    <td width="15%"><%=jbxdd%></td>
    <td align="right" width="10%" class="STYLE1">社保办理时间</td>
    <td width="15%"><%=sbblsj%></td>
    <td align="right" width="10%" class="STYLE1">转入基数</td>
    <td width="15%"><%=sbzrjs%></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">交纳基数</td>
    <td width="15%"><%=yjsxe%> </td>
    <td align="right" width="10%" class="STYLE1">应缴保费</td>
    <td width="15%"><%=cf.formatDouble(grjbfe+gsjbfe)%></td>
    <td align="right" width="10%" class="STYLE1">公司交保费额</td>
    <td width="15%"><%=gsjbfe%> </td>
    <td align="right" width="10%" class="STYLE1">个人交保费额</td>
    <td width="15%"><%=grjbfe%></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">是否参加保险</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+参保&N+未办理&T+停保&Z+转出",sfcjbx,true);
%></td>
    <td align="right" width="10%" class="STYLE1">保险停缴时间</td>
    <td width="15%"><%=bxtjsj%></td>
    <td align="right" width="10%" class="STYLE1">保险转出时间</td>
    <td width="15%"><%=bxzcsj%></td>
    <td align="right" width="10%" class="STYLE1">转出基数</td>
    <td width="15%"><%=sbzcjs%></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">医疗保险</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+已交&N+未交",ylbx,true);
%> </td>
    <td align="right" width="10%" class="STYLE1">养老保险</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+已交&N+未交",jylbx,true);
%> </td>
    <td align="right" width="10%" class="STYLE1">失业保险</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+已交&N+未交",sybx,true);
%> </td>
    <td align="right" width="10%" class="STYLE1">工伤保险</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+已交&N+未交",gsby,true);
%> </td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">缴纳生育保险</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+已交&N+未交",syx,true);
%></td>
    <td align="right" width="10%" class="STYLE1">住房公积金</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+已交&N+未交",sfjgjj,true);
%></td>
    <td align="right" width="10%" class="STYLE1">公司交公积金</td>
    <td width="15%"><%=gsjgjj%></td>
    <td align="right" width="10%" class="STYLE1">个人交公积金</td>
    <td width="15%"><%=grjgjj%></td>
  </tr>
</table>
<table border="1" width="160%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr align="center">
	<td  width="4%">办理记录号</td>
	<td  width="3%">类型</td>
	<td  width="6%">社会保险号</td>
	<td  width="5%">社保办理时间</td>
	<td  width="3%">医疗</td>
	<td  width="3%">养老</td>
	<td  width="3%">失业</td>
	<td  width="3%">工伤</td>
	<td  width="3%">生育</td>
	<td  width="6%">缴保险地点</td>
	<td  width="4%">转入基数</td>
	<td  width="5%">保险停缴时间</td>
	<td  width="5%">保险转出时间</td>
	<td  width="5%">交纳基数</td>
	<td  width="5%">公司交保费额</td>
	<td  width="5%">个人交保费额</td>
	<td  width="3%">公积金</td>
	<td  width="5%">公司交公积金</td>
	<td  width="5%">个人交公积金</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="11%">备注</td>
</tr>
<%
//	String sbbljlh=null;
	String lx=null;

	ls_sql="SELECT rs_sbbljl.sbbljlh,DECODE(rs_sbbljl.lx,'1','办理','2','变更','2','停保','3','转出') lx,rs_sbbljl.shbxh,rs_sbbljl.sbblsj, DECODE(rs_sbbljl.ylbx,'Y','是','N','否') ylbx, DECODE(rs_sbbljl.jylbx,'Y','是','N','否') jylbx, DECODE(rs_sbbljl.sybx,'Y','是','N','否') sybx, DECODE(rs_sbbljl.gsby,'Y','是','N','否') gsby, DECODE(rs_sbbljl.syx,'Y','是','N','否') syx,rs_sbbljl.jbxdd,rs_sbbljl.sbzrjs,rs_sbbljl.bxtjsj,rs_sbbljl.bxzcsj,rs_sbbljl.yjsxe,rs_sbbljl.gsjbfe,rs_sbbljl.grjbfe, DECODE(rs_sbbljl.sfjgjj,'Y','是','N','否') sfjgjj,rs_sbbljl.gsjgjj,rs_sbbljl.grjgjj,rs_sbbljl.lrr,rs_sbbljl.lrsj,rs_sbbljl.bz   ";
	ls_sql+=" FROM rs_sbbljl  ";
    ls_sql+=" where rs_sbbljl.ygbh="+whereygbh;
    ls_sql+=" order by rs_sbbljl.sbbljlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sbbljlh=cf.fillNull(rs.getString("sbbljlh"));
		lx=cf.fillNull(rs.getString("lx"));
		shbxh=cf.fillNull(rs.getString("shbxh"));
		sbblsj=cf.fillNull(rs.getDate("sbblsj"));
		ylbx=cf.fillNull(rs.getString("ylbx"));
		jylbx=cf.fillNull(rs.getString("jylbx"));
		sybx=cf.fillNull(rs.getString("sybx"));
		gsby=cf.fillNull(rs.getString("gsby"));
		syx=cf.fillNull(rs.getString("syx"));
		jbxdd=cf.fillNull(rs.getString("jbxdd"));
		sbzrjs=cf.fillHtml(rs.getString("sbzrjs"));
		bxtjsj=cf.fillHtml(rs.getDate("bxtjsj"));
		bxzcsj=cf.fillHtml(rs.getDate("bxzcsj"));
		yjsxe=cf.fillNull(rs.getString("yjsxe"));
		gsjbfe=rs.getDouble("gsjbfe");
		grjbfe=rs.getDouble("grjbfe");
		sfjgjj=cf.fillNull(rs.getString("sfjgjj"));
		gsjgjj=cf.fillNull(rs.getString("gsjgjj"));
		grjgjj=cf.fillNull(rs.getString("grjgjj"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
%>
	<tr align="center">
	<td ><%=sbbljlh%></td>
	<td ><%=lx%></td>
	<td ><%=shbxh%></td>
	<td ><%=sbblsj%></td>
	<td ><%=ylbx%></td>
	<td ><%=jylbx%></td>
	<td ><%=sybx%></td>
	<td ><%=gsby%></td>
	<td ><%=syx%></td>
	<td ><%=jbxdd%></td>
	<td ><%=sbzrjs%></td>
	<td ><%=bxtjsj%></td>
	<td ><%=bxzcsj%></td>
	<td ><%=yjsxe%></td>
	<td ><%=gsjbfe%></td>
	<td ><%=grjbfe%></td>
	<td ><%=sfjgjj%></td>
	<td ><%=gsjgjj%></td>
	<td ><%=grjgjj%></td>
	<td ><%=lrr%></td>
	<td ><%=lrsj%></td>
	<td ><%=bz%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();

%>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
