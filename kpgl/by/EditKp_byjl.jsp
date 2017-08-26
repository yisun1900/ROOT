<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String byjlh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String zjy=null;
String jgrq=null;
String hth=null;
String slsj=null;
String slr=null;
String bydxlxbm=null;
String bylxbm=null;
String bynr=null;
String wherebyjlh=cf.GB2Uni(request.getParameter("byjlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select byjlh,khbh,khxm,fwdz,lxfs,sjs,sgd,zjy,jgrq,hth,slsj,slr,bydxlxbm,bylxbm,bynr ";
	ls_sql+=" from  kp_byjl";
	ls_sql+=" where  (byjlh='"+wherebyjlh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		byjlh=cf.fillNull(rs.getString("byjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjy=cf.fillNull(rs.getString("zjy"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		hth=cf.fillNull(rs.getString("hth"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		bydxlxbm=cf.fillNull(rs.getString("bydxlxbm"));
		bylxbm=cf.fillNull(rs.getString("bylxbm"));
		bynr=cf.fillNull(rs.getString("bynr"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ�������¼�ţ�<%=byjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_byjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">�ͻ����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#6633FF">�ͻ�����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">���ݵ�ַ</font></div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="70" maxlength="100"  value="<%=fwdz%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" size="20" maxlength="100"  value="<%=lxfs%>" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">���ʦ</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">ʩ����</font></div>
              </td>
              <td width="35%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">�ʼ�Ա</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="zjy" size="20" maxlength="20"  value="<%=zjy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">��������</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="jgrq" size="20" maxlength="10"  value="<%=jgrq%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">��ͬ��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hth" size="20" maxlength="20"  value="<%=hth%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">����ʱ��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="slsj" size="20" maxlength="10"  value="<%=slsj%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">������</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="slr" size="20" maxlength="16"  value="<%=slr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <select name="bydxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+ʩ����&2+���ʦ&3+�ʼ�Ա",bydxlxbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="bylxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"01+ý��&02+�ż�&03+���",bylxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td colspan="3"> 
                <textarea name="bynr" cols="70" rows="3"><%=bynr%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherebyjlh"  value="<%=wherebyjlh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isDatetime(FormName.jgrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("������[����ʱ��]��");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("������[������]��");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.bydxlxbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.bydxlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bylxbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.bylxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bynr)=="") {
		alert("������[��������]��");
		FormName.bynr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
