<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010118")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ÿ��ҵ����תʱ��(<%=dwbh%>)</font></B>

<form method="POST" name="listform" action="" >
<table border="1" cellspacing="0" cellpadding="1" width="50%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50%">��ת���ڣ�1��31��֮�䣩</td>
	<td  width="50%">��תʱ�䣨0��23��֮�䣩</td>
</tr>
<%

try {
	conn=cf.getConnection();

	String jzrq=null;
	String jzsj=null;

	int row=0;

	ls_sql="SELECT jzrq,jzsj ";
	ls_sql+=" FROM sq_yjjzsj  ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" order by jzrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jzrq=cf.fillNull(rs.getString("jzrq"));
		jzsj=cf.fillNull(rs.getString("jzsj"));

		row++;


		%>
		<tr align="center">
			<td>
				<input name="jzrq" type="text" value="<%=jzrq%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" size="8" maxlength="2" >
			</td>
			<td>
				<input type="text" name="jzsj" value="<%=jzsj%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			
			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	for (int i=row;i<5 ;i++ )
	{
		%>
		<tr align="center">
			<td>
				<input name="jzrq" type="text" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" size="8" maxlength="2" >
			</td>
			<td>
				<input type="text" name="jzsj" value="" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >			
			</td>
		</tr>
		<%
	}
}
catch (Exception e) {
	out.print("��������: " + e);
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
      <td colspan="14" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="dwbh" value="<%=dwbh%>">
	  <input type=button value=' �� �� ' onClick="f_do(listform)" >
	  </td>
    </tr>
</table>
</form>
</CENTER>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.jzrq[0])=="") {
		alert("������[��ת����]��");
		FormName.jzrq[0].focus();
		return false;
	}
	if(!(isNumber(FormName.jzrq[0], "��ת����"))) {
		return false;
	}
	if (parseFloat(FormName.jzrq[0].value) <=0 || parseFloat(FormName.jzrq[0].value) >31)
	{
		alert("����[��ת����]Ӧ����1��31��֮�䣡");
		FormName.jzrq[0].select();
		return false;
	}

	if(	javaTrim(FormName.jzsj[0])=="") {
		alert("������[��תʱ��]��");
		FormName.jzsj[0].focus();
		return false;
	}
	if(!(isNumber(FormName.jzsj[0], "��תʱ��"))) {
		return false;
	}
	if (parseFloat(FormName.jzsj[0].value) <0 || parseFloat(FormName.jzsj[0].value) >23)
	{
		alert("����[��תʱ��]Ӧ����0��23��֮�䣡");
		FormName.jzsj[0].select();
		return false;
	}

	for (var i=0;i<5 ;i++ )
	{
		if(	javaTrim(FormName.jzrq[i])!="") 
		{
			if(!(isNumber(FormName.jzrq[i], "��ת����"))) {
				return false;
			}
			if (parseFloat(FormName.jzrq[i].value) <=0 || parseFloat(FormName.jzrq[i].value) >31)
			{
				alert("����[��ת����]Ӧ����1��31��֮�䣡");
				FormName.jzrq[i].select();
				return false;
			}
		}

		if(	javaTrim(FormName.jzsj[i])!="") 
		{
			if(!(isNumber(FormName.jzsj[i], "��תʱ��"))) {
				return false;
			}
			if (parseFloat(FormName.jzsj[i].value) <0 || parseFloat(FormName.jzsj[i].value) >23)
			{
				alert("����[��תʱ��]Ӧ����0��23��֮�䣡");
				FormName.jzsj[i].select();
				return false;
			}
		}

	}
	FormName.action="SaveEditJzsjSq_dwxx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

