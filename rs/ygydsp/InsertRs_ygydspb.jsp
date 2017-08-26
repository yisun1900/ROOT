<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");

%>
<%
String dwbh=null;
String xzzwbm=null;
String sfzszg=null;

double jtbt=0;
double jbgz=0;
double gwgz=0;
double cb=0;
double dhbt=0;
double khgz=0;
double buzhu=0;

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));

String bdxh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="SELECT sq_yhxx.dwbh,sq_yhxx.xzzwbm,sfzszg";
	ls_sql+=" FROM sq_yhxx  ";
    ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sfzszg=cf.fillNull(rs.getString("sfzszg"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dhbt,cb,jtbt,jbgz,gwgz,khgz,buzhu";
	ls_sql+=" FROM rs_ygjbgzb";
    ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dhbt=rs.getDouble("dhbt");
		cb=rs.getDouble("cb");
		jtbt=rs.getDouble("jtbt");
		jbgz=rs.getDouble("jbgz");
		gwgz=rs.getDouble("gwgz");
		khgz=rs.getDouble("khgz");
		buzhu=rs.getDouble("buzhu");
		
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  rs_ygbdsqb";
	ls_sql+=" where ygbh='"+ygbh+"' and clzt in('01','02')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！有未审批的变动记录，不能录入新的");
		return;
	}


	//自动产生序号
	count=0;
	ls_sql="select NVL(max(substr(bdxh,6,5)),0)";
	ls_sql+=" from  rs_ygbdsqb";
	ls_sql+=" where fgsbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	count++;

	bdxh=ssfgs+cf.addZero(count,5);
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

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_ygydsqb.jsp" name="insertform" target="_blank">
<div align="center">员工变动（变动序号：<%=bdxh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">变动序号</td>
	<td  width="9%">处理状态</td>
	<td  width="11%">审批状态</td>
	<td  width="9%">生效时间</td>
	<td  width="6%">性质</td>
	<td  width="11%">申报分公司</td>
	<td  width="11%">提出方</td>
	<td  width="14%">变动后部门</td>
	<td  width="11%">变动后岗位</td>
	<td  width="9%">录入时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT bdxh,DECODE(rs_ygbdsqb.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消'),rs_ztbm.ztmc,bdsxrq, DECODE(bdxz,'01','转正','02','调薪','03','升职','04','降职','05','调职','06','调动','07','升级','08','降级','99','其他'),a.dwmc fgsbh,tcf,c.dwmc dwbh2,zwbm2,rs_ygbdsqb.lrsj";
	ls_sql+=" FROM rs_ygbdsqb,sq_dwxx a,sq_dwxx c,rs_ztbm  ";
    ls_sql+=" where  rs_ygbdsqb.fgsbh=a.dwbh and rs_ygbdsqb.dwbh2=c.dwbh and rs_ygbdsqb.ztbm=rs_ztbm.ztbm(+)";
    ls_sql+=" and rs_ygbdsqb.ygbh="+ygbh;
	ls_sql+=" order by rs_ygbdsqb.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>

 </table>
  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000FF">姓名</font></td>
      <td width="31%"> 
        <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where ygbh='"+ygbh+"'",ygbh);
	%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>变动性质</td>
      <td width="31%"> 
        <select name="bdxz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="01">转正</option>
          <option value="02">调薪</option>
          <option value="03">升职</option>
          <option value="04">降职</option>
          <option value="05">调职</option>
          <option value="06">调动</option>
          <option value="07">升级</option>
          <option value="08">降级</option>
          <option value="99">其他</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>变动生效时间</td>
      <td width="31%"> 
        <input type="text" name="bdsxrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">提出方</td>
      <td width="31%"> 
        <input type="text" name="tcf" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>变动原因</td>
      <td colspan="3"> 
        <textarea name="bdyy" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#CC0000">*</font><font color="#0000CC">变动前部门</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ",dwbh);
%> 
        </select>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF"><font color="#CC0000">*</font>变动后部门</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <select name="dwbh2" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('A0','F0','A1','F1','F2') and cxbz='N' order by dwlx,dwbh",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#CC0000">*</font><font color="#0000CC">变动前岗位</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm where xzzwmc='"+xzzwbm+"'",xzzwbm);
%> 
        </select>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF"><font color="#CC0000">*</font>变动后岗位</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <select name="zwbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xzzwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前基本工资</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqjbgz" value="<%=jbgz%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后基本工资</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhjbgz" value="<%=jbgz%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前岗位工资</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqgwgz" value="<%=gwgz%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后岗位工资</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhgwgz" value="<%=gwgz%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前考核工资</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqkhgz" value="<%=khgz%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后考核工资</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhkhgz" value="<%=khgz%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前补助</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqbuzhu" value="<%=buzhu%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后补助</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhbuzhu" value="<%=buzhu%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前交通补贴</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqjtbt" value="<%=jtbt%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后交通补贴</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhjtbt" value="<%=jtbt%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前餐补</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqcb" value="<%=cb%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后餐补</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhcb" value="<%=cb%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%" bgcolor="#E0F5FF"><font color="#0000CC">变动前电话补贴</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqdhbt" value="<%=dhbt%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="19%" bgcolor="#FFCCFF">变动后电话补贴</td>
      <td width="31%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhdhbt" value="<%=dhbt%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>处理状态</td>
      <td width="31%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="01">等待审批</option>
        </select>
      </td>
      <td rowspan="4" align="right">选择审批流程</td>
      <td rowspan="4"><%
	cf.checkedItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='03' and ztbm not in('0398','0399') order by ztbm","ztbm","","2");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>申报公司</td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' ","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4">
        <input type="hidden" name="bdxh" value="<%=bdxh%>">
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
	if(	javaTrim(FormName.bdxh)=="") {
		alert("请输入[变动序号]！");
		FormName.bdxh.focus();
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
	if(	javaTrim(FormName.bdxz)=="") {
		alert("请选择[变动性质]！");
		FormName.bdxz.focus();
		return false;
	}
	if(	javaTrim(FormName.bdsxrq)=="") {
		alert("请输入[变动生效时间]！");
		FormName.bdsxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.bdsxrq, "变动生效时间"))) {
		return false;
	}
	if(	javaTrim(FormName.bdyy)=="") {
		alert("请输入[变动原因]！");
		FormName.bdyy.focus();
		return false;
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[申报分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[变动前部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh2)=="") {
		alert("请选择[变动后部门]！");
		FormName.dwbh2.focus();
		return false;
	}
	if(	javaTrim(FormName.zwbm)=="") {
		alert("请选择[变动前岗位]！");
		FormName.zwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zwbm2)=="") {
		alert("请选择[变动后岗位]！");
		FormName.zwbm2.focus();
		return false;
	}
	if(!(isFloat(FormName.bdqgwgz, "变动前岗位工资"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhgwgz, "变动后岗位工资"))) {
		return false;
	}
	if(!(isFloat(FormName.bdqjbgz, "变动前基本工资"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhjbgz, "变动后基本工资"))) {
		return false;
	}
	if(!(isFloat(FormName.bdqkhgz, "变动前考核工资"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhkhgz, "变动后考核工资"))) {
		return false;
	}
	if(!(isFloat(FormName.bdqbuzhu, "变动前补助"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhbuzhu, "变动后补助"))) {
		return false;
	}
	if(!(isFloat(FormName.bdqjtbt, "变动前交通补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhjtbt, "变动后交通补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.bdqcb, "变动前餐补"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhcb, "变动后餐补"))) {
		return false;
	}
	if(!(isFloat(FormName.bdqdhbt, "变动前电话补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.bdhdhbt, "变动后电话补贴"))) {
		return false;
	}
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
