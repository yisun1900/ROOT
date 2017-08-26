<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010120")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

String jcppbz=null;
String xmzyglbz=null;
String jjgwglbz=null;
String jjsjsglbz=null;

String jcddblxs=null;
String jcddmxblxs=null;
String djlrfs=null;
String kgcxhdbl=null;
String zcmmbz=null;
String mmbz=null;
String cgjjbz=null;
String jjbz=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,jcppbz,xmzyglbz,jjgwglbz,jjsjsglbz";
	ls_sql+=" ,jcddblxs,jcddmxblxs,djlrfs,kgcxhdbl,zcmmbz,mmbz,cgjjbz,jjbz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bz=cf.fillNull(rs.getString("bz"));

		jcppbz=cf.fillNull(rs.getString("jcppbz"));
		xmzyglbz=cf.fillNull(rs.getString("xmzyglbz"));
		jjgwglbz=cf.fillNull(rs.getString("jjgwglbz"));
		jjsjsglbz=cf.fillNull(rs.getString("jjsjsglbz"));

		jcddblxs=cf.fillNull(rs.getString("jcddblxs"));
		jcddmxblxs=cf.fillNull(rs.getString("jcddmxblxs"));
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="editform">
      <div align="center">集成家居参数－维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位编号</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位名称</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="23%" align="right"><font color="#0000FF">编码</font></td>
	  <td width="27%"><%=bianma%></td>
	  <td width="20%" align="right"><font color="#0000FF">电话区号</font></td>
	  <td width="30%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">单位电话</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">单位传真</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="23%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">备注</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right">投诉报修订单检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+无订单无法录入&N+无订单可录入",jcppbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;在录入投诉报修时，如果涉及[供应商]，没有订单是否可录入</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">主材收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zcmmbz","Y+无订单不能收款&N+无订单可收款&M+可空",zcmmbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;财务收[主材]款时，没有订单是否可收款</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">木门收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "mmbz","Y+无订单不能收款&N+无订单可收款&M+可空",mmbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;财务收[木门]款时，没有订单是否可收款</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">橱柜收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "cgjjbz","Y+无订单不能收款&N+无订单可收款&M+可空",cgjjbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;财务收[橱柜]款时，没有订单是否可收款</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">家具收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjbz","Y+无订单不能收款&N+无订单可收款&M+可空",jjbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;财务收[家具]款时，没有订单是否可收款</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单对[<b>项目专员</b>]过滤</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "xmzyglbz","N+不过滤&Y+过滤",xmzyglbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;集成家居订单对[项目专员]进行过滤，不属于自己的单不能看</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单对[<b>家居顾问</b>]过滤</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjgwglbz","N+不过滤&Y+过滤",jjgwglbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;集成家居订单对[家居顾问]进行过滤，不属于自己的单不能看</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单对[<b>家居设计师</b>]过滤</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjsjsglbz","N+不过滤&Y+过滤",jjsjsglbz);
%>
	    <b><font color="#000099">&nbsp;&nbsp;集成家居订单对[家居设计师]进行过滤，不属于自己的单不能看</font></b></td>
    </tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单保留小数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddblxs","2+2位小数&1+1位小数&0+保留个位&-1+保留十位&-2+保留百位&-3+保留千位",jcddblxs);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单明细保留小数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddmxblxs","2+2位小数&1+1位小数&0+保留个位&-1+保留十位&-2+保留百位&-3+保留千位",jcddmxblxs);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">主材订单单价录入方式</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "djlrfs","1+录入单价算折扣&2+录入折扣算单价&3+不可打折",djlrfs);
%></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">主材订单可改记入活动比例</td>
	  <td colspan="3"><%
	cf.radioToken(out, "kgcxhdbl","Y+可改&N+不可改",kgcxhdbl);
%>
        <b><font color="#000099">&nbsp;&nbsp;在录主材订单时，[记入活动比例]是否可修改</font></b></td>
    </tr>
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="保存" onClick="f_do(editform)">
		  <input type="reset"  value="重输"></td>
	</tr>
</table>
</form>


</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--



function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}


	if(	!radioChecked(FormName.jcppbz)) {
		alert("请选择[投诉报修订单检查]！");
		FormName.jcppbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zcmmbz)) {
		alert("请选择[主材收款检查]！");
		FormName.zcmmbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mmbz)) {
		alert("请选择[木门收款检查]！");
		FormName.mmbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cgjjbz)) {
		alert("请选择[橱柜收款检查]！");
		FormName.cgjjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjbz)) {
		alert("请选择[家具收款检查]！");
		FormName.jjbz[0].focus();
		return false;
	}




	if(	!radioChecked(FormName.xmzyglbz)) {
		alert("请选择[集成订单对项目专员过滤]！");
		FormName.xmzyglbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjgwglbz)) {
		alert("请选择[集成订单对家居顾问过滤]！");
		FormName.jjgwglbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjsjsglbz)) {
		alert("请选择[集成订单对家居设计师过滤标志]！");
		FormName.jjsjsglbz[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.jcddblxs)) {
		alert("请选择[集成订单保留小数]！");
		FormName.jcddblxs[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.jcddmxblxs)) {
		alert("请选择[集成订单明细保留小数]！");
		FormName.jcddmxblxs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.djlrfs)) {
		alert("请选择[主材订单单价录入方式]！");
		FormName.djlrfs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgcxhdbl)) {
		alert("请选择[主材订单可改促销活动比例]！");
		FormName.kgcxhdbl[0].focus();
		return false;
	}
	if (FormName.djlrfs[2].checked)
	{
		if (FormName.kgcxhdbl[0].checked)
		{
			alert("错误！单价不可打折，必须选择【不可改】");
			FormName.kgcxhdbl[1].focus();
			return false;
		}
	}



	FormName.action="SaveEditJcjjSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











