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
  <B><font size="3">促销活动部分报价项目打折(<%=cxhdmc%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="40%">项目分类</td>
	<td  width="30%">折扣<b><font color="#0000FF">（>=0且<=10）</font></b></td>
</tr>
<%

try {
	conn=cf.getConnection();

	String xmflbm=null;
	double zk=0;
	int row=0;

	ls_sql="SELECT xmflbm,zk";
	ls_sql+=" FROM jc_hdbfxmdz  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  xmflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		zk=rs.getDouble("zk");

		row++;


		%>
		<tr align="center">
			<td>
                <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:252PX">
				  <option value=''></option>
          <%
	cf.selectItem(out,"select xmflbm c1,xmflmc c2 from bdm_xmflbm order by xmflbm",xmflbm);
%> 
                </select>			</td>
			<td>
				<input type="text" name="zk" value="<%=zk%>" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	for (int i=row;i<10 ;i++ )
	{
		%>
		<tr align="center">
			<td>
                <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:252PX">
				  <option value=''></option>
          <%
	cf.selectItem(out,"select xmflbm c1,xmflmc c2 from bdm_xmflbm order by xmflbm","");
%> 
                </select>			</td>
			<td>
				<input type="text" name="zk" value="" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			</td>
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
      <td colspan="12" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="cxhdbm" value="<%=cxhdbm%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">      </td>
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
	FormName.action="SaveInsertJc_hdbfxmdz.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

