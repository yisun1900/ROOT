<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010215")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String ygbh=request.getParameter("ygbh");

String dwbh=null;
String kfgssq="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String txxx="";

try {
	conn=cf.getConnection();

	ls_sql="select kfgssq,dwbh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kfgssq=cf.fillNull(rs.getString("kfgssq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		txxx="<P> <U><font color=\"#FF0000\"><b>�����ѣ��ÿͻ��ѡ����ֹ�˾��Ȩ��,����������������Ȩ��,�򡾰��ֹ�˾��Ȩ������ɾ����</b></font></U>";
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><font color="#000099"><b>�ͻ�������Ȩ</b></font> <%=txxx%> 
      </div>
    </td>
  </tr>
	<tr> 
	  <td colspan="2" align="center"> 
		<input type="button"  value="����" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">
	  </td>
	</tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_sqbm.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="41%" align="right"><font color="#CC0000">*</font>�ͻ�������Ȩ��Χ</td>
              <td width="59%">
<%
	cf.radioToken(out, "kfgssq","3+��Ȩ��������<BR>&4+��Ȩĳһ�ֹ�˾�������<BR>&5+��Ȩ����ֹ�˾�������",kfgssq);
%>
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right"> <font color="#000099"><b></b></font> 
                ��ѡ���ţ��ɶ�ѡ��<BR>
              </td>
              <td width="59%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:252PX" size="37" multiple>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��'||DECODE(a.cxbz,'N','','Y','��������') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+ygbh+"'");
	}
	else{
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��'||DECODE(a.cxbz,'N','','Y','��������') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+ygbh+"'");
	}
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
                <input type="hidden" name="ygbh" value="<%=ygbh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.kfgssq)) {
		alert("��ѡ��[�ͻ�������Ȩ��Χ]��");
		FormName.kfgssq[0].focus();
		return false;
	}

	if(	!selectChecked(FormName.dwbh)) {
		alert("������[��Ȩ����]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
