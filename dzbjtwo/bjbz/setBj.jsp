<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>根据报价系数调报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String dqbm=request.getParameter("bj_jzbjb_dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

%>

<body bgcolor="#FFFFFF">
<div align="center">根据报价系数调报价</div>
<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>报价版本号</td>
              <td colspan="3">
                <select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:515PX">
                  <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb where bjbbh='"+bjbbh+"'","");
%> 
                </select>				</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>地区</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
              </select>              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>报价级别</td>
              <td width="31%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjbbm+"' order by bjjbbm","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="59" align="right">&nbsp;</td>
              <td colspan="3"><strong><font color="#FF0000" size="+2">注意：修改后将不可恢复，不要误操作</font></strong></td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                    <BR>
                  <input type="button" onClick="f_do(insertform)"  value="调报价">
                  <BR>
                <BR></td>
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
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}

	FormName.action="SaveSetBj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
