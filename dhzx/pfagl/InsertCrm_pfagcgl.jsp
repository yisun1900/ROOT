<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ƻ�¼��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String khxm=null;
String smmb=null;
java.util.Date ysmsj=null;
String ysmry=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select khxm";
	ls_sql+=" from  crm_zxkhxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
	}
	ps.close();
	rs.close();
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
<form name="form1" action="SaveInsertCrm_pfagcgl.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">�������ƻ�¼��</div></td>
  </tr>
   <tr>
   
 
    <td bgcolor="#FFFFFF" height=25><div align="right">�ͻ����</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right">�ͻ�����       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
   
    <td bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>�ƻ�������ʱ��</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="jhsj" ondblclick="JSCalendar(this)"/></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>����������       </div></td>
    <td width="30%" bgcolor="#FFFFFF">      <select name="pfalxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option></option>
	  <%
		cf.selectItem(out,"select pfalxbm,pfalxmc from dm_pfalxbm ","");
	%> 
    </select></td>
   </tr>
   <tr>
    <td bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>�ƻ��μ���Ա</div></td>
    <td bgcolor="#FFFFFF" colspan=3><input type="text" name="jhry" /></td>
   
  </tr>
 
  <tr>
	 <td width="20%" bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>����������</div></td>
    <td width="28%" bgcolor="#FFFFFF" colspan=3> <textarea name="pfanr" style="width:70%" rows="6"></textarea></td> 
	</tr>
	<tr>
    <td colspan="4" bgcolor="#FFFFFF">      <div align="center">
        <input type="button" name="Submit" value="�ύ" onclick="f_do(form1)"/>
		 <input type="hidden" name="khbh" value="<%=khbh%>" />
      </div></td></tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//����FormName:Form������
{
	if(javaTrim(FormName.pfalxbm)=="")
	{
	alert("���������Ͳ���Ϊ��");
	return flase();
	}
	if(javaTrim(FormName.jhry)=="")
	{
	alert("�ƻ��μ���Ա����Ϊ��");
	return flase();
	}
	
	if(javaTrim(FormName.pfanr)=="")
	{
	alert("���������ݲ���Ϊ��");
	return flase();
	}
	
	if(javaTrim(FormName.jhsj)=="")
	{
	alert("�ƻ�������ʱ�䲻��Ϊ��");
	return flase();
	}
	if(!(isDatetime(FormName.jhsj, "¼��ʱ��"))) {
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
