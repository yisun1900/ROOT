<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String dwbh=null;
String ygbh=null;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String rzsj=null;
String xzzwbm=null;

String lzyyflbm=null;
String yysm=null;

String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String clzt=null;
String ztbm=null;

String shjl=null;
String shyj=null;
String spxh=null;
String shr=null;
String shsj=null;

String yclzt=null;
String yztbm=null;
String czsqsplc="";

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,ygbh,yhmc,bianhao,sfzh,rzsj,xzzwbm,lzyyflbm,yysm,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh,shr,shsj";
	ls_sql+=" from  rs_czsq";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));

		lzyyflbm=cf.fillNull(rs.getString("lzyyflbm"));
		yysm=cf.fillNull(rs.getString("yysm"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));

		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		spxh=cf.fillNull(rs.getString("spxh"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));

	}
	rs.close();
	ps.close();

	String ztmc=null;
	ls_sql="select ztmc";
	ls_sql+=" from  rs_czsqsplc,rs_ztbm";
	ls_sql+=" where rs_czsqsplc.ztbm=rs_ztbm.ztbm and rs_czsqsplc.sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));

		czsqsplc+="-->"+ztmc;
	}
	rs.close();
	ps.close();
	if (!czsqsplc.equals(""))
	{
		czsqsplc=czsqsplc.substring(3);
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">辞职申请</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><font color="#000000">员工序号</font></td>
    <td width="31%"><%=ygbh%> </td>
    <td align="right" width="19%"><font color="#000000">员工名称</font></td>
    <td width="31%"><%=yhmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">工号</td>
    <td width="31%"> <%=bianhao%> </td>
    <td align="right" width="19%"><font color="#000000">职务</font></td>
    <td width="31%"><%=xzzwbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">身份证号</td>
    <td width="31%"><%=sfzh%></td>
    <td align="right" width="19%">入职日期</td>
    <td width="31%"><%=rzsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><font color="#000000">所属分公司</font></td>
    <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
    <td align="right" width="19%"><font color="#000000">所属部门</font></td>
    <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="23"><font color="#000000"></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">离职原因分类</td>
    <td width="31%"> <%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm where lzyyflbm='"+lzyyflbm+"'",lzyyflbm,true);
%> </td>
    <td align="right" width="19%"><font color="#000000"></font></td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><font color="#000000">离职原因</font></td>
    <td colspan="3"><%=yysm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><font color="#000000">录入人</font></td>
    <td width="31%"><%=lrr%> </td>
    <td align="right" width="19%"><font color="#000000">录入时间</font></td>
    <td width="31%"><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><font color="#000000">录入部门</font></td>
    <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
    <td align="right" width="19%"><font color="#000000">申请日期</font></td>
    <td width="31%"><%=sqrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><font color="#000000">备注</font></td>
    <td colspan="3"><%=bz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"><b>辞职申请批流程</b></td>
    <td colspan="3"><%=czsqsplc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 处理状态 </td>
    <td width="31%"> <%
	cf.selectToken(out,"00+不需审批&01+等待审批&02+正在审批&03+审批通过&04+审批取消&05+已离职",clzt,true);
%> </td>
    <td align="right" width="19%"> 审批状态 </td>
    <td width="31%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='13' order by ztbm",ztbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 审批序号 </td>
    <td width="31%"> <%=spxh%> </td>
    <td align="right" width="19%"> 审核结论 </td>
    <td width="31%"> <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl",shjl,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">审核人 </td>
    <td width="31%"><%=shr%> </td>
    <td align="right" width="19%">审核时间 </td>
    <td width="31%"><%=shsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 审核意见 </td>
    <td colspan="3"> <%=shyj%> </td>
  </tr>
</table>


<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="9%">审核结论</td>
	<td  width="7%">审核人</td>
	<td  width="9%">审核时间</td>
	<td  width="9%">处理状态</td>
	<td  width="15%">原审批状态</td>
	<td  width="15%">审批后状态</td>
	<td  width="31%">审核意见</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	ls_sql="SELECT spxh,shjlmc,shr,shsj,DECODE(rs_czsqspb.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已离职'),b.ztmc yztbm,a.ztmc,shyj";
	ls_sql+=" FROM rs_czsqspb,rs_shjlbm,rs_ztbm a,rs_ztbm b";
    ls_sql+=" where rs_czsqspb.shjl=rs_shjlbm.shjl and rs_czsqspb.ztbm=a.ztbm(+) and rs_czsqspb.yztbm=b.ztbm(+)  ";
	ls_sql+=" and rs_czsqspb.sqxh='"+sqxh+"'";
    ls_sql+=" order by rs_czsqspb.spxh";
	
	
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
