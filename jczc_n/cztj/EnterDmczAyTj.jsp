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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='290109'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"',SYSDATE,'���棡�Ƿ�����[�����ֵ����ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
String sjfw=cf.firstOfYear();
String sjfw2=cf.lastOfYear();
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">�����ֵ����ͳ��</div>
      </td>
    </tr>
	<tr>
      <td align="right" width="42%" height="39">����</td>
      <td width="58%" height="39">
        <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">�ֹ�˾</td>
      <td width="58%" height="39"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('F2') order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">��λ</td>
      <td width="58%" height="39"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="43"> ͳ��ʱ��</td>
      <td height="43" colspan="3" width="70%"> �� 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=sjfw%>' ondblclick="JSCalendar(this)">
        ----&gt; �� 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=sjfw2%>' ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>ͳ��ʱ��ѡ��</td>
      <td height="46" colspan="3" width="70%" bgcolor="#CCCCFF"> 
        <input type="radio" name="tjsj" value="1" checked>
        ��װǩ��ʱ�� 
        <input type="radio" name="tjsj" value="2">
        ��˾���׿�ʱ�� 
        <input type="radio" name="tjsj" value="3">
        �������׿�ʱ�� 
        <input type="radio" name="tjsj" value="4">
        ��װ¼��ʱ�� </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>ҵ����Χ</td>
      <td height="46" colspan="3" width="70%" bgcolor="#CCCCFF"> 
        <input type="radio" name="jzbz" value="0" checked>
        ȫ�� 
        <input type="radio" name="jzbz" value="1">
        ��װ 
        <input type="radio" name="jzbz" value="2">
        ��װ </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46">��ʾ���</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="button"  value="��װͳ��" onClick="f_do(selectform,'jz')" name="jzcz">
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
function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ǩԼʱ�� ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ǩԼʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ǩԼʱ�� ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ǩԼʱ�� "))) {
		return false;
	}

	FormName.action="dmYczTjb.jsp";
	FormName.target="";
	FormName.submit();
	FormName.jzcz.disabled=true;
	return true;
}


//-->
</SCRIPT>

