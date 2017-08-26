<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String qcph=null;
String qcxh=null;
String sjxm=null;
String gcsj=null;
String njrq=null;
String yxsgls=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String bz=null;
String whereqcph=request.getParameter("qcph");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select qcph,qcxh,sjxm,gcsj,njrq,yxsgls,ssfgs,lrr,lrsj,bz ";
	ls_sql+=" from  xz_qcdm";
	ls_sql+=" where  (qcph='"+whereqcph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qcph=cf.fillNull(rs.getString("qcph"));
		qcxh=cf.fillNull(rs.getString("qcxh"));
		sjxm=cf.fillNull(rs.getString("sjxm"));
		gcsj=cf.fillNull(rs.getDate("gcsj"));
		njrq=cf.fillNull(rs.getDate("njrq"));
		yxsgls=cf.fillNull(rs.getString("yxsgls"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
		if (ps != null) ps.close(); 
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
<form method="post" action="SaveEditXz_qcdm.jsp" name="editform">
  <div align="center">�޸���������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����ƺ�</td>
      <td width="35%"> 
        <input type="text" name="qcph" size="20" maxlength="20"  value="<%=qcph%>" >
      </td>
      <td align="right" width="15%">˾������</td>
      <td width="35%"> 
        <input type="text" name="sjxm" size="20" maxlength="20"  value="<%=sjxm%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����ͺ�</td>
      <td colspan="3"> 
        <input type="text" name="qcxh" size="73" maxlength="40"  value="<%=qcxh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����ʱ��</td>
      <td width="35%"> 
        <input type="text" name="gcsj" size="20" maxlength="10"  value="<%=gcsj%>" >
      </td>
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <input type="text" name="njrq" size="20" maxlength="10"  value="<%=njrq%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����ֹ�˾</td>
      <td width="35%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",ssfgs);
%> 
        </select>
      </td>
      <td align="right" width="15%">����ʹ������</td>
      <td width="35%"> 
        <input type="text" name="yxsgls" size="20" maxlength="17"  value="<%=yxsgls%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">¼����</td>
      <td width="35%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="15%">¼��ʱ��</td>
      <td width="35%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="whereqcph"  value="<%=whereqcph%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
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
	if(	javaTrim(FormName.qcph)=="") {
		alert("������[�����ƺ�]��");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.qcxh)=="") {
		alert("������[�����ͺ�]��");
		FormName.qcxh.focus();
		return false;
	}
	if(!(isDatetime(FormName.gcsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.njrq)=="") {
		alert("������[�������]��");
		FormName.njrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.njrq, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.yxsgls, "����ʹ������"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
