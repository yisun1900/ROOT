<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>期末结转</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="15%">&nbsp;</td>
	<td  width="25%">公司编号</td>
	<td  width="25%">公司名称</td>
	<td  width="25%">考评时间</td>
	<td  width="15%">施工队数</td>
</tr>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;

	ls_sql=" SELECT kp_yzfpdkpjg.ssfgs,dwmc,kp_yzfpdkpjg.kpsj,count(distinct kp_yzfpdkpjg.sgd) sgds";
	ls_sql+=" FROM kp_yzfpdkpjg,sq_dwxx";
	ls_sql+=" where kp_yzfpdkpjg.ssfgs=sq_dwxx.dwbh";
	ls_sql+=" group by kp_yzfpdkpjg.ssfgs,dwmc,kp_yzfpdkpjg.kpsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","ViewKp_yzfbzpdkpjg.jsp","ViewKp_yzfpdkpjg.jsp");
	pageObj.setPageRow(500);//设置每页显示记录数
	pageObj.setViewStr("班长");
	pageObj.setEditStr("施工队");


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
<P>
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
        <div align="center">派单考评</div>
    <tr> 
      <td align="right" width="47%" height="37">分公司</td>
      <td height="37" width="53%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
				%>
      </select></td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <input type="button"  value="派单考评" onClick="f_do(selectform)">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.action="SaveInsertKp_yzfpdkpjg.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
