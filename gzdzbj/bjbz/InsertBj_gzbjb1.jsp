<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String dybjjb=(String)session.getAttribute("bjjb");
if (dybjjb==null)
{
	dybjjb="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入报价自定义项目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button"  value="从标准项目导入" onClick=window.open("SelectDrBj_jzbjb.jsp","_self","toolbar=no,menubar=no")>
	  </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBj_gzbjb1.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">项目大类</div>
              </td>
              <td width="28%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>
              </td>
              <td width="22%"> 
                <div align="right">项目小类</div>
              </td>
              <td width="28%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">项目编号</div>
              </td>
              <td width="28%"> 
                <input type="text" name="xmbh" value="" size="20" maxlength="16" >
              </td>
              <td width="22%"> 
                <div align="right">地区</div>
              </td>
              <td width="28%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="22%" align="right">项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">饰面</div>
              </td>
              <td width="28%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>
              </td>
              <td width="22%" align="right">工程量计量单位</td>
              <td width="28%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>

            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">排序序号</div>
              </td>
              <td width="28%"> 
                <input type="text" name="xh" value="" size="20" maxlength="17" >
              </td>
             <td align="right">主材计量单位编码</td>
              <td> 
                <select name="zcjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwbm","");
%> 
                </select>
              </td>
            </tr>
			 <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF">成本价</td>
              <td bgcolor="#E8E8FF"> 
                <input type="text" name="cbenj" value="" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF">施工队报价</td>
              <td bgcolor="#E8E8FF"> 
                <input type="text" name="sgdbj" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
			%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" height="22" align="right"> <%=dzbjzjmc%>报价</td>
              <td width="27%"> 
                <input type="text" name="bj" value="" size="20" maxlength="17" >
              </td>
              <td width="22%"> 
                <div align="right"></div>
              </td>
              <td width="28%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right"><%=dzbjzjmc%>主材名称</td>
              <td> 
                <input type="text" name="zcmc" value="" size="20" maxlength="17" >
              </td>
              <td align="right"><%=dzbjzjmc%>主材规格</td>
              <td> 
                <input type="text" name="zcgg" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right"><%=dzbjzjmc%>主材费</td>
              <td> 
                <input type="text" name="zcf" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjzjmc%>辅材费</div>
              </td>
              <td> 
                <input type="text" name="clf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right"><%=dzbjzjmc%>人工费</td>
              <td bgcolor="#CCCCFF"> 
                <input type="text" name="rgf" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjzjmc%>机械费</div>
              </td>
              <td> 
                <input type="text" name="jjf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right"><%=dzbjzjmc%>管理费百分比</td>
              <td> 
                <input type="text" name="glfbl" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjzjmc%>利润百分比</div>
              </td>
              <td> 
                <input type="text" name="lrbl" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" align="right"><%=dzbjzjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="70" rows="8"></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
			%> 
         <tr bgcolor="#FF99CC"> 
              <td align="right"><%=dzbjzgjmc%>报价</td>
              <td> 
                <input type="text" name="bbj" value="" size="20" maxlength="17" >
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right"><%=dzbjzgjmc%>主材名称</td>
              <td> 
                <input type="text" name="bzcmc" value="" size="20" maxlength="17" >
              </td>
              <td align="right"><%=dzbjzgjmc%>主材规格</td>
              <td> 
                <input type="text" name="bzcgg" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right"><%=dzbjzgjmc%>主材费</td>
              <td> 
                <input type="text" name="bzcf" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjzgjmc%>辅材费</div>
              </td>
              <td> 
                <input type="text" name="bclf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right"><%=dzbjzgjmc%>人工费</td>
              <td bgcolor="#FF99CC"> 
                <input type="text" name="brgf" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjzgjmc%>机械费</div>
              </td>
              <td> 
                <input type="text" name="bjjf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right"><%=dzbjzgjmc%>管理费百分比</td>
              <td> 
                <input type="text" name="bglfbl" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjzgjmc%>利润百分比</div>
              </td>
              <td> 
                <input type="text" name="blrbl" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td width="23%" align="right"><%=dzbjzgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="bgycl" cols="70" rows="8"></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
	{
			%> 
           <tr bgcolor="#CCFFCC"> 
              <td align="right"><%=dzbjgjmc%>报价</td>
              <td> 
                <input type="text" name="cbj" value="" size="20" maxlength="17" >
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right"><%=dzbjgjmc%>主材名称</td>
              <td> 
                <input type="text" name="czcmc" value="" size="20" maxlength="17" >
              </td>
              <td align="right"><%=dzbjgjmc%>主材规格</td>
              <td> 
                <input type="text" name="czcgg" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right"><%=dzbjgjmc%>主材费</td>
              <td> 
                <input type="text" name="czcf" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjgjmc%>辅材费</div>
              </td>
              <td> 
                <input type="text" name="cclf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right"><%=dzbjgjmc%>人工费</td>
              <td bgcolor="#CCFFCC"> 
                <input type="text" name="crgf" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjgjmc%>机械费</div>
              </td>
              <td> 
                <input type="text" name="cjjf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right"><%=dzbjgjmc%>管理费百分比</td>
              <td> 
                <input type="text" name="cglfbl" value="" size="20" maxlength="17" >
              </td>
              <td> 
                <div align="right"><%=dzbjgjmc%>利润百分比</div>
              </td>
              <td> 
                <input type="text" name="clrbl" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="23%" align="right"><%=dzbjgjmc%>工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="cgycl" cols="70" rows="8"></textarea>
              </td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">录入人</td>
              <td width="28%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhdlm%>" readonly>
              </td>
              <td width="22%" align="right">录入时间</td>
              <td width="28%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">报价类型</td>
              <td width="28%"> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">自定义项目</option>
                </select>
              </td>
              <td width="22%" align="right">审核标志</td>
              <td width="28%"> 
                <select name="shbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未审核</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}

<%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
		%>
		if(	javaTrim(FormName.bj)=="") {
			alert("请输入[<%=dzbjzjmc%>报价]！");
			FormName.bj.focus();
			return false;
		}
		if(!(isFloat(FormName.bj, "<%=dzbjzjmc%>报价"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
		%>
		if(	javaTrim(FormName.bbj)=="") {
			alert("请输入[<%=dzbjzgjmc%>报价]！");
			FormName.bbj.focus();
			return false;
		}
		if(!(isFloat(FormName.bbj, "<%=dzbjzgjmc%>报价"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
	{
		%>
		if(	javaTrim(FormName.cbj)=="") {
			alert("请输入[<%=dzbjgjmc%>报价]！");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "<%=dzbjgjmc%>报价"))) {
			return false;
		}
		<%
	}
%>
	
	
	if(!(isInt(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
