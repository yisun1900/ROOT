<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%

String xh=null;
String qcph=null;
String ybh=null;
String lysl=null;
String cllcs=null;
String lyrq=null;
String lyr=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String bz=null;
double dj=0;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,qcph,ybh,lysl,cllcs,lyrq,lyr,ssfgs,lrr,lrsj,bz,dj ";
	ls_sql+=" from  xz_yplydjb";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		qcph=cf.fillNull(rs.getString("qcph"));
		ybh=cf.fillNull(rs.getString("ybh"));
		lysl=cf.fillNull(rs.getString("lysl"));
		cllcs=cf.fillNull(rs.getString("cllcs"));
		lyrq=cf.fillNull(rs.getDate("lyrq"));
		lyr=cf.fillNull(rs.getString("lyr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		dj=rs.getDouble("dj");
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
<form method="post" action="SaveEditXz_yplydjb.jsp" name="editform">
  <div align="center">�޸ĳ���������Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>�����ֹ�˾</td>
      <td width="33%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td align="right" width="16%">�����ƺ�</td>
      <td width="34%"> 
        <select name="qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm order by ssfgs,qcph",qcph);
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by ssfgs,qcph",qcph);
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>�ͱ��</td>
      <td width="33%"> 
        <select name="ybh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"90#+90#&91#+91#&92#+92#&93#+93#&94#+94#&95#+95#&96#+96#&97#+97#&98#+98#&99#+99#&����+����",ybh);
%> 
        </select>
      </td>
      <td align="right" width="16%"><font color="#FF0000">*</font>����</td>
      <td width="34%"> 
        <input type="text" name="dj" value="<%=dj%>" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>��������</td>
      <td width="33%"> 
        <input type="text" name="lysl" size="20" maxlength="9"  value="<%=lysl%>" >
      </td>
      <td align="right" width="16%">���������</td>
      <td width="34%"> 
        <input type="text" name="cllcs" size="20" maxlength="9"  value="<%=cllcs%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>������</td>
      <td width="33%"> 
        <input type="text" name="lyr" size="20" maxlength="20"  value="<%=lyr%>" >
      </td>
      <td align="right" width="16%"><font color="#FF0000">*</font>��������</td>
      <td width="34%"> 
        <input type="text" name="lyrq" size="20" maxlength="10"  value="<%=lyrq%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="16%"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.qcph)=="") {
		alert("��ѡ��[�����ƺ�]��");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.ybh)=="") {
		alert("��ѡ��[�ͱ��]��");
		FormName.ybh.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.lysl)=="") {
		alert("������[��������]��");
		FormName.lysl.focus();
		return false;
	}
	if(!(isFloat(FormName.lysl, "��������"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.cllcs)=="") {
		alert("������[���������]��");
		FormName.cllcs.focus();
		return false;
	}
*/
	if(!(isFloat(FormName.cllcs, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.lyrq)=="") {
		alert("������[��������]��");
		FormName.lyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lyrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.lyr)=="") {
		alert("������[������]��");
		FormName.lyr.focus();
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
