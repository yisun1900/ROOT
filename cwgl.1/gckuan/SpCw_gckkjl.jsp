<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String kkjlh=null;
String khbh=null;
String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String spsjsfy=null;
String spsgdfy=null;
String spzjfy=null;
String spgsfy=null;
String spqtfy=null;
String spgckk=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxje=0;


String wherekkjlh=cf.GB2Uni(request.getParameter("kkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kkjlh,khbh,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,spgckk,spsjsfy,spsgdfy,spzjfy,spgsfy,spqtfy,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_gckkjl";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kkjlh=cf.fillNull(rs.getString("kkjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));

		spsjsfy=cf.fillNull(rs.getString("spsjsfy"));
		spsgdfy=cf.fillNull(rs.getString("spsgdfy"));
		spzjfy=cf.fillNull(rs.getString("spzjfy"));
		spgsfy=cf.fillNull(rs.getString("spgsfy"));
		spqtfy=cf.fillNull(rs.getString("spqtfy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		spgckk=cf.fillNull(rs.getString("spgckk"));
	}
	rs.close();
	ps.close();

	ls_sql="select fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,sgbz,jgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();

	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
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
<title>���������󹤳̿ۿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�������̿ۿ�ۿ��¼�ţ�<%=kkjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveSpCw_gckkjl.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ����</td>
  <td><%=khbh%></td>
  <td align="right">��ͬ��</td>
  <td><%=hth%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">�ͻ�����</div></td>
  <td><%=khxm%>��<%=lxfs%>�� </td>
  <td><div align="right">�ʼ�����</div></td>
  <td><%=zjxm%>��<%=zjdh%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ݵ�ַ</td>
  <td colspan="3"><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">ǩԼ����</div></td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>  </td>
  <td><div align="right">���ʦ</div></td>
  <td><%=sjs%>��<%=sjsdh%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%></td>
  <td align="right">���������</td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʩ����</td>
  <td><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
  <td align="right">�೤</td>
  <td><%=sgbz%>��<%=bzdh%>��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">ǩԼ����</div></td>
  <td><%=qyrq%> </td>
  <td><div align="right">��ͬ��������</div></td>
  <td><%=jgrq%> </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td><div align="right">��װ����ǩԼ��</div></td>
  <td><%=qye%> </td>
  <td><div align="right">����ԭ����</div></td>
  <td><%=wdzgce%> </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">��Ʒ�</td>
  <td><%=sjf%></td>
  <td align="right">�����</td>
  <td><%=glf%></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">�������ܶ�</td>
  <td><%=cf.formatDouble(zjxje)%>��</td>
  <td align="right"><font color="#0000FF">���չ��̿�</font></td>
  <td><font color="#0000FF"><%=cf.formatDouble(sfke)%>������<font color="#0000FF">δ��<%=cf.formatDouble(qye+zjxje-sfke)%>��</font>��</font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><strong><font color="#000099">���ʦ�е�����</font></strong></div></td>
  <td><%=sjsfy%></td>
  <td><div align="right"><font color="#000099"><strong>ʩ���ӳе�����</strong></font></div></td>
  <td><%=sgdfy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><strong><font color="#000099">�ʼ�е�����</font></strong></div></td>
  <td><%=zjfy%></td>
  <td><div align="right"><strong><font color="#000099">��˾�е�����</font></strong></div></td>
  <td><%=gsfy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right"><strong><font color="#000099">�������е�����</font></strong></div></td>
  <td><%=qtfy%></td>
  <td><div align="right"><strong><font color="#000099">���̿ۿ�</font></strong></div></td>
  <td><%=gckk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%"> 
    <div align="right">¼����</div>  </td>
  <td width="30%"><%=lrr%></td>
  <td width="21%"> 
    <div align="right">¼��ʱ��</div>  </td>
  <td width="29%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%"> 
    <div align="right">¼�벿��</div>  </td>
  <td colspan="3">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>
  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="20%"> 
    <div align="right">��ע</div>  </td>
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">������<font color="#990000"><strong>���ʦ�е�����</strong></font></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spsjsfy" size="20" maxlength="17"  value="<%=spsjsfy%>" onChange="f_js(editform)">  </td>
  <td bgcolor="#FFFFCC"><div align="right">������<strong><font color="#990000">ʩ���ӳе�����</font></strong></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spsgdfy" size="20" maxlength="17"  value="<%=spsgdfy%>" onChange="f_js(editform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">������<font color="#990000"><strong>�ʼ�е�����</strong></font></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spzjfy" size="20" maxlength="17"  value="<%=spzjfy%>" onChange="f_js(editform)">  </td>
  <td bgcolor="#FFFFCC"><div align="right">������<strong><font color="#990000">��˾�е�����</font></strong></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spgsfy" size="20" maxlength="17"  value="<%=spgsfy%>" onChange="f_js(editform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">������<font color="#990000"><strong>�������е�����</strong></font></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spqtfy" size="20" maxlength="17"  value="<%=spqtfy%>" onChange="f_js(editform)">  </td>
  <td bgcolor="#FFFFCC"><div align="right">������<strong><font color="#990000">���̿ۿ�</font></strong></div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spgckk" value="<%=spgckk%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">������</div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td bgcolor="#FFFFCC"><div align="right">����ʱ��</div></td>
  <td bgcolor="#FFFFCC"><input type="text" name="spsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">������־</td>
  <td colspan="3" bgcolor="#FFFFCC"><input type="radio" name="spbz" value="3">
    ����ͨ��
    <input type="radio" name="spbz" value="4">
    ����δͨ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td bgcolor="#FFFFCC"><div align="right">�������</div></td>
  <td colspan="3" bgcolor="#FFFFCC"><textarea name="spyj" cols="69" rows="3"></textarea>
      <div align="right"></div></td>
</tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
					<input type="hidden" name="wherekkjlh"  value="<%=wherekkjlh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>              </td>
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
function f_js(FormName)//����FormName:Form������
{
	var gk=FormName.spsjsfy.value*1.0+FormName.spsgdfy.value*1.0+FormName.spzjfy.value*1.0+FormName.spgsfy.value*1.0+FormName.spqtfy.value*1.0;
	gk=round(gk,2);
	FormName.spgckk.value=gk;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.spsjsfy)=="") {
		alert("������[���������ʦ�е�����]��");
		FormName.spsjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spsjsfy, "���������ʦ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.spsgdfy)=="") {
		alert("������[������ʩ���ӳе�����]��");
		FormName.spsgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spsgdfy, "������ʩ���ӳе�����"))) {
		return false;
	}
	if(	javaTrim(FormName.spzjfy)=="") {
		alert("������[�������ʼ�е�����]��");
		FormName.spzjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spzjfy, "�������ʼ�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.spgsfy)=="") {
		alert("������[������˾�е�����]��");
		FormName.spgsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spgsfy, "������˾�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.spqtfy)=="") {
		alert("������[�������������е�����]��");
		FormName.spqtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.spqtfy, "�������������е�����"))) {
		return false;
	}

	f_js(FormName);

	if (FormName.spgckk.value!=(FormName.spsjsfy.value*1.0+FormName.spsgdfy.value*1.0+FormName.spzjfy.value*1.0+FormName.spgsfy.value*1.0+FormName.spqtfy.value*1.0))
	{
		alert("����[�����󹤳̿ۿ�]����ϸ����һ����ֵ������");
		FormName.spgckk.focus();
		return false;
	}

	if(	!radioChecked(FormName.spbz)) {
		alert("��ѡ��[������־]��");
		FormName.spbz[0].focus();
		return false;
	}
	
	if(	javaTrim(FormName.spr)=="") {
		alert("��¼��������");
		FormName.spsj.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("������[����ʱ��]��");
		FormName.spsj.focus();
		return false;
	}
  if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
