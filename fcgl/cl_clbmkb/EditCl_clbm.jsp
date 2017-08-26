<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
%>

<%
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrjsfs2=null;
String lrbfb=null;
String bz=null;
String jldwmc=null;
String cldlmc=null;
String paixu=null;
String lx=null;
String wxr=null;
String whereclbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT clbm,clmc,clgg,jldwmc,DECODE(lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,lrjsfs lrjsfs2,lrbfb,cldlmc,bz,paixu,lx,wxr  ";
	ls_sql+=" FROM cl_clbm  ";
    ls_sql+=" where (1=1) ";
	ls_sql+="  and  (clbm='"+whereclbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrjsfs2=cf.fillNull(rs.getString("lrjsfs2"));
		lrbfb=cf.fillNull(rs.getString("lrbfb"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		paixu=cf.fillNull(rs.getString("paixu"));
		lx=cf.fillNull(rs.getString("lx"));
		wxr=cf.fillNull(rs.getString("wxr"));
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
<title>修改信息(<%=clbm%>)</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCl_clbm.jsp" name="editform">
<div align="center">维护材料编码表</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">材料编码</font> </td>
      <td width="32%"> 
        <input type="text" name="clbm" value="<%=clbm%>" size="20" maxlength="20" readonly>      </td>
      <td width="18%" align="right">材料大类</td>
      <td width="32%"><select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
        <option value=""></option>
        <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm",cldlmc);
				%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">材料名称</td>
      <td colspan="3"><input type="text" name="clmc" value="<%=clmc%>" size="73" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">计量单位</td>
      <td width="32%"><select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
        <option value=""></option>
        <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldwmc);
				%>
      </select></td>
      <td width="18%" align="right">材料规格</td>
      <td width="32%"> 
      <input type="text" name="clgg" value="<%=clgg%>" size="20" maxlength="50" >      </td>
    </tr>
    
	
	<tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">排序</td>
      <td width="32%"> 
        <input type="text" name="paixu" value="<%=paixu%>" size="20" maxlength="8" >      </td>
      <td width="18%" align="right">类型 </td>
      <td width="32%"> 
 <%
 	cf.radioToken(out, "lx","1+常用&2+非常用",lx);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">维护人</td>
      <td width="32%"> 
        <input type="text" name="wxr" value="<%=wxr%>" size="20" maxlength="20">     </td>
      <td width="18%" rowspan="3" align="right"><font color="#FF0033">*</font>报价级别</td>
      <td width="32%" rowspan="3">
	  <select name="bjjb" size="6" multiple style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	cf.mutilSelectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","select bjjbbm from cl_jgmx where clbm='"+clbm+"'");
%> 
       </select>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">信息录入人</font></td>
      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0033">*</font><font color="#0000CC">录入时间</font></td>
      <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        备注      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4" align="center"> 
		<%--<input type="text" name="lrjsfs" value="<%=lrjsfs2%>" > --%>
		<input type="hidden" name="lrbfb" value="<%=lrbfb%>" size="20" maxlength="10">
          <input type="hidden" name="whereclbm" value="<%=clbm%>"  >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">      </td>
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
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[材料编码]！");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[材料名称]！");
		FormName.clmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请选择[材料大类]！");
		FormName.cldlmc.focus();
		return false;
	}

	if(	javaTrim(FormName.jldwmc)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwmc.focus();
		return false;
	}
	/*if(	javaTrim(FormName.lrjsfs)=="") {
		alert("请输入[利润计算方式]！");
		FormName.lrjsfs.focus();
		return false;
	}
	if (FormName.lrjsfs.value==2 && FormName.lrbfb.value==0)
	{
		alert("您选择了[百分比方式]必须录入[利润百分比]");
		FormName.lrbfb.focus();
		return false;
	}*/
	if(!(isFloat(FormName.lrbfb, "利润百分比"))) {
		return false;
	}
	if (!(isNumber(FormName.paixu,"排序"))){
		FormName.paixu.focus();     
		return      
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
	if(	!selectChecked(FormName.bjjb)) {
		alert("请输入[报价级别]！");
		FormName.bjjb.focus();
		return false;
	}
	

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
