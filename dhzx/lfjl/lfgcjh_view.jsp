<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String lfjlh=request.getParameter("lfjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String lflxbm=null;
String smmb=null;
java.util.Date jhsmsj=null;
String jhsmry=null;
String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();


	ls_sql="select lfjlh,crm_lfjl.khbh,khxm,lflxbm,smmb,jhsmsj,jhsmry";
	ls_sql+=" from  crm_lfjl,crm_zxkhxx ";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
	ls_sql+=" and  crm_lfjl.khbh=crm_zxkhxx.khbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lflxbm=rs.getString("lflxbm");
		smmb=rs.getString("smmb");
		jhsmsj=rs.getDate("jhsmsj");
		jhsmry=rs.getString("jhsmry");
		khxm=rs.getString("khxm");
		khbh=rs.getString("khbh");
	}
	ps.close();
	rs.close();

%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
<body>
<form name="form1" action="lfgcjh_save.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">�����ƻ�</div></td>
  </tr>
   <tr>
   
 
    <td bgcolor="#FFFFFF" height=25><div align="right">�ͻ����</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right">�ͻ�����       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td width="20%" bgcolor="#FFFFFF" height=25><div align="right">��������       </div></td>
    <td width="30%" bgcolor="#FFFFFF">     
	  <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm where lflxbm='"+lflxbm+"'","");
	  %> 
    </td>
   
  
 
    <td bgcolor="#FFFFFF"><div align="right">�ƻ�����ʱ��</div></td>
    <td bgcolor="#FFFFFF"><%=jhsmsj%></td>
   </tr>
   <tr>
    <td bgcolor="#FFFFFF" height=25><div align="right">�ƻ�������Ա</div></td>
    <td bgcolor="#FFFFFF" colspan=3><%=jhsmry%></td>
   
  </tr>
 
  <tr>
	 <td width="20%" bgcolor="#FFFFFF" height=25><div align="right">����Ŀ��</div></td>
    <td width="28%" bgcolor="#FFFFFF" colspan=3> <%=smmb%></td> 
	</tr>
	
   
</table>
</form>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//����FormName:Form������
{
	if(javaTrim(FormName.lflxbm)=="")
	{
	alert("�������Ͳ���Ϊ��");
	return flase();
	}
	if(javaTrim(FormName.jhsmry)=="")
	{
	alert("�ƻ�������Ա����Ϊ��");
	return flase();
	}
	
	if(javaTrim(FormName.smmb)=="")
	{
	alert("����Ŀ�겻��Ϊ��");
	return flase();
	}
	
	if(javaTrim(FormName.jhsmsj)=="")
	{
	alert("�ƻ�����ʱ�䲻��Ϊ��");
	return flase();
	}
	if(!(isDatetime(FormName.jhsmsj, "¼��ʱ��"))) {
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
