<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='010407'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���ᵱ��ҵ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="selectform" target="_blank">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="36"> 
        <div align="center">���ᵱ��ҵ��</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="22%" height="37">ѡ�񶳽�ʱ��</td>
      <td height="37" width="28%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
          <%
	cf.selectToken(out,"1995+1995��&1996+1996��&1997+1997��&1998+1998��&1999+1999��&2000+2000��&2001+2001��&2002+2002��&2003+2003��&2004+2004��&2005+2005��&2006+2006��&2007+2007��&2008+2008��&2009+2009��&2010+2010��&2011+2011��&2012+2012��&2013+2013��&2014+2014��&2015+2015��",cf.today("YYYY"));
%> 
        </select>
        �� </td>
      <td height="37" colspan="2" width="50%"> 
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
        ����<br>
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
      <td height="45" colspan="4"> 
        <input type="button"  value="���ᵱ��ҵ��" onClick="f_do(selectform)" >
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%" >&nbsp;</td>
	<td  width="16%">��</td>
	<td  width="14%" >��</td>
	<td  width="20%" >������</td>
	<td  width="30%" >����ʱ��</td>
</tr>
<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT nian,yue,djr,djsj  ";
	ls_sql+=" FROM cw_yjdjjl  ";
	ls_sql+=" order by nian desc,yue desc  ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","DeleteYjdj.jsp");

//��������
	String[] keyName={"nian","yue"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("ɾ������");
	pageObj.setDateType("long");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

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
	if(	!radioChecked(FormName.yue)) {
		alert("��ѡ��[�·�]��");
		FormName.yue[0].focus();
		return false;
	}

	FormName.action="KsEnterYjdj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
