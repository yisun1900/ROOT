<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ά������</title>
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
String lflxmc=null;
String smmb=null;
java.util.Date jhsmsj=null;
java.util.Date sjlfsj=null;
String sjlfr=null;
String jhsmry=null;
String lfjgsm=null;
String cfwsjcs=null;
String bz=null;
String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select lfjlh,crm_lfjl.khbh,khxm,lflxmc,smmb,jhsmsj,jhsmry,sjlfsj,sjlfr,lfjgsm,cfwsjcs,bz";
	ls_sql+=" from  crm_lfjl,dm_lflxbm,crm_zxkhxx ";
	ls_sql+=" where lfjlh='"+lfjlh+"' ";
	ls_sql+=" and crm_lfjl.lflxbm=dm_lflxbm.lflxbm ";
	ls_sql+=" and  crm_lfjl.khbh=crm_zxkhxx.khbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lflxmc=rs.getString("lflxmc");
		smmb=rs.getString("smmb");
		jhsmsj=rs.getDate("jhsmsj");
		jhsmry=rs.getString("jhsmry");
		sjlfr=rs.getString("sjlfr");
		sjlfsj=rs.getDate("sjlfsj");
		lfjgsm=rs.getString("lfjgsm");
		cfwsjcs=rs.getString("cfwsjcs");
		bz=rs.getString("bz");
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
<form name="editform" action="lfgcsj_save.jsp" method="post" target="_blank">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td height="20" colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">���������޸�</div></td>
  </tr>
  <tr>
   
 
    <td height=25 align="right" bgcolor="#FFFFFF">�ͻ����</td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="18%" align="right" bgcolor="#FFFFFF">�ͻ�����       </td>
    <td width="32%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td width="18%" height="20" align="right" bgcolor="#FFFFFF">��������       </td>
    <td width="32%" bgcolor="#FFFFFF"><%=lflxmc%></td>

    <td align="right" bgcolor="#FFFFFF">�ƻ�����ʱ��</td>
    <td bgcolor="#FFFFFF"><%=jhsmsj%></td>
   </tr>
   <tr>
    <td height="20" align="right" bgcolor="#FFFFFF">�ƻ�������Ա</td>
    <td bgcolor="#FFFFFF" colspan=3><%=jhsmry%>
	<input type="hidden" name="jhsmsj" value="<%=jhsmsj%>"></td>
  </tr>
 
  <tr>
	 <td width="18%" height="20" align="right" bgcolor="#FFFFFF">����Ŀ��</td>
    <td bgcolor="#FFFFFF" colspan=3> <%=smmb%></td> 
	</tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>ʵ������ʱ��</td>
    <td bgcolor="#FFFFFF"><input name="sjlfsj" type="text" onDblClick="JSCalendar(this)" value="<%=sjlfsj%>" size="20" maxlength="10" /></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>ʵ��������</td>
    <td colspan="3" bgcolor="#FFFFFF">
      <input name="sjlfr" type="text" value="<%=sjlfr%>" size="71" maxlength="50" >    </td>
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
    <td height="20" align="right" bgcolor="#FFFFFF">��ע</td>
    <td bgcolor="#FFFFFF" colspan=3><textarea name="bz" cols="70"  rows="3"><%=bz%></textarea></td>
  </tr>
  
	
    <td colspan="4" align="center">      <div align="center">
        <input type="button" name="Submit" value="����" onClick="f_do(editform)"/>
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
	//alert("9"+javaTrim(FormName.sjlfr)+"2");
	if(javaTrim(FormName.sjlfr)=="")
	{
	alert("ʵ�������˲���Ϊ��");
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
	/*if(javaTrim(FormName.bz)=="")
	{
	alert("��ע����Ϊ��");
	return flase();
	}*/
	if(javaTrim(FormName.sjlfsj)=="")
	{
	alert("ʵ������ʱ�䲻��Ϊ��");
	return flase();
	}
	if(!(isDatetime(FormName.sjlfsj, "¼��ʱ��"))) {
		return false;
	}
	if(javaTrim(FormName.sjlfsj)<javaTrim(FormName.jhsmsj))
	{
		alert("ʵ������ʱ�䲻�����ڼƻ�����ʱ��");
		return false;
	}
	FormName.sczp.disabled=false;
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
