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

	<td  width="15%">������¼��</td>
	<td  width="15%">������ʼʱ��</td>
	<td  width="15%">������ֹʱ��</td>
	<td  width="15%">ɾ��</td>
	<td  width="15%">��˾��</td>
	<td  width="15%">ʩ������</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;

	ls_sql="SELECT * ";
	ls_sql+=" FROM ( ";
	ls_sql+=" SELECT kp_yzfsgdkhpyd.kpjlh,kp_yzfsgdkhpyd.kpkssj,kp_yzfsgdkhpyd.kpjzsj,'ɾ��' sc,count(distinct kp_yzfsgdkhpyd.ssfgs) gss,count(distinct kp_yzfsgdkhpyd.sgd) sgds";
	ls_sql+=" FROM kp_yzfsgdkhpyd";
    ls_sql+=" group by kp_yzfsgdkhpyd.kpjlh,kp_yzfsgdkhpyd.kpkssj,kp_yzfsgdkhpyd.kpjzsj ";
	ls_sql+=" ) ";

    ls_sql+=" where rownum<10 ";
    ls_sql+=" order by kpjlh desc ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(12);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"kpjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_yzfsgdkhpyd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("kpjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"kpjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="DeleteKp_yzfsgdkhpyd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
        <div align="center">ʩ���ӿͻ������</div>
    <tr> 
      <td align="right" width="19%" height="37">ѡ����</td>
      <td height="37" width="21%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
          <%
	cf.selectToken(out,"2006+2006��&2007+2007��&2008+2008��&2009+2009��&2010+2010��&2011+2011��&2012+2012��&2013+2013��&2014+2014��&2015+2015��&2016+2016��&2017+2017��&2018+2018��&2019+2019��&2020+2020��&2021+2021��&2022+2022��&2023+2023��&2024+2024��&2025+2025��",cf.today("YYYY"));
%> 
        </select>
        �� </td>
      <td height="37" colspan="2"> 
        <input type="radio" name="yue" value="01">
        һ��<br>
        <input type="radio" name="yue" value="02">
        ����<br>
        <input type="radio" name="yue" value="03">
        ����<br>
        <input type="radio" name="yue" value="04">
        ����<br>
        <input type="radio" name="yue" value="05">
        ����<br>
        <input type="radio" name="yue" value="06">
        ����
      </td>
      <td height="37" colspan="2" width="34%"> 
        <input type="radio" name="yue" value="07">
        ����<br>
        <input type="radio" name="yue" value="08">
        ����<br>
        <input type="radio" name="yue" value="09">
        ����<br>
        <input type="radio" name="yue" value="10">
        ʮ��<br>
        <input type="radio" name="yue" value="11">
        ʮһ��<br>
        <input type="radio" name="yue" value="12">
        ʮ����</td>
    </tr>
    <tr align="center"> 
      <td colspan="6"> 
        <input type="button"  value="�ͻ������" onClick="f_do(selectform)">
      </td>
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
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	!radioChecked(FormName.yue)) {
		alert("��ѡ��[�·�]��");
		FormName.yue[0].focus();
		return false;
	}

	FormName.action="SaveInsertKp_yzfsgdkhpyd.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
