<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_rkdList.jsp" name="selectform">
<div align="center">��⣭ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

  <tr bgcolor="#FFFFFF">
    <td align="right">�������</td>
    <td><select name="jxc_rkd_rklx" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
<%
	cf.selectToken(out,"C+�ɹ����&T+�˻����&R+�������&S+�깺���&J+����ȯ�˻����&D+���Ķ����˻�&Z+ֱ�����","");
%>
    </select></td>
    <td align="right">��ⵥ״̬</td>
    <td><select name="jxc_rkd_rkdzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value="0">δ�ύ</option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����</td>
    <td><select name="jxc_rkd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(selectform)">
      <%
	if (yhjs.equals("A0"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqmc","");
	}
	else
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct jxc_ckmc.dqbm,dm_dqbm.dqmc from jxc_ckmc,jxc_kgy,dm_dqbm where jxc_ckmc.ckbh=jxc_kgy.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm and jxc_kgy.yhdlm='"+yhdlm+"' order by jxc_ckmc.dqbm","");
	}
%>
    </select></td>
    <td align="right">���ֿ�</td>
    <td><select name="jxc_rkd_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <%
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' order by dqbm,ckmc","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td width="32%"><input type="text" name="jxc_rkd_rkph" size="20" maxlength="11" ></td>
  <td align="right" width="18%">��Դ����</td> 
  <td width="32%"><input type="text" name="jxc_rkd_lydh" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������λ</td> 
  <td colspan="3">
  <select name="jxc_rkd_gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
    <%
	if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
	}
	else
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select gysmc mc,gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+ssfgs+"'  order by gysmc","");
	}
%>
  </select></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">������λ</td>
  <td><input type="text" name="jxc_rkd_gysmc2" size="20" maxlength="50" >
    ��ģ����ѯ��</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<%
if (yhjs.equals("A0"))
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right">�����</td>
	  <td><input type="text" name="jxc_rkd_rkr" value="" size="20" maxlength="50"></td>
	  <td align="right">�������������</td>
	  <td>
	  <select name="rkrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
		  <option value=""></option>
	  </select>
	  </td>
	</tr>
	<%
}
else
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right">�����</td>
	  <td><input type="text" name="jxc_rkd_rkr" value="<%=yhmc%>" size="20" maxlength="50" readonly></td>
	  <td align="right">�������������</td>
	  <td>
	  <select name="rkrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
		%>
	  </select>
	  </td>
	</tr>
	<%
}
%>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʱ�� ��</td> 
  <td width="32%"><input type="text" name="jxc_rkd_rksj" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jxc_rkd_rksj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
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


function changedqbm(FormName)
{
	if (FormName.jxc_rkd_dqbm.value=='')
	{
		return;
	}

	FormName.jxc_rkd_gysmc.length=1;

	var sql;
	sql="select jxc_gysxx.gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and dqbm='"+FormName.jxc_rkd_dqbm.value+"')  order by jxc_ppgysdzb.ssfgs,gysmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToItem2(selectform.jxc_rkd_gysmc,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.jxc_rkd_rksj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_rkd_rksj2, "���ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
