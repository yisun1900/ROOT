<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String sfzhm=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
String sgbz=null;

String hth=null;
String smhtbh=null;


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,xb,fwdz,crm_khxx.lxfs,crm_khxx.qtdh,crm_khxx.email,crm_khxx.sfzhm,sjs,zjxm,sgdmc,crm_khxx.sgbz ";
	ls_sql+=" ,hth,smhtbh ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
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
		if (rs != null) rs.close(); 
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

<body >
<form method="post" action="" name="insertform" >
      <div align="center"> ���޸���Ϣ���ͻ���ţ�<%=khbh%>����<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="34%"><%=khxm%>      </td>
      <td width="19%" align="right"><font color="#0000FF">�Ա�      </font></td>
      <td width="31%">
<%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ֻ�</font></td>
      <td colspan="3"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�����绰</font></td>
      <td colspan="3"> <%=qtdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�����ʼ�</font></td>
      <td width="34%"> <%=email%></td>
      <td width="19%" align="right"><font color="#0000FF">ҵ�����֤����</font></td>
      <td width="31%"><%=sfzhm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">���ʦ</font></td>
      <td width="34%"> <%=sjs%></td>
      <td width="19%" align="right"><font color="#0000FF">���̵���</font></td>
      <td width="31%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">ʩ����</font></td>
      <td width="34%"> <%=sgdmc%></td>
      <td width="19%" align="right"><font color="#0000FF">�೤</font></td>
      <td width="31%"><%=sgbz%></td>
    </tr>
  </TABLE>

<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ͬ��</td>
      <td width="34%"> 
        <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" >
      </td>
      <td width="19%" align="right">�����ͬ���</td>
      <td width="31%"> 
        <input type="text" name="smhtbh" value="<%=smhtbh%>" size="20" maxlength="20">
      </td>
    </tr>
    
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="oldhth"  value="<%=hth%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����">
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
	
	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.submit();

	return true;
}



//-->
</SCRIPT>
