<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<title>家装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style3 {
	color: #FF0000;
	font-size: 14px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="SaveInsertBj_jzcljgb.jsp" name="editform" target="_blank">
<div align="center">录入结算-材料价格信息<BR>
    <span class="style3">(注意:材料编码必须是数字</span>) </div>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="4">地区： 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:90PX">
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
        材料类别： 
        <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:180PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm order by cldlmc","");
					%> 
        </select>
        录入人： 
        <input type="text" name="lrr" size="10" maxlength="20" value="<%=yhmc%>" readonly>
        录入时间： 
        <input type="text" name="lrsj" size="12" maxlength="10"  value="<%=cf.today()%>" >
      </td>
    </tr>
  </table>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="4%">序号</td>
      <td width="8%">结算材料编码</td>
      <td width="20%">材料名称</td>
      <td width="20%">型号规格</td>
      <td width="20%">品牌</td>
      <td width="8%">计量单位</td>
      <td width="10%">单价</td>
      <td width="10%">是否需到物流领料</td>
    </tr>
    <%
	String bgcolor=null;

	for (int row=0;row<15 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td><%=(row+1)%></td>
      <td>
        <input type="text" name="wlbm" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glmc[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="glmc" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xhgg[<%=row%>])">
      </td>
      <td>
        <input type="text" name="xhgg" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=(row)%>])">
      </td>
      <td> 
        <input type="text" name="pp" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[<%=row%>])">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(dj[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc","");
					%> 
        </select>
      </td>
      <td>
        <input type="text" name="dj" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wlbm[<%=(row+1)%>])">
      </td>
      <td> 
        <select name="wlllbz" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(dj[<%=row%>])">
          <option value=""></option>
          <option value="Y">需要</option>
          <option value="N">否</option>
        </select>
      </td>
    </tr>
    <%

	}
%> 
    <tr> 
      <td colspan="8" height="47" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          <input type="reset"  value="重输">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="button"  value="导入材料价格" onClick="window.open('LoadCljg.jsp')" >
        </div>
      </td>
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
     if(javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
     if(javaTrim(FormName.cldlbm)=="") {
		alert("请选择[材料类别]！");
		FormName.cldlbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
