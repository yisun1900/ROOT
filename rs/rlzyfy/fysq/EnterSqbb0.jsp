<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_fyshCxList.jsp" name="selectform">
<div align="center">����Ԥ�㱨���ѯ����</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','F0') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('A0','F0') and cxbz='N' order by dwlx,dwbh","");
	}
%>
    </select>  </td>
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%">        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
  <option value=""></option>
          <%
	cf.selectToken(out,"1995+1995��&1996+1996��&1997+1997��&1998+1998��&1999+1999��&2000+2000��&2001+2001��&2002+2002��&2003+2003��&2004+2004��&2005+2005��&2006+2006��&2007+2007��&2008+2008��&2009+2009��&2010+2010��&2011+2011��&2012+2012��&2013+2013��&2014+2014��&2015+2015��",cf.today("YYYY"));
%> 
  </select>
  ��
  <select name="yue" id="yue" style="FONT-SIZE:12PX;WIDTH:80PX" >
  <option value=""></option>
          <%
	cf.selectToken(out,"01+01��&02+02��&03+03��&04+04��&05+05��&06+06��&07+07��&08+08��&09+09��&10+10��&11+11��&12+12��",cf.today("MM"));
%> 
  </select>
  ��</td>	
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����״̬</td> 
  <td width="35%"> 
     <select name="yshz" id="yshz" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
		<%
		cf.selectToken(out,"01+�ȴ����&02+�ȴ�����&03+�������&04+�޸�&05+ȡ������","");
		%> 	  
	  </select>
  </td>  
  <td align="right" width="15%">���ܱ��</td> 
  <td width="35%"> 
    <input type="text" name="hzbh" size="24" maxlength="11" >  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��˽���</td> 
  <td width="35%"> 
         <select name="shjl" id="shjl" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
		<%
		cf.selectToken(out,"0+���ȡ��&1+���ͨ��&2+�����޸�","");
		%> 	  
	  </select>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
         <select name="spjl" id="spjl" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
		<%
		cf.selectToken(out,"0+���ȡ��&1+���ͨ��&2+�������","");
		%> 	  
	  </select>
  </td>	
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����</td> 
  <td width="35%"> 
    <input name="shr" type="text" id="shr" size="24" maxlength="20" >  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input name="spr" type="text" id="spr" size="24" maxlength="20" >  </td>	
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ʱ�� ��</td> 
  <td width="35%"><input name="shsj" type="text" id="shsj" onDblClick="JSCalendar(this)" size="24" maxlength="10" >
  <BR></td>
  <td align="right" width="15%">���ʱ�� �� </td>
  <td width="35%"><input name="shsj2" type="text" id="shsj2" onDblClick="JSCalendar(this)" size="24" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ�� ��</td> 
  <td width="35%"><input name="spsj" type="text" id="spsj" onDblClick="JSCalendar(this)" size="24" maxlength="10" >
  <BR></td>
  <td align="right" width="15%">����ʱ�� �� </td>
  <td width="35%"><input name="spsj2" type="text" id="spsj2" onDblClick="JSCalendar(this)" size="24" maxlength="10"></td>
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj2, "���ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.spsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
