<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String hth=null;
String khbh=null;
String ysgd=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String slfsbm=null;
String dwbh=null;
String slbm=null;
String tsnr=null;
String ssfgs=null;

String sfksj="";
String sjbh="";
String fysm="";
double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double cjcdfy=0;
String gys="";
double sgdcdfy=0;
String sgd="";
double khcdfy=0;
double gscdfy=0;
double qtfcdfy=0;
String jsbz="";
String jsjlh="";
String lrr=null;
String lrsj=null;
String wxdah="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select tsnr,slbm,slfsbm,hth,crm_khxx.khbh,crm_khxx.sgd,khxm,fwdz,lxfs,crm_khxx.dwbh,crm_khxx.fgsbh";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ysgd=cf.fillNull(rs.getString("sgd"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select wxdah,sfksj,sjbh,fysm,wxrgf,wxcf,wxclf,wxzfy,cjcdfy,gys,sgdcdfy,sgd,khcdfy,gscdfy,qtfcdfy,jsbz,jsjlh,lrr,lrsj ";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxdah=cf.fillNull(rs.getString("wxdah"));
		sfksj=cf.fillNull(rs.getString("sfksj"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fysm=cf.fillHtml(rs.getString("fysm"));
		wxrgf=rs.getDouble("wxrgf");
		wxcf=rs.getDouble("wxcf");
		wxclf=rs.getDouble("wxclf");
		wxzfy=rs.getDouble("wxzfy");
		cjcdfy=rs.getDouble("cjcdfy");
		gys=cf.fillNull(rs.getString("gys"));
		sgdcdfy=rs.getDouble("sgdcdfy");
		sgd=cf.fillNull(rs.getString("sgd"));
		khcdfy=rs.getDouble("khcdfy");
		gscdfy=rs.getDouble("gscdfy");
		qtfcdfy=rs.getDouble("qtfcdfy");
		jsbz=cf.fillNull(rs.getString("jsbz"));
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<title>¼��ά�޷���ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="" name="insertform" >
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="4" height="36"> 
        <div align="center">¼��ά�޷���ϸ��<font color="#006666">���޼�¼�ţ�<%=tsjlh%></font>��</div>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0000CC">�ͻ����</font></td>
      <td><%=khbh%> </td>
      <td align="right"><font color="#0000CC">��ͬ��</font></td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0000CC">�ͻ�����</font></td>
      <td><%=khxm%>��<%=lxfs%>�� </td>
      <td align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">Ͷ����Դ</td>
      <td><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm,true);
%>      </td>
      <td align="right"><font color="#660033">¼�벿��</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��������</td>
      <td colspan="3"><%=tsnr%> </td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td height="30" colspan="4" align="center">��������</td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>ά���˹���</td>
      <td width="31%"> 
      <input type="text" name="wxrgf" value="<%=wxrgf%>" size="20" maxlength="20" onChange="f_jsje(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0000">*</font>ά�޳���</td>
      <td width="31%"> 
      <input type="text" name="wxcf" value="<%=wxcf%>" size="20" maxlength="20" onChange="f_jsje(insertform)">      </td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>ά�޲��Ϸ�</td>
      <td width="31%"> 
      <input type="text" name="wxclf" value="<%=wxclf%>" size="20" maxlength="20" onChange="f_jsje(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">ά���ܷ���</font></td>
      <td width="31%"> 
      <input type="text" name="wxzfy" value="<%=wxzfy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td height="30" colspan="4" align="center">�е�����</td>
    </tr>
    
    <tr>
      <td align="right"><font color="#FF0000">*</font>�Ƿ��վ�</td>
      <td><%
	cf.radioToken(out, "sfksj","Y+��&N+��",sfksj);
%></td>
      <td align="right">�վݱ��</td>
      <td><input type="text" name="sjbh" value="<%=sjbh%>" size="20" maxlength="50" ></td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>ʩ���ӳе�����</td>
      <td width="31%"> 
      <input type="text" name="sgdcdfy" value="<%=sgdcdfy%>" size="20" maxlength="20" >      </td>
      <td width="19%" align="right">�е�����ʩ����</td>
      <td width="31%">
		  <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
			<%
		   cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc",sgd);
			%>
		  </select>
	  </td>
    </tr>
    <tr>
      <td width="19%" align="right"><font color="#FF0000">*</font>�ͻ��е�����</td>
      <td width="31%"><input type="text" name="khcdfy" value="<%=khcdfy%>" size="20" maxlength="20" ></td>
      <td width="19%" align="right"><font color="#FF0000">*</font>��˾�е�����</td>
      <td width="31%"><input type="text" name="gscdfy" value="<%=gscdfy%>" size="20" maxlength="20" ></td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>���ҳе�����</td>
      <td><input type="text" name="cjcdfy" value="<%=cjcdfy%>" size="20" maxlength="20" ></td>
      <td align="right">�е����ó���</td>
      <td><input type="text" name="gys" value="<%=gys%>" size="20" maxlength="50" ></td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>�������е�����</td>
      <td><input type="text" name="qtfcdfy" value="<%=qtfcdfy%>" size="20" maxlength="20" ></td>
      <td align="right">ά�޵�����</td>
      <td><input type="text" name="wxdah" value="<%=wxdah%>" size="20" maxlength="20" ></td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="31%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="31%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>����˵��</td>
      <td colspan="3"> 
        <textarea name="fysm" cols="71" rows="6"><%=fysm%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
          <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
          <input type="hidden" name="khbh" value="<%=khbh%>" >
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//����FormName:Form������
{
	var gk=FormName.wxrgf.value*1.0+FormName.wxcf.value*1.0+FormName.wxclf.value*1.0;
	gk=round(gk,2);
	FormName.wxzfy.value=gk;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wxrgf)=="") {
		alert("��ѡ��[ά���˹���]��");
		FormName.wxrgf.select();
		return false;
	}
	if(!(isFloat(FormName.wxrgf, "ά���˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.wxcf)=="") {
		alert("��ѡ��[ά�޳���]��");
		FormName.wxcf.select();
		return false;
	}
	if(!(isFloat(FormName.wxcf, "ά�޳���"))) {
		return false;
	}
	if(	javaTrim(FormName.wxclf)=="") {
		alert("��ѡ��[ά�޲��Ϸ�]��");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.wxclf, "ά�޲��Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wxzfy)=="") {
		alert("��ѡ��[ά���ܷ���]��");
		FormName.wxzfy.select();
		return false;
	}
	if(!(isFloat(FormName.wxzfy, "ά���ܷ���"))) {
		return false;
	}

	if (parseFloat(FormName.wxzfy.value)==0)
	{
		alert("����[ά���ܷ���]����Ϊ0��");
		FormName.wxrgf.select();
		return false;
	}

	f_jsje(FormName);


	if(	!radioChecked(FormName.sfksj)) {
		alert("��ѡ��[�Ƿ��վ�]��");
		FormName.sfksj[0].focus();
		return false;
	}

	if (FormName.sfksj[0].checked)
	{
		if(	javaTrim(FormName.sjbh)=="") {
			alert("��ѡ��[�վݱ��]��");
			FormName.sjbh.focus();
			return false;
		}
	}
	else{
		FormName.sjbh.value="";
	}

	if(	javaTrim(FormName.cjcdfy)=="") {
		alert("��ѡ��[���ҳе�����]��");
		FormName.cjcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.cjcdfy, "���ҳе�����"))) {
		return false;
	}

	if (parseFloat(FormName.cjcdfy.value)!=0)
	{
		if(	javaTrim(FormName.gys)=="") {
			alert("���󣡡����ҳе����á���Ϊ0����ѡ��[�е����ó���]��");
			FormName.gys.focus();
			return false;
		}
	}
	else{
		FormName.gys.value="";
	}


	if(	javaTrim(FormName.sgdcdfy)=="") {
		alert("��ѡ��[ʩ���ӳе�����]��");
		FormName.sgdcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdcdfy, "ʩ���ӳе�����"))) {
		return false;
	}


	if (parseFloat(FormName.sgdcdfy.value)!=0)
	{
		if(	javaTrim(FormName.sgd)=="") {
			alert("���󣡡�ʩ���ӳе����á���Ϊ0����ѡ��[�е�����ʩ����]��");
			FormName.sgd.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.khcdfy)=="") {
		alert("��ѡ��[ҵ���е�����]��");
		FormName.khcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.khcdfy, "ҵ���е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.gscdfy)=="") {
		alert("��ѡ��[��˾�е�����]��");
		FormName.gscdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gscdfy, "��˾�е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfcdfy)=="") {
		alert("��ѡ��[�������е�����]��");
		FormName.qtfcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfcdfy, "�������е�����"))) {
		return false;
	}


	var gk=FormName.cjcdfy.value*1.0+FormName.sgdcdfy.value*1.0+FormName.khcdfy.value*1.0+FormName.gscdfy.value*1.0+FormName.qtfcdfy.value*1.0;
	gk=round(gk,2);


	if (FormName.wxzfy.value!=gk)
	{
		alert("���󣡷��÷�̯���ܶ������̯���ü���һ��Ϊ��"+gk);
		FormName.sgdcdfy.focus();
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
	if(	javaTrim(FormName.fysm)=="") {
		alert("������[����˵��]��");
		FormName.fysm.focus();
		return false;
	}


	FormName.action="SaveInsertCrm_wxfmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
