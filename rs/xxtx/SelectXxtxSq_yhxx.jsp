<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhmc=(String)session.getAttribute("yhmc");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Sq_yhxxXxtxList.jsp" name="selectform">
<div align="center">��Ϣ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right" bgcolor="#FFFFCC">�ֹ�˾</td>
      <td width="31%"><%
	if ( yhjs.equals("A0") ||yhjs.equals("A1")  )
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td width="17%" align="right">��������</td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if ( yhjs.equals("A0") ||yhjs.equals("A1")  )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and  ssfgs='"+ssfgs+"' and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">Ա�����</td>
      <td width="31%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="17%">����</td>
      <td width="33%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">Ա������</td>
      <td width="31%"> 
        <input type="text" name="yhmc" size="20" maxlength="50" value="" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���֤��</td>
      <td width="31%"> 
        <input type="text" name="sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">����ְ��</td>
      <td width="33%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectToken(out,"1995+1995��&1996+1996��&1997+1997��&1998+1998��&1999+1999��&2000+2000��&2001+2001��&2002+2002��&2003+2003��&2004+2004��&2005+2005��&2006+2006��&2007+2007��&2008+2008��&2009+2009��&2010+2010��&2011+2011��&2012+2012��&2013+2013��&2014+2014��&2015+2015��",cf.today("YYYY"));
%> 
        </select>
      </td>
      <td align="right" width="17%">�����·�</td>
      <td width="33%"> 
        <select name="yue" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+һ��&02+����&03+����&04+����&05+����&06+����&07+����&08+����&09+����&10+ʮ��&11+ʮһ��&12+ʮ����",cf.today("MM"));
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ʾ���</td>
      <td width="31%">
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.yue)=="") {
		alert("������[�·�]��");
		FormName.yue.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
