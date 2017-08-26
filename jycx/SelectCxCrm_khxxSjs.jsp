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
	String dwstr=cf.getItemData("select dwbh,dwmc,dqbm from sq_dwxx where dwlx='S0' order by dqbm,dwbh");
%>
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

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
                <input type="button"  value="打印" onClick="f_do(selectform,'dy')" name="button" >
                <input type="reset"  value="重输">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" bgcolor="#E8E8FF" align="right">所属城市</td>
              <td width="31%"> 
                <select name="sscs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(sscs,sgdmc,<%=dwstr%>) ">
                            <%		
		cf.selectItem(out,"select distinct dqbm,dqmc from dm_dqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">施工队</td>
              <td width="33%"> 
                <select name="sgdmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='S0' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
                <input type="button"  value="打印" onClick="f_do(selectform,'dy')" name="button" >
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	
	if (lx=='cx')
	{
		FormName.action="Crm_khxxCxList.jsp";
	}
	else if (lx=='dy'){
		FormName.action="Crm_khxxDyList.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
