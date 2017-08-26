<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;

try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
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
<form method="post" action="SaveInsertCrm_cpgzjl.jsp" name="insertform">
<div align="center">¼�룭����Ʒ��Ϣ</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="18%">��Ʒ����</td>
	<td  width="9%">��Ʒ״̬</td>
	<td  width="7%">״̬����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="5%">���׺��¶���</td>
	<td  width="5%">ѡ���Ƿ����</td>
	<td  width="6%">��Ʒ���ʦ</td>
	<td  width="5%">�Ƿ��践��</td>
	<td  width="5%">�Ƿ����쳣</td>
	<td  width="7%">��������</td>
	<td  width="7%">����Ӧ��������</td>
	<td  width="7%">�ƻ����ʱ��</td>
	<td  width="7%">�ƻ��ͻ�ʱ��</td>
	<td  width="7%">�ƻ���װʱ��</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_cpgzjl.khbh,crm_cpgzjl.cpflbm,cpflmc,cpztmc,ztfssj,crm_cpgzjl.ghf";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxdd,'Y','��','N','��') sfxdd";
	ls_sql+=" ,DECODE(crm_cpgzjl.zxsfwz,'Y','��','N','��') zxsfwz,crm_cpgzjl.cpsjs";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfxfb,'N','�޷���','Y','�ȴ�����','W','�����ɹ�','S','����ʧ��') sfxfb ";
	ls_sql+=" ,DECODE(crm_cpgzjl.sfyyc,'N','���쳣','Y','�ȴ�����','W','�쳣����ɹ�','S','�쳣���ʧ��') sfyyc";
	ls_sql+=" ,crm_cpgzjl.txrq,crm_cpgzjl.zwyjcrq ";
	ls_sql+=" ,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj";

	ls_sql+=" FROM crm_cpgzjl,dm_cpflbm,dm_cpztbm  ";
    ls_sql+=" where crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.khbh='"+khbh+"'  ";
    ls_sql+=" order by crm_cpgzjl.lrsj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"cpflmc","cpztmc","ztfssj","ghf","sfxdd","zxsfwz","cpsjs","sfxfb","sfyyc","txrq","zwyjcrq","jhrksj","jhshsj","jhazsj"};
	pageObj.setDisColName(disColName);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh","cpflbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_cpgzjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("cpflmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE3">�ͻ����</span></td>
      <td><%=khbh%></td>
      <td align="right"><span class="STYLE3">��ͬ��</span></td>
      <td><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE3">�ͻ�����</span></td>
      <td><%=khxm%></td>
      <td align="right"><span class="STYLE3">���ݵ�ַ</span></td>
      <td><%=fwdz%></td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ����</td> 
  <td width="32%"><select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm not in(select cpflbm from crm_cpgzjl where khbh='"+khbh+"') order by cpflbm","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ����</td> 
  <td width="32%"><input type="radio" name="cplx"  value="1">
����Ʒ
  <input type="radio" name="cplx"  value="2">
��Ʒ</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ��װ����</td> 
  <td width="32%"><input type="radio" name="cpazlx"  value="1">
    ʩ����
      <input type="radio" name="cpazlx"  value="2">
      ��װ�� </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"><input type="radio" name="ghf"  value="�׹�">
    �׹�
      <input type="radio" name="ghf"  value="��˾��">
      ��˾��
      <input type="radio" name="ghf"  value="δȷ��">
      δȷ�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�׹�Ʒ��</td> 
  <td colspan="3"><input type="text" name="jgpp" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������֪ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="ghfhzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ񽻵׺��¶���</td> 
  <td width="32%"> 
    <input type="radio" name="sfxdd"  value="Y">��
    <input name="sfxdd" type="radio"  value="N" checked>
    ��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ����������</td> 
  <td width="32%"> 
    <input name="sfxhxgl" type="radio"  value="Y" checked>
    ��
    <input type="radio" name="sfxhxgl"  value="N">��  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>ѡ���Ƿ����</td> 
  <td width="32%"> 
    <input type="radio" name="zxsfwz"  value="Y">��
    <input type="radio" name="zxsfwz"  value="N">��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ���ʦ</td> 
  <td width="32%"> 
    <input type="text" name="cpsjs" value="" size="20" maxlength="30" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�������</td> 
  <td width="32%"><input type="radio" name="sfxtx"  value="Y">
������
  <input type="radio" name="sfxtx"  value="N">
�� </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="txrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">����Сʱ</td>
  <td><input type="text" name="txxs" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td colspan="3"><textarea name="txnr" cols="71" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����Ӧ��������</td>
  <td><input type="text" name="zwyjcrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�ƻ����ʱ��</td>
  <td><input type="text" name="jhrksj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ��ͻ�ʱ��</td>
  <td><input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�ƻ���װʱ��</td>
  <td><input type="text" name="jhazsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>  </td>
  </tr>

    <tr align="center"> 
      <td colspan="4"> 
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly>  
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cpazlx)) {
		alert("��ѡ��[��Ʒ��װ����]��");
		FormName.cpazlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("��ѡ��[������]��");
		FormName.ghf[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.ghfhzsj, "��������֪ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxdd)) {
		alert("��ѡ��[�Ƿ񽻵׺��¶���]��");
		FormName.sfxdd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxhxgl)) {
		alert("��ѡ��[�Ƿ����������]��");
		FormName.sfxhxgl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zxsfwz)) {
		alert("��ѡ��[ѡ���Ƿ����]��");
		FormName.zxsfwz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxtx)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxtx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.txrq, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.txxs, "����Сʱ"))) {
		return false;
	}
	if(!(isDatetime(FormName.zwyjcrq, "����Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhrksj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "�ƻ���װʱ��"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_cpgzjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
