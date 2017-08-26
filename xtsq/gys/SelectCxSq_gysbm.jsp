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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询供应商</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_gysbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">供应商编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_gysbm" size="20" maxlength="5" >
              </td>
              <td width="17%"> 
                <div align="right">供应商名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_gys" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">所属地区</div>
              </td>
              <td width="33%"> 
                <select name="sq_gysbm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where  dqbm='"+dqbm+"'","");
	}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">供应商地址</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_gysdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">供应商类别</td>
              <td width="33%"> 
                <select name="sq_gysxx_gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+木门&2+橱柜&3+家具&4+主材","");
%> 
                </select>
              </td>
              <td width="17%" align="right">主材类别</td>
              <td width="33%"> 
                <select name="sq_gysxx_zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">供应商负责人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_gysfzr" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">供应商电话</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_gysdh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">供应商传真</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_gyscz" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">EMail</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysbm_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">用户登录名</td>
              <td width="33%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16" >
              </td>
              <td width="17%" align="right">用户口令</td>
              <td width="33%"> 
                <input type="text" name="yhkl" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">用户名称</td>
              <td width="33%"> 
                <input type="text" name="yhmc" value="" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right">是否已授权</td>
              <td width="33%"> 
                <input type="radio" name="sfsq" value="N">
                未授权 
                <input type="radio" name="sfsq" value="Y">
                授权 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">查询结果排序</div>
              </td>
              <td width="33%"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="sq_gysbm.gys">供应商名称</option>
                  <option value="sq_gysbm.gysbm">供应商编号</option>
                  <option value="sq_gysbm.yhdlm">用户登录名</option>
                  <option value="sq_gysbm.yhmc">用户名称</option>
                  <option value="sq_yhssz.yhzbh">用户所属组</option>
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
