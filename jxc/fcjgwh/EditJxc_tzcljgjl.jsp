<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
%>
<%

String clbm=null;
String dqbm=null;
String lrsj=null;
String lrr=null;
String cbj=null;
String lsj=null;
String xsj=null;
String dfgsjg=null;
String dgzjg=null;
String sxsj=null;
String xgzt=null;
String xgsj=null;
String whereclbm=cf.GB2Uni(request.getParameter("clbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherelrsj=cf.GB2Uni(request.getParameter("lrsj"));

String clmc=null;
String xh=null;
String gg=null;
String nbbm=null;
String jldwbm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select clbm,dqbm,lrsj,lrr,cbj,lsj,xsj,dfgsjg,dgzjg,sxsj,xgzt,xgsj ";
	ls_sql+=" from  jxc_tzcljgjl";
	ls_sql+=" where  (clbm='"+whereclbm+"') and  (dqbm='"+wheredqbm+"') and  (lrsj=TO_DATE('"+wherelrsj+"','YYYY-MM-DD'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		cbj=cf.fillNull(rs.getString("cbj"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		dfgsjg=cf.fillNull(rs.getString("dfgsjg"));
		dgzjg=cf.fillNull(rs.getString("dgzjg"));
		sxsj=cf.fillNull(rs.getDate("sxsj"));
		xgzt=cf.fillNull(rs.getString("xgzt"));
		xgsj=cf.fillNull(rs.getDate("xgsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select clmc,nbbm,xh,gg,jldwbm";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where clbm='"+whereclbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clmc=cf.fillNull(rs.getString("clmc"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_tzcljgjl.jsp" name="editform">
<div align="center">预先调整价格－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">材料编码</font></td> 
  <td width="32%"> 
    <input type="text" name="clbm" size="20" maxlength="13"  value="<%=clbm%>" readonly>  </td>
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">地区</font></td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">材料名称</font></td>
  <td><%=clmc%></td>
  <td align="right"><font color="#0000CC">内部编码</font></td>
  <td><%=nbbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">型号</font></td>
  <td><%=xh%></td>
  <td align="right"><font color="#0000CC">规格</font></td>
  <td><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">计量单位</font></td>
  <td><%=jldwbm%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>成本价</td> 
  <td width="32%"><input type="text" name="cbj" size="20" maxlength="17"  value="<%=cbj%>" ></td>
  <td align="right" width="18%"><font color="#CC0000">*</font>对分公司价格</td> 
  <td width="32%"><input type="text" name="dfgsjg" size="20" maxlength="17"  value="<%=dfgsjg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>对工长价格</td> 
  <td width="32%"><input type="text" name="dgzjg" size="20" maxlength="17"  value="<%=dgzjg%>" ></td>
  <td align="right" width="18%"><font color="#CC0000">*</font>生效时间</td> 
  <td width="32%"><input type="text" name="sxsj" size="20" maxlength="10"  value="<%=sxsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>


    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="whereclbm"  value="<%=whereclbm%>" >
		<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
		<input type="hidden" name="wherelrsj"  value="<%=wherelrsj%>" >
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
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[材料编码]！");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[成本价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.dfgsjg)=="") {
		alert("请输入[对分公司价格]！");
		FormName.dfgsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dfgsjg, "对分公司价格"))) {
		return false;
	}
	if(	javaTrim(FormName.dgzjg)=="") {
		alert("请输入[对工长价格]！");
		FormName.dgzjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzjg, "对工长价格"))) {
		return false;
	}
	if(	javaTrim(FormName.sxsj)=="") {
		alert("请输入[生效时间]！");
		FormName.sxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sxsj, "生效时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
