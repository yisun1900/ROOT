<%@ page contentType="text/html;charset=GBK" %>
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
<form method="post" action="Rs_ldhtjlCxList.jsp" name="selectform">
<div align="center">��̨ͬ��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
  <td width="35%"> 
  <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
  <option value=""></option>
          <%	cf.selectToken(out,"1995+1995��&1996+1996��&1997+1997��&1998+1998��&1999+1999��&2000+2000��&2001+2001��&2002+2002��&2003+2003��&2004+2004��&2005+2005��&2006+2006��&2007+2007��&2008+2008��&2009+2009��&2010+2010��&2011+2011��&2012+2012��&2013+2013��&2014+2014��&2015+2015��",cf.today("YYYY"));
%> 
  </select>
  ��
</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
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
	if(	javaTrim(FormName.fgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}	
	if(	javaTrim(FormName.nian)=="") {
		alert("��ѡ��[��]��");
		FormName.nian.focus();
		return false;
	}	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
