<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sjjgrq=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
	}
	rs.close();

	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼�����ݣ�<font color="#FF0000">*</font>Ϊ��¼�ֶΣ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_dgqk.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��ϵ��ʽ</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="20" maxlength="50" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">���ݵ�ַ</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="fwdz" value="<%=fwdz%>" size="20" maxlength="100" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��ͬ��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">���ʦ</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">ʩ����</font></div>
              </td>
              <td width="35%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="zjy" value="<%=zjxm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>��Ʒ</div>
              </td>
              <td width="35%"> 
                <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cpbm,cpmc from dm_cpbm order by cpbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>Ʒ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pp" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>��Ӧ��</div>
              </td>
              <td width="35%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>ʵ�ʷ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjfy" value="" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>Ӧ��װ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yazrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right">פ��Ҿӹ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="clgw" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="button"  value="�鿴�������" onClick="f_ck(insertform)" name="button">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("��ѡ��[��Ʒ]��");
		FormName.cpbm.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.pp)=="") {
		alert("������[Ʒ��]��");
		FormName.pp.focus();
		return false;
	}
	if(	javaTrim(FormName.gys)=="") {
		alert("��ѡ��[��Ӧ��]��");
		FormName.gys.focus();
		return false;
	}
	if(	javaTrim(FormName.sjfy)=="") {
		alert("��ѡ��[ʵ�ʷ���]��");
		FormName.sjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.sjfy, "ʵ�ʷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yazrq)=="") {
		alert("������[Ӧ��װ����]��");
		FormName.yazrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yazrq, "Ӧ��װ����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_dgqk.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="Crm_dgqkCkList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
