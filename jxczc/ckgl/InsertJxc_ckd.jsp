<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhdlm=(String)session.getAttribute("yhdlm");
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String cklx=request.getParameter("cklx");
String sgph=request.getParameter("sgph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;

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
String gcjdbm=null;

String ckbh=null;
String ckjxz="1";//�����ѡ��,1��ȡ�۸��2��ȡ���ʱ���ۣ�3��ȡ�����۸�4���˹�¼��
try {
	conn=cf.getConnection();

	
	//�����ѡ��,1��ȡ�۸���Ӽۣ�2��ȡ���ʱȷ���Ĺ��Ӽۣ�3��ȡ�����۸�4���˹�¼��
	ls_sql="select csz";
	ls_sql+=" from  sq_xtcsb";
	ls_sql+=" where csbm='ckjxz'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckjxz=cf.fillNull(rs.getString("csz"));
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
<form method="post" action="SaveInsertJxc_ckd.jsp" name="insertform" >
<div align="center">�깺��<strong>[<%=sgph%>]</strong>�����¼</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��������</td>
	<td  width="8%">���ⵥ״̬</td>
	<td  width="10%">����������</td>
	<td  width="10%">�����ܽ��</td>
	<td  width="8%">������</td>
	<td  width="10%">����ʱ��</td>
	<td  width="10%">�Ƿ��и����</td>
	<td  width="14%">����ֿ�</td>
	<td  width="20%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jxc_ckd.ckph,DECODE(jxc_ckd.ckdzt,'0','δ�ύ','1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�ѽ���','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ͨ��','9','�������'), jxc_ckd.ckzsl,jxc_ckd.ckzje,jxc_ckd.ckr,jxc_ckd.cksj, DECODE(jxc_ckd.sfyfkc,'1','�޸����','2','�����δ���','3','��������'),ckmc,jxc_ckd.bz  ";
	ls_sql+=" FROM crm_khxx,jxc_ckd,dm_dqbm,sq_dwxx a,sq_dwxx b,jxc_ckmc  ";
    ls_sql+=" where jxc_ckd.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and jxc_ckd.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and jxc_ckd.fgsbh=a.dwbh(+)";
    ls_sql+=" and jxc_ckd.lrbm=b.dwbh(+)";
    ls_sql+=" and jxc_ckd.ckbh=jxc_ckmc.ckbh(+)";
    ls_sql+=" and jxc_ckd.lydh='"+sgph+"'";
    ls_sql+=" order by jxc_ckd.ckph";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ckph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_ckd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ckph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<div align="center"><strong>��¼����ⵥ</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�������</span></td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>Ŀ�ĵ���</td>
  <td><select name="mddqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">����ֹ�˾</span></td>
  <td><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' order by dwmc","");
%>
  </select></td>
  <td align="right" class="STYLE2"><span class="STYLE1">*</span>��Դ����</td>
  <td><input type="text" name="lydh" value="<%=sgph%>" size="20" maxlength="13" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">��������</span></td>
  <td><select name="cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"D+��������&B+���ϳ���&T+�˻�����&S+�깺����&P+���ϵ�����&J+����ȯ����&X+���۳���&R+��������",cklx,false);
%>
  </select></td>
  <td align="right" class="STYLE2">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ֿ�</td> 
  <td width="32%"><p>
    <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy,jxc_ckssfgs where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_ckmc.ckbh=jxc_ckssfgs.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and jxc_ckssfgs.ssfgs='"+ssfgs+"'  order by ckmc","");
%>
    </select>
  </p>    </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"><input type="text" name="jsr" value="" size="20" maxlength="20" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���ⷽʽ</td>
  <td colspan="3">
    <input name="ckfs" type="radio"  value="1" checked>
    �Զ����⣨�������ȳ��⣩ 
    <input type="radio" name="ckfs"  value="2">�Զ����⣨������ȳ��⣩��
	<input type="radio" name="ckfs"  value="3">�ֹ�����  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����ѡ��</td>
  <td colspan="3">
<%
	cf.radioToken(out, "ckjxz","1+ȡ�۸��&2+ȡ���ʱ����&3+ȡ�����۸�&4+�˹�¼��",ckjxz,true);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ͷ�ʽ</td> 
  <td width="32%"> 
    <input type="radio" name="psfs"  value="0">��������
    <input type="radio" name="psfs"  value="1">��˾�ͻ�
    <input type="radio" name="psfs"  value="2">��ȡ  </td>
  <td align="right" width="15%">�ƻ��ͻ�ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"> 
    <input type="text" name="ckr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td>
	<input type="text" name="lrr" value="<%=yhmc%>" size="20"  readonly>  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td>
	<input type="text" name="lrsj" value="<%=cf.today()%>" size="20"  readonly>  </td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td>
   <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'  order by dwbh","");
   %>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="button" onClick="window.open('/jxcfc/psdgl/ViewKcjxc_clsgd.jsp?sgph=<%=sgph%>')"  value="�鿴��Դ����Ϣ"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mddqbm)=="") {
		alert("��ѡ��[Ŀ�ĵ���]��");
		FormName.mddqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cklx)=="") {
		alert("��ѡ��[��������]��");
		FormName.cklx.focus();
		return false;
	}
	if(	javaTrim(FormName.lydh)=="") {
		alert("������[��Դ����]��");
		FormName.lydh.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("��ѡ��[����ֿ�]��");
		FormName.ckbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ckfs)) {
		alert("��ѡ��[���ⷽʽ]��");
		FormName.ckfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ckjxz)=="") {
		alert("��ѡ��[�����ѡ��]��");
		FormName.ckjxz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ckr)=="") {
		alert("������[������]��");
		FormName.ckr.focus();
		return false;
	}
	if(	javaTrim(FormName.cksj)=="") {
		alert("������[����ʱ��]��");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "����ʱ��"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
