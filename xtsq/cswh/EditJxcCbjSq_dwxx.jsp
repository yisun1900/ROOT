<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

String fccbj=null;
String xmzyglbz=null;
String jjgwglbz=null;
String jjsjsglbz=null;

String jcddblxs=null;
String jcddmxblxs=null;
String djlrfs=null;
String kgcxhdbl=null;
String zccbj=null;
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
	ls_sql+=" ,fccbj,xmzyglbz,jjgwglbz,jjsjsglbz";
	ls_sql+=" ,jcddblxs,jcddmxblxs,djlrfs,kgcxhdbl,zccbj,mmbz,cgjjbz,jjbz";
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

		fccbj=cf.fillNull(rs.getString("fccbj"));
		xmzyglbz=cf.fillNull(rs.getString("xmzyglbz"));
		jjgwglbz=cf.fillNull(rs.getString("jjgwglbz"));
		jjsjsglbz=cf.fillNull(rs.getString("jjsjsglbz"));

		jcddblxs=cf.fillNull(rs.getString("jcddblxs"));
		jcddmxblxs=cf.fillNull(rs.getString("jcddmxblxs"));
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
		zccbj=cf.fillNull(rs.getString("zccbj"));
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
      <div align="center">进销存成本价－维护</div>
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
      <td bgcolor="#FFFFFF" align="right">辅材成本价</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "fccbj","1+个别计价法&2+移动加权平均法",fccbj);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">主材成本价</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zccbj","1+个别计价法&2+移动加权平均法",zccbj);
%></td>
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


	if(	!radioChecked(FormName.fccbj)) {
		alert("请选择[辅材成本价]！");
		FormName.fccbj[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zccbj)) {
		alert("请选择[主材成本价]！");
		FormName.zccbj[0].focus();
		return false;
	}

	FormName.action="SaveEditJxcCbjSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











