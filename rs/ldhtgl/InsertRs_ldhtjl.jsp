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
<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String rzsj=null;
String dwbh=null;
String ssfgs=null;
String bianma=null;
String yldhtbh=null;
String ldhtlx=null;
String ldhtqx=null;
String htksrq=null;
String htdqrq=null;

String ldhtbh=null;

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select yhmc,bianhao,sfzh,xzzwbm,rzsj,dwbh,ssfgs,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh='"+ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yldhtbh=cf.fillNull(rs.getString("ldhtbh"));
		ldhtlx=cf.fillNull(rs.getString("ldhtlx"));
		ldhtqx=cf.fillNull(rs.getString("ldhtqx"));
		htksrq=cf.fillNull(rs.getDate("htksrq"));
		htdqrq=cf.fillNull(rs.getDate("htdqrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select bianma";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bianma=cf.fillNull(rs.getString("bianma"));
	}
	rs.close();
	ps.close();
	if (bianma.equals(""))
	{
		out.println("错误！请在单位信息表中录入『编码』");
		return;
	}

	int count=0;
	ls_sql="select NVL(max(substr(ldhtbh,4,4)),0)";
	ls_sql+=" from  rs_ldhtjl";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ldhtbh=bianma+"-"+cf.addZero(count+1,4);

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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_ldhtjl.jsp" name="insertform" target="_blank">
<div align="center">劳动合同录入 </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">所属分公司</font></td>
      <td width="32%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">所属部门</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">员工序号</font></td>
      <td width="34%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="17%"><font color="#000099">工号</font></td>
      <td width="33%"> 
        <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">员工名称</font></td>
      <td width="34%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#000099">身份证号</font></td>
      <td width="33%"> 
        <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#000099">入职日期</font></td>
      <td width="34%"> 
        <input type="text" name="rzsj" value="<%=rzsj%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="17%"><font color="#000099">行政职务</font></td>
      <td width="33%"> 
        <input type="text" name="xzzwbm" size="20" maxlength="50"  value="<%=xzzwbm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原劳动合同编号</font></td>
      <td width="32%"><%=yldhtbh%> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原劳动合同类型</font></td>
      <td width="32%"><%=ldhtlx%> </td>
      <td align="right" width="18%"><font color="#000099">原劳动合同期限</font></td>
      <td width="32%"><%=ldhtqx%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原合同开始日期</font></td>
      <td width="32%"><%=htksrq%> </td>
      <td align="right" width="18%"><font color="#000099">原合同到期日期</font></td>
      <td width="32%"><%=htdqrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font>劳动合同编号</td>
      <td width="32%"> 
        <input type="text" name="ldhtbh" value="<%=ldhtbh%>" size="20" maxlength="14" readonly>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font>劳动合同类型</td>
      <td width="32%"> 
        <select name="ldhtlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtlx c1,ldhtlx c2 from dm_ldhtlx order by ldhtlxbm","");
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font>劳动合同期限</td>
      <td width="32%"> 
        <select name="ldhtqx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtqx c1,ldhtqx c2  from dm_ldhtqx order by ldhtqxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font>合同开始日期</td>
      <td width="32%"> 
        <input type="text" name="htksrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font>合同到期日期</td>
      <td width="32%"> 
        <input type="text" name="htdqrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">录入时间</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">录入部门</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="lx" value="<%=lx%>">
        <input type="hidden" name="yldhtbh" value="<%=yldhtbh%>">
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
	if(	javaTrim(FormName.ldhtbh)=="") {
		alert("请输入[劳动合同编号]！");
		FormName.ldhtbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[所属部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职日期"))) {
		return false;
	}
	if(	javaTrim(FormName.ldhtlx)=="") {
		alert("请选择[劳动合同类型]！");
		FormName.ldhtlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ldhtqx)=="") {
		alert("请选择[劳动合同期限]！");
		FormName.ldhtqx.focus();
		return false;
	}
	if(	javaTrim(FormName.htksrq)=="") {
		alert("请输入[合同开始日期]！");
		FormName.htksrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.htksrq, "合同开始日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htdqrq)=="") {
		alert("请输入[合同到期日期]！");
		FormName.htdqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.htdqrq, "合同到期日期"))) {
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
