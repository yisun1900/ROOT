<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ĩ��ת</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="15%">&nbsp;</td>
	<td  width="25%">��˾���</td>
	<td  width="25%">��˾����</td>
	<td  width="25%">����ʱ��</td>
	<td  width="15%">ʩ������</td>
</tr>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;

	ls_sql=" SELECT kp_yzfpdkpjg.ssfgs,dwmc,kp_yzfpdkpjg.kpsj,count(distinct kp_yzfpdkpjg.sgd) sgds";
	ls_sql+=" FROM kp_yzfpdkpjg,sq_dwxx";
	ls_sql+=" where kp_yzfpdkpjg.ssfgs=sq_dwxx.dwbh";
	ls_sql+=" group by kp_yzfpdkpjg.ssfgs,dwmc,kp_yzfpdkpjg.kpsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","ViewKp_yzfbzpdkpjg.jsp","ViewKp_yzfpdkpjg.jsp");
	pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��
	pageObj.setViewStr("�೤");
	pageObj.setEditStr("ʩ����");


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
<P>
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
        <div align="center">�ɵ�����</div>
    <tr> 
      <td align="right" width="47%" height="37">�ֹ�˾</td>
      <td height="37" width="53%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
    <tr align="center"> 
      <td colspan="2"> 
        <input type="button"  value="�ɵ�����" onClick="f_do(selectform)">      </td>
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

	FormName.action="SaveInsertKp_yzfpdkpjg.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
