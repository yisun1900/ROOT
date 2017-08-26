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
	ls_sql+=" from  rs_ccsqd";
	ls_sql+=" where fgsbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqxh=fgsbh+cf.addZero(count+1,5);

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



<form method="post" action="SaveInsertRs_ccsqd.jsp" name="insertform" target="_blank">
  <div align="center">出差申请</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">申请序号</font></td>
      <td width="33%"> 
        <input type="text" name="sqxh" value="<%=sqxh%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">员工序号</font></td>
      <td width="33%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">员工名称</font></td>
      <td width="32%"> 
        <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">性别</font></td>
      <td width="33%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
      <td align="right" width="18%"><font color="#0000CC">职务</font></td>
      <td width="32%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm where xzzwmc='"+xzzwbm+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#0000CC">所属部门</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="39" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>同行者说明</td>
      <td colspan="3">
        <input type="text" name="txzsm" value="" size="74" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>交通工具</td>
      <td width="33%"> 
        <input type="text" name="jtgj" value="" size="20" maxlength="50">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>出差期间职务代理人</td>
      <td width="32%"> 
        <input type="text" name="zwdlr" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>补贴标准</td>
      <td width="33%"> 
        <input type="text" name="btbz" value="" size="20" maxlength="16">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>住宿标准</td>
      <td width="32%"> 
        <input type="text" name="zsbz" value="" size="20" maxlength="16">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>行程说明</td>
      <td colspan="3">
        <input type="text" name="xcsm" value="" size="74" maxlength="200">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>开始时间</td>
      <td width="33%"> 
        <input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>截至时间</td>
      <td width="32%"> 
        <input type="text" name="jzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>累计天数</td>
      <td width="33%"> 
        <input type="text" name="ljts" value="" size="20" maxlength="10">
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>原因说明</td>
      <td colspan="3"> 
        <textarea name="yysm" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="33%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>申请日期</td>
      <td width="32%"> 
        <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
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
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}

	if(	javaTrim(FormName.txzsm)=="") {
		alert("请选择[同行者说明]！");
		FormName.txzsm.select();
		return false;
	}
	if(	javaTrim(FormName.jtgj)=="") {
		alert("请选择[交通工具]！");
		FormName.jtgj.select();
		return false;
	}
	if(	javaTrim(FormName.btbz)=="") {
		alert("请选择[补贴标准]！");
		FormName.btbz.select();
		return false;
	}
	if(!(isFloat(FormName.btbz, "补贴标准"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbz)=="") {
		alert("请选择[住宿标准]！");
		FormName.zsbz.select();
		return false;
	}
	if(!(isFloat(FormName.zsbz, "住宿标准"))) {
		return false;
	}
	if(	javaTrim(FormName.zwdlr)=="") {
		alert("请选择[出差期间职务代理人]！");
		FormName.zwdlr.select();
		return false;
	}
	if(	javaTrim(FormName.xcsm)=="") {
		alert("请选择[行程说明]！");
		FormName.xcsm.select();
		return false;
	}




	if(	javaTrim(FormName.kssj)=="") {
		alert("请选择[开始时间]！");
		FormName.kssj.select();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请选择[截至时间]！");
		FormName.jzsj.select();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "截至时间"))) {
		return false;
	}

	if (FormName.kssj.value>FormName.jzsj.value)
	{
		alert("错误！[开始时间]不能大于[截至时间]！");
		FormName.jzsj.select();
		return false;
	}



	if(	javaTrim(FormName.ljts)=="") {
		alert("请选择[累计天数]！");
		FormName.ljts.focus();
		return false;
	}
	if(!(isFloat(FormName.ljts, "累计天数"))) {
		return false;
	}
	if(	javaTrim(FormName.yysm)=="") {
		alert("请输入[原因说明]！");
		FormName.yysm.focus();
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
