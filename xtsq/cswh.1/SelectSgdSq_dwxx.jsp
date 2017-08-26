<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_dwxxSgdList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">施工队编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwbh" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">施工队类型</div>
              </td>
              <td width="35%"> 
                <select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="S0">施工队</option>
                  <option value="S1">直属施工队</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">施工队简称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwjc" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">施工队名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_dwmc" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">所属地区</td>
              <td width="35%"> 
                <select name="sq_dwxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">撤销标志</td>
              <td width="35%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未撤销</option>
                  <option value="Y">已撤销</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属分公司</td>
              <td width="31%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%" align="right">上级单位</td>
              <td width="32%"> 
                <select name="sq_dwxx_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">施工队地址</td>
              <td colspan="3"> 
                <input type="text" name="sq_dwxx_dwdz" size="75" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">施工队电话</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="sq_dwxx_dwdh" size="75" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">施工队传真</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_dwxx_dwcz" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">施工队EMail</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sq_dwxx_email" size="20" maxlength="50" >
              </td>
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
