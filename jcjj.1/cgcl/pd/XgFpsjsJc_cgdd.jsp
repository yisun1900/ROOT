<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String cgsjs=null;
String pdr=null;
String pdsj=null;
String pdsm=null;
String sjsgpyybm=null;
String fgsbh=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String listSql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select cgsjs,pdgc,jc_cgdd.pdr,jc_cgdd.pdsj,jc_cgdd.pdsm,sjsgpyybm,fgsbh";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		sjsgpyybm=cf.fillNull(rs.getString("sjsgpyybm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>橱柜部审核橱柜定制单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">订单编号</td>
	<td  width="8%">新设计师</td>
	<td  width="8%">原设计师</td>
	<td  width="24%">设计师改派原因</td>
	<td  width="32%">派设计师说明</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT ddbh,cgsjs,ycgsjs,sjsgpyymc,pdsm,lrr,lrsj";
	ls_sql+=" FROM jc_cgsjsgpjl,jdm_sjsgpyybm";
	ls_sql+=" where jc_cgsjsgpjl.sjsgpyybm=jdm_sjsgpyybm.sjsgpyybm";
	ls_sql+=" and jc_cgsjsgpjl.ddbh='"+ddbh+"'";
	ls_sql+=" order by jc_cgsjsgpjl.lrsj desc";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
</table>

<form method="post" action="SaveXgFpsjsJc_cgdd.jsp" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">橱柜订单处理--派设计师（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF">家居设计师</td>
              <td width="30%"> 
                <input type="hidden" name="oldcgsjs" value="<%=cgsjs%>">
                <select name="cgsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="sjsgpyybm.value='';pdsm.value=''">
                  <option value=""></option>
<%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N')";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+fgsbh+"' and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N')";
	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,cgsjs);
%> 
                </select>
              </td>
              <td width="18%" align="right">设计师改派原因</td>
              <td width="32%"><select name="sjsgpyybm" style="FONT-SIZE:12PX;WIDTH:180PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sjsgpyybm,sjsgpyymc from jdm_sjsgpyybm order by sjsgpyybm",sjsgpyybm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right" bgcolor="#FFFFFF">派单人</td>
              <td width="30%">
                <input type="text" name="pdr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" align="right">派单时间</td>
              <td width="32%">
                <input type="text" name="pdsj" size="24" maxlength="20"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">派单说明</td>
              <td colspan="3">
                <textarea name="pdsm" cols="71" rows="3"><%=pdsm%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                </div>
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
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgsjs)=="") {
		alert("请输入[家居设计师]！");
		FormName.cgsjs.focus();
		return false;
	}
	if(	javaTrim(FormName.pdr)=="") {
		alert("请输入[派单人]！");
		FormName.pdr.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("请输入[派单时间]！");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "派单时间"))) {
		return false;
	}
	if (FormName.oldcgsjs.value!=FormName.cgsjs.value)
	{
		if(	javaTrim(FormName.sjsgpyybm)=="") {
			alert("请输入[设计师改派原因]！");
			FormName.sjsgpyybm.focus();
			return false;
		}
		if(	javaTrim(FormName.pdsm)=="") {
			alert("请输入[派单说明]！");
			FormName.pdsm.focus();
			return false;
		}
	}
	else{
		alert("请选择不同的[家居设计师]！");
		FormName.cgsjs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
