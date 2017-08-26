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
	String dwstr=cf.getItemData("select xqbm,xqmc,dqbm from dm_xqbm  order by xqbm,dqbm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

            <H4> <CENTER>请设定查询条件</CENTER></H4>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
			 <td width="19%" bgcolor="#E8E8FF" align="right">开始时间</td>
             <td width="19%" bgcolor="#E8E8FF" align="left"> <input type="text" name="sjfw" size="20" maxlength="10"  value=""></td>
			<td width="19%" bgcolor="#E8E8FF" align="right">终止时间</td>
             <td width="19%" bgcolor="#E8E8FF" align="left"> <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.today()%>"></td>
			</tr>
			<tr bgcolor="#E8E8FF"> 
              <td width="19%" bgcolor="#E8E8FF" align="right">所属城市</td>
			  
              <td width="31%"> 
                <select name="sscs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(sscs,csmc,<%=dwstr%>) ">
                   <option value=""></option>
				  <%		
		cf.selectItem(out,"select distinct dqbm,dqmc from dm_dqbm","");
%> 
                </select>
              </td>
              <td width="17%" align="right">小区</td>
              <td width="33%"> 
                <select name="csmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqbm,xqmc from dm_xqbm","");
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
     
      </div>
    </td>
  </tr>
</table>
   </form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName,pd)//参数FormName:Form的名称
{
	
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}
	//if(	FormName.csmc.value=="") {
	//	alert("请指明小区");
	//	FormName.csmc.focus();
	//	return false;
	//}
	
	if (pd=='cx')
	{
		FormName.action="Crm_khxxCxListXq.jsp";
	}
	if (pd=='dy')
	{
		document.alert("sdf");
	}
	FormName.submit();
	return true;
	
}
</SCRIPT>
