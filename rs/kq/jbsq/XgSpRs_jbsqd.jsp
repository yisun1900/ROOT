<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String shr=(String)session.getAttribute("yhmc");

String fgsbh=null;
String dwbh=null;
String ygbh=null;
String yhmc=null;
String xb=null;
String xzzwbm=null;

String kssj=null;
String jzsj=null;
double ljts=0;
String yysm=null;

String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String clzt=null;
String ztbm=null;

String shjl=null;
String shyj=null;
String spxh=null;

String yclzt=null;
String yztbm=null;

String xgztbm=cf.GB2Uni(request.getParameter("ztbm"));
String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,ygbh,yhmc,xb,xzzwbm,kssj,jzsj,ljts,yysm,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh ";
	ls_sql+=" from  rs_jbsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		kssj=cf.fillNull(rs.getDate("kssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		ljts=rs.getDouble("ljts");

		yysm=cf.fillNull(rs.getString("yysm"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));

		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		spxh=cf.fillNull(rs.getString("spxh"));
	}
	rs.close();
	ps.close();

	ls_sql="select yclzt,yztbm";
	ls_sql+=" from  rs_jbsqspb";
	ls_sql+=" where spxh="+spxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yclzt=cf.fillNull(rs.getString("yclzt"));
		yztbm=cf.fillNull(rs.getString("yztbm"));
	}
	rs.close();
	ps.close();

	if (!yztbm.equals(xgztbm))
	{
		out.println("错误！『审批状态』已改变，不能再修改");
		return;
	}

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
<title>审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgSpRs_jbsqd.jsp" name="editform">
  <div align="center">修改审批（申请序号：<%=sqxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">员工序号</font></td>
      <td width="33%"><%=ygbh%> </td>
      <td align="right" width="17%"><font color="#0000CC">员工名称</font></td>
      <td width="33%"><%=yhmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">性别</font></td>
      <td width="33%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">职务</font></td>
      <td width="33%"><%=xzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">所属分公司</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">所属部门</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">处理状态</font></td>
      <td width="33%"> <%
	cf.selectToken(out,"01+等待审批&02+正在审批&03+审批通过&04+审批取消",clzt,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">审批状态</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztbm='"+ztbm+"'",ztbm,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">开始时间</font></td>
      <td width="33%"><%=kssj%> </td>
      <td align="right" width="17%"><font color="#0000CC">截至时间</font></td>
      <td width="33%"><%=jzsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">累计小时</font></td>
      <td width="33%"><%=ljts%> </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">原因说明</font></td>
      <td colspan="3"><%=yysm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">录入人</font></td>
      <td width="33%"><%=lrr%> </td>
      <td align="right" width="17%"><font color="#0000CC">录入时间</font></td>
      <td width="33%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">录入部门</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">申请日期</font></td>
      <td width="33%"><%=sqrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">备注</font></td>
      <td colspan="3"><%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="34">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">审核人</font></td>
      <td width="33%"> 
        <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">审核时间</font></td>
      <td width="33%"> 
        <input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>审核结论</td>
      <td width="33%"> 
        <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rs_shjlbm.shjl,shjlmc from rs_shjlbm,rs_shztlc where rs_shjlbm.shjl=rs_shztlc.shjl and rs_shztlc.ztbm='"+yztbm+"' order by rs_shjlbm.shjl",shjl);
%> 
        </select>
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核意见</td>
      <td colspan="3"> 
        <textarea name="shyj" cols="73" rows="3"><%=shyj%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="hidden" name="spxh"  value="<%=spxh%>" >
          <input type="hidden" name="xgztbm"  value="<%=xgztbm%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("请选择[审核结论]！");
		FormName.shjl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
