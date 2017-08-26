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

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yhmc,bianhao,sfzh,xzzwbm,rzsj,dwbh,ssfgs";
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
	}
	rs.close();
	ps.close();
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
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">奖罚记录号</td>
	<td  width="8%">状态</td>
	<td  width="8%">类型</td>
	<td  width="22%">奖罚类型</td>
	<td  width="10%">奖罚金额</td>
	<td  width="10%">奖罚日期</td>
	<td  width="10%">已支付日期</td>
	<td  width="8%">录入人</td>
	<td  width="14%">录入部门</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT rs_jfjl.jfjlh, DECODE(rs_jfjl.zt,'1','未支付','2','已支付'), DECODE(rs_jfjl.lx,'1','处罚','2','奖励'),jflxmc,rs_jfjl.jfje,rs_jfjl.jfrq,rs_jfjl.jfzfrq,rs_jfjl.lrr,dwmc  ";
	ls_sql+=" FROM rs_jfjl,sq_dwxx,dm_jflxbm  ";
    ls_sql+=" where rs_jfjl.lrbm=sq_dwxx.dwbh(+) and rs_jfjl.jflxbm=dm_jflxbm.jflxbm(+)";
    ls_sql+=" and rs_jfjl.ygbh="+ygbh;
	ls_sql+=" order by  rs_jfjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDateSum();

%> 
  </table>



<form method="post" action="SaveInsertRs_jfjl.jsp" name="insertform" target="_blank">
<div align="center">请录入奖罚记录</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">所属分公司</font></td>
      <td width="32%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
        </select>      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">所属部门</font></td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">员工序号</font></td>
      <td width="32%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>      </td>
      <td align="right" width="20%"><font color="#000099">工号</font></td>
      <td width="30%"> 
        <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">员工名称</font></td>
      <td width="32%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="20%"><font color="#000099">身份证号</font></td>
      <td width="30%"> 
        <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">入职日期</font></td>
      <td width="32%"> 
        <input type="text" name="rzsj" value="<%=rzsj%>" size="20" maxlength="10" readonly>      </td>
      <td align="right" width="20%"><font color="#000099">行政职务</font></td>
      <td width="30%"> 
        <input type="text" name="xzzwbm" size="20" maxlength="50"  value="<%=xzzwbm%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" bgcolor="#CCFFCC">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>类型</td>
      <td width="32%"> 
        <input type="radio" name="lx"  value="1">
        处罚 
        <input type="radio" name="lx"  value="2">
        奖励 </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>奖罚类型</td>
      <td width="30%"> 
        <select name="jflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jflxbm,jflxmc from dm_jflxbm order by lx,jflxbm","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>奖罚事由</td>
      <td colspan="3"> 
        <textarea name="jfsy" cols="74" rows="6"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>奖罚金额</td>
      <td width="32%"> 
        <input type="text" name="jfje" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>奖罚日期</td>
      <td width="30%"> 
        <input type="text" name="jfrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">录入人</font></td>
      <td width="32%"><input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly></td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#000099">录入时间</font></td>
      <td width="30%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">录入部门</font></td>
      <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
      </select></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" name="bc"  value="存盘" onClick="f_do(insertform)">
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jfsy)=="") {
		alert("请输入[奖罚事由]！");
		FormName.jfsy.focus();
		return false;
	}
	if(	javaTrim(FormName.jflxbm)=="") {
		alert("请选择[奖罚类型]！");
		FormName.jflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jfje)=="") {
		alert("请输入[奖罚金额]！");
		FormName.jfje.focus();
		return false;
	}
	if(!(isFloat(FormName.jfje, "奖罚金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jfrq)=="") {
		alert("请输入[奖罚日期]！");
		FormName.jfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jfrq, "奖罚日期"))) {
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
	FormName.bc.disabled=false;
	return true;
}
//-->
</SCRIPT>
