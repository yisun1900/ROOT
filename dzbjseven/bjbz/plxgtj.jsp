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
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("bj_jzbjb_dqbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 批量修改报价</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF" align="center"> 
              <td height="37" colspan="4"><b>选择修改条件</b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">报价版本号</td>
              <td colspan="3">
			  <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
                  <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bj_dzbjbb.dqbm='"+dqbm+"' and bj_dzbjbb.bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">地区</div>              </td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
                </select>              </td>
              <td width="19%"> 
              <div align="right">报价级别</div>              </td>
              <td width="31%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"' order by bjjbbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">饰面</td>
              <td><select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目大类</div>              </td>
              <td width="31%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>              </td>
              <td width="19%"> 
              <div align="right">项目小类</div>              </td>
              <td width="31%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4" height="42"><b>如何进行调整</b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td colspan="3"> 
                <input type="radio" name="jgqz" value="Y">
                结果取整 
                <input type="radio" name="jgqz" value="N">
                结果不取整 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td colspan="3"> 
                <p>调价百分比 
                  <input type="text" name="tjbfb" size="10">
                  %&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000"><b>注意：如果想加价10％，应输入110，若想减价10％，应输入90</b></font></p>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button" name="Button" value="调工程预算价" onClick="plxg(selectform)" >              </td>
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
function plxg(FormName,lx)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}

	if(	!radioChecked(FormName.jgqz)) {
		alert("请选择[结果取整]！");
		FormName.jgqz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.tjbfb)=="") {
		alert("请输入[调价百分比]！");
		FormName.tjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tjbfb, "调价百分比"))) {
		return false;
	}


	if (!confirm("确实要修改吗?") )	
	{
		return;
	}

	FormName.action="plxg.jsp?bjjb="+lx;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
