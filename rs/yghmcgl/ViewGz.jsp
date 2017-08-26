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


String gzlb=null;
String khgz=null;
String jbgz=null;
String gwgz=null;
String glgz=null;
String jtbt=null;
String dhbt=null;
String cb=null;
String buzhu=null;

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

	ls_sql="select ygbh,bianhao,yhmc,gzlb,khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,bz ";
	ls_sql+=" from  rs_ygjbgzb";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		gzlb=cf.fillNull(rs.getString("gzlb"));
		khgz=cf.fillNull(rs.getString("khgz"));
		jbgz=cf.fillNull(rs.getString("jbgz"));
		gwgz=cf.fillNull(rs.getString("gwgz"));
		glgz=cf.fillNull(rs.getString("glgz"));
		jtbt=cf.fillNull(rs.getString("jtbt"));
		dhbt=cf.fillNull(rs.getString("dhbt"));
		cb=cf.fillNull(rs.getString("cb"));
		buzhu=cf.fillNull(rs.getString("buzhu"));
		bz=cf.fillHtml(rs.getString("bz"));
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
<div align="center"> 工资（员工序号：<%=ygbh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1">姓名</td>
    <td><%=yhmc%></td>
    <td align="right" class="STYLE1">身份证号</td>
    <td><%=sfzh%></td>
    <td align="right" class="STYLE1">工号</td>
    <td><%=bianhao%></td>
    <td align="right" class="STYLE1">行政职务</td>
    <td><%=xzzwbm%></td>
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
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#0000CC">工资</font></b></td>
  </tr>
  <tr > 
    <td width="9%" align="right" class="STYLE1"> 工资类别 </td>
    <td width="13%"><%
	cf.selectToken(out,"1+固定工资&2+浮动工资",gzlb,true);
%> </td>
    <td width="9%" align="right" class="STYLE1">基本工资</td>
    <td width="18%"><%=jbgz%></td>
    <td width="9%" align="right" class="STYLE1">岗位工资</td>
    <td width="13%"><%=gwgz%></td>
    <td width="11%" align="right" class="STYLE1">工龄工资</td>
    <td width="18%"><%=glgz%></td>
  </tr>
  <tr > 
    <td width="9%" align="right" class="STYLE1">交通补贴</td>
    <td width="13%"><%=jtbt%></td>
    <td width="9%" align="right" class="STYLE1">电话补贴</td>
    <td width="18%"><%=dhbt%></td>
    <td width="9%" align="right" class="STYLE1">餐饮补贴</td>
    <td width="13%"><%=cb%></td>
    <td width="11%" align="right" class="STYLE1">其它补贴</td>
    <td width="18%"><%=buzhu%></td>
  </tr>
  <tr > 
    <td width="9%" align="right" class="STYLE1">绩效工资基数</td>
    <td width="13%"><%=khgz%></td>
    <td width="9%" align="right" class="STYLE1">&nbsp;</td>
    <td width="18%">&nbsp;</td>
    <td width="9%" align="right" class="STYLE1">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="11%" align="right" class="STYLE1">&nbsp;</td>
    <td width="18%">&nbsp;</td>
  </tr>
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
