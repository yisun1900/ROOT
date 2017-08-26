<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String xuhao=null;
String sgd=null;
String zbjjsyybm=null;
String je=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherexuhao=cf.GB2Uni(request.getParameter("xuhao"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xuhao,sgd,zbjjsyybm,je,lrr,lrsj,bz ";
	ls_sql+=" from  cw_zbjxgjl";
	ls_sql+=" where scbz='N' and xuhao="+wherexuhao;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zbjjsyybm=cf.fillNull(rs.getString("zbjjsyybm"));
		je=cf.fillNull(rs.getString("je"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	else{
		out.println("错误！不存在的序号："+wherexuhao);
		return;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="5%">施工队</td>
	<td  width="6%">类型</td>
	<td  width="9%">金额</td>
	<td  width="10%">质保金减少原因</td>
	<td  width="7%">结算记录号</td>
	<td  width="8%">投诉报修记录号</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="38%">备注</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_zbjxgjl.xuhao,sq_sgd.sgdmc,DECODE(cw_zbjxgjl.lx,'1','手工录入','2','完工结算','3','工地维修') lx,cw_zbjxgjl.je,dm_zbjjsyybm.zbjjsyymc,cw_zbjxgjl.jsjlh,cw_zbjxgjl.tsjlh,cw_zbjxgjl.lrr,cw_zbjxgjl.lrsj,dwmc,cw_zbjxgjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zbjxgjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjxgjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjxgjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_zbjxgjl.sgd='"+sgd+"'";
    ls_sql+=" and cw_zbjxgjl.scbz='N'";
    ls_sql+=" order by cw_zbjxgjl.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>
	</table>

<form method="post" action="SaveEditCw_zbjxgjl.jsp" name="editform">
  <div align="center">请修改信息（序号：<%=xuhao%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">施工队</span></td>
      <td width="32%">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd  where sgd='"+sgd+"'",sgd);
%> 
        </select>      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>金额</td>
      <td><input type="text" name="je" size="20" maxlength="17"  value="<%=je%>" ></td>
      <td align="right">质保金减少原因</td>
      <td><select name="zbjjsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select zbjjsyybm,zbjjsyymc from dm_zbjjsyybm order by zbjjsyybm",zbjjsyybm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
      <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
      <td colspan="3"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+lrbm+"' ","");
%>
      </select></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <input type="hidden" name="wherexuhao"  value="<%=wherexuhao%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>      </td>
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}

	if (parseFloat(FormName.je.value)<0)
	{
		if(	javaTrim(FormName.zbjjsyybm)=="") {
			alert("请选择[质保金减少原因]！");
			FormName.zbjjsyybm.focus();
			return false;
		}
	}
	else{
		FormName.zbjjsyybm.value="";
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
	if(	javaTrim(FormName.bz)=="") {
		alert("请选择[备注]！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
