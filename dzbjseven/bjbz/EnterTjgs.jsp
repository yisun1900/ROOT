<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String[] xmbh = request.getParameterValues("xmbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" >
		<input type="hidden" name="bjbbh"  value="<%=bjbbh%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
		<input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
<%
	for (int i=0;i<xmbh.length ;i++ )
	{
		%>
		<input type="hidden" name="xmbh"  value="<%=xmbh[i]%>" >
		<%
	}

%>
		1、批量修改工程报价 
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td rowspan="3" align="right">生成修改公式</td>
              <td width="65%"> 
                <select name="jgfh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="bj">工程预算价</option>
                </select>
                <input type="text" name="jgxs" size="14">
                <input type="button"  value="增加公式" onClick="f_zjgs(selectform)" name="button">
                <input type="reset" value="重输" name="reset">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td width="65%">结果是否保留小数
                <input type="radio" name="blxs" value="1" checked>
                取整 
                <input type="radio" name="blxs" value="2">
                保留小数 </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="65%"> 
                <input type="text" name="jggs" size="30" readonly="true">
                <input type="button"  value="修改价格" onClick="f_jg(selectform)" name="button3">
              </td>
            </tr>
          </table>
          <BR>2、替换整个工艺材料简介
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr valign="middle" bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="38"> 
                <div align="center">新工艺材料简介 
                  <textarea name="gycl" cols="77" rows="8"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="开始替换" onClick="f_gycl(selectform)" name="button22">
                </div>
              </td>
            </tr>
          </table>
          <BR>3、替换部分工艺材料简介
          <table width="80%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="50%" align="right" height="38"> 
                <div align="center">需替换内容 
                  <textarea name="oldgycl" cols="36" rows="4"></textarea>
                </div>
              </td>
              <td width="50%" height="38"> 
                <div align="center">替换后内容 
                  <textarea name="newgycl" cols="36" rows="4"></textarea>
                </div>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="right" height="2"> 
                <div align="center"> 
                  <input type="button"  value="开始替换" onClick="f_bfgycl(selectform)" name="button2">
                </div>
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

function f_zjgs(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jgfh)=="" && javaTrim(FormName.jgxs)=="") {
		alert("请选择[参数]，然后再点击按钮！");
		FormName.jgfh.focus();
		return false;
	}

	FormName.jggs.value+=FormName.jgfh.value+FormName.jgxs.value;

}

function f_jg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jggs)=="") {
		alert("点击[增加公式]按钮，生成[价格修改公式]！");
		FormName.jggs.focus();
		return false;
	}

	if ( !confirm("确实要继续吗?") )	
	{
		return;
	}

	FormName.action="UpdateTj.jsp";
	FormName.submit();
	return true;
}

function f_gycl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gycl)=="") {
		alert("请输入[新工艺材料]！");
		FormName.gycl.focus();
		return false;
	}

	if ( !confirm("确实要继续吗?") )	
	{
		return;
	}

	FormName.action="UpdateGycl.jsp";
	FormName.submit();
	return true;
}
function f_bfgycl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.oldgycl)=="") {
		alert("请输入[需替换内容]！");
		FormName.oldgycl.focus();
		return false;
	}
	if(	javaTrim(FormName.newgycl)=="") {
		alert("请输入[替换后内容]！");
		FormName.newgycl.focus();
		return false;
	}

	if ( !confirm("确实要继续吗?") )	
	{
		return;
	}

	FormName.action="UpdateBfGycl.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
