
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
String lflxmc=null;
String smmb=null;
String jhsmsj=null;
String sjsmsj=null;
String sjsmry=null;
String jhsmry=null;
String lfjgsm=null;
String cfwsjcs=null;
String bzsm=null;
String khxm=null;
String khbh=null;
try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select lfjlh,crm_lfjl.khbh,khxm,lflxmc,smmb,jhsmsj,jhsmry,sjsmsj,sjsmry,lfjgsm,cfwsjcs,bzsm";
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
		jhsmsj=cf.fillNull(rs.getDate("jhsmsj"));
		jhsmry=cf.fillHtml(rs.getString("jhsmry"));
		sjsmry=cf.fillHtml(rs.getString("sjsmry"));
		sjsmsj=cf.fillNull(rs.getDate("sjsmsj"));
		lfjgsm=cf.fillHtml(rs.getString("lfjgsm"));
		cfwsjcs=cf.fillHtml(rs.getString("cfwsjcs"));
		bzsm=cf.fillHtml(rs.getString("bzsm"));
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
<form name="editform" action="lfgcsj_save.jsp" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td height="20" colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">�������ݲ鿴</div></td>
  </tr>
  <tr>
   
 
    <td bgcolor="#FFFFFF" height=25><div align="right">�ͻ����</div></td>
    <td bgcolor="#FFFFFF"><%=khbh%></td>

	 <td width="20%" bgcolor="#FFFFFF"><div align="right">�ͻ�����       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=khxm%></td>
   </tr>
  <tr>
    <td height="20"width="20%" bgcolor="#FFFFFF"><div align="right">��������       </div></td>
    <td width="30%" bgcolor="#FFFFFF"><%=lflxmc%></td>

    <td bgcolor="#FFFFFF"><div align="right">�ƻ�����ʱ��</div></td>
    <td bgcolor="#FFFFFF"><%=jhsmsj%></td>
   </tr>
   <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">�ƻ�������Ա</div></td>
    <td bgcolor="#FFFFFF" colspan=3><%=jhsmry%></td>
  </tr>
 
  <tr>
	 <td height="20" width="20%" bgcolor="#FFFFFF"><div align="right">����Ŀ��</div></td>
    <td width="28%" bgcolor="#FFFFFF" colspan=3> <%=smmb%></td> 
	</tr>
  <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">ʵ��������Ա</div></td>
    <td bgcolor="#FFFFFF"><div align="justify">
      <%=sjsmry%>
    </div></td>
    <td bgcolor="#FFFFFF"><div align="right">ʵ������ʱ��</div></td>
    <td bgcolor="#FFFFFF"><%=sjsmsj%></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">���Ž�� </div></td>
    <td bgcolor="#FFFFFF" colspan=3><%=lfjgsm%></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">�������������</div></td>
    <td bgcolor="#FFFFFF" colspan=3><%=cfwsjcs%></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#FFFFFF"><div align="right">��ע˵��</div></td>
    <td bgcolor="#FFFFFF" colspan=3><%=bzsm%></td>
  </tr>
  
	
  
</table>
</form>




<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="25%"> 
	<div align="center"><font color="#000099">�ļ�����</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">��Ƭ</font></div>
  </td>
</tr>
<%

	String lfzpmc=null;
	ls_sql="SELECT lfzpmc";
	ls_sql+=" FROM crm_lfjlzp";
	ls_sql+=" where  lfjlh='"+lfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		lfzpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center"><%=lfzpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="/gcgl/gcjdgz/ViewImage.jsp?zhaopian=/dhzx/lfjl/images/<%=java.net.URLEncoder.encode(lfzpmc,"UTF-8")%>" target="_blank"><img src="/dhzx/lfjl/images/<%=lfzpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
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

</table>
</body>
</html>
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
	if(javaTrim(FormName.bzsm)=="")
	{
	alert("��ע˵������Ϊ��");
	return flase();
	}
	if(javaTrim(FormName.sjsmsj)=="")
	{
	alert("ʵ������ʱ�䲻��Ϊ��");
	return flase();
	}
	if(!(isDatetime(FormName.sjsmsj, "¼��ʱ��"))) {
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
