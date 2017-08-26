<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");



%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">公文发布</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">发布分公司</div>
              </td>
              <td width="35%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by ssfgs,dwbh");
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
	%> </td>
              <td width="15%"> 
                <div align="right">发布部门</div>
              </td>
              <td width="35%"> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
//			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
		}
		else if (yhjs.equals("F0"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
		}
		else
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
		}
	%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">公文编号</td>
              <td width="35%"> 
                <input type="text" name="gwbh" value="" size="20" maxlength="20">
              </td>
              <td width="15%" align="right">发布范围</td>
              <td width="35%"> <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			%> 
                <input type="radio" name="fbfw" value="1">
                本公司 
                <input type="radio" name="fbfw" value="2">
                集团 <%
		}
		else{
			%> 
                <input type="radio" name="fbfw" value="1" checked>
                本公司 <%
		}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">公文名称</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="gwmc" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">标题</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="bt" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">分类</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fl" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">发布时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">发布人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbr" value="<%=lrr%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">录入时间</div>
              </td>
              <td> 
                <input type="text" name="lrsj" value=<%=cf.today()%> size="20" maxlength="10" readonly >
              </td>
              <td> 
                <div align="right">录入人</div>
              </td>
              <td> 
                <input type="text" name="lrr" value=<%=lrr%> size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">公文内容</div>
              </td>
              <td colspan="3"> 
                <textarea name="gwnr" cols="71" rows="19"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button" name="sc" value="上传附件" onClick="f_do1(insertform)" disabled>
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
	if(	javaTrim(FormName.fbfgs)=="") {
		alert("请选择[发布分公司]！");
		FormName.fbfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.fbbm)=="") {
		alert("请选择[发布部门]！");
		FormName.fbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.gwbh)=="") {
		alert("请输入[公文编号]！");
		FormName.gwbh.focus();
		return false;
	}

<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			%> 
			if(	!radioChecked(FormName.fbfw)) {
				alert("请选择[发布范围]！");
				FormName.fbfw[0].focus();
				return false;
			}
			<%
		}
		else{
			%> 
			if(!FormName.fbfw.checked) {
				alert("请输入[发布范围]！");
				FormName.fbfw.focus();
				return false;
			}
			<%
		}
%>

	if(	javaTrim(FormName.gwmc)=="") {
		alert("请输入[公文名称]！");
		FormName.gwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.bt)=="") {
		alert("请输入[标题]！");
		FormName.bt.focus();
		return false;
	}
	if(	javaTrim(FormName.fl)=="") {
		alert("请输入[分类]！");
		FormName.fl.focus();
		return false;
	}
	if(	javaTrim(FormName.gwnr)=="") {
		alert("请输入[公文内容]！");
		FormName.gwnr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("请输入[发布时间]！");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "发布时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("请输入[发布人]！");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}

	FormName.action="SaveInsertQh_gwgl.jsp";
	FormName.submit();
	FormName.sc.disabled=false;
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gwbh)=="") {
		alert("请输入[公文编号]！");
		FormName.gwbh.focus();
		return false;
	}

	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}
//-->
</SCRIPT>
