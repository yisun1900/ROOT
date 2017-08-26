<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=null;
String fwdz=null;
String hth=null;
String smhtbh=null;
String sfzhm=null;
String kgsjqd=null;
String jyjdrq=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String gqts=null;



String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,hth,smhtbh,sfzhm,kgsjqd,jyjdrq,qyrq,kgrq,jgrq,gqts ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));

		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		gqts=cf.fillNull(rs.getString("gqts"));

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
		if (ps!= null) ps.close(); 
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

<body bgcolor="#CCCCFF">
<form method="post" action="" name="insertform" >
      <div align="center"> 确定开工时间（客户编号：<%=khbh%>）（<font color="#FF0033">*</font>为必填字段）</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">合同号</font></td>
      <td width="34%"><%=hth%></td>
      <td width="19%" align="right"><font color="#0000FF">书面合同编号</font></td>
      <td width="31%"><%=smhtbh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">客户姓名</font>      </td>
      <td width="34%"><%=khxm%>      </td>
      <td width="19%" align="right"><font color="#0000FF">业主身份证号码</font></td>
      <td width="31%"><%=sfzhm%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
  </TABLE>

<BR>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>开工时间</td>
      <td width="34%"><%
	cf.radioToken(out, "kgsjqd","Y+已确定&N+未确定",kgsjqd);
%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工期天数</td>
      <td width="31%">
        <input type="text" name="gqts" value="<%=gqts%>" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>建议交底日期      </td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="<%=jyjdrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">签约日期</font> </td>
      <td width="31%">
      <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>合同开工日期      </td>
      <td width="34%"> 
        <input type="text" name="kgrq" size="20" maxlength="10"  value="<%=kgrq%>" onDblClick="JSCalendar(this)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>合同竣工日期      </td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10"  value="<%=jgrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button"  value="保存" onClick="f_do(insertform)">
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
	if(	!radioChecked(FormName.kgsjqd)) {
		alert("请选择[开工时间]！");
		FormName.kgsjqd[0].focus();
		return false;
	}


	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("请输入[建议交底日期]！");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("请输入[合同开工日期]！");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "合同开工日期"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("请输入[合同竣工日期]！");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "合同竣工日期"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[建议交底日期]应大于[签约日期]！");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[合同开工日期]应大于[建议交底日期]！");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[合同竣工日期]应大于[合同开工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[建议交底日期]！");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同开工日期]！");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同竣工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}


	if(	javaTrim(FormName.gqts)=="") {
		alert("请选择[工期天数]！");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "工期天数"))) {
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
