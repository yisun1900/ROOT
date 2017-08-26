<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String xqmc=null;
String kssj=null;
String jzsj=null;
String yjfy=null;
String yjcc=null;
String sjfy=null;
String sjcc=null;
String spjl=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String bz=null;
String xqhdmc=null;
String wherecxhdmc=cf.getParameter(request,"cxhdmc");
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xqhdmc,cxhdmc,xqmc,kssj,jzsj,yjfy,yjcc,sjfy,sjcc,spjl,spr,spsj,spyj,lrr,lrsj,fgsbh,bz ";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where  (cxhdmc='"+wherecxhdmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		kssj=cf.fillNull(rs.getDate("kssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		yjfy=cf.fillNull(rs.getString("yjfy"));
		yjcc=cf.fillNull(rs.getString("yjcc"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		sjcc=cf.fillNull(rs.getString("sjcc"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bz=cf.fillNull(rs.getString("bz"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveFyYx_xqcxhdgl.jsp" name="editform">
<div align="center">录入－活动费用 </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">公司</td>
      <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgsbh,true);
%> </td>
      <td align="right" width="17%">小区名称</td>
      <td width="33%"><%=xqmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">促销活动名称</td>
      <td colspan="3"><%=cxhdmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">活动开始时间</td>
      <td width="34%"><%=kssj%> </td>
      <td align="right" width="17%">活动截至时间</td>
      <td width="33%"><%=jzsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">预计费用</td>
      <td width="34%"><%=yjfy%> </td>
      <td align="right" width="17%">预计产出</td>
      <td width="33%"><%=yjcc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">录入人</td>
      <td width="34%"><%=lrr%> </td>
      <td align="right" width="17%">录入时间</td>
      <td width="33%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">备注</td>
      <td colspan="3"><%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">审批结论</td>
      <td width="34%"> <%
	cf.selectToken(out,"Y+同意&N+不同意",spjl,true);
%> </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">审批人</td>
      <td width="34%"><%=spr%> </td>
      <td align="right" width="17%">审批时间</td>
      <td width="33%"><%=spsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">审批意见</td>
      <td colspan="3"><%=spyj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>实际费用</td>
      <td width="34%"> 
        <input type="text" name="sjfy" size="20" maxlength="16"  value="" >
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>实际产出</td>
      <td width="33%"> 
        <input type="text" name="sjcc" size="20" maxlength="16"  value="" >
      </td>
    </tr>
    <input type="hidden" name="wherecxhdmc"  value="<%=wherecxhdmc%>" >
    <input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.sjfy)=="") {
		alert("请输入[实际费用]！");
		FormName.sjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.sjfy, "实际费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sjcc)=="") {
		alert("请输入[实际产出]！");
		FormName.sjcc.focus();
		return false;
	}
	if(!(isNumber(FormName.sjcc, "实际产出"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
