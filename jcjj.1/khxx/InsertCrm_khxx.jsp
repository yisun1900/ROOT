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
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String zdyhbz=(String)session.getAttribute("zdyhbz");

	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
%>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入客户信息（<font color="#FF0033">*</font>为必填字段）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khxx.jsp" name="insertform" target='_blank'>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font>客户姓名</div>              </td>
              <td width="31%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50"  >              </td>
              <td width="20%"> 
                <div align="right">性别</div>              </td>
              <td width="30%"> 
                <input type="radio" name="xb"  value="M" >
                男 
                <input type="radio" name="xb"  value="W" >
                女 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font>联系方式</td>
              <td width="31%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="100" >              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font>客户类型</td>
              <td width="30%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
	}
	else{
		out.println("<option value=\"04\">普通客户</option>");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font>房屋地址</div>              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="74" maxlength="100"  >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属城区</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>              </td>
              <td width="20%" align="right">房价（元/m）</td>
              <td width="30%"> 
                <input type="text" name="fj" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">出生日期</td>
              <td width="31%"> 
                <input type="text" name="csrq" value="" size="20" maxlength="10" >              </td>
              <td width="20%" align="right">职业</td>
              <td width="30%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>项目专员</td>
              <td><select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by ssfgs,yhmc","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
				%>
              </select></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">录入时间</font></div>              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly >              </td>
              <td width="20%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">信息录入人</font></div>              </td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000CC">所属分公司</font></td>
              <td width="31%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>              </td>
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">录入单位</font></td>
              <td width="30%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">备注</div>              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
                <input type="reset"  value="重输" name="reset">              </td>
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
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}

	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	if(!(isNumber(FormName.fj, "房价"))) {
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[客户类型]！");
		FormName.khlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("错误！没有[项目专员]！");
		FormName.xmzy.focus();
		return false;
	}


	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[录入单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.lrr.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
