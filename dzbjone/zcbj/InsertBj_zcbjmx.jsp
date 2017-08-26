<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String zcxmlist[]=request.getParameterValues("zcxmlist");
if (zcxmlist==null)
{
	out.println("请输入主材名称!");
	return;
}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材报价明细</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveInsertBj_zcbjmx.jsp" target="_blank">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td  width="5%">序号</td>
	  <td  width="25%">主材名称</td>
	  <td  width="9%">计量单位</td>
	  <td  width="9%">单价</td>
	  <td  width="9%">数量</td>
	  <td  width="10%">主材费</td>
	  <td  width="33%">备注</td>
</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

int pos=0;
int count=0;
int row=0;
String zcmc=null;
String jldwbm=null;
String djstr=null;
String slstr=null;
String bz=null;
String itemStr=null;
String[] itemArray=new String[5];
StringTokenizer token=null;

double dj=0;
double sl=0;
double je=0;

try {
	conn=cf.getConnection();

	for (int i=0;i<zcxmlist.length ;i++ )
	{
		itemStr=cf.GB2Uni(zcxmlist[i]);

		token=new StringTokenizer(itemStr,"^");
		itemArray=new String[5];
		int col=0;
		while (token.hasMoreTokens())
		{
			itemArray[col]=token.nextToken();
			col++;
		}

		zcmc=itemArray[0];
		jldwbm=itemArray[1];
		djstr=itemArray[2];
		slstr=itemArray[3];
		bz=cf.fillNull(itemArray[4]);

		dj=Double.parseDouble(djstr.trim());
		sl=Double.parseDouble(slstr.trim());
		je=cf.doubleTrim(dj*sl);

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}
		count=0;
%>
			
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=(i+1)%></td>
      <td>
		  <input type="text" name="zcmc" size="40" maxlength="50" value="<%=zcmc%>">
	  </td>
      <td>
		  <input type="text" name="jldwbm" size="8" maxlength="20" value="<%=jldwbm%>">
	  </td>
      <td>
		  <input type="text" name="dj" size="8" maxlength="16" value="<%=dj%>">
	  </td>
      <td>
		<input type="text" name="sl" size="8" maxlength="8" value="<%=sl%>">
	  </td>
      <td>
		<input type="text" name="je" size="9" maxlength="16" value="<%=je%>">
	  </td>
      <td>
		<input type="text" name="bz" size="45" maxlength="300" value="<%=bz%>">
	  </td>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<tr bgcolor="#FFFFFF">
<td colspan="8" > 
<input type="hidden" name="khbh"  value="<%=khbh%>">
<input type="hidden" name="dqbm"  value="<%=dqbm%>">
<input type=button value='存盘' onclick="f_do(listform)"  name="savebutton">
<input type="button"  value="允许再次存盘" onclick="savebutton.disabled=false">
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

	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
