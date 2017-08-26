<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dqbm=null;
String ssfgs=null;
String xsdlx=null;
String xszsl=null;
String xszje=null;
String sklx=null;
String sfqk=null;
String shfmc=null;
String shrlxfs=null;
String shfdz=null;
String xsy=null;
String xsrq=null;
String xsdzt=null;
String nian=null;
String lrr=null;
String lrsj=null;
String shbm=null;

String bz=null;
String xsph=cf.GB2Uni(request.getParameter("xsph"));

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//表示录入存盘直接转过来
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,ssfgs,xsdlx,xszsl,xszje,sklx,sfqk,shfmc,shrlxfs,shfdz,xsy,xsrq,xsdzt,nian,lrr,lrsj,bz,shbm ";
	ls_sql+=" from  jxc_fcxsd";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		xsdlx=cf.fillNull(rs.getString("xsdlx"));
		xszsl=cf.fillNull(rs.getString("xszsl"));
		xszje=cf.fillNull(rs.getString("xszje"));
		sklx=cf.fillNull(rs.getString("sklx"));
		sfqk=cf.fillNull(rs.getString("sfqk"));
		shfmc=cf.fillNull(rs.getString("shfmc"));
		shrlxfs=cf.fillNull(rs.getString("shrlxfs"));
		shfdz=cf.fillNull(rs.getString("shfdz"));
		xsy=cf.fillNull(rs.getString("xsy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		nian=cf.fillNull(rs.getString("nian"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		shbm=cf.fillNull(rs.getString("shbm"));
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">请修改供货商退货单（销售批号：<%=xsph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供货商退货单类型</td> 
  <td width="32%"> 
    <select name="xsdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx where xsdlx='6' order by xsdlx",xsdlx);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>所属分公司</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right">收货部门</td>
  <td><select name="shbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",shbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收款类型</td>
  <td><select name="sklx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+现金&2+转账&3+支票&9+其它",sklx);
%>
  </select></td>
  <td align="right">是否全款</td>
  <td><%
	cf.radioToken(out, "sfqk","1+全款&2+部分款&3+未付款",sfqk);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">供货商</span></td>
  <td colspan="3"><input type="text" name="shfmc" size="73" maxlength="50"  value="<%=shfmc%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收货人联系方式</td>
  <td colspan="3"><input type="text" name="shrlxfs" size="73" maxlength="50"  value="<%=shrlxfs%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收货方地址</td>
  <td colspan="3"><input type="text" name="shfdz" size="73" maxlength="100"  value="<%=shfdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售员</td> 
  <td width="32%"> 
    <input type="text" name="xsy" size="20" maxlength="50"  value="<%=xsy%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>销售日期</td> 
  <td width="32%"> 
    <input type="text" name="xsrq" size="20" maxlength="10"  value="<%=xsrq%>" onDblClick="JSCalendar(this)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="xsph"  value="<%=xsph%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="button"  value="常用材料录入" onClick="f_pllr(insertform)" >
      <input type="button"  value="选择录入" onClick="f_cklr(insertform)" >
      <input type="button"  value="查看明细" onClick="f_ck(insertform)"  >
      <input type="button"  value=" 提 交 " onClick="f_tj(insertform)" >
      <input name="button" type="button" onClick="f_print(insertform)"  value="打印" >
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
	if(	javaTrim(FormName.xsph)=="") {
		alert("请输入[销售批号]！");
		FormName.xsph.focus();
		return false;
	}
	if(	javaTrim(FormName.xsdlx)=="") {
		alert("请选择[供货商退货单类型]！");
		FormName.xsdlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if (FormName.xsdlx.value=="5")//5：内部使用
	{
		if(	javaTrim(FormName.shbm)=="") {
			alert("请选择[收货部门]！");
			FormName.shbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
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

	FormName.action="SaveEditJxc_fcxsd.jsp";
	FormName.submit();
	return true;
}

function f_pllr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("请输入[销售批号]！");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="PlInsertJxc_clbm.jsp";
	FormName.submit();
	return true;
}


function f_cklr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("请输入[销售批号]！");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("请输入[销售批号]！");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("请输入[销售批号]！");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="tjxsd.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("请输入[销售批号]！");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="/jxcdy/dyxsd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
