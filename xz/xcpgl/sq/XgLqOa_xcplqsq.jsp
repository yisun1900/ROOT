<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>领取</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" >
  <div align="center">印刷品领取申请---修改领取</div>
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

String yjspr=null;
String yjspsj=null;
String yjspjl=null;
String yjspsm=null;

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
	ls_sql="select dwbh,fgsbh,slr,jhlqrq,lrr,lrrq,sfxsp,bz,yjspr,yjspsj,yjspjl,yjspsm,ejspr,ejspsj,ejspjl,ejspsm,sjspr,sjspsj,sjspjl,sjspsm ";
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

		yjspr=cf.fillNull(rs.getString("yjspr"));
		yjspsj=cf.fillNull(rs.getDate("yjspsj"));
		yjspjl=cf.fillNull(rs.getString("yjspjl"));
		yjspsm=cf.fillNull(rs.getString("yjspsm"));

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

%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
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
	String bg1="E8E8FF";
	String bg2="FFFFFF";

	String xcpbm=null;
	String sfxspmc=null;
	String xcpmc=null;
	String xcpflmc=null;
	String jldw=null;
	double dj=0;
	double jhlqsl=0;
	double slqsl=0;

	int row=0; 

	ls_sql="SELECT oa_xcplqmx.xcpbm,DECODE(sfxsp,'N','不需要','Y','需要') sfxspmc,oa_xcplqmx.xcpmc,oa_xcpflbm.xcpflmc,oa_xcplqmx.jldw,oa_xcplqmx.dj,oa_xcplqmx.jhlqsl,oa_xcplqmx.slqsl  ";
	ls_sql+=" FROM oa_xcpflbm,oa_xcplqmx  ";
    ls_sql+=" where oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcplqmx.sqxh="+sqxh;
    ls_sql+=" order by oa_xcplqmx.xcpbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;
		xcpbm=cf.fillNull(rs.getString("xcpbm"));
		sfxspmc=cf.fillNull(rs.getString("sfxspmc"));
		xcpmc=cf.fillNull(rs.getString("xcpmc"));
		xcpflmc=cf.fillNull(rs.getString("xcpflmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		jhlqsl=rs.getDouble("jhlqsl");
		slqsl=rs.getDouble("slqsl");

		%>
		<tr align="center" bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td><%=row%></td>
		<td><%=xcpbm%>
			<input type="hidden" name="xcpbm" value="<%=xcpbm%>">
		</td>
		<td><%=sfxspmc%></td>
		<td><%=xcpmc%></td>
		<td><%=xcpflmc%></td>
		<td><%=jldw%></td>
		<td><%=dj%></td>
		<td><%=jhlqsl%></td>
		<td> 
			<input type="text" name="slqsl" size="16" maxlength="10" value="<%=slqsl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
		</td>
		</tr>
		<%
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
      <td align="right" width="15%"><font color="#0000CC">一级审批人</font></td>
      <td width="35%"> <%=yjspr%> </td>
      <td align="right" width="15%"><font color="#0000CC">一级审批时间</font></td>
      <td width="35%"> <%=yjspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">一级审批结论</font></td>
      <td width="35%"><%
	cf.radioToken(out,"1+同意&2+返回上级&3+撤销",yjspjl,true);
%></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">一级审批说明</font></td>
      <td colspan="3"> <%=yjspsm%> </td>
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
      <td align="right" width="15%"><font color="#CC0033">*</font>办理人</td>
      <td width="35%"> 
        <input type="text" name="blr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0033">*</font>领取时间</td>
      <td width="35%"> 
        <input type="text" name="lqsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="button"  value="领取" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.blr)=="") {
		alert("请输入[办理人]！");
		FormName.blr.focus();
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("请输入[领取时间]！");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "领取时间"))) {
		return false;
	}

	FormName.action="SaveXgLqOa_xcplqsq.jsp"
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
