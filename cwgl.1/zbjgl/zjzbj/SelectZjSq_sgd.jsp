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
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">增加质保金</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_sgdZjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目经理编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_sgd" size="20" maxlength="5" >
              </td>
              <td width="19%"> 
                <div align="right">项目经理类型</div>
              </td>
              <td width="31%"> 
                <select name="sq_sgd_sgdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="S0">施工队</option>
                  <option value="S1">直属施工队</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目经理名称</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">项目经理电话</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_dh" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">队号</td>
              <td width="31%"> 
                <input type="text" name="duihao" value="" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">级别</td>
              <td width="31%"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属地区</td>
              <td width="31%"> 
                <select name="sq_sgd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
	}
	else 
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  where dqbm='"+dqbm+"'","");
	}
%> 
                </select>
              </td>
              <td width="19%" align="right">撤销标志</td>
              <td width="31%"> 
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
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') and dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
              <td width="19%" align="right">所属单位</td>
              <td width="31%"> 
                <select name="sq_sgd_ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') order by dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') and dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">项目经理家庭地址</td>
              <td colspan="3"> 
                <input type="text" name="sq_sgd_dz" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目经理传真</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="sq_sgd_cz" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">项目经理EMail</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_sgd_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">结果排序</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="sq_sgd.sgdjbbm">施工队级别</option>
                  <option value="sq_sgd.duihao">队号</option>
                  <option value="sq_sgd.sgdmc">施工队名称</option>
                  <option value="sq_sgd.sgd">施工队编号</option>
                </select>
              </td>
              <td width="19%" align="right">是否可跨区接单</td>
              <td width="31%">
                <input type="radio" name="sfkkqjd" value="Y">
                可以 
                <input type="radio" name="sfkkqjd" value="N">
                不可以</td>
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
