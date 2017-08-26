<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String yddbh=request.getParameter("yddbh");
String qhtr=null;
String qhtsj=null;
String htbz=null;
String khbh=null;
String khxm=null;
String fwdz=null;

int mmhtje=0;
int wjhtje=0;
int blhtje=0;
int htje=0;
int fwf=0;
int wdzje=0;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jc_mmydd.khbh,crm_khxx.khxm,crm_khxx.fwdz,htbz,mmhtje,wjhtje,blhtje,htje,fwf,wdzje";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+) and yddbh='"+yddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		htbz=cf.fillNull(rs.getString("htbz"));
		mmhtje=rs.getInt("mmhtje");
		wjhtje=rs.getInt("wjhtje");
		blhtje=rs.getInt("blhtje");
		htje=rs.getInt("htje");
		fwf=rs.getInt("fwf");
		wdzje=rs.getInt("wdzje");
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
<title>ǩ����ͬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">�����޸ļ۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ͻ����</font></td>
              <td width="29%"><%=khbh%></td>
              <td width="22%" align="right"><font color="#0000FF">�ͻ�����</font></td>
              <td width="28%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ݵ�ַ</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">ľ�ź�ͬ���</td>
              <td width="29%"> <%=mmhtje%></td>
              <td width="22%" align="right">����ͬ���</td>
              <td width="28%"> <%=wjhtje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">������ͬ���</td>
              <td width="29%"> <%=blhtje%></td>
              <td width="22%" align="right">�����</td>
              <td width="28%"> <%=fwf%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">��ͬ�ܶ�</td>
              <td width="29%"><%=htje%></td>
              <td width="22%" align="right">δ���۽��</td>
              <td width="28%"> <%=wdzje%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��ͬ��ע</td>
              <td colspan="3"><%=htbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���۷�Χ</td>
              <td colspan="3"><input type="radio" name="tjfw" value="mm">
                ľ��
                  <input type="radio" name="tjfw" value="wj">
                  ���
              <input type="radio" name="tjfw" value="bl">
              ����
              <input type="radio" name="tjfw" value="all">
              ȫ��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�۸��ۿ�</td>
              <td colspan="3"><input type="text" name="zkl" size="10" maxlength="20"  value="" >
                <strong><font color="#FF0000">ע�⣺�ۿ���1��10֮��</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="�޸�" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
                </div>              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
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

	if(	!radioChecked(FormName.tjfw)) {
		alert("��ѡ��[���۷�Χ]��");
		FormName.tjfw[0].focus();
		return false;
	}

	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�۸��ۿ�]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�۸��ۿ�"))) {
		return false;
	}
	if (parseFloat(FormName.zkl.value)<1 || parseFloat(FormName.zkl.value)>10)
	{
		alert("[�۸��ۿ�]Ӧ��1��10֮�䣡");
		FormName.zkl.select();
		return false;
	}


	FormName.action="SaveTjJc_mmydd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
