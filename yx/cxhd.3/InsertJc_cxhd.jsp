<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String yxbffydz="";//�Ƿ������ַ��ô���  1������9��������

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sq_dwxx.yxbffydz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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


<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
      <div align="center"> ��¼������</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                  <input type="button"  value="����" onClick="f_do(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td width="32%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
%>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>���������</td>
              <td colspan="3"> 
                <input type="text" name="cxhdmc" value="" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�����</td>
              <td colspan="3"><input type="radio" name="hdlx" value="1">
                �޻
                <input type="radio" name="hdlx" value="2">
                ��˾�
                <input type="radio" name="hdlx" value="3">
                С���
                <input type="radio" name="hdlx" value="4">
                չ��
                <input type="radio" name="hdlx" value="5">
                �г��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ɹ��������</td>
              <td><%
	cf.radioToken(out, "kgxqthd","1+���ɹ���&2+�ɹ���","");
%></td>
              <td align="right"><font color="#FF0000">*</font>����</td>
              <td><input type="text" name="dj" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�౶���ֹ��̿�</td>
              <td><input type="text" name="fxgck" value="" size="10" maxlength="8" >
                <strong><font color="#FF0000">��¼�뱶����</font></strong></td>
              <td align="right"><font color="#FF0000">*</font>�౶�������Ŀ�</td>
              <td><input type="text" name="fxzck" value="0" size="10" maxlength="8" >
              <strong><font color="#FF0000">��¼�뱶����</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">���Чʱ��              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>��ʼʱ��(>=)</td>
              <td><input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td colspan="2" align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>��������ʱ��(<=) </td>
              <td><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"><font color="#FF0000">*</font>ǩ������ʱ��(<=) </td>
              <td><input type="text" name="qdjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFCC">��ۿ�</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
              <td colspan="3">
  
  <INPUT type="radio" name="zklx" value="4"  onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    ���ۿ�
  <INPUT type="radio" name="zklx" value="1"  onClick="zddz.style.display='block';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    ��������
      <INPUT type="radio" name="zklx" value="2" onClick="zddz.style.display='none';dxdz.style.display='block';bfdz.style.display='none';qtdz.style.display='block'">
      �������
<%
	if (yxbffydz.equals("1"))//�Ƿ������ַ��ô���  1������9��������
	{
		%>
		  <input type="radio" name="zklx" value="3" onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='block';qtdz.style.display='block'">���ַ��ô���
		<%
	}
%>

           </tr>
			  </td>
 </table>

<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="zddz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">��������</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>�����ۿ�</td>
  <td width="32%"><input name="zdzk" type="text"  value="" size="8" maxlength="8" >
    <b><font color="#0000FF">��>0��<=10��</font></b></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>���̷Ѳ��ִ���</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td width="32%"><input type="text" name="clfzk" size="8" maxlength="9"  value="" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td width="32%"><input type="text" name="zcfzk" size="8" maxlength="9"  value="" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣��˹����ۿ�</td>
  <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣�������ۿ�</td>
  <td><input type="text" name="ysfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣���е���ۿ�</td>
  <td><input type="text" name="jxfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣���ķ��ۿ�</td>
  <td><input type="text" name="shfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣��������ۿ�</td>
  <td><input type="text" name="qtfzk" size="8" maxlength="8" value="">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="dxdz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>�������</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̷��ۿ�</td>
  <td><input type="text" name="gcfzk" value="" size="8" maxlength="8" >
      <b><font color="#0000FF">��>0��<=10��</font></b> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>�������ۿ�����</td>
  <td width="32%"><INPUT type="radio" name="zjxzklx" value="1"  >
    ͬ��ͬ
    <INPUT type="radio" name="zjxzklx" value="2"  >
    �����ۿ� </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ��в�����Ŀ����</td>
  <td width="32%"><input type="radio" name="sfybfxmzk" value="Y"  >
    ��
    <input name="sfybfxmzk" type="radio" value="N"  >
    ��</td>
</tr>

</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:none" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="qtdz" >
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>������ۿ�</td>
  <td width="32%"><input type="text" name="glfzk" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>˰���ۿ�</td>
  <td width="32%"><input type="text" name="sjzk" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>��Ʒ��ۿ�</td>
  <td><input type="text" name="sjfzk" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>�����շ���Ŀ�ۿ�</td>
  <td><input name="qtsfxmzk" type="text" value="" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
</table>


<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td width="82%" colspan="3"> 
              <textarea name="bz" cols="72" rows="19"></textarea>              </td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.cxhdmc)=="") {
		alert("������[���������]��");
		FormName.cxhdmc.focus();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isNumber(FormName.dj, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.fxgck )=="") {
		alert("������[�౶���ֹ��̿�]��");
		FormName.fxgck.focus();
		return false;
	}

	if(!(isFloat(FormName.fxgck , "�౶���ֹ��̿�"))) {
		return false;
	}

	if(	javaTrim(FormName.fxzck )=="") {
		alert("������[�౶�������Ŀ�]��");
		FormName.fxzck.focus();
		return false;
	}
	if(!(isFloat(FormName.fxzck , "�౶�������Ŀ�"))) {
		return false;
	}

	if(	javaTrim(FormName.kssj)=="") {
		alert("������[��ʼʱ��]��");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cxjssj)=="") {
		alert("������[��������ʱ��]��");
		FormName.cxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxjssj, "��������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qdjssj)=="") {
		alert("������[ǩ������ʱ��]��");
		FormName.qdjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qdjssj, "ǩ������ʱ��"))) {
		return false;
	}

	if (FormName.kssj.value>FormName.cxjssj.value)
	{
		alert("[��������ʱ��]����С��[��ʼʱ��]��");
		FormName.cxjssj.select();
		return false;
	}
	if (FormName.kssj.value>FormName.qdjssj.value)
	{
		alert("[ǩ������ʱ��]����С��[��ʼʱ��]��");
		FormName.qdjssj.select();
		return false;
	}

	if(	!radioChecked(FormName.hdlx)) {
		alert("��ѡ��[�����]��");
		FormName.hdlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgxqthd)) {
		alert("��ѡ��[�ɹ��������]��");
		FormName.kgxqthd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zklx)) {
		alert("��ѡ��[�ۿ�����]��");
		FormName.zklx[0].focus();
		return false;
	}

	

	if (FormName.zklx[1].checked)//��������
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("������[�����ۿ�]��");
			FormName.zdzk.focus();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "�����ۿ�"))) {
			return false;
		}
		if (FormName.zdzk.value<=0 || FormName.zdzk.value>10)
		{
			alert("����[�����ۿ�]Ӧ����0��10֮�䣡");
			FormName.zdzk.select();
			return false;
		}
	}
	else if (FormName.zklx[2].checked)//�������
	{
		if(	javaTrim(FormName.gcfzk)=="") {
			alert("������[���̷��ۿ�]��");
			FormName.gcfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.gcfzk, "���̷��ۿ�"))) {
			return false;
		}
		if (FormName.gcfzk.value<0 || FormName.gcfzk.value>10)
		{
			alert("����[���̷��ۿ�]Ӧ����0��10֮�䣡");
			FormName.gcfzk.select();
			return false;
		}


		if(	javaTrim(FormName.glfzk)=="") {
			alert("������[������ۿ�]��");
			FormName.glfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.glfzk, "������ۿ�"))) {
			return false;
		}
		if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
		{
			alert("����[������ۿ�]Ӧ����0��10֮�䣡");
			FormName.glfzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjzk)=="") {
			alert("������[˰���ۿ�]��");
			FormName.sjzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjzk, "˰���ۿ�"))) {
			return false;
		}
		if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
		{
			alert("����[˰���ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjfzk)=="") {
			alert("������[��Ʒ��ۿ�]��");
			FormName.sjfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjfzk, "��Ʒ��ۿ�"))) {
			return false;
		}
		if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
		{
			alert("����[��Ʒ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjfzk.select();
			return false;
		}

		if(	javaTrim(FormName.qtsfxmzk)=="") {
			alert("������[�����շ���Ŀ�ۿ�]��");
			FormName.qtsfxmzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtsfxmzk, "�����շ���Ŀ�ۿ�"))) {
			return false;
		}
		if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
		{
			alert("����[�����շ���Ŀ�ۿ�]Ӧ����0��10֮�䣡");
			FormName.qtsfxmzk.select();
			return false;
		}

		if(	!radioChecked(FormName.zjxzklx)) {
			alert("��ѡ��[�������ۿ�����]��");
			FormName.zjxzklx[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfybfxmzk)) {
			alert("��ѡ��[�Ƿ��в�����Ŀ����]��");
			FormName.sfybfxmzk[0].focus();
			return false;
		}
	}
	else if (FormName.zklx[3].checked)//���ַ��ô���
	{
		if(	javaTrim(FormName.clfzk)=="") {
			alert("������[���ķ��ۿ�]��");
			FormName.clfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.clfzk, "���ķ��ۿ�"))) {
			return false;
		}
		if (FormName.clfzk.value<0 || FormName.clfzk.value>10)
		{
			alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.clfzk.select();
			return false;
		}
		if(	javaTrim(FormName.zcfzk)=="") {
			alert("������[���ķ��ۿ�]��");
			FormName.clfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.zcfzk, "���ķ��ۿ�"))) {
			return false;
		}
		if (FormName.zcfzk.value<0 || FormName.zcfzk.value>10)
		{
			alert("����[���ķ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.zcfzk.select();
			return false;
		}
		if(	javaTrim(FormName.rgfzk)=="") {
			alert("������[�˹����ۿ�]��");
			FormName.rgfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.rgfzk, "�˹����ۿ�"))) {
			return false;
		}
		if (FormName.rgfzk.value<0 || FormName.rgfzk.value>10)
		{
			alert("����[�˹����ۿ�]Ӧ����0��10֮�䣡");
			FormName.rgfzk.select();
			return false;
		}
		if(	javaTrim(FormName.ysfzk)=="") {
			alert("������[������ۿ�]��");
			FormName.ysfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.ysfzk, "������ۿ�"))) {
			return false;
		}
		if (FormName.ysfzk.value<0 || FormName.ysfzk.value>10)
		{
			alert("����[������ۿ�]Ӧ����0��10֮�䣡");
			FormName.ysfzk.select();
			return false;
		}
		if(	javaTrim(FormName.jxfzk)=="") {
			alert("������[��е���ۿ�]��");
			FormName.jxfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.jxfzk, "��е���ۿ�"))) {
			return false;
		}
		if (FormName.jxfzk.value<0 || FormName.jxfzk.value>10)
		{
			alert("����[��е���ۿ�]Ӧ����0��10֮�䣡");
			FormName.jxfzk.select();
			return false;
		}
		if(	javaTrim(FormName.shfzk)=="") {
			alert("������[��ķ��ۿ�]��");
			FormName.shfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.shfzk, "��ķ��ۿ�"))) {
			return false;
		}
		if (FormName.shfzk.value<0 || FormName.shfzk.value>10)
		{
			alert("����[��ķ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.shfzk.select();
			return false;
		}
		if(	javaTrim(FormName.qtfzk)=="") {
			alert("������[�������ۿ�]��");
			FormName.qtfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfzk, "�������ۿ�"))) {
			return false;
		}
		if (FormName.qtfzk.value<0 || FormName.qtfzk.value>10)
		{
			alert("����[�������ۿ�]Ӧ����0��10֮�䣡");
			FormName.qtfzk.select();
			return false;
		}

	

		if(	javaTrim(FormName.glfzk)=="") {
			alert("������[������ۿ�]��");
			FormName.glfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.glfzk, "������ۿ�"))) {
			return false;
		}
		if (FormName.glfzk.value<0 || FormName.glfzk.value>10)
		{
			alert("����[������ۿ�]Ӧ����0��10֮�䣡");
			FormName.glfzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjzk)=="") {
			alert("������[˰���ۿ�]��");
			FormName.sjzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjzk, "˰���ۿ�"))) {
			return false;
		}
		if (FormName.sjzk.value<0 || FormName.sjzk.value>10)
		{
			alert("����[˰���ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjzk.select();
			return false;
		}
		if(	javaTrim(FormName.sjfzk)=="") {
			alert("������[��Ʒ��ۿ�]��");
			FormName.sjfzk.focus();
			return false;
		}
		if(!(isFloat(FormName.sjfzk, "��Ʒ��ۿ�"))) {
			return false;
		}
		if (FormName.sjfzk.value<0 || FormName.sjfzk.value>10)
		{
			alert("����[��Ʒ��ۿ�]Ӧ����0��10֮�䣡");
			FormName.sjfzk.select();
			return false;
		}

		if(	javaTrim(FormName.qtsfxmzk)=="") {
			alert("������[�����շ���Ŀ�ۿ�]��");
			FormName.qtsfxmzk.focus();
			return false;
		}
		if(!(isFloat(FormName.qtsfxmzk, "�����շ���Ŀ�ۿ�"))) {
			return false;
		}
		if (FormName.qtsfxmzk.value<0 || FormName.qtsfxmzk.value>10)
		{
			alert("����[�����շ���Ŀ�ۿ�]Ӧ����0��10֮�䣡");
			FormName.qtsfxmzk.select();
			return false;
		}
	
	}


	FormName.action="SaveInsertJc_cxhd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
