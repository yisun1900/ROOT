<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010112")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

String dzbjjc=null;
double gcjcbjxs=0;
double sgcbbjxs=0;
String zdyxmshbz=null;
String zdyxmyxq=null;
double clfbfb=0;
double cbbfb=0;
String sfqyyssh=null;
String bjdysq=null;
String sjdsfdz=null;
String yxbffydz=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,dzbjjc,gcjcbjxs,sgcbbjxs,zdyxmshbz,zdyxmyxq,clfbfb,sfqyyssh,bjdysq,cbbfb,sjdsfdz,yxbffydz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bz=cf.fillNull(rs.getString("bz"));

		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
		zdyxmshbz=cf.fillNull(rs.getString("zdyxmshbz"));
		zdyxmyxq=cf.fillNull(rs.getString("zdyxmyxq"));
		clfbfb=rs.getDouble("clfbfb");
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		cbbfb=rs.getDouble("cbbfb");
		sjdsfdz=cf.fillNull(rs.getString("sjdsfdz"));
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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


<form method="post" action="" name="editform">
      <div align="center">���ӱ��۲�����ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ���</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ����</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="20%" align="right"><font color="#0000FF">����</font></td>
	  <td width="30%"><%=bianma%></td>
	  <td width="20%" align="right"><font color="#0000FF">�绰����</font></td>
	  <td width="30%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ�绰</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ����</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="20%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">��ע</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>���õ��ӱ��ۼ��</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]<BR>&2+2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]<BR>&3+3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����<BR>&6+6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬��¼����<BR>&4+4�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸ�<BR>&7+7��[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸģ��ɸ������Ż�<BR>&5+5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]",dzbjjc);
%></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>���̻�������ϵ��</td>
	  <td colspan="3"><input type="text" name="gcjcbjxs" size="20" maxlength="8"  value="<%=gcjcbjxs%>" >
        <strong><font color="#0000CC">&nbsp;&nbsp;���̻�������=����Ԥ��ۡ¹��̻�������ϵ��</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>ʩ���ɱ�����ϵ��</td>
	  <td colspan="3"><input type="text" name="sgcbbjxs" size="20" maxlength="8"  value="<%=sgcbbjxs%>" >
        <strong><font color="#0000CC">&nbsp;&nbsp;ʩ���ɱ���=���̻������ۡ�ʩ���ɱ�����ϵ��</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�Ƿ�����Ԥ�����</td>
	  <td colspan="3"><%
	cf.radioToken(out, "sfqyyssh","Y+����&N+������",sfqyyssh);
%>
          <strong><font color="#0000CC">&nbsp;&nbsp;���ӱ����Ƿ���Ҫ��ˣ�������ǩ���Ǽ�</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>�Ƿ������Զ��������</td>
	  <td colspan="3"><%
	cf.radioToken(out, "zdyxmshbz","Y+����&N+������",zdyxmshbz);
%>
	    <strong><font color="#0000CC">&nbsp;&nbsp;���ӱ������ʦ�Զ�����Ƿ���Ҫ��˲���ʹ��</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>�Զ�����Ŀ��Ч��</td>
	  <td colspan="3"><input type="text" name="zdyxmyxq" size="14" maxlength="8"  value="<%=zdyxmyxq%>" >
�£�<font color="#0000CC"><strong>&nbsp;&nbsp;���ӱ������ʦ�Զ����������Ч�ں��Զ�����</strong></font></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><font color="#FF0000">*</font>�Զ�������ϷѰٷֱ�</td>
	  <td colspan="3"><input type="text" name="clfbfb" size="14" maxlength="9"  value="<%=clfbfb%>" >
�ٷֱȣ�<strong><font color="#0000CC">&nbsp;&nbsp;���ӱ�����Ŀ�У����Ϸ�ռ���۵İٷֱ�</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�Զ�����ɱ��ٷֱ�</td>
	  <td colspan="3"><input type="text" name="cbbfb" size="14" maxlength="9"  value="<%=cbbfb%>" >
	    �ٷֱȣ�<strong><font color="#0000CC">&nbsp;&nbsp;���ӱ�����Ŀ�У��ɱ�ռ���۵İٷֱ�</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>���۴�ӡ�Ƿ�����Ȩ</td>
	  <td colspan="3"><%
	cf.radioToken(out, "bjdysq","1+������Ȩ&2+ֻ��һ����Ȩ&3+ÿ�δ�ӡ������Ȩ",bjdysq);
%>
          <strong><font color="#0000CC">&nbsp;&nbsp;���ӱ��۴�ӡ���п���</font></strong></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>ˮ��·�Ƿ����</td>
	  <td><%
	cf.radioToken(out, "sjdsfdz","Y+��&N+��",sjdsfdz);
%></td>
      <td align="right"><font color="#FF0000">*</font>�����̷Ѳ��ִ���</td>
      <td><%
	cf.radioToken(out, "yxbffydz","1+����&9+������",yxbffydz);
%></td>
	</tr>
	
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
		  <input type="button" onClick="window.open('SaveUpdateBixs.jsp?dwbh=<%=dwbh%>')"  value="���ݱ���ϵ��������ǰ�汾����">
		  <input type="reset"  value="����"></td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	!radioChecked(FormName.dzbjjc)) {
		alert("��ѡ��[���õ��ӱ��ۼ��]��");
		FormName.dzbjjc[0].focus();
		return false;
	}

	if(	javaTrim(FormName.gcjcbjxs)=="") {
		alert("������[���̻�������ϵ��]��");
		FormName.gcjcbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjcbjxs, "���̻�������ϵ��"))) {
		return false;
	}
	if (parseFloat(FormName.gcjcbjxs.value)==0)
	{
		alert("����[���̻�������ϵ��]����Ϊ0");
		FormName.gcjcbjxs.select();
		return false;
	}

	if(	javaTrim(FormName.sgcbbjxs)=="") {
		alert("������[ʩ���ɱ�����ϵ��]��");
		FormName.sgcbbjxs.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbbjxs, "ʩ���ɱ�����ϵ��"))) {
		return false;
	}
	if (parseFloat(FormName.sgcbbjxs.value)==0)
	{
		alert("����[ʩ���ɱ�����ϵ��]����Ϊ0");
		FormName.sgcbbjxs.select();
		return false;
	}

	if(	!radioChecked(FormName.sfqyyssh)) {
		alert("��ѡ��[�Ƿ�����Ԥ�����]��");
		FormName.sfqyyssh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdyxmshbz)) {
		alert("��ѡ��[�Ƿ������Զ��������]��");
		FormName.zdyxmshbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("������[�Զ�����Ŀ��Ч��]��");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isNumber(FormName.zdyxmyxq, "�Զ�����Ŀ��Ч��"))) {
		return false;
	}


	if(	javaTrim(FormName.clfbfb)=="") {
		alert("������[�Զ�������ϷѰٷֱ�]��");
		FormName.clfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.clfbfb, "�Զ�������ϷѰٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.clfbfb.value) <=0 || parseFloat(FormName.clfbfb.value) >100)
	{
		alert("����[�Զ�������ϷѰٷֱ�]Ӧ����0��100֮�䣡");
		FormName.clfbfb.select();
		return false;
	}

	if(	javaTrim(FormName.cbbfb)=="") {
		alert("������[�Զ�����ɱ��ٷֱ�]��");
		FormName.cbbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.cbbfb, "�Զ�����ɱ��ٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.cbbfb.value) <=0 || parseFloat(FormName.cbbfb.value) >100)
	{
		alert("����[�Զ�����ɱ��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.cbbfb.select();
		return false;
	}
	if(	!radioChecked(FormName.bjdysq)) {
		alert("��ѡ��[���۴�ӡ�Ƿ�����Ȩ]��");
		FormName.bjdysq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjdsfdz)) {
		alert("��ѡ��[ˮ��·�Ƿ����]��");
		FormName.sjdsfdz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yxbffydz)) {
		alert("��ѡ��[�����̷Ѳ��ִ���]��");
		FormName.yxbffydz[0].focus();
		return false;
	}


	FormName.action="SaveEditDzbjCsSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











