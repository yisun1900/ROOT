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
String yhjs=(String)session.getAttribute("yhjs");
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String dqbm=request.getParameter("bj_gzbjb_dqbm");

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
              <td align="right">报价类型</td>
              <td> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">标准项目</option>
                </select>
              </td>
              <td align="right"></td>
              <td> 
               </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目大类</div>
              </td>
              <td width="31%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)" size="8" multiple>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">项目小类</div>
              </td>
              <td width="29%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">地区</div>
              </td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">饰面</div>
              </td>
              <td width="29%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>
              </td>
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
                  %&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000"><b>注意：如果想加价10％，应输入110，若想减价10％，应输入90</b></font></p>
                <p>
                  <input type="button" name="Button" value="调<%=dzbjzjmc%>报价" onClick="plxg(selectform,'A')" >
                  <input type="button" name="Button2" value="调<%=dzbjzgjmc%>报价" onClick="plxg(selectform,'B')" >
                  <input type="button" name="Button3" value="调<%=dzbjgjmc%>报价" onClick="plxg(selectform,'C')" >
                </p>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4">&nbsp; </td>
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
	if(	!radioChecked(FormName.jgqz)) {
		alert("请选择[结果取整]！");
		FormName.jgqz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
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
