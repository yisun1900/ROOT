<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String dwbh=cf.GB2Uni(request.getParameter("ssfgs"));
String whereclbm=cf.GB2Uni(request.getParameter("clbm"));
String leixing=cf.GB2Uni(request.getParameter("leixing"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrjsfs2=null;
double lrbfb=0;
String bz=null;
String jldwmc=null;
String cldlmc=null;

String ckmc=null;
String sfrk=null;
double cj=0;
double cjjsj=0;
double fgsdj=0;
double gdj=0;

double ckdj=0;
String lx="";


try {
	conn=cf.getConnection();

	ls_sql=" select lx";
	ls_sql+=" from cl_ckd";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();
	
	
	ls_sql="SELECT ckmc,sfrk,cj,cjjsj,fgsdj,cl_clbm.clbm,clmc,clgg,gdj,jldwmc,DECODE(lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,lrjsfs lrjsfs2,lrbfb,bz,cl_clbm.cldlmc  ";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and cl_clbm.clbm='"+whereclbm+"' and cl_jgmx.dwbh='"+dwbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrjsfs2=cf.fillNull(rs.getString("lrjsfs2"));
		lrbfb=rs.getDouble("lrbfb");
		bz=cf.fillNull(rs.getString("bz"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));

		ckmc=cf.fillNull(rs.getString("ckmc"));
		sfrk=cf.fillNull(rs.getString("sfrk"));
		cj=rs.getDouble("cj");
		cjjsj=rs.getDouble("cjjsj");
		fgsdj=rs.getDouble("fgsdj");
		gdj=rs.getDouble("gdj");
	}
	rs.close();
	ps.close();

	if (leixing.equals("1"))//1：正常；2：赠送
	{
		ckdj=gdj;
	}
	else{
		ckdj=0;
	}
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
<title>出库录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">出库明细(<%=ckph%>)</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">材料编码</div>
    </td>
    <td width="32%"> <%=clbm%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">材料名称</div>
    </td>
    <td width="33%"><%=clmc%>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">材料大类</div>
    </td>
    <td width="32%"> <%=cldlmc%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">材料规格</div>
    </td>
    <td width="33%"><%=clgg%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">工队价</div>
    </td>
    <td width="32%"><%=gdj%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">计量单位</div>
    </td>
    <td width="33%"><%=jldwmc%> &nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"><%=bz%>&nbsp; </td>
  </tr>
</table>
<div align="center">
		<form method="post" action="ServerCl_clbmmx.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right"><font color="red">出库单价</font></td>
        <td width="32%" > 
          <input type="text" name="gdj" value="<%=ckdj%>" size="20" maxlength="20"  onChange="dj(insertform);" readonly>
        <td width="17%" align="right">计量单位</td>
        <td width="33%" > 
          <input type="text" name="jldwmc" value="<%=jldwmc%>" size="20" maxlength="50"  readonly>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%"> 
          <div align="right"><font color="red">出库数量</font></div>
        </td>
        <td width="32%" > 
          <input type="text" name="cksl" value="" size="20" maxlength="20"  onChange="sl(insertform);" >
        <td width="17%"> 
          <div align="right"><font color="red">出库金额</font></div>
        </td>
        <td width="33%" > 
          <input type="text" name="ckje" value="" size="20" maxlength="20" readonly>
        </td>
      </tr>
      <tr align="center"> 
        <td colspan="4"> 
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="ckph" value="<%=ckph%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="clmc" value="<%=clmc%>"  >
          <input type="hidden" name="clgg" value="<%=clgg%>"  >
          <input type="hidden" name="lrjsfs" value="<%=lrjsfs2%>"  >
          <input type="hidden" name="lrbfb" value="<%=lrbfb%>"  >
          <input type="hidden" name="cldlmc" value="<%=cldlmc%>"  >

          <input type="hidden" name="ckmc" value="<%=ckmc%>"  >
          <input type="hidden" name="sfrk" value="<%=sfrk%>"  >
          <input type="hidden" name="cj" value="<%=cj%>"  >
          <input type="hidden" name="fgsdj" value="<%=fgsdj%>"  >
          <input type="hidden" name="cjjsj" value="<%=cjjsj%>"  >
		 <input type="hidden" name="leixing" value="<%=leixing%>" > 
        </td>
      </tr>
    </table>
		</form>
	</div>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function sl(FormName)
{	
	if (FormName.gdj.value!="")
	{
		FormName.ckje.value=formatDouble(FormName.cksl.value*FormName.gdj.value,2);

		if (!(isFloat(FormName.ckje,""))){
			FormName.ckje.value="";
			FormName.cksl.value="";
			FormName.cksl.focus();
			return      
		} 
	}       
}
function dj(FormName)
{	
	if (FormName.cksl.value!="")
	{
		FormName.ckje.value=formatDouble(FormName.cksl.value*FormName.gdj.value,2);

		if (!(isFloat(FormName.ckje,""))){
			FormName.ckje.value="";
			FormName.gdj.value="";
			FormName.gdj.focus();
			return      
		} 
	}       
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jldwmc)=="") {
		alert("请输入[计量单位]！");
		FormName.jldwmc.focus();
		return false;
	}

	if(	javaTrim(FormName.cksl)=="") {
		alert("请输入[出库数量]！");
		FormName.cksl.focus();
		return false;
	}
	if (!(isFloat(FormName.cksl,"出库数量"))){
		FormName.cksl.focus();     
		return      
	   }
		if(	javaTrim(FormName.gdj)=="") {
		alert("请输入[出库单价]！");
		FormName.gdj.focus();
		return false;
	}
	if (!(isFloat(FormName.gdj,"出库单价"))){
		FormName.gdj.focus();     
		return      
	   }
		if(	javaTrim(FormName.ckje)=="") {
		alert("请输入[出库金额]！");
		FormName.ckje.focus();
		return false;
	}
	if (!(isFloat(FormName.ckje,"出库金额"))){
		FormName.ckje.focus();     
		return      
	}
	lrsl=FormName.cksl.value-0;
	rdj=FormName.gdj.value-0;
	rje=FormName.ckje.value-0;

<%
	if (lx.equals("2"))//1：出库；2：退货
	{
		%>
		if (lrsl>0)
		{
			alert("因为是退货，要录入负数！！！");
			FormName.cksl.select();
			return false;
		}
		<%
	}
	else{
		%>
		if (lrsl<=0)
		{
			alert("【出库数量】必须大于零！！！");
			FormName.cksl.select();
			return false;
		}
		<%
	}
%>
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>