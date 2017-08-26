<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
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

String zxkhlrjc=null;
String zxkhlrts=null;
String qdkhbljc=null;
String qdkhblts=null;
int djbhts=0;
int scyjts=0;
String sjszdgh=null;
String ywyzdgh=null;
String sjszdjz=null;
String khjlzdgh=null;
String khjlzdjz=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,djbhts,scyjts,sjszdgh,ywyzdgh,sjszdjz,khjlzdgh,khjlzdjz";
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

		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		zxkhlrts=cf.fillNull(rs.getString("zxkhlrts"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		qdkhblts=cf.fillNull(rs.getString("qdkhblts"));
		djbhts=rs.getInt("djbhts");
		scyjts=rs.getInt("scyjts");
		sjszdgh=cf.fillNull(rs.getString("sjszdgh"));
		ywyzdgh=cf.fillNull(rs.getString("ywyzdgh"));
		sjszdjz=cf.fillNull(rs.getString("sjszdjz"));
		khjlzdgh=cf.fillNull(rs.getString("khjlzdgh"));
		khjlzdjz=cf.fillNull(rs.getString("khjlzdjz"));
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
      <div align="center">录入信息规范－维护</div>
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
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>启用咨询客户录入检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+不启用&Y+启用",zxkhlrjc);
%>
          <b><BR>
          <font color="#000099">咨询客户资料必须提前若干天录入，否则不允许做签单登记</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>咨询客户提前录入天数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="zxkhlrts" value="<%=zxkhlrts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">签单登记中，[咨询录入时间]和[签单录入时间]允许相差最小天数</font> </b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>启用签单客户补录检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+不启用&Y+启用",qdkhbljc);
%>
          <BR>
          <b><font color="#000099">对补录签单客户进行限制，超过某几天后，不允许补录</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>签单客户补录允许天数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="qdkhblts" value="<%=qdkhblts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">签单登记中，[签单录入时间]和[签约时间]允许相差最大天数</font></b> </td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>交定金客户保护天数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="djbhts" value="<%=djbhts%>" size="10" maxlength="8" ></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>市场客户移交有效天数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="scyjts" value="<%=scyjts%>" size="10" maxlength="8" ></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>设计师换部门咨询客户自动更换</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sjszdgh","N+否&Y+是",sjszdgh);
%>
          <BR>
          <b><font color="#000099">设计师从【A店】调到【B店】，【咨询客户】自动由【A店】调到【B店】</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>设计师换部门自动兼职</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sjszdjz","N+否&Y+是",sjszdjz);
%>
          <BR>
          <b><font color="#000099">设计师从【A店】调到【B店】，系统授权为【A店】和【B店】</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>业务员换部门咨询客户自动更换</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "ywyzdgh","N+否&Y+是",ywyzdgh);
%>
          <BR>
          <b><font color="#000099">设计师从【市场部A】调到【市场部B】，【咨询客户】自动由【市场部A】调到【市场部B】</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>客户经理换部门咨询客户自动更换</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "khjlzdgh","N+否&Y+是",khjlzdgh);
%>
          <BR>
          <b><font color="#000099">客户经理从【A店】调到【B店】，【咨询客户】自动由【A店】调到【B店】</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>客户经理换部门自动兼职</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "khjlzdjz","N+否&Y+是",khjlzdjz);
%>
          <BR>
          <b><font color="#000099">客户经理从【A店】调到【B店】，系统授权为【A店】和【B店】</font></b></td>
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

	if(	!radioChecked(FormName.zxkhlrjc)) {
		alert("请选择[启用咨询客户录入检查]！");
		FormName.zxkhlrjc[0].focus();
		return false;
	}
	if (FormName.zxkhlrjc[1].checked)
	{
		if(	javaTrim(FormName.zxkhlrts)=="") {
			alert("请选择[咨询客户提前录入天数]！");
			FormName.zxkhlrts.focus();
			return false;
		}
		if(!(isNumber(FormName.zxkhlrts, "咨询客户提前录入天数"))) {
			return false;
		}
	}
	else{
		FormName.zxkhlrts.value="";
	}


	if(	!radioChecked(FormName.qdkhbljc)) {
		alert("请选择[启用签单客户补录检查]！");
		FormName.qdkhbljc[0].focus();
		return false;
	}
	if (FormName.qdkhbljc[1].checked)
	{
		if(	javaTrim(FormName.qdkhblts)=="") {
			alert("请选择[签单客户补录允许天数]！");
			FormName.qdkhblts.focus();
			return false;
		}
		if(!(isNumber(FormName.qdkhblts, "签单客户补录允许天数"))) {
			return false;
		}
	}
	else{
		FormName.qdkhblts.value="";
	}

	if(	javaTrim(FormName.djbhts)=="") {
		alert("请选择[交定金客户保护天数]！");
		FormName.djbhts.focus();
		return false;
	}
	if(!(isNumber(FormName.djbhts, "交定金客户保护天数"))) {
		return false;
	}

	if(	javaTrim(FormName.scyjts)=="") {
		alert("请选择[市场客户移交有效天数]！");
		FormName.scyjts.focus();
		return false;
	}
	if(!(isNumber(FormName.scyjts, "市场客户移交有效天数"))) {
		return false;
	}
	if(	!radioChecked(FormName.sjszdgh)) {
		alert("请选择[设计师换部门咨询客户自动更换]！");
		FormName.sjszdgh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjszdjz)) {
		alert("请选择[设计师换部门自动兼职]！");
		FormName.sjszdjz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ywyzdgh)) {
		alert("请选择[业务员换部门咨询客户自动更换]！");
		FormName.ywyzdgh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khjlzdgh)) {
		alert("请选择[客户经理换部门咨询客户自动更换]！");
		FormName.khjlzdgh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khjlzdjz)) {
		alert("请选择[客户经理换部门自动兼职]！");
		FormName.khjlzdjz[0].focus();
		return false;
	}

	FormName.action="SaveEditLrgfSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











