<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xjjlh=null;
String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgbm=null;
double fkze=0;
double kfzs=0;
double kcjdebl=0;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

String zgjlh=cf.GB2Uni(request.getParameter("zgjlh"));
String zgcljlh = null;
int count = 0;
String zgxm = null;
String yqjjsj = null;
String zgsm = null;
String fkbmmc = null;
String fkbmjsr = null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	ls_sql="select xjjlh,zgxm,yqjjsj,zgsm,dwmc,fkbmjsr";
	ls_sql+=" from  kp_zggdmx,sq_dwxx";
	ls_sql+=" where  kp_zggdmx.fkbm=sq_dwxx.dwbh";
	ls_sql+=" and zgjlh='"+zgjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString(1));
		zgxm=cf.fillNull(rs.getString(2));
		yqjjsj=cf.fillNull(rs.getDate(3));
		zgsm=cf.fillNull(rs.getString(4));
		fkbmmc=cf.fillNull(rs.getString("dwmc"));
		fkbmjsr=cf.fillNull(rs.getString("fkbmjsr"));
	}
	rs.close();
	ps.close();

	ls_sql="select xjjlh,khbh,xjr,xjsj,xjlxbm,xjjgbm,fkze,kcjdebl,kfzs,kcjdebl,lrr,lrsj,kp_xjgdjl.bz ,sgdmc";
	ls_sql+=" from  kp_xjgdjl,sq_sgd";
	ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and  (xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		xjjgbm=cf.fillNull(rs.getString("xjjgbm"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();
	
	ls_sql="select NVL(max(substr(zgcljlh,13,3)),0)";
	ls_sql+=" from  kp_zgclgdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zgcljlh=zgjlh+cf.addZero(count+1,3);

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

<html>
<head>
<title>整改问题－接收</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">整改处理记录号</td>
	<td  width="8%">类型</td>
	<td  width="8%">处理结果</td>
	<td  width="8%">处理人</td>
	<td  width="10%">处理时间</td>
	<td  width="56%">处理说明</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT zgcljlh,lx,DECODE(cljg,'1','未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') ,clr,clsj,clsm";
	ls_sql+=" FROM kp_zgclgdmx";
    ls_sql+=" where zgjlh='"+zgjlh+"'";
    ls_sql+=" order by zgcljlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>


<form method="post" action="SaveJsKp_xjgdjl.jsp" name="editform" >
<div align="center">整改问题－接收(处理记录号:<%=zgcljlh%>)</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		<font color="#000099">客户编号</font>              </td>
	  <td width="32%"><%=khbh%> </td>
	  <td width="18%" align="right"> 
		<font color="#000099">实开工日期</font>              </td>
	  <td width="32%"><%=sjkgrq%> </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">客户姓名</font></td>
	  <td width="32%"><%=khxm%></td>
	  <td width="18%" align="right"><font color="#000099">联系方式</font></td>
	  <td width="32%"><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">房屋地址</font></td>
	  <td colspan="3"><%=fwdz%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">设计师</font></td>
	  <td width="32%"><%=sjs%></td>
	  <td width="18%" align="right"><font color="#000099">施工队</font></td>
	  <td width="32%"><%=sgd%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"><font color="#000099">质检姓名</font></td>
	  <td width="32%"><%=zjxm%></td>
	  <td width="18%" align="right"><font color="#000099">施工班组</font></td>
	  <td width="32%"><%=sgbz%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">检查记录号</td>
	  <td><%=xjjlh%></td>
	  <td align="right">整改记录号</td>
	  <td><%=zgjlh%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">检查人              </td>
	  <td width="32%"> <%=xjr%> </td>
	  <td width="18%" align="right"> 
		检查时间              </td>
	  <td width="32%"> <%=xjsj%> </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		检查类型              </td>
	  <td width="32%"> <%
cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm,true);
%> </td>
	  <td width="18%" align="right"> 
		检查结果              </td>
	  <td width="32%"><%
cf.selectItem(out,"select xjjgbm,xjjgmc from dm_xjjgbm order by xjjgbm",xjjgbm,true);
%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"> 录入人 </td>
	  <td><%=lrr%> </td>
	  <td align="right"> 录入时间 </td>
	  <td><%=lrsj%> </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">备注</td>
	  <td colspan="3"><%=bz%> </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td align="right">整改照片</td>
	  <td ><input type="button" onClick="window.open('viewAllPhoto.jsp?xjjlh=<%=xjjlh%>')" value="查看照片" ></td>
	  <td width="18%" align="right">要求解决时间</td>
	  <td width="32%"> 
		<%=yqjjsj%>              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">整改项目</td>
	  <td colspan="3"><%=zgxm%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td align="right">整改说明</td>
	  <td colspan="3"> <%=zgsm%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">反馈部门</td>
	  <td><%=fkbmmc%></td>
	  <td align="right">反馈部门接收人</td>
	  <td><%=fkbmjsr%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right"> 
		<font color="#FF0000">*</font>接收人              </td>
	  <td width="32%"> 
		<input type="text" name="jsr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
	  <td width="18%" align="right"> 
		<font color="#FF0000">*</font>接收时间              </td>
	  <td width="32%"> 
		<input type="text" name="jssj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
	  <td width="18%" align="right">接收说明</td>
	  <td colspan="3"> 
		<textarea name="jsyj" cols="71" rows="4"></textarea>              </td>
	</tr>
	<tr> 
	  <td colspan="4" align="center"> 
		<div align="center"> 
			<input type="hidden" name="zgcljlh"  value="<%=zgcljlh%>" >
			<input type="hidden" name="zgjlh"  value="<%=zgjlh%>" >
			<input type="hidden" name="xjjlh"  value="<%=xjjlh%>" >
		  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输"></td>
	</tr>
</table>
</form>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">整改记录号</td>
	<td  width="6%">处理状态</td>
	<td  width="7%">要求解决</td>
	<td  width="10%">反馈部门</td>
	<td  width="5%">接收人</td>
	<td  width="20%">整改项目</td>
	<td  width="32%">整改说明</td>
	<td  width="5%">验收人</td>
	<td  width="7%">验收时间</td>
</tr>
<%
	ls_sql="SELECT kp_zggdmx.zgjlh, DECODE(kp_zggdmx.clzt,'1','未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') as clzt,kp_zggdmx.yqjjsj,dwmc,kp_zggdmx.fkbmjsr,kp_zggdmx.zgxm,kp_zggdmx.zgsm,kp_zggdmx.ysr,kp_zggdmx.yssj";
	ls_sql+=" FROM kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_zggdmx.zgjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

	  

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[接收人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[接收时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "接收时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
