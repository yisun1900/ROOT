<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdmc=cf.GB2Uni(request.getParameter("cxhdmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">促销活动《只能多选一》赠送信息(<%=cxhdmc%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="37%">赠送项目</td>
	<td  width="7%">计量单位</td>
	<td  width="7%">成本单价</td>
	<td  width="7%">市场单价</td>
	<td  width="6%">数量下限</td>
	<td  width="6%">数量上限</td>
	<td  width="30%">备注</td>
</tr>
<%

try {
	conn=cf.getConnection();

	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String bz=null;
	int row=0;

	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz";
	ls_sql+=" FROM jc_hddxzsxx  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillNull(rs.getString("bz"));

		row++;


		%>
		<tr align="center">
			<td>
				<input type="text" name="zsxm" value="<%=zsxm%>" size="50" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><input name="jldw" type="text" value="<%=jldw%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" size="8" maxlength="20" ></td>
			<td>
				<input type="text" name="cbdj" value="<%=cbdj%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><input type="text" name="scdj" value="<%=scdj%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			<td><input type="text" name="zsslxx" value="<%=zsslxx%>" size="4" maxlength="5" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			<td>
				<input type="text" name="zsslsx" value="<%=zsslsx%>" size="5" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><input type="text" name="bz" value="<%=bz%>" size="38" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	for (int i=row;i<50 ;i++ )
	{
		%>
		<tr align="center">
			<td>
				<input type="text" name="zsxm" value="" size="50" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><input name="jldw" type="text" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" size="8" maxlength="20" ></td>
			<td>
				<input type="text" name="cbdj" value="" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><input type="text" name="scdj" value="" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			<td><input type="text" name="zsslxx" value="" size="5" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			<td>
				<input type="text" name="zsslsx" value="" size="5" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
			<td><input type="text" name="bz" value="" size="38" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
		</tr>
		<%
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
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
<tr bgcolor="#FFFFFF"> 
      <td colspan="15" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="cxhdbm" value="<%=cxhdbm%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="zsslsx">      </td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	FormName.action="SaveInsertJc_hddxzsxx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

