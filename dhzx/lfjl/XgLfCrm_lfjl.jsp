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

String sjsmsj=null;
String sjsmry=null;
String lfjg=null;
String lfjgsm=null;
String cfwsjcs=null;
String bzsm=null;


String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();


	ls_sql="select lfjlh,crm_lfjl.khbh,khxm,lflxbm,smmb,jhsmsj,jhsmry,sjsmsj,sjsmry,lfjg,lfjgsm,cfwsjcs,bzsm";
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
		sjsmsj=cf.fillNull(rs.getDate("sjsmsj"));
		sjsmry=cf.fillNull(rs.getString("sjsmry"));
		lfjg=cf.fillNull(rs.getString("lfjg"));
		lfjgsm=cf.fillNull(rs.getString("lfjgsm"));
		cfwsjcs=cf.fillNull(rs.getString("cfwsjcs"));
		bzsm=cf.fillNull(rs.getString("bzsm"));
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
<form name="editform" action="SaveXgLfCrm_lfjl.jsp" method="post" target="_blank">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td height="20" colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">ʵ���������޸�</div></td>
  </tr>
  <tr>
   
 
    <td height=25 align="right" bgcolor="#FFFFFF">�ͻ����</td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="18%" align="right" bgcolor="#FFFFFF">�ͻ�����       </td>
    <td width="32%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td width="18%" height="20" align="right" bgcolor="#FFFFFF">��������       </td>
    <td width="32%" bgcolor="#FFFFFF"> <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm where lflxbm='"+lflxbm+"'","");
	  %> </td>

    <td align="right" bgcolor="#FFFFFF">�ƻ�����ʱ��</td>
    <td bgcolor="#FFFFFF"><%=jhsmsj%>
	<input type="hidden" name="jhsmsj" value="<%=jhsmsj%>">	</td>
   </tr>
   <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�ƻ�������Ա</td>
    <td bgcolor="#FFFFFF" colspan=3><%=jhsmry%></td>
  </tr>
 
  <tr height="25">
	 <td width="18%" height="20" align="right" bgcolor="#FFFFFF">����Ŀ��</td>
    <td bgcolor="#FFFFFF" colspan=3> <%=smmb%></td> 
	</tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>ʵ������ʱ��</td>
    <td bgcolor="#FFFFFF"><input name="sjsmsj" type="text" onDblClick="JSCalendar(this)" value="<%=sjsmsj%>" size="20" maxlength="10"/></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>ʵ��������Ա</td>
    <td colspan="3" bgcolor="#FFFFFF">
      <input name="sjsmry" type="text" size="71" value="<%=sjsmry%>">    </td>
    </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>���Ž�� </td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="lfjgsm" cols="70"  rows="6"><%=lfjgsm%></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>�������������</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="cfwsjcs" cols="70"  rows="6"><%=cfwsjcs%></textarea></td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">��ע˵��</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="bzsm" cols="70"  rows="3"><%=bzsm%></textarea></td>
  </tr>
  
	
    <td colspan="4" align="center"> 
       
		<input type="button" name="tj" value="����" onClick="f_do(editform)"/>
		<input type="button" name="sczp" value="�ϴ���Ƭ" onClick="sc()" />
		<input type="button" name="ckzp" value="�鿴��Ƭ" onClick="ck()" />
	  <input type="hidden" name="lfjlh" value="<%=lfjlh%>" />      </td>
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
	//alert("9"+javaTrim(FormName.sjsmry)+"2");
	if(javaTrim(FormName.sjsmry)=="")
	{
	alert("ʵ��������Ա����Ϊ��");
	return flase();
	}
	
	if(javaTrim(FormName.lfjgsm)=="")
	{
	alert("���Ž������Ϊ��");
	return flase();
	}
	if(javaTrim(FormName.cfwsjcs)=="")
	{
	alert("�����������������Ϊ��");
	return flase();
	}
	/*if(javaTrim(FormName.bzsm)=="")
	{
	alert("��ע˵������Ϊ��");
	return flase();
	}*/
	if(javaTrim(FormName.sjsmsj)=="")
	{
	alert("ʵ������ʱ�䲻��Ϊ��");
	return flase();
	}
	if(!(isDatetime(FormName.sjsmsj, "¼��ʱ��"))) {
		return false;
	}
	if(javaTrim(FormName.sjsmsj)<javaTrim(FormName.jhsmsj))
	{
		alert("ʵ������ʱ�䲻�����ڼƻ�����ʱ��");
		return false;
	}
	FormName.sczp.disabled=false;
	FormName.tj.disabled=false;
	FormName.submit();
	return true;
	
}

function sc()
{
	var lfjlh=editform.lfjlh.value
	window.open("loadPhoto.jsp?lfjlh="+lfjlh);
}

function ck()
{
	var lfjlh=editform.lfjlh.value
	window.open("viewPhoto.jsp?lfjlh="+lfjlh);
}

</SCRIPT>





