<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
String psdh=null;
psdh=cf.GB2Uni(request.getParameter("psdh"));

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ckdw=null;
String lrr=null;
String lrsj=null;
String bz=null;
String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;
String lx=null;
double yf=0;
double qtsf=0;


String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;


try { 
	conn=cf.getConnection();

	ls_sql="select dwbh,lrr,lrsj,bz,khbh,psfs,jhshsj,fkje,lx,yf,qtsf";
	ls_sql+=" from  cl_psd";
	ls_sql+=" where psdh='"+psdh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdw=cf.fillNull(rs.getString("dwbh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		lx=cf.fillNull(rs.getString("lx"));
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
	}
	rs.close();
	ps.close();


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
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
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">�޸Ĳ������͵�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ͻ����</font></div>
      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="20%"> 
        <div align="right"><font color="#0000CC">��ͬ��</font></div>
      </td>
      <td width="30%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ͻ�����</font></div>
      </td>
      <td width="31%"> <%=khxm%> </td>
      <td width="20%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="30%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="20%" align="right"><font color="#0000CC">���ʦ</font></td>
      <td width="30%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
      </td>
      <td width="31%"><%=zjxm%> </td>
      <td width="20%"> 
        <div align="right">ǩԼ��</div>
      </td>
      <td width="30%"><%=qye%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#0000CC">ʩ����</font></div>
      </td>
      <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="20%"> 
        <div align="right"><font color="#0000CC">ʩ������</font></div>
      </td>
      <td width="30%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="31%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="20%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="30%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">���͵���</font></td>
      <td width="31%"> 
        <input type="text" name="psdh" value="<%=psdh%>" size="20" maxlength="11" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">�ֹ�˾</font></td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ckdw+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>���ͷ�ʽ</td>
      <td width="31%"> <%
	cf.radioToken(out, "psfs","1+����&2+����&9+����",psfs);
%> </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>�ƻ��ͻ�ʱ��</td>
      <td width="30%"> 
        <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�����˷�</td>
      <td width="31%"> 
        <input type="text" name="yf" value="<%=yf%>" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>�����շ�</td>
      <td width="30%"> 
        <input type="text" name="qtsf" value="<%=qtsf%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>������</td>
      <td width="31%"> 
        <input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" >
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>����</td>
      <td width="30%"><%
	cf.radioToken(out, "lx","1+���&2+�˻�",lx);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="����¼����ϸ" onClick="f_pllr(insertform)" name="pllr">
        <input type="button"  value="¼����ϸ" onClick="f_cklr(insertform)" name="cklr" >
		   <input type="button"  value="ѡ�����" onClick="f_xz(insertform)" name="xzcl" >
		<input type="button"  value="¼������" onClick="f_lrsl(insertform)" name="lrsl">
        <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" >
        <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" >
        <input type="reset"  value="����" name="reset">
        <input type="button"  value="��ӡ���͵�" onClick="f_print(insertform)" name="print" >
      </td>
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
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("��ѡ��[���ͷ�ʽ]��");
		FormName.psfs[0].focus();
		return false;
	}
	if (FormName.psfs[0].checked)
	{
		if(	javaTrim(FormName.jhshsj)=="") {
			alert("������[�ƻ��ͻ�ʱ��]��");
			FormName.jhshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.jhshsj.value="";
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("������[������]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.yf)=="") {
		alert("������[�����˷�]��");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "�����˷�"))) {
		return false;
	}
	if(	javaTrim(FormName.qtsf)=="") {
		alert("������[�����շ�]��");
		FormName.qtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsf, "�����շ�"))) {
		return false;
	}

	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
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

	FormName.action="SaveEditCl_ckd.jsp";
	FormName.submit();

	return true;
}


function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="PllrCl_clbm.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}

function f_lrsl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="PllrCl_clbmSl.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}


function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}
function f_xz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="SelectCxCl_clbm2.jsp";
	FormName.submit();
	FormName.ckmx.disabled=false;
	FormName.tj.disabled=false;
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="Cl_ckmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="tjckd.jsp";
	FormName.submit();
	FormName.ckmx.disabled=true;
	FormName.cklr.disabled=true;
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.psdh)=="") {
		alert("������[���͵���]��");
		FormName.psdh.focus();
		return false;
	}

	FormName.action="dypsd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
