<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>回访冻结</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String khbh=request.getParameter("khbh");
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sjkgrq=null;
String djbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//冻结编号
	int count=0;
	ls_sql="select NVL(max(substr(djbh,8,2)),0)";
	ls_sql+=" from  crm_hfdjjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	djbh=khbh+cf.addZero(count+1,2);

	ls_sql="select khxm,fwdz,sjs,zjxm,sgdmc,sjkgrq";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjxm=rs.getString("zjxm");
		sgd=cf.fillNull(rs.getString("sgdmc"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
	}
	rs.close();
	ps.close();
	

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveEnterDjfw.jsp" name="selectform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="65" colspan="4"> 
        <div align="center">客户回访冻结（冻结编号：<%=djbh%>）</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">客户编号</font></td>
      <td width="28%"> 
        <input type="text" name="khbh" size="20" maxlength="20" value="<%=khbh%>" readonly>
        <input type="hidden" name="djbh" value="<%=djbh%>" >
      </td>
      <td width="17%" align="right"><font color="#0000CC">客户姓名</font></td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="20" value="<%=khxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="22%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> 
        <input type="text" name="khbh2" size="68" maxlength="100" value="<%=fwdz%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">设计师</font></td>
      <td width="28%">
        <input type="text" name="sjs" size="20" maxlength="20" value="<%=sjs%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">质检姓名</font></td>
      <td width="33%">
        <input type="text" name="zjxm" size="20" maxlength="20" value="<%=zjxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">施工队</font></td>
      <td width="28%">
        <input type="text" name="sgd" size="20" maxlength="20" value="<%=sgd%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
      <td width="33%">
        <input type="text" name="sjkgrq" size="20" maxlength="20" value="<%=sjkgrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="22%" align="right"><font color="#FF0000">*</font>冻结范围</td>
      <td colspan="3"> 
        <input type="radio" name="hfdjbz" value="1">
        工程回访冻结 <BR>
        <input type="radio" name="hfdjbz" value="2">
        投诉报修回访冻结（<b>包括已受理和今后新的投诉报修</b>） <BR>
        <input type="radio" name="hfdjbz" value="3">
        全部冻结（<b>冻结对客户的所有回访</b>）</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"> <font color="#FF0000">*</font>冻结时间</td>
      <td width="28%"> 
        <input type="text" name="djsj" size="20" maxlength="10" value="<%=cf.today()%>" ondblclick="JSCalendar(this)">
      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font>计划解冻时间</td>
      <td width="33%"> 
        <input type="text" name="jhjdsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#FF0000">*</font>冻结原因</td>
      <td colspan="3"> 
        <textarea name="djyy" cols="66" rows="4"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#FF0000">*</font><font color="#0000CC">冻结人</font></td>
      <td colspan="3"> 
        <input type="text" name="djr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="继续" name="butt" onClick="f_do(selectform)">
          <input type="reset" name="Submit2" value="重输">
        </div>
      </td>
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
	if(	!radioChecked(FormName.hfdjbz)) {
		alert("请选择[冻结范围]！");
		FormName.hfdjbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.djsj)=="") {
		alert("请选择[冻结时间]！");
		FormName.djsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.djsj, "冻结时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjdsj, "计划解冻时间"))) {
		return false;
	}
	if(	javaTrim(FormName.djyy)=="") {
		alert("请选择[冻结原因]！");
		FormName.djyy.focus();
		return false;
	}
	if(	javaTrim(FormName.djr)=="") {
		alert("请选择[冻结人]！");
		FormName.djr.focus();
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
