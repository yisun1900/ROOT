<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String ygbh=null;
String bdsxrq=null;
String bdxz=null;
String bdyy=null;
String fgsbh=null;
String tcf=null;
String dwbh=null;
String dwbh2=null;
String zwbm=null;
String zwbm2=null;
String bdqgwgz=null;
String bdhgwgz=null;
String bdqjbgz=null;
String bdhjbgz=null;
String bdqkhgz=null;
String bdhkhgz=null;
String bdqbuzhu=null;
String bdhbuzhu=null;
String bdqjtbt=null;
String bdhjtbt=null;
String bdqcb=null;
String bdhcb=null;
String bdqdhbt=null;
String bdhdhbt=null;
String clzt=null;
String ztbm=null;
String bz=null;
String bdxh=cf.GB2Uni(request.getParameter("bdxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select clzt,ygbh,bdsxrq,bdxz,bdyy,fgsbh,tcf,dwbh,dwbh2,zwbm,zwbm2,bdqgwgz,bdhgwgz,bdqjbgz,bdhjbgz,bdqkhgz,bdhkhgz,bdqbuzhu,bdhbuzhu,bdqjtbt,bdhjtbt,bdqcb,bdhcb,bdqdhbt,bdhdhbt,ztbm,bz ";
	ls_sql+=" from  rs_ygbdsqb";
	ls_sql+=" where  (bdxh='"+bdxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bdsxrq=cf.fillNull(rs.getDate("bdsxrq"));
		bdxz=cf.fillNull(rs.getString("bdxz"));
		bdyy=cf.fillNull(rs.getString("bdyy"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		tcf=cf.fillNull(rs.getString("tcf"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwbh2=cf.fillNull(rs.getString("dwbh2"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		zwbm2=cf.fillNull(rs.getString("zwbm2"));
		bdqgwgz=cf.fillNull(rs.getString("bdqgwgz"));
		bdhgwgz=cf.fillNull(rs.getString("bdhgwgz"));
		bdqjbgz=cf.fillNull(rs.getString("bdqjbgz"));
		bdhjbgz=cf.fillNull(rs.getString("bdhjbgz"));
		bdqkhgz=cf.fillNull(rs.getString("bdqkhgz"));
		bdhkhgz=cf.fillNull(rs.getString("bdhkhgz"));
		bdqbuzhu=cf.fillNull(rs.getString("bdqbuzhu"));
		bdhbuzhu=cf.fillNull(rs.getString("bdhbuzhu"));
		bdqjtbt=cf.fillNull(rs.getString("bdqjtbt"));
		bdhjtbt=cf.fillNull(rs.getString("bdhjtbt"));
		bdqcb=cf.fillNull(rs.getString("bdqcb"));
		bdhcb=cf.fillNull(rs.getString("bdhcb"));
		bdqdhbt=cf.fillNull(rs.getString("bdqdhbt"));
		bdhdhbt=cf.fillNull(rs.getString("bdhdhbt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		bz=cf.fillNull(rs.getString("bz"));
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_ygbdsqb.jsp" name="editform">
  <div align="center">请修改员工变动信息（变动序号：<%=bdxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#DFE3E9"> 
      <td width="19%" align="right" ><font color="#CC0000">*</font><font color="#0000CC">姓名</font></td>
      <td width="31%"> 
        <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where ygbh='"+ygbh+"'",ygbh);
	%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>变动性质</td>
      <td width="32%"> 
        <select name="bdxz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+转正&02+调薪&03+升职&04+降职&05+调职&06+调动&07+升级&08+降级&99+其他",bdxz);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>变动生效时间</td>
      <td width="31%"> 
        <input type="text" name="bdsxrq" size="20" maxlength="10"  value="<%=bdsxrq%>" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">提出方</td>
      <td width="32%"> 
        <input type="text" name="tcf" size="20" maxlength="50"  value="<%=tcf%>" >
      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>变动原因</td>
      <td colspan="3"> 
        <textarea name="bdyy" cols="72" rows="3"><%=bdyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#CC0000">*</font><font color="#0000CC">变动前部门</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF"><font color="#CC0000">*</font>变动后部门</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <select name="dwbh2" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fgsbh+"' and dwlx in ('A0','F0','A1','F1','F2') and cxbz='N' order by dwlx,dwbh",dwbh2);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#CC0000">*</font><font color="#0000CC">变动前岗位</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm where xzzwmc='"+zwbm+"'",zwbm);
%> 
        </select>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF"><font color="#CC0000">*</font>变动后岗位</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <select name="zwbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",zwbm2);%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前岗位工资</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqgwgz" size="20" maxlength="9"  value="<%=bdqgwgz%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后岗位工资</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhgwgz" size="20" maxlength="9"  value="<%=bdhgwgz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前基本工资</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqjbgz" size="20" maxlength="9"  value="<%=bdqjbgz%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后基本工资</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhjbgz" size="20" maxlength="9"  value="<%=bdhjbgz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前考核工资</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqkhgz" size="20" maxlength="9"  value="<%=bdqkhgz%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后考核工资</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhkhgz" size="20" maxlength="9"  value="<%=bdhkhgz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前补助</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqbuzhu" size="20" maxlength="9"  value="<%=bdqbuzhu%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后补助</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhbuzhu" size="20" maxlength="9"  value="<%=bdhbuzhu%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前交通补贴</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqjtbt" size="20" maxlength="9"  value="<%=bdqjtbt%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后交通补贴</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhjtbt" size="20" maxlength="9"  value="<%=bdhjtbt%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前餐补</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqcb" size="20" maxlength="9"  value="<%=bdqcb%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后餐补</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhcb" size="20" maxlength="9"  value="<%=bdhcb%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E0F5FF"><font color="#0000CC">变动前电话补贴</font></td>
      <td width="31%" bgcolor="#E0F5FF"> 
        <input type="text" name="bdqdhbt" size="20" maxlength="9"  value="<%=bdqdhbt%>" readonly>
      </td>
      <td align="right" width="18%" bgcolor="#FFCCFF">变动后电话补贴</td>
      <td width="32%" bgcolor="#FFCCFF"> 
        <input type="text" name="bdhdhbt" size="20" maxlength="9"  value="<%=bdhdhbt%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>处理状态</td>
      <td width="31%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"00+不需审批&01+等待审批",clzt);
%> 
        </select>
      </td>
      <td align="right" rowspan="4">选择审批流程</td>
      <td rowspan="4"><%
	cf.mutilCheckedItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='03' and ztbm not in('0398','0399') order by ztbm","ztbm","select rs_ygbdsplc.ztbm,ztmc from rs_ztbm,rs_ygbdsplc where rs_ztbm.ztbm=rs_ygbdsplc.ztbm and rs_ygbdsplc.bdxh='"+bdxh+"'  order by rs_ygbdsplc.ztbm","2");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>申报公司</td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
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
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
          <input type="hidden" name="bdxh"  value="<%=bdxh%>" >
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
