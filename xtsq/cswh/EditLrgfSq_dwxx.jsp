<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
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

String zxkhlrjc=null;
String zxkhlrts=null;
String qdkhbljc=null;
String qdkhblts=null;
int djbhts=0;
int scyjts=0;
String sjszdgh=null;
String ywyzdgh=null;
String sjszdjz=null;
String khjlzdgh=null;
String khjlzdjz=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,djbhts,scyjts,sjszdgh,ywyzdgh,sjszdjz,khjlzdgh,khjlzdjz";
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

		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		zxkhlrts=cf.fillNull(rs.getString("zxkhlrts"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		qdkhblts=cf.fillNull(rs.getString("qdkhblts"));
		djbhts=rs.getInt("djbhts");
		scyjts=rs.getInt("scyjts");
		sjszdgh=cf.fillNull(rs.getString("sjszdgh"));
		ywyzdgh=cf.fillNull(rs.getString("ywyzdgh"));
		sjszdjz=cf.fillNull(rs.getString("sjszdjz"));
		khjlzdgh=cf.fillNull(rs.getString("khjlzdgh"));
		khjlzdjz=cf.fillNull(rs.getString("khjlzdjz"));
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
      <div align="center">¼����Ϣ�淶��ά��</div>
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
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>������ѯ�ͻ�¼����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+������&Y+����",zxkhlrjc);
%>
          <b><BR>
          <font color="#000099">��ѯ�ͻ����ϱ�����ǰ������¼�룬����������ǩ���Ǽ�</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>��ѯ�ͻ���ǰ¼������</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="zxkhlrts" value="<%=zxkhlrts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����</font> </b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>����ǩ���ͻ���¼���</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+������&Y+����",qdkhbljc);
%>
          <BR>
          <b><font color="#000099">�Բ�¼ǩ���ͻ��������ƣ�����ĳ����󣬲�����¼</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>ǩ���ͻ���¼��������</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="qdkhblts" value="<%=qdkhblts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">ǩ���Ǽ��У�[ǩ��¼��ʱ��]��[ǩԼʱ��]��������������</font></b> </td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>������ͻ���������</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="djbhts" value="<%=djbhts%>" size="10" maxlength="8" ></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>�г��ͻ��ƽ���Ч����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="scyjts" value="<%=scyjts%>" size="10" maxlength="8" ></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>���ʦ��������ѯ�ͻ��Զ�����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sjszdgh","N+��&Y+��",sjszdgh);
%>
          <BR>
          <b><font color="#000099">���ʦ�ӡ�A�꡿������B�꡿������ѯ�ͻ����Զ��ɡ�A�꡿������B�꡿</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>���ʦ�������Զ���ְ</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sjszdjz","N+��&Y+��",sjszdjz);
%>
          <BR>
          <b><font color="#000099">���ʦ�ӡ�A�꡿������B�꡿��ϵͳ��ȨΪ��A�꡿�͡�B�꡿</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>ҵ��Ա��������ѯ�ͻ��Զ�����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "ywyzdgh","N+��&Y+��",ywyzdgh);
%>
          <BR>
          <b><font color="#000099">���ʦ�ӡ��г���A���������г���B��������ѯ�ͻ����Զ��ɡ��г���A���������г���B��</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>�ͻ�����������ѯ�ͻ��Զ�����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "khjlzdgh","N+��&Y+��",khjlzdgh);
%>
          <BR>
          <b><font color="#000099">�ͻ�����ӡ�A�꡿������B�꡿������ѯ�ͻ����Զ��ɡ�A�꡿������B�꡿</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>�ͻ����������Զ���ְ</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "khjlzdjz","N+��&Y+��",khjlzdjz);
%>
          <BR>
          <b><font color="#000099">�ͻ�����ӡ�A�꡿������B�꡿��ϵͳ��ȨΪ��A�꡿�͡�B�꡿</font></b></td>
    </tr>
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
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

	if(	!radioChecked(FormName.zxkhlrjc)) {
		alert("��ѡ��[������ѯ�ͻ�¼����]��");
		FormName.zxkhlrjc[0].focus();
		return false;
	}
	if (FormName.zxkhlrjc[1].checked)
	{
		if(	javaTrim(FormName.zxkhlrts)=="") {
			alert("��ѡ��[��ѯ�ͻ���ǰ¼������]��");
			FormName.zxkhlrts.focus();
			return false;
		}
		if(!(isNumber(FormName.zxkhlrts, "��ѯ�ͻ���ǰ¼������"))) {
			return false;
		}
	}
	else{
		FormName.zxkhlrts.value="";
	}


	if(	!radioChecked(FormName.qdkhbljc)) {
		alert("��ѡ��[����ǩ���ͻ���¼���]��");
		FormName.qdkhbljc[0].focus();
		return false;
	}
	if (FormName.qdkhbljc[1].checked)
	{
		if(	javaTrim(FormName.qdkhblts)=="") {
			alert("��ѡ��[ǩ���ͻ���¼��������]��");
			FormName.qdkhblts.focus();
			return false;
		}
		if(!(isNumber(FormName.qdkhblts, "ǩ���ͻ���¼��������"))) {
			return false;
		}
	}
	else{
		FormName.qdkhblts.value="";
	}

	if(	javaTrim(FormName.djbhts)=="") {
		alert("��ѡ��[������ͻ���������]��");
		FormName.djbhts.focus();
		return false;
	}
	if(!(isNumber(FormName.djbhts, "������ͻ���������"))) {
		return false;
	}

	if(	javaTrim(FormName.scyjts)=="") {
		alert("��ѡ��[�г��ͻ��ƽ���Ч����]��");
		FormName.scyjts.focus();
		return false;
	}
	if(!(isNumber(FormName.scyjts, "�г��ͻ��ƽ���Ч����"))) {
		return false;
	}
	if(	!radioChecked(FormName.sjszdgh)) {
		alert("��ѡ��[���ʦ��������ѯ�ͻ��Զ�����]��");
		FormName.sjszdgh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjszdjz)) {
		alert("��ѡ��[���ʦ�������Զ���ְ]��");
		FormName.sjszdjz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ywyzdgh)) {
		alert("��ѡ��[ҵ��Ա��������ѯ�ͻ��Զ�����]��");
		FormName.ywyzdgh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khjlzdgh)) {
		alert("��ѡ��[�ͻ�����������ѯ�ͻ��Զ�����]��");
		FormName.khjlzdgh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khjlzdjz)) {
		alert("��ѡ��[�ͻ����������Զ���ְ]��");
		FormName.khjlzdjz[0].focus();
		return false;
	}

	FormName.action="SaveEditLrgfSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











