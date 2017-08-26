<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String yhmc=null;
String xb=null;
String fgsbh=null;
String dwbh=null;
String xzzwbm=null;
String rzsj=null;
String lzrq=null;
String lzyy=null;

String sbfgs=request.getParameter("fgsbh");
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sqxh=null;

try {
	conn=cf.getConnection();

	ls_sql="select yhmc,xb,ssfgs,dwbh,xzzwbm,rzsj,lzrq,lzyy";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		lzrq=cf.fillNull(rs.getDate("lzrq"));
		lzyy=cf.fillNull(rs.getString("lzyy"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(sqxh,6,5)),0)";
	ls_sql+=" from  rs_ecrzsqd";
	ls_sql+=" where fgsbh='"+sbfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqxh=sbfgs+cf.addZero(count+1,5);

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



<form method="post" action="SaveInsertRs_ecrzsqd.jsp" name="insertform" target="_blank">
  <div align="center">重新入职申请</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">申请序号</font></td>
      <td width="30%"> 
        <input type="text" name="sqxh" value="<%=sqxh%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#0000CC">员工序号</font></td>
      <td width="30%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="20%"><font color="#0000CC">员工名称</font></td>
      <td width="30%"> 
        <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#0000CC">性别</font></td>
      <td width="30%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
      <td align="right" width="20%"><font color="#0000CC">原职位</font></td>
      <td width="30%"> 
        <input type="text" name="yxzzwbm" value="<%=xzzwbm%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#0000CC">原分公司</font></td>
      <td width="30%">
        <select name="yfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#0000CC">原部门</font></td>
      <td width="30%">
        <select name="ydwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#0000CC">上次入职日期</font></td>
      <td width="30%"> 
        <input type="text" name="yrzsj" value="<%=rzsj%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="20%"><font color="#0000CC">离职日期</font></td>
      <td width="30%"> 
        <input type="text" name="ylzrq" value="<%=lzrq%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#0000CC">离职原因</font></td>
      <td colspan="3"> 
        <textarea name="ylzyy" cols="73" rows="3"><%=lzyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="39" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>处理状态</td>
      <td width="30%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="01">等待审批</option>
        </select>
      </td>
      <td align="right" rowspan="5" width="20%">选择审批流程</td>
      <td rowspan="5" width="30%"> <%
	cf.checkedItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='06' and ztbm not in('0698','0699') order by ztbm","ztbm","","2");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="20%"><font color="#CC0000">*</font>申请二次入职公司</td>
      <td width="30%">
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sbfgs+"'",sbfgs);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>申请二次入职部门</td>
      <td width="30%"> 
        <select name="xdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+sbfgs+"' order by ssfgs,dwlx,dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>申请二次入职职位</td>
      <td width="30%"> 
        <select name="xxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>申请日期</td>
      <td width="30%"> 
        <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>二次入职原因</td>
      <td colspan="3"> 
        <textarea name="xrzyy" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="30%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.clzt)=="") {
		alert("请输入[处理状态]！");
		FormName.clzt.focus();
		return false;
	}

	if (FormName.clzt.value=="01")
	{
		if(	!radioChecked(FormName.ztbm)) {
			alert("请选择[审批流程]！");
			FormName.ztbm[0].focus();
			return false;
		}
	}
	else{
		if(	radioChecked(FormName.ztbm)) {
			alert("不需审批，不能选择[审批流程]！");
			FormName.ztbm[0].focus();
			return false;
		}
	}

	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[申报公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrzsj, "上次入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.ylzrq, "离职日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xdwbh)=="") {
		alert("请选择[申请二次入职部门]！");
		FormName.xdwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xxzzwbm)=="") {
		alert("请选择[申请二次入职职位]！");
		FormName.xxzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xrzyy)=="") {
		alert("请输入[二次入职原因]！");
		FormName.xrzyy.focus();
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
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
