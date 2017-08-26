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
String shjl=null;
String shr=null;
String shsj=null;
String shsm=null;

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
	ls_sql="select dqbm,ssfgs,xsdlx,xszsl,xszje,sklx,sfqk,shfmc,shrlxfs,shfdz,xsy,xsrq,xsdzt,nian,lrr,lrsj,bz,shbm,shjl,shr,shsj,shsm ";
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
		shjl=cf.fillNull(rs.getString("shjl"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shsm=cf.fillNull(rs.getString("shsm"));
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
<title>销售单－审核维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">销售单－审核维护（销售批号：<%=xsph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">销售单类型</span></td> 
  <td width="32%"> 
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx order by xsdlx",xsdlx,true);
%>    </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">所属分公司</span></td>
  <td>
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>  </td>
  <td align="right"><span class="STYLE2">收货部门</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",shbm,true);
%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">收款类型</span></td>
  <td>
    <%
	cf.selectToken(out,"1+现金&2+转账&3+支票&9+其它",sklx,true);
%> </td>
  <td align="right"><span class="STYLE2">是否全款</span></td>
  <td><%
	cf.radioToken(out,"1+全款&2+部分款&3+未付款",sfqk,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">收货方名称</span></td>
  <td colspan="3"><%=shfmc%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">收货人联系方式</span></td>
  <td colspan="3"><%=shrlxfs%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">收货方地址</span></td>
  <td colspan="3"><%=shfdz%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">销售员</span></td> 
  <td width="32%"><%=xsy%> </td>
  <td align="right" width="18%"><span class="STYLE2">销售日期</span></td> 
  <td width="32%"><%=xsrq%> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入人</span></td>
  <td><%=lrr%></td><td align="right"><font color="#0000CC">录入时间</font></td>
    <td><%=lrsj%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入部门</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">备注</span></td>
  <td colspan="3"><%=bz%>  </td></tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFF99">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>审核结论</td>
  <td><%
	cf.radioToken(out, "shjl","Y+同意&N+不同意",shjl);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">审核人</span></td>
  <td><input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" >  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">审核时间</span></td>
  <td><input type="text" name="shsj" size="20" maxlength="10"  value="<%=shsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核说明</td>
  <td colspan="3"><textarea name="shsm" cols="72" rows="3"><%=shsm%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="xsph"  value="<%=xsph%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input name="button" type="button" onClick="window.open('ViewJxc_fcxsd.jsp?xsph=<%=xsph%>')"  value="查看明细">
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
	if(	!radioChecked(FormName.shjl)) {
		alert("请选择[审核结论]！");
		FormName.shjl[0].focus();
		return false;
	}
	if (FormName.shjl[1].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("请输入[审核说明]！");
			FormName.shsm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}


	FormName.action="SaveXgShJxc_fcxsd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
