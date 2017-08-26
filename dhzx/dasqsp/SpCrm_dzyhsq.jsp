<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String sqr=null;
String sqsj=null;
double sqzkl=0;
double sqzjxzkl=0;
String sfsqqtyh=null;
String sqqtyhnr=null;
String sqyysm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String zklx=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String zxdm=null;
String sjs=null;
String xxlrr=null;
String xxlrsj=null;
String zxdjbm=null;
String ssfgs=null;
String dqbm=null;

try {
	conn=cf.getConnection();
	ls_sql="select sqr,sqsj,sqzkl,sqzjxzkl,sfsqqtyh,sqqtyhnr,sqyysm,lrr,lrsj,lrbm,zklx ";
	ls_sql+=" from  crm_dzyhsq";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqr=cf.fillNull(rs.getString("sqr"));
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqzkl=rs.getDouble("sqzkl");
		sqzjxzkl=rs.getDouble("sqzjxzkl");
		sfsqqtyh=cf.fillNull(rs.getString("sfsqqtyh"));
		sqqtyhnr=cf.fillNull(rs.getString("sqqtyhnr"));
		sqyysm=cf.fillNull(rs.getString("sqyysm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();



	ls_sql="select khxm,xb,fwdz,lxfs,zxdm,sjs,lrr,lrsj,zxdjbm,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		xxlrr=cf.fillNull(rs.getString("lrr"));
		xxlrsj=cf.fillNull(rs.getDate("lrsj"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>ls_sql= " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
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
<title>打折优惠申请--审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveSpCrm_dzyhsq.jsp" name="editform">
  <div align="center">打折优惠申请--审批
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        客户编号      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="19%" align="right"> 
        客户姓名      </td>
      <td width="31%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right" bgcolor="#CCCCFF"> 
        性别      </td>
      <td width="31%"> <%
	cf.radioToken(out, "M+男&W+女",xb,true);
%> </td>
      <td width="19%" align="right"> 
        联系方式      </td>
      <td width="31%"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        房屋地址      </td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        咨询店面      </td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
      <td width="19%" align="right"> 
        设计师      </td>
      <td width="31%"><%=sjs%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        录入时间      </td>
      <td width="31%"> <%=xxlrsj%> </td>
      <td width="19%" align="right"> 
        信息录入人      </td>
      <td width="31%"><%=xxlrr%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">申请人</td>
      <td width="31%"> <%=sqr%> </td>
      <td align="right" width="19%">申请时间</td>
      <td width="31%"> <%=sqsj%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">折扣类型</td>
      <td width="31%"><%
	cf.radioToken(out, "zklx","1+全额折扣&2+单项折扣",zklx,true);
%> </td>
      <td align="right" width="19%">是否申请其它优惠</td>
      <td width="31%"><%
	cf.radioToken(out, "sfsqqtyh","Y+是&N+否",sfsqqtyh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">申请其它优惠内容</td>
      <td colspan="3"> <%=sqqtyhnr%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">申请原因说明</td>
      <td colspan="3"> <%=sqyysm%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">录入人</td>
      <td width="31%"> <%=lrr%> </td>
      <td align="right" width="19%">录入时间</td>
      <td width="31%"> <%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">录入部门</td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>审批结果</td>
      <td width="31%"> 
        <input type="radio" name="spjg" value="1">
        同意 
        <input type="radio" name="spjg" value="2" >
        不同意 </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">申请合同折扣</font></td>
      <td><%=sqzkl%></td>
      <td align="right"><font color="#000099">申请增减项折扣</font></td>
      <td><%=sqzjxzkl%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>审批合同折扣</td>
      <td><input type="text" name="spzkl" size="12" maxlength="9"  value="<%=sqzkl%>" >
（>0且<=10）</td>
      <td align="right"><font color="#FF0000">*</font>审批增减项折扣率</td>
      <td><input type="text" name="spzjxzkl" value="<%=sqzjxzkl%>" size="12" maxlength="9" >
（>0且<=10）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>是否批准其它优惠</td>
      <td><%
	cf.radioToken(out, "sfpzqtyh","Y+是&N+否",sfsqqtyh);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">批准其它优惠内容</td>
      <td colspan="3"> 
        <textarea name="pzqtyhnr" cols="74" rows="3"><%=sqqtyhnr%></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">审批说明</td>
      <td colspan="3"> 
        <textarea name="spsm" cols="74" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#000099">审批人</font></td>
      <td width="31%"> 
        <input type="text" name="spr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#000099">审批时间</font></td>
      <td width="31%"> 
        <input type="text" name="spsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>      </td>
    </tr>

    <tr> 
      <td colspan="4" align="center" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
      <input type="hidden" name="zklx"  value="<%=zklx%>" >      </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	!radioChecked(FormName.spjg)) {
		alert("请选择[审批结果]！");
		FormName.spjg[0].focus();
		return false;
	}

	if(	javaTrim(FormName.spzkl)=="") {
		alert("请输入[合同折扣率]！");
		FormName.spzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.spzkl, "合同折扣率"))) {
		return false;
	}
	if (FormName.spzkl.value<=0 || FormName.spzkl.value>10)
	{
		alert("错误！[合同折扣率]应该在0和10之间！");
		FormName.spzkl.select();
		return false;
	}

	if(	javaTrim(FormName.spzjxzkl)=="") {
		alert("请输入[增减项折扣率]！");
		FormName.spzjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.spzjxzkl, "增减项折扣率"))) {
		return false;
	}
	if (FormName.spzjxzkl.value<=0 || FormName.spzjxzkl.value>10)
	{
		alert("错误！[增减项折扣率]应该在0和10之间！");
		FormName.spzjxzkl.select();
		return false;
	}


	if(	!radioChecked(FormName.sfpzqtyh)) {
		alert("请选择[是否批准其它优惠]！");
		FormName.sfpzqtyh[0].focus();
		return false;
	}
	if (FormName.sfpzqtyh[0].checked)
	{
		if(	javaTrim(FormName.pzqtyhnr)=="") {
			alert("请输入[批准其它优惠内容]！");
			FormName.pzqtyhnr.focus();
			return false;
		}
	}
	else{
		FormName.pzqtyhnr.value="";
	}

	if(	javaTrim(FormName.spr)=="") {
		alert("请输入[审批人]！");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("请输入[审批时间]！");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
