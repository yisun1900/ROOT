<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_hfjl_hfjlh=null;
String dm_hflxbm_hflxmc=null;
String crm_hfjl_khbh=null;
String crm_hfjl_sjfa=null;
String crm_hfjl_hqfw=null;
String crm_hfjl_jdqk=null;
String crm_hfjl_zjyfw=null;
String crm_hfjl_zjydw=null;
String crm_hfjl_zjyjz=null;
String crm_hfjl_fwsz=null;
String crm_hfjl_sgzl=null;
String crm_hfjl_grsz=null;
String crm_hfjl_sjshfnr=null;
String crm_hfjl_zjyhfnr=null;
String crm_hfjl_sgdhfnr=null;
String crm_hfjl_sfjxhf=null;
String crm_hfjl_xchfrq=null;
String crm_hfjl_xchflxbm=null;
String crm_hfjl_clfs=null;
String sq_dwxx_dwmc=null;
String crm_hfjl_hfsj=null;
String crm_hfjl_hfr=null;
String crm_hfjl_gcjdbm=null;
String crm_hfjl_clzt=null;
String crm_hfjl_clqk=null;
String crm_hfjl_clr=null;
String crm_hfjl_clsj=null;
String jglxbm=null;
String khxm=null;
String bz=null;
String fwdz=null;

String jcjjsjs=null;
String jsjjgw=null;
String jcxmzy=null;
String jcshaz=null;
String jccpzl=null;
String jchfnr=null;
String zxhfbz=null;
String yhfjlh=null;

String wherecrm_hfjl_hfjlh=null;
wherecrm_hfjl_hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_hfjl.bz,jglxbm,khxm,fwdz,crm_hfjl.hfjlh as crm_hfjl_hfjlh,dm_hflxbm.hflxmc as dm_hflxbm_hflxmc,crm_hfjl.khbh as crm_hfjl_khbh,crm_hfjl.sjfa as crm_hfjl_sjfa,crm_hfjl.hqfw as crm_hfjl_hqfw,crm_hfjl.jdqk as crm_hfjl_jdqk,crm_hfjl.zjyfw as crm_hfjl_zjyfw,crm_hfjl.zjydw as crm_hfjl_zjydw,crm_hfjl.zjyjz as crm_hfjl_zjyjz,crm_hfjl.fwsz as crm_hfjl_fwsz,crm_hfjl.sgzl as crm_hfjl_sgzl,crm_hfjl.grsz as crm_hfjl_grsz,crm_hfjl.sjshfnr as crm_hfjl_sjshfnr,crm_hfjl.zjyhfnr as crm_hfjl_zjyhfnr,crm_hfjl.sgdhfnr as crm_hfjl_sgdhfnr,crm_hfjl.sfjxhf as crm_hfjl_sfjxhf,crm_hfjl.xchfrq as crm_hfjl_xchfrq,crm_hfjl.xchflxbm as crm_hfjl_xchflxbm,crm_hfjl.clfs as crm_hfjl_clfs,crm_hfjl.hfsj as crm_hfjl_hfsj,crm_hfjl.hfr as crm_hfjl_hfr,crm_hfjl.gcjdbm as crm_hfjl_gcjdbm,jcjjsjs,jsjjgw,jcxmzy,jcshaz,jccpzl,jchfnr,zxhfbz,yhfjlh";
	ls_sql+=" from  crm_hfjl,dm_hflxbm,crm_khxx";
	ls_sql+=" where crm_hfjl.hflxbm=dm_hflxbm.hflxbm and  (crm_hfjl.hfjlh="+wherecrm_hfjl_hfjlh+")  ";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bz=cf.fillNull(rs.getString("bz"));
		jglxbm=cf.fillNull(rs.getString("jglxbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		crm_hfjl_hfjlh=cf.fillNull(rs.getString("crm_hfjl_hfjlh"));
		dm_hflxbm_hflxmc=cf.fillNull(rs.getString("dm_hflxbm_hflxmc"));
		crm_hfjl_khbh=cf.fillNull(rs.getString("crm_hfjl_khbh"));
		crm_hfjl_sjfa=cf.fillNull(rs.getString("crm_hfjl_sjfa"));
		crm_hfjl_hqfw=cf.fillNull(rs.getString("crm_hfjl_hqfw"));
		crm_hfjl_jdqk=cf.fillNull(rs.getString("crm_hfjl_jdqk"));
		crm_hfjl_zjyfw=cf.fillNull(rs.getString("crm_hfjl_zjyfw"));
		crm_hfjl_zjydw=cf.fillNull(rs.getString("crm_hfjl_zjydw"));
		crm_hfjl_zjyjz=cf.fillNull(rs.getString("crm_hfjl_zjyjz"));
		crm_hfjl_fwsz=cf.fillNull(rs.getString("crm_hfjl_fwsz"));
		crm_hfjl_sgzl=cf.fillNull(rs.getString("crm_hfjl_sgzl"));
		crm_hfjl_grsz=cf.fillNull(rs.getString("crm_hfjl_grsz"));
		crm_hfjl_sjshfnr=cf.fillNull(rs.getString("crm_hfjl_sjshfnr"));
		crm_hfjl_zjyhfnr=cf.fillNull(rs.getString("crm_hfjl_zjyhfnr"));
		crm_hfjl_sgdhfnr=cf.fillNull(rs.getString("crm_hfjl_sgdhfnr"));
		crm_hfjl_sfjxhf=cf.fillNull(rs.getString("crm_hfjl_sfjxhf"));
		crm_hfjl_xchfrq=cf.fillNull(rs.getDate("crm_hfjl_xchfrq"));
		crm_hfjl_xchflxbm=cf.fillNull(rs.getString("crm_hfjl_xchflxbm"));
		crm_hfjl_clfs=cf.fillNull(rs.getString("crm_hfjl_clfs"));
		crm_hfjl_hfsj=cf.fillNull(rs.getDate("crm_hfjl_hfsj"));
		crm_hfjl_hfr=cf.fillNull(rs.getString("crm_hfjl_hfr"));
		crm_hfjl_gcjdbm=cf.fillNull(rs.getString("crm_hfjl_gcjdbm"));

		jcjjsjs=cf.fillNull(rs.getString("jcjjsjs"));
		jsjjgw=cf.fillNull(rs.getString("jsjjgw"));
		jcxmzy=cf.fillNull(rs.getString("jcxmzy"));
		jcshaz=cf.fillNull(rs.getString("jcshaz"));
		jccpzl=cf.fillNull(rs.getString("jccpzl"));
		jchfnr=cf.fillNull(rs.getString("jchfnr"));
		zxhfbz=cf.fillNull(rs.getString("zxhfbz"));
		yhfjlh=cf.fillNull(rs.getString("yhfjlh"));
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

<body bgcolor="#FFFFFF">
<div align="center">回访记录</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      回访记录号    </td>
    <td width="31%"> <%=crm_hfjl_hfjlh%> </td>
    <td width="17%" align="right"> 
      回访类型    </td>
    <td width="34%"> <%=dm_hflxbm_hflxmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      客户编号    </td>
    <td width="31%"> <%=crm_hfjl_khbh%> </td>
    <td width="17%" align="right"> 
      客户姓名    </td>
    <td width="34%"><%=khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right">设计师设计方案</td>
    <td width="31%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_sjfa,true);
%></td>
    <td width="17%" align="right">设计师后期服务</td>
    <td width="34%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_hqfw,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right"> 
      设计师交底清楚    </td>
    <td width="31%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_jdqk,true);
%> </td>
    <td width="17%">&nbsp; 
    </td>
    <td width="34%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right">设计师回访内容</td>
    <td colspan="3"><%=crm_hfjl_sjshfnr%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right"> 
      工程担当服务    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_zjyfw,true);
%> </td>
    <td width="17%" align="right"> 
      工程担当到位    </td>
    <td width="34%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_zjydw,true);
%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right"> 
      工程担当尽责    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_zjyjz,true);
%> </td>
    <td width="17%">&nbsp;  
    </td>
    <td width="34%">&nbsp; </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right">工程担当回访内容</td>
    <td colspan="3"><%=crm_hfjl_zjyhfnr%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right">施工队服务态度</td>
    <td width="31%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_fwsz,true);
%></td>
    <td width="17%" align="right">施工队施工质量</td>
    <td width="34%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_sgzl,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right"> 
      施工队工人素质    </td>
    <td width="31%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_grsz,true);
%> </td>
    <td width="17%">&nbsp;  
    </td>
    <td width="34%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right"> 
      施工队回访内容    </td>
    <td colspan="3"> <%=crm_hfjl_sgdhfnr%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right" bgcolor="#E8E8FF">家居设计师</td>
    <td width="31%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jcjjsjs,true);
%></td>
    <td width="17%" align="right">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right" bgcolor="#E8E8FF">项目专员</td>
    <td width="31%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jcxmzy,true);
%></td>
    <td width="17%" align="right">家居顾问</td>
    <td width="34%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jsjjgw,true);
%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right" bgcolor="#E8E8FF">送货安装</td>
    <td width="31%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jcshaz,true);
%></td>
    <td width="17%" align="right">产品质量</td>
    <td width="34%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jccpzl,true);
%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right" bgcolor="#E8E8FF">集成家居回访内容</td>
    <td colspan="3"><%=jchfnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      设置下次回访时间    </td>
    <td width="31%"><%
	cf.radioToken(out, "Y+设置&N+不设置&F+重新回访",crm_hfjl_sfjxhf,true);
%> </td>
    <td width="17%" align="right"> 
      工程进度    </td>
    <td width="34%"><%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_hfjl_gcjdbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      下次回访日期    </td>
    <td width="31%"> <%=crm_hfjl_xchfrq%> </td>
    <td width="17%" align="right"> 
      下次回访类型    </td>
    <td width="34%"> <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm",crm_hfjl_xchflxbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      回访时间    </td>
    <td width="31%"> <%=crm_hfjl_hfsj%> </td>
    <td width="17%" align="right"> 
      回访人    </td>
    <td width="34%"> <%=crm_hfjl_hfr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      处理方式    </td>
    <td width="31%"><%
	cf.selectToken(out,"0+不需处理&1+反馈相关部门",crm_hfjl_clfs,true);
%> </td>
    <td width="17%" align="right"> 
      回访结果    </td>
    <td width="34%"><%
	cf.selectItem(out,"select jglxbm,jglxmc from dm_jglxbm ",jglxbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">最新回访标志</td>
    <td><%=zxhfbz%></td>
    <td align="right">原回访记录号</td>
    <td><%=yhfjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" height="18">备注</td>
    <td colspan="3" height="18"><%=bz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">反馈部门</td>
	<td  width="8%">处理状态</td>
	<td  width="52%">相关部门对新问题处理</td>
	<td  width="8%">处理人</td>
	<td  width="12%">处理时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT dwmc,DECODE(clzt,'Y','已处理','N','未处理'),xwtclqk,clr,clsj";
	ls_sql+=" FROM crm_gchffkbm,sq_dwxx  ";
    ls_sql+=" where crm_gchffkbm.dwbh=sq_dwxx.dwbh";
    ls_sql+=" and  hfjlh="+wherecrm_hfjl_hfjlh;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>
