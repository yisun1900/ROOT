<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String azr=null;
String sazrq=null;
String azsm=null;
String aztzr=null;
String kazsj=null;
String jhazrq=null;
String aztzsj=null;
String ksazsj=null;
String ycyybm=null;
String clzt=null;
String ycclzt=null;

String ychssj=null;
String ychsr=null;
String ychsqk=null;
String zsycyybm=null;
String sfxwyj=null;
String wyj=null;
String jjfa=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ksazsj,ycyybm,azr,sazrq,azsm,aztzr,kazsj,aztzsj,jhazrq,ycclzt,ychssj,ychsr,ychsqk,zsycyybm,sfxwyj,wyj,jjfa";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		azr=cf.fillNull(rs.getString("azr"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));

		ychssj=cf.fillNull(rs.getDate("ychssj"));
		ychsr=cf.fillNull(rs.getString("ychsr"));
		ychsqk=cf.fillNull(rs.getString("ychsqk"));
		zsycyybm=cf.fillNull(rs.getString("zsycyybm"));
		sfxwyj=cf.fillNull(rs.getString("sfxwyj"));
		wyj=cf.fillNull(rs.getString("wyj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<html>
<head>
<title>橱柜订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
  
<form method="post" action="" name="selectform" >
<div align="center">橱柜订单处理--修改延迟处理（订单编号：<%=ddbh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">协商安装时间</span></td>
      <td bgcolor="#CCCCFF"><%=kazsj%></td>
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">合同安装时间</span></td>
      <td bgcolor="#CCCCFF"><%=jhazrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">发安装通知人</span></td>
      <td bgcolor="#CCCCFF"><%=aztzr%></td>
      <td align="right" bgcolor="#CCCCFF"><span class="STYLE1">发安装通知时间</span></td>
      <td bgcolor="#CCCCFF"><%=aztzsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#CCCCFF">安装开始时间</td>
      <td bgcolor="#CCCCFF"><%=ksazsj%></td>
      <td align="right" bgcolor="#CCCCFF">安装完成时间</td>
      <td bgcolor="#CCCCFF"><%=sazrq%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#CCCCFF"> 延迟原因</td>
      <td bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",ycyybm,true);
%>      </td>
      <td align="right" bgcolor="#CCCCFF"> 延迟处理状态</td>
      <td bgcolor="#CCCCFF"><%
	cf.radioToken(out, "0+未延迟&1+延迟未核实&2+延迟原因属实&3+延迟原因不属实",ycclzt,true);
%>      </td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#CCCCFF">安装说明</td>
      <td colspan="3"><%=azsm%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">延迟核实时间</td>
      <td width="33%"> 
        <input type="text" name="ychssj" size="20" maxlength="10" value="<%=ychssj%>" readonly>      </td>
      <td width="23%" bgcolor="#E8E8FF" align="right">延迟核实人</td>
      <td width="35%"> 
        <input type="text" name="ychsr" size="20" maxlength="10" value="<%=ychsr%>" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">延迟原因是否属实</td>
      <td width="33%"> 
        <select name="ycclzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectToken(out,"2+延迟原因属实&3+延迟原因不属实",ycclzt);
%> 
        </select>      </td>
      <td width="23%" bgcolor="#E8E8FF" align="right">真实延迟原因</td>
      <td width="35%"> 
        <select name="zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",zsycyybm);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="22%">延迟核实情况</td>
      <td colspan="3"> 
        <textarea name="ychsqk" cols="71" rows="5"><%=ychsqk%></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">否支付违约金</td>
      <td>
<%
	cf.radioToken(out,"sfxwyj","Y+需要&N+不需要",sfxwyj);
%>      </td>
      <td bgcolor="#E8E8FF" align="right">违约金</td>
      <td><input type="text" name="wyj" size="20" maxlength="10" value="<%=wyj%>" ></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right">解决方案</td>
      <td colspan="3"><textarea name="jjfa" cols="71" rows="3"><%=jjfa%></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td height="39" colspan="4" align="center"> 
        <input type="button"  value="存 盘" onClick="f_do(selectform)">
        <input type="reset" name="Reset" value="重输">        
		<input type="hidden" name="ddbh"  value="<%=ddbh%>" >      
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
	if(	javaTrim(FormName.ychssj)=="") {
		alert("请输入[延迟核实时间]！");
		FormName.ychssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ychssj, "延迟核实时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ychsr)=="") {
		alert("请输入[延迟核实人]！");
		FormName.ychsr.focus();
		return false;
	}

	if(	javaTrim(FormName.ycclzt)=="") {
		alert("请输入[延迟原因是否属实]！");
		FormName.ycclzt.focus();
		return false;
	}
	if(	javaTrim(FormName.zsycyybm)=="") {
		alert("请输入[真实延迟原因]！");
		FormName.zsycyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.ychsqk)=="") {
		alert("请输入[延迟核实情况]！");
		FormName.ychsqk.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfxwyj)) {
		alert("请选择[否支付违约金]！");
		FormName.sfxwyj[0].focus();
		return false;
	}
	if (FormName.sfxwyj[0].checked)
	{
		if(	javaTrim(FormName.wyj)=="") {
			alert("请输入[违约金]！");
			FormName.wyj.focus();
			return false;
		}
		if(!(isFloat(FormName.wyj, "违约金"))) {
			return false;
		}
		if(	javaTrim(FormName.jjfa)=="") {
			alert("请输入[解决方案]！");
			FormName.jjfa.focus();
			return false;
		}
	}
	else{
		FormName.wyj.value="";
		FormName.jjfa.value="";
	}

	FormName.action="SaveXgHsJc_cgdd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
