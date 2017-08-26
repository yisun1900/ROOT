<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwstr=cf.getItemData("select gtpjbh,gtpjmc||'（'||xinghao||'）'||'，价格:'||dj,jjpjflbm from jc_jjpjbj order by jjpjflbm,gtpjbh");
%>
<%

String ddbh=null;
String gtxh=null;
String gtpjbh=null;
double bzdj=0;
double sl=0;
double zqje=0;
String bz=null;
String jjpjflbm=null;
String jldwbm=null;
String wherepjxh=cf.GB2Uni(request.getParameter("pjxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ddbh,gtxh,gtpjbh,bzdj,sl,zqje,bz,jjpjflbm,jldwbm ";
	ls_sql+=" from  jc_gtpjmx";
	ls_sql+=" where  (pjxh="+wherepjxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		gtxh=cf.fillNull(rs.getString("gtxh"));
		gtpjbh=cf.fillNull(rs.getString("gtpjbh"));
		bzdj=rs.getDouble("bzdj");
		sl=rs.getDouble("sl");
		zqje=rs.getDouble("zqje");
		bz=cf.fillNull(rs.getString("bz"));
		jjpjflbm=cf.fillNull(rs.getString("jjpjflbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_gtpjmx.jsp" name="insertform">
  <div align="center">请修改柜体配件明细</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">订单编号</font></td>
      <td width="32%"> 
        <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000CC">柜体序号</font></td>
      <td width="32%"> 
        <input type="text" name="gtxh" size="20" maxlength="11"  value="<%=gtxh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配件分类</td>
      <td width="32%"> 
        <select name="jjpjflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(jjpjflbm,gtpjbh,<%=dwstr%>);">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjpjflbm,jjpjflmc from jdm_jjpjflbm order by jjpjflbm",jjpjflbm);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">配件名称</td>
      <td colspan="3"> 
        <select name="gtpjbh" style="FONT-SIZE:12PX;WIDTH:514PX" onChange="getDj(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gtpjbh,gtpjmc||'（'||xinghao||'）'||'，价格:'||dj from jc_jjpjbj where jjpjflbm='"+jjpjflbm+"'  order by gtpjbh",gtpjbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">计量单位</td>
      <td width="32%">
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc",jldwbm);
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#0000CC">标准单价</font></td>
      <td width="32%">
        <input type="text" name="bzdj" size="20" maxlength="17"  value="<%=bzdj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">合同数量</td>
      <td width="32%">
        <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" onChange="f_wdzje(insertform)">
      </td>
      <td align="right" width="18%"><font color="#0000CC">金额</font></td>
      <td width="32%">
        <input type="text" name="je" size="20" maxlength="17"  value="<%=zqje%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherepjxh"  value="<%=wherepjxh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(insertform)">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getDj(FormName)
{
	FormName.bzdj.value="";
	FormName.je.value="";
	FormName.jldwbm.value="";

	var str="Jc_gtpjmxCx.jsp?gtpjbh="+FormName.gtpjbh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_wdzje(FormName)//参数FormName:Form的名称
{
	var je=0;
	je=FormName.bzdj.value*1.0*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtpjbh)=="") {
		alert("请输入[配件名称]！");
		FormName.gtpjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bzdj)=="") {
		alert("请输入[标准单价]！");
		FormName.bzdj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzdj, "标准单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[合同数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "合同数量"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}
	if (FormName.je.value=="0")
	{
		alert("错误！[金额]不能为0");
		FormName.bzdj.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
