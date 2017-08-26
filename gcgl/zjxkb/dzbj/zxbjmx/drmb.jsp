<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%

	String yhdlm=(String)session.getAttribute("yhdlm");
	String khbh=request.getParameter("khbh");
	String dqbm=request.getParameter("dqbm");
	String ssfgs=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
	String zxdm=cf.executeQuery("select zxdm from crm_zxkhxx where khbh='"+khbh+"'");
	String sjs=cf.executeQuery("select sjs from crm_zxkhxx where khbh='"+khbh+"'");
	String xqbm=cf.executeQuery("select xqbm from crm_zxkhxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<div align="center"> </div>
<form method="post" action="" name="editform" >
	<input name="fgsbh" type="hidden" value="<%=ssfgs%>">
  <input type="hidden" name="khbh" value="<%=khbh%>">
  <input type="hidden" name="dqbm" value="<%=dqbm%>">
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>1、从模板--&gt;导入报价</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"><font color="#FF0000">说明：把模板的【报价项目】和【房间信息】，导入到目前报价中，模板有</font></td>
    </tr>
    <tr> 
      <td width="33%" height="65" align="right">模板名称</td>
      <td width="67%" height="65"> 
        <select name="mbmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct mbmc||'+'||yhdlm c1,mbmc||DECODE(bj_bjmbfjxx.mblx,'1','（公用模板）','2','（私人模板）') c2  from bj_bjmbfjxx where (yhdlm='"+yhdlm+"' and mblx='2') OR mblx='1' order by c1","");
%> 
        </select>
        <input type="button"  value="导入" onClick="f_drmb(editform)" >
        <input type="button"  value="查看模板" onClick="f_ckmb(editform)">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>2、从临时报价--&gt;导入</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"><font color="#FF0000">说明：用以前保存的临时报价，替换目前报价</font>
	  
	  </td>
    </tr>
    <tr> 
      <td width="33%" height="65" align="right">临时报价名称</td>
      <td width="67%" height="65"> 
        <select name="sclsbjmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct mbmc c1,mbmc c2  from bj_mbbjxmmx where khbh='"+khbh+"' order by mbmc","");
%> 
        </select>
        <input type="button"  value="导入" onClick="f_drlsbj(editform)" name="button">
        <input type="button"  value="查看临时报价" onClick="f_cklsbj(editform)" name="button2">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>3、复制报价『不同设计师间也可复制报价』（<font color="#FF0000">说明：用某个客户的报价，替换目前报价</font>）</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"> 
	   同小区客户名单
        <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="6%">客户编号</td>
			<td  width="8%">姓名</td>
			<td  width="8%">城区</td>
			<td  width="14%">小区/街道</td>
			<td  width="9%">咨询状态</td>
			<td  width="10%">电子报价总额</td>
			<td  width="7%">报价级别</td>
			<td  width="6%">家装标志</td>
			<td  width="12%">咨询店面</td>
			<td  width="7%">设计师</td>
			<td  width="9%">录入时间</td>
		</tr>
		<%
			ybl.common.PageObject pageObj=new ybl.common.PageObject();
			String ls_sql=null;

			ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm,cqmc,crm_zxkhxx.xqbm,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过'),dzbjze,bjjbmc,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),sq_dwxx.dwmc as zxdm,sjs,lrsj";
			ls_sql+=" FROM crm_zxkhxx,sq_dwxx,bdm_bjjbbm,dm_cqbm ";
			ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.cqbm=dm_cqbm.cqbm(+)";
			ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
			ls_sql+=" and crm_zxkhxx.zxdm='"+zxdm+"' and crm_zxkhxx.sjs='"+sjs+"'";
			ls_sql+=" order by crm_zxkhxx.khxm";
//			out.println(ls_sql);
			pageObj.sql=ls_sql;
		//进行对象初始化
			pageObj.initPage("","","","");
			pageObj.setPageRow(100);//设置每页显示记录数


		//设置主键
			String[] keyName={"khbh"};
			pageObj.setKey(keyName);

			pageObj.out=out;
			pageObj.getDate(1);

			pageObj.displayDate();

		%>
		</table>	  
	  
	  
	  
	  </td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="65">客户所属分公司 <%
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	%> 客户编号 
        <input type="text" name="copykhbh" maxlength="7" size="10">
        客户姓名 
        <input type="text" name="khxm" maxlength="20" size="20">
        <input type="button"  value="继续" onClick="f_copy(editform)" name="button">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>4、更新报价</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"><font color="#FF0000">说明：由于报价调整或错误等原因，需要对该客户的所有报价项目，用最新的报价替换</font></td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="65">
        <input type="button"  value="更新报价" onClick="f_update(editform)" name="button">
      </td>
    </tr>
  </table>
  <HR>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_drmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("请选择导入[模板名称]！");
		FormName.mbmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveDrmb.jsp";
	FormName.submit();
	return true;
}
function f_drlsbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("请输入[临时报价名称]！");
		FormName.sclsbjmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveDrlsbj.jsp";
	FormName.submit();
	return true;
}
function f_ckmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("请选择导入[模板名称]！");
		FormName.mbmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ViewBj_bjmb.jsp";
	FormName.submit();
	return true;
}
function f_cklsbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("请输入[临时报价名称]！");
		FormName.sclsbjmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ViewBj_lsbj.jsp";
	FormName.submit();
	return true;
}
function f_copy(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[客户所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.copykhbh)=="") {
		alert("请输入[客户编号]！");
		FormName.copykhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}

	FormName.target="";
	FormName.action="Crm_zxkhxxCxList.jsp";
	FormName.submit();
	return true;
}
function f_update(FormName)//参数FormName:Form的名称
{
	if ( !confirm("注意！修改后不可恢复，确实要继续吗?") )	
	{
		return;
	}

	FormName.target="";
	FormName.action="UpdateAllXmbj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
