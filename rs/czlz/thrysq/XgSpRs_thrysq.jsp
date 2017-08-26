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
String bianhao=null;
String sfzh=null;
String rzsj=null;
String xzzwbm=null;

String yysm=null;
String gzbx=null;
String wpjjqk=null;

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

	ls_sql="select fgsbh,dwbh,ygbh,yhmc,bianhao,sfzh,rzsj,xzzwbm,yysm,gzbx,wpjjqk,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh,shr,shsj";
	ls_sql+=" from  rs_thrysq";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));

		yysm=cf.fillNull(rs.getString("yysm"));
		gzbx=cf.fillNull(rs.getString("gzbx"));
		wpjjqk=cf.fillNull(rs.getString("wpjjqk"));

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
	ls_sql+=" from  rs_thrysqspb";
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
<form method="post" action="SaveXgSpRs_thrysq.jsp" name="editform">
  <div align="center">修改审批（退回人员申请序号：<%=sqxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">员工序号</font></td>
      <td width="33%"><%=ygbh%> </td>
      <td align="right" width="16%"><font color="#0000CC">员工名称</font></td>
      <td width="34%"><%=yhmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">工号</font></td>
      <td width="33%"> <%=bianhao%> </td>
      <td align="right" width="16%"><font color="#0000CC">职务</font></td>
      <td width="34%"><%=xzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">身份证号</font></td>
      <td width="33%"><%=sfzh%></td>
      <td align="right" width="16%"><font color="#0000CC">入职日期</font></td>
      <td width="34%"><%=rzsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">所属分公司</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="16%"><font color="#0000CC">所属部门</font></td>
      <td width="34%"> <%
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
      <td align="right" width="16%"><font color="#0000CC">审批状态</font></td>
      <td width="34%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztbm='"+ztbm+"'",ztbm,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">退回原因</font></td>
      <td colspan="3"><%=yysm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">在职期间工作表现</font></td>
      <td colspan="3"><%=gzbx%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">物品交接情况</font></td>
      <td colspan="3"><%=wpjjqk%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">录入人</font></td>
      <td width="33%"><%=lrr%> </td>
      <td align="right" width="16%"><font color="#0000CC">录入时间</font></td>
      <td width="34%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">录入部门</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
      <td align="right" width="16%"><font color="#0000CC">申请日期</font></td>
      <td width="34%"><%=sqrq%> </td>
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
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">审核时间</font></td>
      <td width="34%"> 
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
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
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
