<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String htbh=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String kssj=null;
String jssj=null;
String lrbz=null;
String bz=null;
String wherehtbh=cf.GB2Uni(request.getParameter("htbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select htbh,dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,kssj,jssj,lrbz,bz ";
	ls_sql+=" from  jxc_gyshtxx";
	ls_sql+=" where  (htbh='"+wherehtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htbh=cf.fillNull(rs.getString("htbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		kssj=cf.fillNull(rs.getDate("kssj"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		lrbz=cf.fillNull(rs.getString("lrbz"));
		bz=cf.fillNull(rs.getString("bz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_gyshtxx.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>合同编号</td> 
  <td width="32%"> 
    <input type="text" name="htbh" size="20" maxlength="50"  value="<%=htbh%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>所属地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商名称</td> 
  <td colspan="3"> 
    <input type="text" name="gysmc" size="73" maxlength="50"  value="<%=gysmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>供应商地址</td>
  <td colspan="3"><input type="text" name="gysdz" size="73" maxlength="100"  value="<%=gysdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20"  value="<%=gysfzr%>" >  </td>
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"><input type="text" name="gyscz" size="20" maxlength="50"  value="<%=gyscz%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商电话</td> 
  <td colspan="3"><input type="text" name="gysdh" size="73" maxlength="50"  value="<%=gysdh%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>合同开始时间</td> 
  <td width="32%"><input type="text" name="kssj" size="20" maxlength="10"  value="<%=kssj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>合同结束时间</td> 
  <td width="32%"><input type="text" name="jssj" size="20" maxlength="10"  value="<%=jssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="wherehtbh"  value="<%=wherehtbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.htbh)=="") {
		alert("请输入[合同编号]！");
		FormName.htbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供应商名称]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysdz)=="") {
		alert("请输入[供应商地址]！");
		FormName.gysdz.focus();
		return false;
	}
	if(	javaTrim(FormName.gysfzr)=="") {
		alert("请输入[供应商负责人]！");
		FormName.gysfzr.focus();
		return false;
	}
	if(	javaTrim(FormName.gysdh)=="") {
		alert("请输入[供应商电话]！");
		FormName.gysdh.focus();
		return false;
	}
	if(	javaTrim(FormName.kssj)=="") {
		alert("请输入[合同开始时间]！");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "合同开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[合同结束时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "合同结束时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
