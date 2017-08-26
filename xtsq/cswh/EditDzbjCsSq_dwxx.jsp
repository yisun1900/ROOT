<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010112")==0) 
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

String dzbjjc=null;
double gcjcbjxs=0;
double sgcbbjxs=0;
String zdyxmshbz=null;
String zdyxmyxq=null;
double clfbfb=0;
double cbbfb=0;
String sfqyyssh=null;
String bjdysq=null;
String sjdsfdz=null;
String yxbffydz=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,dzbjjc,gcjcbjxs,sgcbbjxs,zdyxmshbz,zdyxmyxq,clfbfb,sfqyyssh,bjdysq,cbbfb,sjdsfdz,yxbffydz";
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

		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
		zdyxmshbz=cf.fillNull(rs.getString("zdyxmshbz"));
		zdyxmyxq=cf.fillNull(rs.getString("zdyxmyxq"));
		clfbfb=rs.getDouble("clfbfb");
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		cbbfb=rs.getDouble("cbbfb");
		sjdsfdz=cf.fillNull(rs.getString("sjdsfdz"));
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
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
      <div align="center">电子报价参数－维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位编号</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位名称</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="20%" align="right"><font color="#0000FF">编码</font></td>
	  <td width="30%"><%=bianma%></td>
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
	  <td width="20%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">备注</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>启用电子报价检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]<BR>&2+2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]<BR>&3+3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免<BR>&6+6：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，记录减免<BR>&4+4：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改<BR>&7+7：[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改，可改其它优惠<BR>&5+5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]",dzbjjc);
%></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>工程基础报价系数</td>
	  <td colspan="3"><input type="text" name="gcjcbjxs" size="20" maxlength="8"  value="<%=gcjcbjxs%>" >
        <strong><font color="#0000CC">&nbsp;&nbsp;工程基础报价=工程预算价÷工程基础报价系数</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>施工成本报价系数</td>
	  <td colspan="3"><input type="text" name="sgcbbjxs" size="20" maxlength="8"  value="<%=sgcbbjxs%>" >
        <strong><font color="#0000CC">&nbsp;&nbsp;施工成本价=工程基础报价×施工成本报价系数</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>是否启用预算审核</td>
	  <td colspan="3"><%
	cf.radioToken(out, "sfqyyssh","Y+启用&N+不启用",sfqyyssh);
%>
          <strong><font color="#0000CC">&nbsp;&nbsp;电子报价是否需要审核，否则不能签单登记</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>是否启用自定义项审核</td>
	  <td colspan="3"><%
	cf.radioToken(out, "zdyxmshbz","Y+启用&N+不启用",zdyxmshbz);
%>
	    <strong><font color="#0000CC">&nbsp;&nbsp;电子报价设计师自定义项，是否需要审核才能使用</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>自定义项目有效期</td>
	  <td colspan="3"><input type="text" name="zdyxmyxq" size="14" maxlength="8"  value="<%=zdyxmyxq%>" >
月，<font color="#0000CC"><strong>&nbsp;&nbsp;电子报价设计师自定义项，过了有效期后自动作废</strong></font></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>自定义项材料费百分比</td>
	  <td colspan="3"><input type="text" name="clfbfb" size="14" maxlength="9"  value="<%=clfbfb%>" >
百分比，<strong><font color="#0000CC">&nbsp;&nbsp;电子报价项目中，材料费占报价的百分比</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>自定义项成本百分比</td>
	  <td colspan="3"><input type="text" name="cbbfb" size="14" maxlength="9"  value="<%=cbbfb%>" >
	    百分比，<strong><font color="#0000CC">&nbsp;&nbsp;电子报价项目中，成本占报价的百分比</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>报价打印是否需授权</td>
	  <td colspan="3"><%
	cf.radioToken(out, "bjdysq","1+不需授权&2+只需一次授权&3+每次打印都需授权",bjdysq);
%>
          <strong><font color="#0000CC">&nbsp;&nbsp;电子报价打印进行控制</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>水电路是否打折</td>
	  <td><%
	cf.radioToken(out, "sjdsfdz","Y+是&N+否",sjdsfdz);
%></td>
      <td align="right"><font color="#FF0000">*</font>允许工程费部分打折</td>
      <td><%
	cf.radioToken(out, "yxbffydz","1+允许&9+不允许",yxbffydz);
%></td>
	</tr>
	
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="保存" onClick="f_do(editform)">
		  <input type="button" onClick="window.open('SaveUpdateBixs.jsp?dwbh=<%=dwbh%>')"  value="更据报价系数调整当前版本报价">
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

	if(	!radioChecked(FormName.dzbjjc)) {
		alert("请选择[启用电子报价检查]！");
		FormName.dzbjjc[0].focus();
		return false;
	}

	if(	javaTrim(FormName.gcjcbjxs)=="") {
		alert("请输入[工程基础报价系数]！");
		FormName.gcjcbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjcbjxs, "工程基础报价系数"))) {
		return false;
	}
	if (parseFloat(FormName.gcjcbjxs.value)==0)
	{
		alert("错误！[工程基础报价系数]不能为0");
		FormName.gcjcbjxs.select();
		return false;
	}

	if(	javaTrim(FormName.sgcbbjxs)=="") {
		alert("请输入[施工成本报价系数]！");
		FormName.sgcbbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbbjxs, "施工成本报价系数"))) {
		return false;
	}
	if (parseFloat(FormName.sgcbbjxs.value)==0)
	{
		alert("错误！[施工成本报价系数]不能为0");
		FormName.sgcbbjxs.select();
		return false;
	}

	if(	!radioChecked(FormName.sfqyyssh)) {
		alert("请选择[是否启用预算审核]！");
		FormName.sfqyyssh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdyxmshbz)) {
		alert("请选择[是否启用自定义项审核]！");
		FormName.zdyxmshbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("请输入[自定义项目有效期]！");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isNumber(FormName.zdyxmyxq, "自定义项目有效期"))) {
		return false;
	}


	if(	javaTrim(FormName.clfbfb)=="") {
		alert("请输入[自定义项材料费百分比]！");
		FormName.clfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.clfbfb, "自定义项材料费百分比"))) {
		return false;
	}
	if (parseFloat(FormName.clfbfb.value) <=0 || parseFloat(FormName.clfbfb.value) >100)
	{
		alert("错误！[自定义项材料费百分比]应该在0和100之间！");
		FormName.clfbfb.select();
		return false;
	}

	if(	javaTrim(FormName.cbbfb)=="") {
		alert("请输入[自定义项成本百分比]！");
		FormName.cbbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.cbbfb, "自定义项成本百分比"))) {
		return false;
	}
	if (parseFloat(FormName.cbbfb.value) <=0 || parseFloat(FormName.cbbfb.value) >100)
	{
		alert("错误！[自定义项成本百分比]应该在0和100之间！");
		FormName.cbbfb.select();
		return false;
	}
	if(	!radioChecked(FormName.bjdysq)) {
		alert("请选择[报价打印是否需授权]！");
		FormName.bjdysq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjdsfdz)) {
		alert("请选择[水电路是否打折]！");
		FormName.sjdsfdz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yxbffydz)) {
		alert("请选择[允许工程费部分打折]！");
		FormName.yxbffydz[0].focus();
		return false;
	}


	FormName.action="SaveEditDzbjCsSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











