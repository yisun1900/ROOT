<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�طö���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String khbh=request.getParameter("khbh");
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sjkgrq=null;
String djbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//������
	int count=0;
	ls_sql="select NVL(max(substr(djbh,8,2)),0)";
	ls_sql+=" from  crm_hfdjjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	djbh=khbh+cf.addZero(count+1,2);

	ls_sql="select khxm,fwdz,sjs,zjxm,sgdmc,sjkgrq";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjxm=rs.getString("zjxm");
		sgd=cf.fillNull(rs.getString("sgdmc"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
	}
	rs.close();
	ps.close();
	

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
<body bgcolor="#FFFFFF">
<form method="post" action="SaveEnterDjfw.jsp" name="selectform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="65" colspan="4"> 
        <div align="center">�ͻ��طö��ᣨ�����ţ�<%=djbh%>��</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">�ͻ����</font></td>
      <td width="28%"> 
        <input type="text" name="khbh" size="20" maxlength="20" value="<%=khbh%>" readonly>
        <input type="hidden" name="djbh" value="<%=djbh%>" >
      </td>
      <td width="17%" align="right"><font color="#0000CC">�ͻ�����</font></td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="20" value="<%=khxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="22%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> 
        <input type="text" name="khbh2" size="68" maxlength="100" value="<%=fwdz%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">���ʦ</font></td>
      <td width="28%">
        <input type="text" name="sjs" size="20" maxlength="20" value="<%=sjs%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">�ʼ�����</font></td>
      <td width="33%">
        <input type="text" name="zjxm" size="20" maxlength="20" value="<%=zjxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">ʩ����</font></td>
      <td width="28%">
        <input type="text" name="sgd" size="20" maxlength="20" value="<%=sgd%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
      <td width="33%">
        <input type="text" name="sjkgrq" size="20" maxlength="20" value="<%=sjkgrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="22%" align="right"><font color="#FF0000">*</font>���᷶Χ</td>
      <td colspan="3"> 
        <input type="radio" name="hfdjbz" value="1">
        ���̻طö��� <BR>
        <input type="radio" name="hfdjbz" value="2">
        Ͷ�߱��޻طö��ᣨ<b>����������ͽ���µ�Ͷ�߱���</b>�� <BR>
        <input type="radio" name="hfdjbz" value="3">
        ȫ�����ᣨ<b>����Կͻ������лط�</b>��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"> <font color="#FF0000">*</font>����ʱ��</td>
      <td width="28%"> 
        <input type="text" name="djsj" size="20" maxlength="10" value="<%=cf.today()%>" ondblclick="JSCalendar(this)">
      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font>�ƻ��ⶳʱ��</td>
      <td width="33%"> 
        <input type="text" name="jhjdsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#FF0000">*</font>����ԭ��</td>
      <td colspan="3"> 
        <textarea name="djyy" cols="66" rows="4"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td colspan="3"> 
        <input type="text" name="djr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="����" name="butt" onClick="f_do(selectform)">
          <input type="reset" name="Submit2" value="����">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.hfdjbz)) {
		alert("��ѡ��[���᷶Χ]��");
		FormName.hfdjbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.djsj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.djsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.djsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjdsj, "�ƻ��ⶳʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.djyy)=="") {
		alert("��ѡ��[����ԭ��]��");
		FormName.djyy.focus();
		return false;
	}
	if(	javaTrim(FormName.djr)=="") {
		alert("��ѡ��[������]��");
		FormName.djr.focus();
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
