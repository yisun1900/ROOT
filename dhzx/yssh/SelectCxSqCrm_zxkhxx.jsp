<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String jsy=yhmc;
if (!zwbm.equals("22"))//22:����Ա
{
	jsy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_zxkhxxCxSqList.jsp" name="selectform">
<div align="center">��ѯԤ�����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"> �ͻ������ֹ�˾ </td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
      </select>    </td>
    <td align="right"> ��ѯ���� </td>
    <td><select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%>
      </select>    </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ͻ���� </td>
    <td><input type="text" name="khbh" size="20" maxlength="7" >    </td>
    <td align="right">�Ա�</td>
    <td><INPUT type="radio" name="xb" value="M">
      ��
      <INPUT type="radio" name="xb" value="W">
      Ů</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">�ͻ�����</span></td>
    <td><input type="text" name="khxm" size="20" maxlength="20" >    </td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm2" size="14" maxlength="20" >
      ��ģ����ѯ��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">���ݵ�ַ </span></td>
    <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
    <td align="right">���ݵ�ַ</td>
    <td><input type="text" name="fwdz2" size="14" maxlength="100" >
      ��ģ����ѯ��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">��ϵ��ʽ </span></td>
    <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
    <td align="right">��ϵ��ʽ</td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50" >
      ��ģ����ѯ��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
    <td align="right">���ʦ</td>
    <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">Ԥ����˼�¼</td> 
  <td width="31%"><input type="text" name="bj_ysshjl_ysshjl" size="20" maxlength="10" ></td>
  <td align="right" width="19%">¼����</td> 
  <td width="31%"> 
    <input type="text" name="bj_ysshjl_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ԥ����˱�־</td>
  <td colspan="3"><%
	cf.radioToken(out, "bj_ysshjl_ysshbz","B+�������&C+��������&Y+���ͨ��&M+���δͨ��&S+�޸ķ�����Ȩ","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼��ʱ�� ��</td> 
  <td width="31%"><input type="text" name="bj_ysshjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="bj_ysshjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="bj_ysshjl_slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="bj_ysshjl_slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������</td>
  <td><input type="text" name="bj_ysshjl_slr" size="20" maxlength="20" >  </td>
  <td align="right">�����</td>
  <td><input type="text" name="bj_ysshjl_ysshr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ�� �� </td>
  <td><input type="text" name="bj_ysshjl_ysshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="bj_ysshjl_ysshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���鹤��</td> 
  <td width="31%"> 
    <input type="text" name="bj_ysshjl_jygq" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">���鿪��ʱ��</td> 
  <td width="31%"> 
    <input type="text" name="bj_ysshjl_jykgsj" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���鿢��ʱ��</td> 
  <td width="31%"> 
    <input type="text" name="bj_ysshjl_jyjgsj" size="20" maxlength="10" >  </td>
  <td align="right" width="19%">��˿۷�</td> 
  <td width="31%"> 
    <input type="text" name="bj_ysshjl_shdf" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������Ͽ��Ƿ�����</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "bj_ysshjl_zlksfwz","Y+��&N+��","");
%>  </td>
  <td align="right" width="19%">�Ƿ�¼��ͻ���������</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "bj_ysshjl_zcxqsflr","Y+��&N+��","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�Ƿ�������˼�¼</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "bj_ysshjl_zxbz","Y+��&N+��","");
%>  </td>
  <td align="right" width="19%">ԭԤ����˼�¼</td> 
  <td width="31%"> 
    <input type="text" name="bj_ysshjl_yysshjl" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����Ա</td>
  <td><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		%>
      <select name="jsy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <option value=""></option>
        <%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_dwxx.dwmc||'��' c2";
		sql+=" from sq_yhxx,sq_dwxx ";
		sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh ";
		sql+=" and sq_yhxx.zwbm='22' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY sq_yhxx.ssfgs,sq_yhxx.yhmc";

		cf.selectItem(out,sql,"");
		%>
      </select>
      <%
	}
	else if (!jsy.equals(""))
	{
		%>
      <input type="text" name="jsy" value="<%=jsy%>" size="20" maxlength="20" readonly>
      <%
	}
	else{
		%>
      <select name="jsy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <option value=""></option>
        <%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm='22' and sq_yhxx.sfzszg in('Y','N') ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");
		%>
      </select>
      <%
	}

%>  </td>
  <td align="right">ǩ��״̬</td>
  <td><select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">δ�������</option>
    <option value="1">�������</option>
    <option value="2">���ʦ�ύ�ɵ�</option>
    <option value="3">��ǩԼ</option>
    <option value="4">�ɵ�</option>
    <option value="5">�ɵ����δͨ��</option>
  </select></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);

}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.bj_ysshjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_slsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_slsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_ysshsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_ysshsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.bj_ysshjl_jygq, "���鹤��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_jykgsj, "���鿪��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_ysshjl_jyjgsj, "���鿢��ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_ysshjl_shdf, "��˿۷�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
