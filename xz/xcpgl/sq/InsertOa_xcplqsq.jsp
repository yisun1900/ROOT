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
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">�������</td>
	<td  width="5%">��ȡ״̬</td>
	<td  width="8%">���쵥λ</td>
	<td  width="4%">������</td>
	<td  width="6%">¼������</td>
	<td  width="4%">һ��������</td>
	<td  width="6%">һ������ʱ��</td>
	<td  width="5%">һ����������</td>
	<td  width="17%">һ������˵��</td>
	<td  width="18%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT oa_xcplqsq.sqxh, DECODE(oa_xcplqsq.lqzt,'1','δ���','2','�������','3','һ������','4','��������','5','��������','6','����ȡ'),a.dwmc dw ,oa_xcplqsq.slr,oa_xcplqsq.lrrq,oa_xcplqsq.yjspr,oa_xcplqsq.yjspsj, DECODE(oa_xcplqsq.yjspjl,'1','ͬ��','2','�����ϼ�','3','����'),oa_xcplqsq.yjspsm,oa_xcplqsq.bz  ";
	ls_sql+=" FROM oa_xcplqsq,sq_dwxx a";
    ls_sql+=" where oa_xcplqsq.dwbh=a.dwbh(+)  ";
	ls_sql+=" and oa_xcplqsq.lqzt='3' and oa_xcplqsq.yjspjl='2'";
	if (yhjs.equals("A0") )
	{
	}
	else{
		ls_sql+=" and oa_xcplqsq.dwbh='"+dwbh+"'";
	}
    ls_sql+=" order by oa_xcplqsq.yjspsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","EditOa_xcplqsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewOa_xcplqsq.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%>
</table>

<form method="post" action="SaveInsertOa_xcplqsq.jsp" name="insertform" >
  <div align="center">ӡˢƷ��ȡ���루<font color="#0000CC"><b>ע�⣺���̺��¼��ϸ</b></font>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font>����ֹ�˾</td>
      <td width="35%"> 
<%
	if (yhjs.equals("A0") )
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgsbh,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>

      </td>
      <td align="right" width="15%"><font color="#CC0033">*</font>���쵥λ</td>
      <td width="35%">
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font>������</td>
      <td width="35%"> 
        <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">�ƻ���ȡ����</td>
      <td width="35%"> 
        <input type="text" name="jhlqrq" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#CC0033">*</font><font color="#0000CC">¼����</font></td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%"><font color="#CC0033">*</font><font color="#0000CC">¼������</font></td>
      <td width="35%"> 
        <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="¼����ϸ" onClick="f_lrmx(editform)" name="button" disabled>
        <input type="button"  value="�鿴��ϸ" onClick="f_ckmx(editform)" name="button" disabled>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[���쵥λ]��");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "�ƻ���ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("������[¼������]��");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "¼������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
