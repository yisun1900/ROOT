<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String ssfgs=null;
String khxm=null;
String xb=null;
String fwdz=null;
String sjs=null;
String zxdm=null;
String zxzt=null;

String sbyymc=null;
String sbkhlx=null;
String sbyyxs=null;
String sbsj=null;
String lrr=null;
String lrsj=null;
String dwmc=null;

String sjbshjl=null;
String sjbshr=null;
String sjbshsj=null;
String sjbshyj=null;

String scbshjl=null;
String scbshr=null;
String scbshsj=null;
String scbshyj=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select ssfgs,sjs,khbh,khxm,xb,fwdz,zxdm,zxzt ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
	}
	rs.close();
	ps.close();


	ls_sql="select sbyymc,sbkhlx,sbyyxs,sbsj,lrr,lrsj,dwmc";
	ls_sql+=" ,sjbshjl,sjbshr,sjbshsj,sjbshyj";
	ls_sql+=" ,scbshjl,scbshr,scbshsj,scbshyj";
	ls_sql+=" from  crm_qysbdj,dm_sbyybm,sq_dwxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and  crm_qysbdj.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and  crm_qysbdj.lrbm=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sbyymc=cf.fillNull(rs.getString("sbyymc"));
		sbkhlx=cf.fillNull(rs.getString("sbkhlx"));
		sbyyxs=cf.fillNull(rs.getString("sbyyxs"));
		sbsj=cf.fillNull(rs.getDate("sbsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		dwmc=cf.fillNull(rs.getString("dwmc"));

		sjbshjl=cf.fillNull(rs.getString("sjbshjl"));
		sjbshr=cf.fillNull(rs.getString("sjbshr"));
		sjbshsj=cf.fillNull(rs.getDate("sjbshsj"));
		sjbshyj=cf.fillNull(rs.getString("sjbshyj"));

		scbshjl=cf.fillNull(rs.getString("scbshjl"));
		scbshr=cf.fillNull(rs.getString("scbshr"));
		scbshsj=cf.fillNull(rs.getDate("scbshsj"));
		scbshyj=cf.fillNull(rs.getString("scbshyj"));
	}
	rs.close();
	ps.close();


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
<title>接待主管审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">接待主管审核</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">回访记录号</td>
	<td  width="7%">类型</td>
	<td  width="12%">飞单原因</td>
	<td  width="12%">飞单客户流向</td>
	<td  width="39%">飞单原因详述</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="11%">录入部门</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_fdkhhf.hfjlh, DECODE(crm_fdkhhf.lx,'1','飞单回访','2','随机回访','3','信息人回访'),sbyymc,crm_fdkhhf.hfsbkhlx,crm_fdkhhf.hfsbyyxs,crm_fdkhhf.lrr,crm_fdkhhf.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM crm_fdkhhf,crm_zxkhxx,sq_dwxx b,dm_sbyybm  ";
    ls_sql+=" where crm_fdkhhf.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_fdkhhf.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_fdkhhf.hfsbyybm=dm_sbyybm.sbyybm(+)";
    ls_sql+=" and crm_fdkhhf.khbh='"+khbh+"'";
    ls_sql+=" order by crm_fdkhhf.hfjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>


<form method="post" action="SaveZgShCrm_qysbdj.jsp" name="selectform">
	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#CCCCCC" cellpadding="2" cellspacing="2">
	  <tr bgcolor="#CCCCFF">
        <td align="right" bgcolor="#FFFFCC"> 客户编号 </td>
	    <td bgcolor="#FFFFCC"><%=khbh%> </td>
	    <td align="right" bgcolor="#FFFFCC"> 客户姓名 </td>
	    <td bgcolor="#FFFFCC"><%=khxm%> </td>
      </tr>
	  <tr bgcolor="#CCCCFF">
        <td align="right" bgcolor="#FFFFCC"> 房屋地址 </td>
	    <td bgcolor="#FFFFCC"><%=fwdz%></td>
	    <td align="right" bgcolor="#FFFFCC">性别</td>
	    <td bgcolor="#FFFFCC"><%
	cf.radioToken(out, "M+男&W+女",xb,true);
%></td>
      </tr>
	  
	  <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFCC">咨询店面</td>
	    <td bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
	    <td align="right" bgcolor="#FFFFCC">设计师</td>
	    <td bgcolor="#FFFFCC"><%=sjs%></td>
      </tr>
      
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right">飞单原因</td>
        <td width="32%"><%=sbyymc%></td>
        <td width="18%" align="right">飞单客户流向</td>
        <td width="32%"><%=sbkhlx%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">飞单时间</td>
        <td><%=sbsj%></td><td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right">飞单原因详述</td>
        <td colspan="3"><%=sbyyxs%>       </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF">飞单录入人</td>
        <td bgcolor="#FFFFFF"><%=lrr%>      </td><td align="right" bgcolor="#FFFFFF">飞单录入时间</td>
          <td><%=lrsj%>       </td></tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF">飞单录入部门</td>
        <td bgcolor="#FFFFFF"><%=dwmc%></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF">设计部审核结论</td>
        <td>
<%
	cf.radioToken(out,"Y+通过&N+未通过",sjbshjl,true);
%>		</td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">设计部审核人</td>
        <td><%=sjbshr%>      </td><td align="right">设计部审核时间</td>
          <td><%=sjbshsj%>        </td></tr>
      <tr bgcolor="#FFFFFF" >
        <td align="right" >设计部审核意见</td>
        <td colspan="3" ><%=sjbshyj%></td></tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF">市场部审核结论</td>
        <td><%
	cf.radioToken(out,"Y+通过&N+未通过",scbshjl,true);
%>        </td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">市场部审核人</td>
        <td><%=scbshr%>        </td><td align="right">市场部审核时间</td>
          <td><%=scbshsj%>       </td></tr>
      <tr bgcolor="#FFFFFF" >
        <td align="right" >市场部审核意见</td>
        <td colspan="3" ><%=scbshyj%></td></tr>
      <tr bgcolor="#FFFFFF">
        <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span>接待主管审核结论</td>
        <td><%
	cf.radioToken(out, "zgshjl","Y+通过&N+未通过","");
%>        </td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right">飞单原因</td>
        <td><select name="jdzgsbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <option value=""></option>
            <%
			cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
			%>
          </select>        </td>
        <td align="right">飞单客户流向</td>
        <td><select name="jdzgsbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
            <option value=""></option>
            <%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"' order by xh","");
%>
        </select></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><span class="STYLE1">*</span><span class="STYLE2">接待主管审核人</span></td>
        <td><input type="text" name="zgshr" value="<%=yhmc%>" size="20" maxlength="10" readonly>        </td>
        <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>接待主管审核时间</span></td>
        <td><input type="text" name="zgshsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>        </td>
      </tr>
      <tr bgcolor="#FFFFFF" >
        <td align="right" ><span class="STYLE1">*</span>接待主管审核意见</td>
        <td colspan="3" ><textarea name="zgshyj" cols="73" rows="3"></textarea></td>
      </tr>
      <tr bgcolor="#FFFFFF" > 
        <td colspan="4" align="center" bgcolor="#FFFFFF"> 
          <input type="button" name="cz" value="存盘" onClick="f_do(selectform)">
          <input type="reset" name="Reset" value="重输">
        <input type="hidden" name="khbh" value="<%=khbh%>">		</td>
      </tr>
  </table>
</form>



</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.zgshjl)) {
		alert("请选择[审核结论]！");
		FormName.zgshjl[0].focus();
		return false;
	}

	if (FormName.zgshjl[1].checked)
	{
		FormName.jdzgsbyybm.value="";
		FormName.jdzgsbkhlx.value="";
		if(	javaTrim(FormName.zgshyj)=="") {
			alert("请输入[审核意见]！");
			FormName.zgshyj.focus();
			return false;
		}

	}
	else{
		if(	javaTrim(FormName.jdzgsbyybm)=="") {
			alert("请输入[飞单原因]！");
			FormName.jdzgsbyybm.focus();
			return false;
		}
		if(	javaTrim(FormName.jdzgsbkhlx)=="") {
			alert("请输入[飞单客户流向]！");
			FormName.jdzgsbkhlx.focus();
			return false;
		}
	}


	if(	javaTrim(FormName.zgshr)=="") {
		alert("请输入[审核人]！");
		FormName.zgshr.focus();
		return false;
	}
	if(	javaTrim(FormName.zgshsj)=="") {
		alert("请输入[审核时间]！");
		FormName.zgshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zgshsj, "审核时间"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
