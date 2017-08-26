<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%

String khxm=null;
String fwdz=null;
String lxfs=null;
String email=null;
String ssfgs=null;

String dhqh=null;
String khlxfs="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,email,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		email=cf.fillNull(rs.getString("email"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dhqh=cf.fillNull(rs.getString("dhqh"));
	}
	rs.close();
	ps.close();

	if (dhqh==null || dhqh.equals(""))
	{
		out.println("�����޵绰���ţ�����ϵϵͳ����Ա");
		return;
	}

	String lxr="";
	String lx="";
	String getdhqh="";
	String qhdh="";
	String dhhm="";
	String fenji="";
	ls_sql="select qhdh,lxr,dhhm,fj,dhqh,lx ";
	ls_sql+=" from  crm_khlxfs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qhdh=cf.fillNull(rs.getString("qhdh"));
		lxr=cf.fillNull(rs.getString("lxr"));
		dhhm=cf.fillNull(rs.getString("dhhm"));
		fenji=cf.fillNull(rs.getString("fj"));
		getdhqh=cf.fillNull(rs.getString("dhqh"));
		lx=cf.fillNull(rs.getString("lx"));

		khlxfs+=lxr+"^"+lx+"^"+dhqh+"^"+qhdh+"^"+dhhm+"^"+fenji+"*";
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> �޸���ϵ��ʽ���ͻ���ţ�<%=khbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td align="right">�ͻ�����</td>
              <td width="84%" colspan="3"><%=khxm%>
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#CC0000">*</font><font color="#0000FF">��ϵ��ʽ</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" size="70" maxlength="100"  value="<%=lxfs%>" readonly>
                <input type="hidden" name="khlxfs" value="<%=khlxfs%>"  >
                <input type="hidden" name="khxm" value="<%=khxm%>"  >
                <input name="button" type="button" onClick="if (javaTrim(khxm)=='') {alert('¼��[�ͻ�����]');khxm.select();return false;};window.open('/dhzx/dhzx/getLxfs.jsp?dhqh=<%=dhqh%>&khlxfs='+khlxfs.value+'&lxr='+khxm.value,'','height=400,width=800,top=200,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="¼��绰""></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">�����ʼ�</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                <font color="#FF0000">(ע�⣺�ж������<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>              </td>
            </tr>
            
            <tr> 
              <td colspan="4" align="center" > 
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(FormName.lxfs.value=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}
	FormName.action="SaveEditLxfs.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
