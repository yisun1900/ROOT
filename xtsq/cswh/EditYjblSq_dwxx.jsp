<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010116")==0) 
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

double jryjbfb=0;
double sjjryjbfb=0;
double yjjzcs=0;


String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz ";
	ls_sql+=" ,jryjbfb,sjjryjbfb,yjjzcs ";
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

		jryjbfb=rs.getDouble("jryjbfb");
		sjjryjbfb=rs.getDouble("sjjryjbfb");
		yjjzcs=rs.getDouble("yjjzcs");
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
      <div align="center">计入业绩比例－维护</div>
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
	  <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>家装签单计入业绩收款比例</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="jryjbfb" value="<%=jryjbfb%>" size="10" maxlength="20" >
	    %
&nbsp;&nbsp;<strong><font color="#0000FF">【签单】是否记入当月业绩，需检查首期款是否收取，达到设定百分比</font></strong></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>设计费计入业绩收款比例</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="sjjryjbfb" value="<%=sjjryjbfb%>" size="10" maxlength="20" >
	    %
&nbsp;&nbsp;<strong><font color="#0000FF">【设计费】是否记入当月业绩，需检设计费实收款是否达到设定百分比</font></strong></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>业绩净值参数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="yjjzcs" value="<%=yjjzcs%>" size="10" maxlength="20" >
	    % <strong><font color="#0000FF">&nbsp;&nbsp;业绩净值＝毛利额÷业绩净值参数</font></strong></td>
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

	if(	javaTrim(FormName.jryjbfb)=="") {
		alert("请输入[家装签单计入业绩收款比例]！");
		FormName.jryjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.jryjbfb, "家装签单计入业绩收款比例"))) {
		return false;
	}
	if (parseFloat(FormName.jryjbfb.value) <0 || parseFloat(FormName.jryjbfb.value) >100)
	{
		alert("错误！[家装签单计入业绩收款比例]应该在0和100之间！");
		FormName.jryjbfb.select();
		return false;
	}

	
	if(	javaTrim(FormName.sjjryjbfb)=="") {
		alert("请输入[设计费计入业绩收款比例]！");
		FormName.sjjryjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjryjbfb, "设计费计入业绩收款比例"))) {
		return false;
	}
	if (parseFloat(FormName.sjjryjbfb.value) <0 || parseFloat(FormName.sjjryjbfb.value) >100)
	{
		alert("错误！[设计费计入业绩收款比例]应该在0和100之间！");
		FormName.sjjryjbfb.select();
		return false;
	}
	
	if(	javaTrim(FormName.yjjzcs)=="") {
		alert("请输入[业绩净值参数]！");
		FormName.yjjzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.yjjzcs, "业绩净值参数"))) {
		return false;
	}
	if (parseFloat(FormName.yjjzcs.value) <=0 || parseFloat(FormName.yjjzcs.value) >100)
	{
		alert("错误！[业绩净值参数]应该在0和100之间！");
		FormName.yjjzcs.select();
		return false;
	}


	FormName.action="SaveEditYjblSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











