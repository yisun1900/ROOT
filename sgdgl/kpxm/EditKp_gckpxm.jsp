<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpxmbm=null;
String kpxmmc=null;
String kpdlbm=null;
String kpjg=null;
String kpjgdy=null;
double kf=0;
double sgdfk=0;
double kcjdebl=0;
String kpcfbm=null;
String cfbz=null;
String wherekpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
String wherekpjg=cf.GB2Uni(request.getParameter("kpjg"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpxmbm,kpxmmc,kpdlbm,kpjg,kpjgdy,kf,kpcfbm,cfbz,sgdfk,kcjdebl ";
	ls_sql+=" from  kp_gckpxm";
	ls_sql+=" where  (kpxmbm='"+wherekpxmbm+"') and  (kpjg='"+wherekpjg+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpxmbm=cf.fillNull(rs.getString("kpxmbm"));
		kpxmmc=cf.fillNull(rs.getString("kpxmmc"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpjgdy=cf.fillNull(rs.getString("kpjgdy"));
		kf=rs.getDouble("kf");
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
		cfbz=cf.fillNull(rs.getString("cfbz"));
		sgdfk=rs.getDouble("sgdfk");
		kcjdebl=rs.getDouble("kcjdebl");
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_gckpxm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>Υ����Ŀ����</td>
              <td width="32%"> 
                <input type="text" name="kpxmbm" size="20" maxlength="10"  value="<%=kpxmbm%>" >              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��Ŀ����</td>
              <td width="32%"><select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>Υ����Ŀ����</td>
              <td colspan="3"><input type="text" name="kpxmmc" size="73" maxlength="100"  value="<%=kpxmmc%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>Υ��ּ� </td>
              <td width="32%"><select name="kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm",kpjg);
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">Υ��ּ�����</td>
              <td colspan="3"><textarea name="kpjgdy" cols="71" rows="5"><%=kpjgdy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��������</td>
              <td><select name="kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm",kpcfbm);
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">������׼</td>
              <td colspan="3"><textarea name="cfbz" cols="71" rows="5"><%=cfbz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>�۷�              </td>
              <td width="32%"> 
                <input type="text" name="kf" value="<%=kf%>" size="20" maxlength="16" >              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>����              </td>
              <td width="32%">
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="16" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>�۳��ӵ���ٷֱ�</td>
              <td width="32%">
                <input type="text" name="kcjdebl" value="<%=kcjdebl%>" size="10" maxlength="16" >
              % </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <input type="hidden" name="wherekpxmbm"  value="<%=wherekpxmbm%>" >
            <input type="hidden" name="wherekpjg"  value="<%=wherekpjg%>" >
            <tr> 
              <td colspan="4" align="center">
                  <input type="button"  value="����" onClick="f_do(editform)">
              <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("������[Υ����Ŀ����]��");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmmc)=="") {
		alert("������[Υ����Ŀ����]��");
		FormName.kpxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("��ѡ��[Υ��ּ�]��");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("��ѡ��[�۷�]��");
		FormName.kf.focus();
		return false;
	}
	if(!(isFloat(FormName.kf, "�۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("��ѡ��[����]��");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.kcjdebl)=="") {
		alert("��ѡ��[�۳��ӵ���ٷֱ�]��");
		FormName.kcjdebl.focus();
		return false;
	}
	if(!(isFloat(FormName.kcjdebl, "�۳��ӵ���ٷֱ�"))) {
		return false;
	}
	if (FormName.kcjdebl.value<0 || FormName.kcjdebl.value>100)
	{
		alert("����[�۳��ӵ���ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.kcjdebl.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
