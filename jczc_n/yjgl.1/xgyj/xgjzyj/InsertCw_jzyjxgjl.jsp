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
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;
double wdzgce=0;
double qye=0;

String yjjzsj=null;
String tdyjjzsj=null;
String zt=null;

String yjzrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq,wdzgce,qye  ,yjjzsj,tdyjjzsj,zt";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");

		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();

	if (!zt.equals("3"))//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	{
		if (!tdyjjzsj.equals(""))//�˵���ת
		{
			out.println("���󣡷��˵��ͻ��������С��˵�ҵ����תʱ�䡻");
			return;
		}
	}
	else{
		if (yjjzsj.equals(""))//ǩ��δ��ת
		{
			out.println("�����˵��ͻ�����ǩ��δ��ת�������ܽ����޸�");
			return;
		}
	}

	if (!yjjzsj.equals("") && !tdyjjzsj.equals(""))//ǩ��,�˵�ͬʱ��ת
	{
		if (yjjzsj.compareTo(tdyjjzsj)>=0)
		{
			out.println("���󣡡�ǩ��ҵ����תʱ�䡻ҪС�ڡ��˵�ҵ����תʱ�䡻");
			return;
		}
		yjzrq=tdyjjzsj;
	}
	else if (!yjjzsj.equals("") && tdyjjzsj.equals(""))//ǩ����ת,�˵�δ��ת
	{
		yjzrq=yjjzsj;
	}
	else if (yjjzsj.equals("") && !tdyjjzsj.equals(""))//ǩ��δ��ת,�˵���ת
	{
		out.println("���󣡡�ǩ��δ��ת�������˵���ת��");
		return;
	}
	else{
		yjzrq="";
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jzyjxgjl.jsp" name="insertform" target="_blank">
  <div align="center">�޸ģ���תҵ��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">�ͻ����</font></td>
      <td width="32%"><%=khbh%></td>
      <td align="right" width="19%"><font color="#000099">��ͬ��</font></td>
      <td width="31%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">�ͻ�����</font></td>
      <td width="32%"><%=khxm%></td>
      <td align="right" width="19%"><font color="#000099">���ݵ�ַ</font></td>
      <td width="31%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">���ʦ</font></td>
      <td width="32%"><%=sjs%></td>
      <td align="right" width="19%"><font color="#000099">�ʼ�Ա</font></td>
      <td width="31%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ʩ����</font></td>
      <td width="32%"><%=sgdmc%></td>
      <td align="right" width="19%"><font color="#000099">ʩ������</font></td>
      <td width="31%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">ǩԼ����</font></td>
      <td width="32%"><%=qyrq%></td>
      <td align="right" width="19%"><font color="#000099">ǩԼ����</font></td>
      <td width="31%"><%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000"><b>ǩ��ҵ����תʱ��</b></font></td>
      <td width="32%"><font color="#CC0000"><b><%=yjjzsj%></b></font></td>
      <td align="right" width="19%"><font color="#CC0000"><b>�˵�ҵ����תʱ��</b></font></td>
      <td width="31%"><font color="#CC0000"><b><%=tdyjjzsj%></b></font></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="28" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>�޸�����</td>
      <td width="32%"> 
        <input type="radio" name="xglx"  value="1">
        �޸� 
        <input type="radio" name="xglx"  value="2">
        ɾ�� 
        <input type="radio" name="xglx"  value="3">
        ���� </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�ͻ�����</td>
      <td width="31%"> 
        <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectToken(out,"2+��װ�ͻ�&3+�˵��ͻ�&4+���ɿͻ�&5+��ƿͻ�",zt,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">ԭҵ����תʱ��</font></td>
      <td width="32%"> 
        <input type="text" name="yjzrq" value="<%=yjzrq%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="19%">�޸ĺ�ҵ����תʱ��</td>
      <td width="31%"> 
        <input type="text" name="xjzrq" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">ԭ��ͬԭ����</font></td>
      <td width="32%"> 
        <input type="text" name="ywdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�޸ĺ��ͬԭ����</td>
      <td width="31%"> 
        <input type="text" name="xwdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">ԭ����ǩԼ��</font></td>
      <td width="32%"> 
        <input type="text" name="yqye" value="<%=qye%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�޸ĺ󹤳�ǩԼ��</td>
      <td width="31%"> 
        <input type="text" name="xqye" value="<%=qye%>" size="20" maxlength="17" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">�޸���</font></td>
      <td width="32%"> 
        <input type="text" name="xgr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#000099">�޸�ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="xgsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="hidden" name="hth"  value="<%=hth%>" >
        <input type="hidden" name="khxm"  value="<%=khxm%>" >
        <input type="button"  value="����" name="bc" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.xgsj)=="") {
		alert("������[�޸�ʱ��]��");
		FormName.xgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xgr)=="") {
		alert("������[�޸���]��");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.zt)=="") {
		alert("��ѡ��[�ͻ�����]��");
		FormName.zt.focus();
		return false;
	}
	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xglx)) {
		alert("��ѡ��[�޸�����]��");
		FormName.xglx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzrq, "ԭҵ����תʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ywdzgce)=="") {
		alert("������[ԭ��ͬԭ����]��");
		FormName.ywdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.ywdzgce, "ԭ��ͬԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yqye)=="") {
		alert("������[ԭ����ǩԼ��]��");
		FormName.yqye.focus();
		return false;
	}
	if(!(isFloat(FormName.yqye, "ԭ����ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xjzrq, "�޸ĺ�ҵ����תʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xwdzgce)=="") {
		alert("������[�޸ĺ��ͬԭ����]��");
		FormName.xwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.xwdzgce, "�޸ĺ��ͬԭ����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqye)=="") {
		alert("������[�޸ĺ󹤳�ǩԼ��]��");
		FormName.xqye.focus();
		return false;
	}
	if(!(isFloat(FormName.xqye, "�޸ĺ󹤳�ǩԼ��"))) {
		return false;
	}

	if (FormName.xglx[0].checked)//�޸�
	{
		if(	javaTrim(FormName.yjzrq)=="") {
			alert("����[ԭҵ����תʱ��]�����ڣ������޸ģ�");
			FormName.xglx[2].focus();
			return false;
		}

		if(	javaTrim(FormName.xjzrq)=="") {
			alert("������[�޸ĺ�ҵ����תʱ��]��");
			FormName.xjzrq.select();
			return false;
		}
	}
	else if (FormName.xglx[1].checked)//ɾ��
	{
		if(	javaTrim(FormName.yjzrq)=="") {
			alert("����[ԭҵ����תʱ��]�����ڣ�����ɾ����");
			FormName.xglx[2].focus();
			return false;
		}

		if(	javaTrim(FormName.xjzrq)!="") {
			alert("����ɾ����������[�޸ĺ�ҵ����תʱ��]��");
			FormName.xjzrq.select();
			return false;
		}
	}
	else if (FormName.xglx[2].checked)//����
	{
		if(	javaTrim(FormName.xjzrq)=="") {
			alert("������[�޸ĺ�ҵ����תʱ��]��");
			FormName.xjzrq.select();
			return false;
		}
	}

	if (!confirm("ȷʵҪ������?") )	
	{
		return;
	}

	
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
