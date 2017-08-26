<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right">报价类型</td>
              <td> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">标准项目</option>
                </select>
              </td>
              <td align="right">审核标志</td>
              <td> 
                <select name="shbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未审核</option>
                  <option value="Y">已审核</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目大类</div>
              </td>
              <td width="31%"> 
                <select name="bj_gzbjb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_gzbjb_xmdlbm,bj_gzbjb_xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">项目小类</div>
              </td>
              <td width="29%"> 
                <select name="bj_gzbjb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="bj_gzbjb_xmbh" size="20" maxlength="7" >
              </td>
              <td width="21%"> 
                <div align="right">地区</div>
              </td>
              <td width="29%"> 
                <select name="bj_gzbjb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">项目名称</td>
              <td width="31%"> 
                <input type="text" name="bj_gzbjb_xmmc" size="20" maxlength="50" >
              </td>
              <td width="21%" align="right">报价级别</td>
              <td width="29%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">饰面</div>
              </td>
              <td width="31%"> 
                <select name="bj_gzbjb_smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>
              </td>
              <td width="21%" align="right">工程量计量单位</td>
              <td width="29%"> 
                <select name="bj_gzbjb_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入人</td>
              <td width="31%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
              </td>
              <td width="21%" align="right">录入时间</td>
              <td width="29%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">是否必选项</td>
              <td colspan="3">
                <input type="radio" name="sfbxx" value="1">
                必选 
                <input type="radio" name="sfbxx" value="2">
                非必选 
                <input type="radio" name="sfbxx" value="3">
                不可选 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <input type="text" name="gycl" size="75" maxlength="50" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
                <input type="button" name="Button" value="批量修改" onClick="plxg(selectform)" >
                <input type="button"  value="导出报价" onClick="f_exp(selectform)" >
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bj_gzbjb_dqbm)=="") {
		alert("请选择[地区]！");
		FormName.bj_gzbjb_dqbm.focus();
		return false;
	}

	FormName.action="Bj_gzbjbList.jsp";
	FormName.submit();
	return true;
}
function f_exp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bj_gzbjb_dqbm)=="") {
		alert("请选择[地区]！");
		FormName.bj_gzbjb_dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}

	FormName.action="Bj_gzbjbExpList.jsp";
	FormName.submit();
	return true;
}
function plxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bj_gzbjb_dqbm)=="") {
		alert("请选择[地区]！");
		FormName.bj_gzbjb_dqbm.focus();
		return false;
	}

	FormName.action="plxgtj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
