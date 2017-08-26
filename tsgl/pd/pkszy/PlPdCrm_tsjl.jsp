<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] tsjlh = request.getParameterValues("tsjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String ssfgs=null;

try {
	conn=cf.getConnection();

	ls_sql="select khbh";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillHtml(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>派客诉专员</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlPdCrm_tsjl.jsp" name="insertform" >
<div align="center"><b>派客诉专员 </b></div>
<table width="100%" style="FONT-SIZE:12">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<%
	for (int i=0;i<tsjlh.length ;i++ )
	{
		%>
		  <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right">投诉报修记录号</td>
            <td width="32%"><%=tsjlh[i]%>
                 <input type="hidden" name="tsjlh"  value="<%=tsjlh[i]%>" >
			</td>
            <td width="20%" align="right">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
		<%
	}
%>
		  
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#FF0033">*</font>客诉专员</td>
            <td>
			  <select name="kszy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='21' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%>
              </select>			</td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#FF0033">*</font><font color="#0000CC">派单人</font></td>
            <td><input type="text" name="kszypdr" value="<%=yhmc%>" size="20" maxlength="20" readonly>            </td>
            <td align="right"><font color="#FF0033">*</font><font color="#0000CC">派单时间</font></td>
            <td><input type="text" name="kszypdsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>            </td>
          </tr>
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                  <input type="reset"  value="重输">              </td>
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
	if(	javaTrim(FormName.kszy)=="") {
		alert("请选择[客诉专员]！");
		FormName.kszy.focus();
		return false;
	}
	if(	javaTrim(FormName.kszypdr)=="") {
		alert("请选择[派单人]！");
		FormName.kszypdr.focus();
		return false;
	}
	if(	javaTrim(FormName.kszypdsj)=="") {
		alert("请选择[派单时间]！");
		FormName.kszypdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kszypdsj, "派单时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
