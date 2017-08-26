<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gtxh=null;
String ddbh=null;
String gtmc=null;
String jjazwz=null;
String guige=null;
String jjlx=null;
String bcpp=null;
String bclx=null;
String bcys=null;
double bcbfje=0;
double pjbfje=0;
double zj=0;
double zqbcbfje=0;
double zqpjbfje=0;
double zqzj=0;
String bz=null;
String wheregtxh=cf.GB2Uni(request.getParameter("gtxh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lx=null;
	ls_sql="select lx ";
	ls_sql+=" from  jc_gtzjxmx";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and gtxh='"+wheregtxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();
	if (lx.equals("1"))//1：减项；2：增项
	{
		out.println("错误！减项不能修改明细");
		return;
	}

	ls_sql="select gtxh,ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bcbfje,pjbfje,zj,zqbcbfje,zqpjbfje,zqzj,bz ";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where  (gtxh='"+wheregtxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		gtmc=cf.fillNull(rs.getString("gtmc"));
		jjazwz=cf.fillNull(rs.getString("jjazwz"));
		guige=cf.fillNull(rs.getString("guige"));
		jjlx=cf.fillNull(rs.getString("jjlx"));
		bcpp=cf.fillNull(rs.getString("bcpp"));
		bclx=cf.fillNull(rs.getString("bclx"));
		bcys=cf.fillNull(rs.getString("bcys"));
		bcbfje=rs.getDouble("bcbfje");
		pjbfje=rs.getDouble("pjbfje");
		zj=rs.getDouble("zj");
		zqbcbfje=rs.getDouble("zqbcbfje");
		zqpjbfje=rs.getDouble("zqpjbfje");
		zqzj=rs.getDouble("zqzj");
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
<form method="post" action="" name="editform" target="_blank">
  <div align="center"></div>  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="center" colspan="4">修改柜体信息（增减项序号：<%=zjxxh%>）</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">柜体序号</font></td>
      <td width="32%"> 
        <input type="text" name="gtxh" size="20" maxlength="11"  value="<%=gtxh%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#0000FF">订单编号</font></td>
      <td width="32%"> 
        <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>柜体名称</td>
      <td width="32%"> 
        <input type="text" name="gtmc" size="20" maxlength="50"  value="<%=gtmc%>" >
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>安装位置</td>
      <td width="32%"> 
        <select name="jjazwz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjazwzmc c1,jjazwzmc c2 from jdm_jjazwzbm order by jjazwzmc",jjazwz);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">规格</td>
      <td width="32%"> 
        <input type="text" name="guige" size="20" maxlength="50"  value="<%=guige%>" >
      </td>
      <td align="right" width="18%">家具系列</td>
      <td width="32%"> 
        <select name="jjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjlbmc c1,jjlbmc c2 from jdm_jjlbbm order by jjlbmc",jjlx);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>板材类型</td>
      <td width="32%"> 
        <select name="bclx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="<%=bclx%>"><%=bclx%></option>
        </select>
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>板材颜色</td>
      <td width="32%"> 
        <select name="bcys" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gtbcysmc c1,gtbcysmc c2 from jdm_gtbcysbm order by gtbcysmc",bcys);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">板材部分金额</font></td>
      <td width="32%"> <%=zqbcbfje%></td>
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">配件部分金额</font></td>
      <td width="32%"> <%=zqpjbfje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">总价</font></td>
      <td width="32%"> <%=zqzj%></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
		<input type="hidden" name="wheregtxh"  value="<%=wheregtxh%>" >
		<input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
		  &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" name="lrbj" value="录入板件" onClick="f_lrbj(editform)">
          <input type="button" name="copybj" value="Excel拷贝板件" onClick="f_copybj(editform)">
		  &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" name="lrpj" value="录入配件" onClick="f_lrpj(editform)">
          <input type="button" name="copypj" value="Excel拷贝配件" onClick="f_copypj(editform)">
          <input type="button" name="ckpj" value="查看配件" onClick="f_ckpj(editform)">
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

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtmc)=="") {
		alert("请输入[柜体名称]！");
		FormName.gtmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jjazwz)=="") {
		alert("请输入[安装位置]！");
		FormName.jjazwz.focus();
		return false;
	}
	if(	javaTrim(FormName.bclx)=="") {
		alert("请输入[板材类型]！");
		FormName.bclx.focus();
		return false;
	}
	if(	javaTrim(FormName.bcys)=="") {
		alert("请输入[板材颜色]！");
		FormName.bcys.focus();
		return false;
	}

	FormName.action="SaveEditJc_jjgtmx.jsp";
	FormName.submit();
	return true;
}
function f_lrbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="InsertJc_gtbjmxMain.jsp";
	FormName.submit();
	return true;
}
function f_copybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="EnetrExcelCopyBj.jsp";
	FormName.submit();
	return true;
}

function f_lrpj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="InsertJc_gtpjmxMain.jsp";
	FormName.submit();
	return true;
}
function f_copypj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="EnetrExcelCopyPj.jsp";
	FormName.submit();
	return true;
}
function f_ckpj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="Jc_gtpjmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
