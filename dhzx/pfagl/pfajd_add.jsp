<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String pfajlh=request.getParameter("pfajlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
//ResultSet rs=null;
String ls_sql=null;
String pfalxmc=null;
String pfanr=null;
java.util.Date jhsj=null;
String jhry=null;
String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select crm_pfagcgl.khbh,khxm,pfajlh,pfalxmc,pfanr,jhsj,jhry";
	ls_sql+=" from  crm_pfagcgl,dm_pfalxbm,crm_zxkhxx ";
	ls_sql+=" where pfajlh='"+pfajlh+"' ";
	ls_sql+=" and crm_pfagcgl.pfalxbm=dm_pfalxbm.pfalxbm ";
	ls_sql+=" and  crm_pfagcgl.khbh=crm_zxkhxx.khbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pfalxmc=rs.getString("pfalxmc");
		pfanr=rs.getString("pfanr");
		jhsj=rs.getDate("jhsj");
		jhry=rs.getString("jhry");
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
<form name="form1" action="pfajd_save.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">�������ƻ�¼��</div></td>
  </tr>
  <tr>
   
    <td bgcolor="#FFFFFF" height=25><div align="right">�ͻ����</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="30%" bgcolor="#FFFFFF"><div align="right">�ͻ�����       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td height="20" width="20%" bgcolor="#FFFFFF"><div align="right">����������       </div></td>
    <td height="20" width="30%" bgcolor="#FFFFFF"> <%=pfalxmc%></td>
   
  
 
    <td height="20" bgcolor="#FFFFFF"><div align="right">�ƻ�������ʱ��</div></td>
    <td height="20" bgcolor="#FFFFFF"><%=jhsj%></td>
   </tr>
   <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">�ƻ��μ���Ա</div></td>
    <td height="20" bgcolor="#FFFFFF" colspan=3><%=jhry%></td>
  </tr>
 
  <tr>
	 <td height="20" width="20%" bgcolor="#FFFFFF"><div align="right">����������</div></td>
    <td width="30%" bgcolor="#FFFFFF" colspan=3> <%=pfanr%></td> 
	</tr>
  <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>ʵ�ʲμ���Ա</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sjry"></td>
    <td bgcolor="#FFFFFF"><div align="right"><font color="#FF0033">*</font>ʵ��������ʱ��</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sjsj" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>���������</td>
    <td colspan=3 bgcolor="#FFFFFF"><input type="radio" name="radiobutton" value="radiobutton">
      ����ͨ��
        <input type="radio" name="radiobutton" value="radiobutton">
        �ֲ��޸�
        <input type="radio" name="radiobutton" value="radiobutton">
ȫ���޸�
<input type="radio" name="radiobutton" value="radiobutton">
�ͻ�����</td>
    </tr>
  
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�����</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">�������</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">���ڹ����ƻ�</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">�´�ԤԼʱ��</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�ͻ�����</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ʩ��Ӧ��</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">ͨ������һ��</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">����ʱ�ޱ���</td>
    <td colspan=3 bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">���ȡ������</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�ͻ�������������</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea2" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ƹ�ע������</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea3" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ͬ������ơ���������</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea4" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��������Ʒ��</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea5" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�ͻ��Ի����Ƿ�����</td>
    <td colspan=3 bgcolor="#FFFFFF"><input type="radio" name="radiobutton" value="radiobutton">
����
  <input type="radio" name="radiobutton" value="radiobutton">
  ������</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">����������</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="textarea6" cols="71" rows="3" style="width:70%" ></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ע</td>
    <td colspan=3 bgcolor="#FFFFFF"><textarea name="gc" cols="71" rows="2" style="width:70%" ></textarea></td>
  </tr>
	
    <td height="20" colspan="4" bgcolor="#FFFFFF">      <div align="center">
        <input type="button" name="Submit" value="����" onClick="f_do(form1)"/>
		 <input type="hidden" name="pfajlh" value="<%=pfajlh%>" />
      </div></td></tr>
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
	
	if(javaTrim(FormName.sjry)=="")
	{
	alert("ʵ�ʲμ���Ա����Ϊ��");
	return flase();
	}
	if(javaTrim(FormName.sjsj)=="")
	{
	alert("ʵ��������ʱ�䲻��Ϊ��");
	return flase();
	}

	if(javaTrim(FormName.jd)=="")
	{
	alert("���Ȳ���Ϊ��");
	return flase();
	}
	if(javaTrim(FormName.gc)=="")
	{
	alert("���������ݲ���Ϊ��");
	return flase();
	}
	
	
	if(!(isDatetime(FormName.sjsj, "¼��ʱ��"))) {
		return false;
	}
	
	FormName.submit();
	return true;
	
}

</SCRIPT>
