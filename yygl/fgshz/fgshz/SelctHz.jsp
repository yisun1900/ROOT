<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ѡ��</title>
</head>


<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body > 

<form name="cx" action="fgshz.jsp" method="post" target="_blank">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF">
		<td height="35" colspan="2" align="center"> �ֹ�˾����</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td height="44" align="right">��ѡ��ֹ�˾</td>
	  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:252PX">
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
      </select></td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td height="44" align="right">ѡ��������</td>
	  <td><select name="zqs" style="FONT-SIZE:12PX;WIDTH:252PX" >
        <option value=""></option>
        <%
					cf.selectItem(out,"select zqs,'����'||zqs||'��'||TO_CHAR(yy_rqsd_bzs,'YYYY-MM-DD')||'��'||TO_CHAR(yy_rqsd_bze,'YYYY-MM-DD')||'��' from YY_RQSD order by yy_rqsd_bzs desc","");
				%>
      </select></td>
    </tr>
	<tr bgcolor="#E8E8FF">
		<td width="31%" height="44" align="right">��ʾ���</td>
		<td width="69%"><input type="radio" name="xsfg" value="1" checked>
��ҳ
  <input type="radio" name="xsfg" value="2">
EXCEL </td>
	</tr>
	<tr>
		<td height="54" colspan="2" align="center"><input name="button" type="button" onClick="f_do(cx)" value="��ѯ"></td>
	</tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.zqs)=="") {
		alert("������[������]��");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
