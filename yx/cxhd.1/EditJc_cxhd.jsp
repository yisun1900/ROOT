<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxhdmc=null;
String fgsbh=null;
int dj=0;
double fxgck=0;
double fxzck=0;

double zdzk=0;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double qtsfxmzk=0;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

String zjxzklx=null;
String sfybfxmzk=null;

String hdlx=null;
String kgxqthd=null;
String zklx="";
String bz=null;

String kssj=null;
String cxjssj=null;
String qdjssj=null;

String yxbffydz="";//�Ƿ������ַ��ô���  1������9��������

String zdzkDisplay="none";
String dxzkDisplay="none";
String bfzkDisplay="none";
String qtzkDisplay="none";

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));


String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//��ʾ¼�����ֱ��ת����
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh,dj,fxgck,fxzck,zdzk,gcfzk,glfzk,hdlx,kgxqthd,zklx,bz,sjzk,sjfzk,qtsfxmzk";
	ls_sql+=" ,zjxzklx,sfybfxmzk ";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		sfybfxmzk=cf.fillNull(rs.getString("sfybfxmzk"));

		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dj=rs.getInt("dj");
		fxgck=rs.getDouble("fxgck");
		fxzck=rs.getDouble("fxzck");
		zdzk=rs.getDouble("zdzk");
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		hdlx=cf.fillNull(rs.getString("hdlx"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
		zklx=cf.fillNull(rs.getString("zklx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT kssj,cxjssj,qdjssj";
	ls_sql+=" FROM jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		qdjssj=cf.fillNull(rs.getDate("qdjssj"));
	}
	rs.close();
	ps.close();

	if (zklx.equals("4"))//4�����ۿۣ�1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="none";
		dxzkDisplay="none";
		bfzkDisplay="none";
		qtzkDisplay="none";
	}
	else if (zklx.equals("1"))//4�����ۿۣ�1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="block";
		dxzkDisplay="none";
		bfzkDisplay="none";
		qtzkDisplay="none";
	}
	else if (zklx.equals("2"))//4�����ۿۣ�1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="none";
		dxzkDisplay="block";
		bfzkDisplay="none";
		qtzkDisplay="block";
	}
	else if (zklx.equals("3"))//4�����ۿۣ�1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zdzkDisplay="none";
		dxzkDisplay="none";
		bfzkDisplay="block";
		qtzkDisplay="block";
	}

	ls_sql="select sq_dwxx.yxbffydz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">���޸Ĵ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="hidden" name="oldkssj" value="<%=kssj%>">
            <input type="button"  value="����" onClick="f_do(insertform)">
            <input type="button" name="scfj" value="�ϴ�����" onClick="f_scfj(insertform)" >
            <input type="button" name="xs" value="ҵ��ϵ��" onClick="f_xs(insertform)" >
            <input type="reset"  value="����">
            <br>
            <br>
                <input type="button" onClick="f_zsxx(insertform)" value="��ѡ������Ϣ" >
                <input type="button" onClick="f_dxzsxx(insertform)" value="��ѡ������Ϣ" >
                <input type="button" onClick="f_djj(insertform)" value="����ȯ" >
                <input type="button" value="�μӻ����" onClick="f_dm(insertform)" >
            <input type="button" value="����С��" onClick="f_xq(insertform)" >
            <input type="button" onClick="f_djfxbz(insertform)" value="�����ֱ�׼" >
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">���������</font></td>
      <td width="32%"> 
      <input type="text" name="cxhdbm" size="20" maxlength="7"  value="<%=cxhdbm%>" readonly>      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>�ֹ�˾</td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>���������</td>
      <td colspan="3"> 
        <input type="text" name="cxhdmc" size="71" maxlength="50"  value="<%=cxhdmc%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�����</td>
      <td colspan="3"><%
	cf.radioToken(out, "hdlx","1+�޻&2+��˾�&3+С���&4+չ��&5+�г��",hdlx);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ɹ��������</td>
      <td><%
	cf.radioToken(out, "kgxqthd","1+���ɹ���&2+�ɹ���",kgxqthd);
%></td>
      <td align="right"><font color="#FF0000">*</font>����</td>
      <td><input type="text" name="dj" size="20" maxlength="8"  value="<%=dj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�౶���ֹ��̿�</td>
      <td><input type="text" name="fxgck" value="<%=fxgck%>" size="10" maxlength="8" >
          <strong><font color="#FF0000">��¼�뱶����</font></strong></td>
      <td align="right"><font color="#FF0000">*</font>�౶�������Ŀ�</td>
      <td><input type="text" name="fxzck" value="<%=fxzck%>" size="10" maxlength="8" >
          <strong><font color="#FF0000">��¼�뱶����</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">���Чʱ��      
      <input type="button" name="sjd" value="¼�����ʱ���" onClick="f_sjd(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>��ʼʱ��(>=)</td>
      <td><input type="text" name="kssj" value="<%=kssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>��������ʱ��(<=)</td>
      <td><input type="text" name="cxjssj" value="<%=cxjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right"><font color="#FF0000">*</font>ǩ������ʱ��(<=)</td>
      <td><input type="text" name="qdjssj" value="<%=qdjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC">��ۿ�</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�ۿ�����</td>
      <td colspan="3">
	  
  <INPUT type="radio" name="zklx" value="4" <%if (zklx.equals("4")) out.println("checked");%>  onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    ���ۿ�
  <INPUT type="radio" name="zklx" value="1" <%if (zklx.equals("1")) out.println("checked");%>  onClick="zddz.style.display='block';dxdz.style.display='none';bfdz.style.display='none';qtdz.style.display='none'">
    ��������
      <INPUT type="radio" name="zklx" value="2" <%if (zklx.equals("2")) out.println("checked");%> onClick="zddz.style.display='none';dxdz.style.display='block';bfdz.style.display='none';qtdz.style.display='block'">
      �������
<%
	if (yxbffydz.equals("1"))//�Ƿ������ַ��ô���  1������9��������
	{
		%>
		  <input type="radio" name="zklx" value="3" <%if (zklx.equals("3")) out.println("checked");%> onClick="zddz.style.display='none';dxdz.style.display='none';bfdz.style.display='block';qtdz.style.display='block'">���ַ��ô���
		<%
	}
%>	  </td>
    </tr>
</table>
    
<table width="100%" border="0" style="FONT-SIZE:12;display:<%=zdzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="zddz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">��������</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>�����ۿ�</td>
  <td width="32%"><input name="zdzk" type="text"  value="<%=zdzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>0��<=10��</font></b></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=bfzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>���̷Ѳ��ִ���</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td width="32%"><input type="text" name="clfzk" size="8" maxlength="9"  value="<%=clfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>���̣����ķ��ۿ�</td>
  <td width="32%"><input type="text" name="zcfzk" size="8" maxlength="9"  value="<%=zcfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b> </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣��˹����ۿ�</td>
  <td><input type="text" name="rgfzk" size="8" maxlength="9"  value="<%=rgfzk%>" >
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣�������ۿ�</td>
  <td><input type="text" name="ysfzk" size="8" maxlength="8" value="<%=ysfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣���е���ۿ�</td>
  <td><input type="text" name="jxfzk" size="8" maxlength="8" value="<%=jxfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>���̣���ķ��ۿ�</td>
  <td><input type="text" name="shfzk" size="8" maxlength="8" value="<%=shfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̣��������ۿ�</td>
  <td><input type="text" name="qtfzk" size="8" maxlength="8" value="<%=qtfzk%>">
      <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=dxzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="dxdz" >
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>�������</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>���̷��ۿ�</td>
  <td><input type="text" name="gcfzk" value="<%=gcfzk%>" size="8" maxlength="8" >
      <b><font color="#0000FF">��>0��<=10��</font></b> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>�������ۿ�����</td>
  <td width="32%"><INPUT type="radio" name="zjxzklx" value="1" <%if (zjxzklx.equals("1")) out.println("checked");%> onClick="tzjxzk.disabled=true">
    ͬ��ͬ
    <INPUT type="radio" name="zjxzklx" value="2" <%if (zjxzklx.equals("2")) out.println("checked");%> onClick="tzjxzk.disabled=false">
    �����ۿ� </td>
  <td width="18%" align="right"><font color="#FF0000">*</font>�Ƿ��в�����Ŀ����</td>
  <td width="32%">
  
	<input type="radio" name="sfybfxmzk" value="Y" <%if (sfybfxmzk.equals("Y")) out.println("checked");%> onClick="tbfxmzk.disabled=false">��
	<input name="sfybfxmzk" type="radio" value="N" <%if (sfybfxmzk.equals("N")) out.println("checked");%> onClick="tbfxmzk.disabled=true">��
	
	</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center">
		<input name="tbfxmzk" type="button" onClick="f_bfdz(insertform)"  value="���ֹ�����Ŀ��������" <% if (sfybfxmzk.equals("N")) out.println("disabled");%>>
		<input name="tzjxzk" type="button" onClick="window.open('InsertJc_cxhdzjxzk.jsp?cxhdbm=<%=cxhdbm%>')"  value="�������������" <% if (zjxzklx.equals("1")) out.println("disabled");%></td>
</tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12;display:<%=qtzkDisplay%>" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="qtdz" >
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right"><font color="#FF0000">*</font>������ۿ�</td>
  <td width="32%"><input type="text" name="glfzk" value="<%=glfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>˰���ۿ�</td>
  <td width="32%"><input type="text" name="sjzk" value="<%=sjzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>��Ʒ��ۿ�</td>
  <td><input type="text" name="sjfzk" value="<%=sjfzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
  <td align="right"><font color="#FF0000">*</font>�����շ���Ŀ�ۿ�</td>
  <td><input name="qtsfxmzk" type="text" value="<%=qtsfxmzk%>" size="8" maxlength="8" >
    <b><font color="#0000FF">��>=0��<=10��</font></b></td>
</tr>
</table>


<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td width="82%" colspan="3"> 
      <textarea name="bz" cols="72" rows="19"><%=bz%></textarea>      </td>
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
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
	
	FormName.action="SaveEditJc_cxhd.jsp";
	FormName.submit();
	return true;
}

function f_scfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}

function f_sjd(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	
	FormName.action="InsertJc_cxhdsj.jsp";
	FormName.submit();
	return true;
	
}

function f_xq(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhdxq.jsp";
	FormName.submit();
	return true;
	
}

function f_xs(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhdyjxs.jsp";
	FormName.submit();
	return true;
	
}


function f_dm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhddm.jsp";
	FormName.submit();
	return true;
}

function f_zsxx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hdzsxx.jsp";
	FormName.submit();
	return true;
}

function f_dxzsxx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hddxzsxx.jsp";
	FormName.submit();
	return true;
}

function f_bfdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hdbfxmdz.jsp";
	FormName.submit();
	return true;
}

function f_djj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_hddjj.jsp";
	FormName.submit();
	return true;
}

function f_djfxbz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("������[���������]��");
		FormName.cxhdbm.focus();
		return false;
	}
	FormName.action="InsertJc_cxhddjfxbz.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
