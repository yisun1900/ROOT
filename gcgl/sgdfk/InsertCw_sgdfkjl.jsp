<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String sgd=cf.GB2Uni(request.getParameter("sgd"));

String fkjlh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select NVL(max(substr(fkjlh,6,4)),0)";
	ls_sql+=" from  cw_sgdfkjl";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	fkjlh=sgd+cf.addZero(count+1,4);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_sgdfkjl.jsp" name="insertform" >
<div align="center">
  <DIV align="center">录入－施工队罚款</DIV>
</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">罚款记录号</td>
	<td  width="5%">状态</td>
	<td  width="5%">班长</td>
	<td  width="8%">罚款时间</td>
	<td  width="6%">罚款人</td>
	<td  width="8%">罚款金额</td>
	<td  width="61%">罚款原因</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT cw_sgdfkjl.fkjlh,DECODE(cw_sgdfkjl.zt,'1','未审核','2','审核','3','结算'),sgbz,cw_sgdfkjl.fksj,cw_sgdfkjl.fkr,cw_sgdfkjl.fkje,cw_sgdfkjl.fkyy";
	ls_sql+=" FROM cw_sgdfkjl  ";
    ls_sql+=" where cw_sgdfkjl.sgd='"+sgd+"' and cw_sgdfkjl.scbz='N'";
    ls_sql+=" order by cw_sgdfkjl.fkjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#FFFFFF"><span class="STYLE2"><span class="STYLE1">*</span>罚款记录号</span></td> 
  <td width="35%"> 
    <input type="text" name="fkjlh" value="<%=fkjlh%>" size="20" maxlength="9" readonly>  </td>
  <td width="15%" align="right" bgcolor="#FFFFFF"><span class="STYLE2"><span class="STYLE1">*</span>施工队</span></td> 
  <td width="35%"> 
  <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where sgd='"+sgd+"'",sgd);
%>	
  </select>	</td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>罚款金额</td>
    <td><input type="text" name="fkje" value="" size="20" maxlength="17" ></td>
    <td align="right">班长</td>
    <td><select name="sgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+sgd+"' and tdbz in('N','Y') order by bzmc","");
%>
    </select></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>罚单编号</td>
    <td><input name="fdbh" type="text" id="fdbh" value="" size="20" maxlength="17" ></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>罚款人</td>
  <td><input type="text" name="fkr" value="<%=yhmc%>" size="20" maxlength="20" ></td>
  <td align="right"><span class="STYLE1">*</span>罚款时间</td>
  <td><input type="text" name="fksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>罚款原因</td> 
  <td colspan="3"> 
    <textarea name="fkyy" cols="75" rows="6"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="35%">
  <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
  </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="75" rows="2"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	    <input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.fkjlh)=="") {
		alert("请输入[罚款记录号]！");
		FormName.fkjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.fdbh)=="") {
		alert("请输入[罚单编号]！");
		FormName.fdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fksj)=="") {
		alert("请输入[罚款时间]！");
		FormName.fksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fksj, "罚款时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fkr)=="") {
		alert("请输入[罚款人]！");
		FormName.fkr.focus();
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[罚款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.fkyy)=="") {
		alert("请输入[罚款原因]！");
		FormName.fkyy.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
