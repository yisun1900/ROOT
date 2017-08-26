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
String psdh=null;
String nian=cf.today("YY");

String yhmc=(String)session.getAttribute("yhmc");
String khbh=request.getParameter("khbh");
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
int cpsl=0;


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



/***************************************************************\
|		����Ƿ�����ĩ��ת											|
\***************************************************************/
	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where  jzrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1))) and dwbh='"+fgs+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//�����ݿ���ȡ����ǰ������� 
	} 
	rs.close();
	ps.close();

	if (count==0)
	{
//		out.println("����û�н���<a href=\"/fcgl/qmjz/ydjz.jsp\">����ת</a>�����ܽ��п�������");
//		return;
	}

	ls_sql=" select NVL(MAX(to_number(SUBSTR(psdh,8,4))),0) ";
	ls_sql+=" from cl_psd where dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		count = rs.getInt(1);
	}
	rs.close();
	ps.close();

	psdh = fgs+nian+cf.addZero(count+1,4);
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
<div align="center">�������͵�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#0000CC">�ͻ����</font></div>
      </td>
      <td width="34%"> <%=khbh%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">��ͬ��</font></div>
      </td>
      <td width="33%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#0000CC">�ͻ�����</font></div>
      </td>
      <td width="34%"> <%=khxm%> </td>
      <td width="17%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="33%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td width="34%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="17%" align="right"><font color="#0000CC">���ʦ</font></td>
      <td width="33%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
      </td>
      <td width="34%"><%=zjxm%> </td>
      <td width="17%"> 
        <div align="right">ǩԼ��</div>
      </td>
      <td width="33%"><%=qye%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#0000CC">ʩ����</font></div>
      </td>
      <td width="34%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">ʩ������</font></div>
      </td>
      <td width="33%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="34%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="17%" align="right"><font color="#0000CC">��ͬ��������</font></td>
      <td width="33%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">���͵���</font></td>
      <td width="34%"> 
        <input type="text" name="psdh" value="<%=psdh%>" size="20" maxlength="11" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">�ֹ�˾</font></td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>���ͷ�ʽ</td>
      <td width="34%"> 
        <input type="radio" name="psfs" value="1">
        ���� 
        <input type="radio" name="psfs" value="2">
        ���� 
        <input type="radio" name="psfs" value="9">
        ���� </td>
      <td align="right" width="17%">�ƻ��ͻ�ʱ��</td>
      <td width="33%"> 
        <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="16%"><font color="#CC0000">*</font>�����˷�</td>
      <td width="34%"> 
        <input type="text" name="yf" value="0" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>�����շ�</td>
      <td width="33%"> 
        <input type="text" name="qtsf" value="0" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>������</td>
      <td width="34%"> 
        <input type="text" name="fkje" value="0" size="20" maxlength="14" >
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>����</td>
      <td width="33%"> 
        <input type="radio" name="lx" value="1">
        ��� 
        <input type="radio" name="lx" value="2">
        �˻� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></td>
      <td width="34%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="����¼����ϸ" onClick="f_pllr(insertform)" name="pllr" disabled>
        <input type="button"  value="¼����ϸ" onClick="f_cklr(insertform)" name="cklr" disabled>
        <input type="button"  value="ѡ�����" onClick="f_xz(insertform)" name="xzcl" disabled>
		<input type="button"  value="¼������" onClick="f_lrsl(insertform)" name="lrsl" disabled>
		<input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" disabled>
        <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" disabled>
        <input type="reset"  value="����" name="reset">
        <input type="button"  value="��ӡ���͵�" onClick="f_print(insertform)" name="print"  disabled>
        <input type="hidden" name="ckr" value="" size="20" maxlength="20" >
        <input type="hidden" name="cksj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
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


	FormName.action="SaveInsertCl_ckd.jsp";
	FormName.submit();

	FormName.pllr.disabled=false;
	FormName.cklr.disabled=false;
	FormName.print.disabled=false;
	FormName.xzcl.disabled=false;
	FormName.lrsl.disabled=false;
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
	FormName.ckmx.disabled=false;
	FormName.xzcl.disabled=false;
	FormName.lrsl.disabled=false;
	FormName.cklr.disabled=false;
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