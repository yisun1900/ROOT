<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=null;
String fgsbh=null;
String slr=null;
String jhlqrq=null;
String lrr=null;
String lrrq=null;
String sfxsp=null;
String bz=null;

String ejspr=null;
String ejspsj=null;
String ejspjl=null;
String ejspsm=null;

String sjspr=null;
String sjspsj=null;
String sjspjl=null;
String sjspsm=null;

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,fgsbh,slr,jhlqrq,lrr,lrrq,sfxsp,bz,ejspr,ejspsj,ejspjl,ejspsm,sjspr,sjspsj,sjspjl,sjspsm ";
	ls_sql+=" from  oa_xcplqsq";
	ls_sql+=" where  (sqxh="+sqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		slr=cf.fillNull(rs.getString("slr"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		bz=cf.fillNull(rs.getString("bz"));

		ejspr=cf.fillNull(rs.getString("ejspr"));
		ejspsj=cf.fillNull(rs.getDate("ejspsj"));
		ejspjl=cf.fillNull(rs.getString("ejspjl"));
		ejspsm=cf.fillNull(rs.getString("ejspsm"));

		sjspr=cf.fillNull(rs.getString("sjspr"));
		sjspsj=cf.fillNull(rs.getDate("sjspsj"));
		sjspjl=cf.fillNull(rs.getString("sjspjl"));
		sjspsm=cf.fillNull(rs.getString("sjspsm"));
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
<title>审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" >
  <div align="center">印刷品领取申请---一级审批</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">印刷品编码</td>
	<td  width="8%">是否需审批</td>
	<td  width="20%">印刷品名称</td>
	<td  width="20%">印刷品分类</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">单价</td>
	<td  width="8%">计划领取数量</td>
	<td  width="8%">实领取数量</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT oa_xcplqmx.xcpbm,DECODE(sfxsp,'N','不需要','Y','需要'),oa_xcplqmx.xcpmc,oa_xcpflbm.xcpflmc,oa_xcplqmx.jldw,TO_CHAR(oa_xcplqmx.dj),oa_xcplqmx.jhlqsl,oa_xcplqmx.slqsl  ";
	ls_sql+=" FROM oa_xcpflbm,oa_xcplqmx  ";
    ls_sql+=" where oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcplqmx.sqxh="+sqxh;
    ls_sql+=" order by oa_xcplqmx.xcpbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();


%>
</table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">申领单位</font></td>
      <td width="35%"> <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ",dwbh,true);
%> </td>
      <td align="right" width="15%"><font color="#0000CC">申领分公司</font></td>
      <td width="35%"> <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ",fgsbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">申领人</font></td>
      <td width="35%"> <%=slr%> </td>
      <td align="right" width="15%"><font color="#0000CC">计划领取日期</font></td>
      <td width="35%"> <%=jhlqrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">录入人</font></td>
      <td width="35%"> <%=lrr%> </td>
      <td align="right" width="15%"><font color="#0000CC">录入日期</font></td>
      <td width="35%"> <%=lrrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">是否需审批</font></td>
      <td width="35%"><%
	cf.radioToken(out,"N+不需要&Y+需要",sfxsp,true);
%></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">备注</font></td>
      <td colspan="3"> <%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">二级审批人</font></td>
      <td width="35%"> <%=ejspr%> </td>
      <td align="right" width="15%"><font color="#0000CC">二级审批时间</font></td>
      <td width="35%"> <%=ejspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">二级审批结论</font></td>
      <td width="35%"><%
	cf.radioToken(out,"1+同意&2+返回上级&3+撤销",ejspjl,true);
%></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">二级审批说明</font></td>
      <td colspan="3"> <%=ejspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">三级审批人</font></td>
      <td width="35%"> <%=sjspr%> </td>
      <td align="right" width="15%"><font color="#0000CC">三级审批时间</font></td>
      <td width="35%"> <%=sjspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">三级审批结论</font></td>
      <td width="35%"><%
	cf.radioToken(out,"1+同意&2+返回上级&3+撤销",sjspjl,true);
%></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">三级审批说明</font></td>
      <td colspan="3"> <%=sjspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font>审批人</td>
      <td width="35%"> 
        <input type="text" name="yjspr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0033">*</font>审批时间</td>
      <td width="35%"> 
        <input type="text" name="yjspsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font>审批结论</td>
      <td width="35%"><%
	cf.radioToken(out, "yjspjl","1+同意&2+返回上级&3+撤销","");
%></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">审批说明</td>
      <td colspan="3"> 
        <textarea name="yjspsm" cols="71" rows="3"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="button"  value="完成审批" onClick="f_do(editform)">
        </div>
      </td>
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
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.yjspr)=="") {
		alert("请输入[审批人]！");
		FormName.yjspr.focus();
		return false;
	}
	if(	javaTrim(FormName.yjspsj)=="") {
		alert("请输入[审批时间]！");
		FormName.yjspsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjspsj, "审批时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.yjspjl)) {
		alert("请选择[审批结论]！");
		FormName.yjspjl[0].focus();
		return false;
	}

	FormName.action="SaveYsOa_xcplqsq.jsp"
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
