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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertOa_bgypbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">所属公司</td>
              <td width="32%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品编码(4位)</div>
              </td>
              <td width="32%"> 
                <input type="text" name="bgypbm" value="" size="20" maxlength="4" >
              </td>
              <td width="18%"> 
                <div align="right">办公用品名称</div>
              </td>
              <td width="32%"> 
                <input type="text" name="bgypmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">办公用品分类</div>
              </td>
              <td width="32%"> 
                <select name="flbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select flbm,flmc from oa_flbm order by flbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jldw" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">单价</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">品牌</div>
              </td>
              <td width="32%"> 
                <input type="text" name="pp" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">型号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xh" value="" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">供货商</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ghs" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="复制－办公用品编码" onClick="window.open('chooseFgs.jsp')">
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypbm)=="") {
		alert("请输入[办公用品编码]！");
		FormName.bgypbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypmc)=="") {
		alert("请输入[办公用品名称]！");
		FormName.bgypmc.focus();
		return false;
	}
	if(	javaTrim(FormName.flbm)=="") {
		alert("请选择[办公用品分类]！");
		FormName.flbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
