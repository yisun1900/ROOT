<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] scbkhbh=request.getParameterValues("scbkhbh");

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
String ssfgs=null;
String ywybm=null;
String zxdm=null;

try {
	conn=cf.getConnection();

	stmt = conn.createStatement();

	ls_sql="select count(distinct ssfgs)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where "+cf.arrayToInSQL(scbkhbh,"scbkhbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("����ֻ��ͬһ���ֹ�˾�Ŀͻ������������滻");
		return;
	}

	ls_sql="select count(distinct ywybm)";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where "+cf.arrayToInSQL(scbkhbh,"scbkhbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("����ֻ��ͬһҵ��Ա���ŵĿͻ������������滻");
		return;
	}

	ls_sql="select ssfgs,ywybm";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where scbkhbh='"+scbkhbh[0]+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		ywybm=rs.getString("ywybm");
	}
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

<html>
<head>
<title>����С��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SavePlGhXz1.jsp" name="editform">
		  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td colspan="2" align="center" height="41"><b><font color="#000066">����С�鱣��ҵ��Ա��Ϣ</font></b></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="38%" align="right" height="52"><span class="STYLE2">*</span><span class="STYLE1">�ֹ�˾</span></td>
      <td width="62%" height="52"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwbh",ssfgs);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" height="45"><span class="STYLE2">*</span><span class="STYLE1">ҵ��Ա����</span></td>
      <td height="45"><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywybm+"'",ywybm);
	%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right" height="45"><span class="STYLE2">*</span>ҵ��Ա����С��</td>
      <td height="45"><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+ywybm+"' and dwlx='F4' and cxbz='N' order by dwbh","");
%>
      </select></td>
    </tr>
    
    <tr> 
      <td colspan="2" height="2"> 
        <div align="center"> <%
	for (int i=0;i<scbkhbh.length ;i++ )
	{
		%> 
          <input type="hidden" name="scbkhbh" value="<%=scbkhbh[i]%>" >
          <%
	}

%> 
          <input type="button"  value="��ʼ����" onClick="f_do(editform)">
        </div>      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ywybm)=="") {
		alert("������[ҵ��Ա����]��");
		FormName.ywybm.focus();
		return false;
	}
	if(	javaTrim(FormName.ywyssxz)=="") {
		alert("������[ҵ��Ա����С��]��");
		FormName.ywyssxz.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
