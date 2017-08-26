<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String lpmc=null;
String lpsl=null;
String lqsj=null;
String shth=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherelpmc=request.getParameter("lpmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String zxdm=null;
String sjs=null;
String xxlrr=null;
String xxlrsj=null;
String zxdjbm=null;

try {
	conn=cf.getConnection();
	ls_sql="select lpmc,lpsl,lqsj,shth,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  yx_lqlpdj";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (lpmc='"+wherelpmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lpmc=cf.fillNull(rs.getString("lpmc"));
		lpsl=cf.fillNull(rs.getString("lpsl"));
		lqsj=cf.fillNull(rs.getDate("lqsj"));
		shth=cf.fillNull(rs.getString("shth"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,xb,fwdz,lxfs,zxdm,sjs,lrr,lrsj,zxdjbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		xxlrr=cf.fillNull(rs.getString("lrr"));
		xxlrsj=cf.fillNull(rs.getDate("lrsj"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
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
<form method="post" action="SaveEditYx_lqlpdj.jsp" name="editform">
  <div align="center">领取礼品--修改 </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="16%"> 
        <div align="right">客户编号</div>      </td>
      <td width="34%"> <%=wherekhbh%> </td>
      <td width="17%"> 
        <div align="right">客户姓名</div>      </td>
      <td width="33%"> <%=khxm%> </td>
    </tr>
    
    <tr bgcolor="#CCCCFF"> 
      <td width="16%"> 
        <div align="right">房屋地址</div>      </td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="16%"> 
        <div align="right">咨询店面</div>      </td>
      <td width="34%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
      <td width="17%"> 
        <div align="right">设计师</div>      </td>
      <td width="33%"><%=sjs%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="16%"> 
        <div align="right">录入时间</div>      </td>
      <td width="34%"> <%=xxlrsj%> </td>
      <td width="17%"> 
        <div align="right">信息录入人</div>      </td>
      <td width="33%"><%=xxlrr%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>礼品名称</td>
      <td colspan="3"> 
        <input type="text" name="lpmc" size="73" maxlength="50"  value="<%=lpmc%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>礼品数量</td>
      <td width="34%"> 
        <input type="text" name="lpsl" size="20" maxlength="8"  value="<%=lpsl%>" >      </td>
      <td align="right" width="17%"><font color="#FF0000">*</font>领取时间</td>
      <td width="33%"> 
        <input type="text" name="lqsj" size="20" maxlength="10"  value="<%=lqsj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>录入人</td>
      <td width="34%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>      </td>
      <td align="right" width="17%"><font color="#FF0000">*</font>录入时间</td>
      <td width="33%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>录入部门</td>
      <td width="34%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2">
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
			<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
			<input type="hidden" name="wherelpmc"  value="<%=wherelpmc%>" >
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
	if(	javaTrim(FormName.lpmc)=="") {
		alert("请输入[礼品名称]！");
		FormName.lpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lpsl)=="") {
		alert("请输入[礼品数量]！");
		FormName.lpsl.focus();
		return false;
	}
	if(!(isNumber(FormName.lpsl, "礼品数量"))) {
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("请输入[领取时间]！");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "领取时间"))) {
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
