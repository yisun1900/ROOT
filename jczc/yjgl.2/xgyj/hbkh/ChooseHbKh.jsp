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
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050103'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ǩ���ͻ�--��ѯ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}

	String ssfgs=request.getParameter("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:16">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>�ͻ��ϲ���<font color="#FF0000"><b><font color="#0000FF">�������ͻ����Ϻϲ���һ��ɾ��һ��������һ��</font></b></font>��</p>
        <p><b><font color="#CC00CC">���ϲ�ԭ�򣺱���<font size="5" color="#FF0000">��װ�ͻ�</font>��ɾ��<font size="5" color="#FF0000">���ɿͻ�</font>��</font></b></p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="ViewHbKhxx.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="42%" height="36"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="58%" height="36"> <%
	out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	out.println("        </select>");
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="42%" align="right" height="49"><font color="#FF0000"><b>�����ͻ���ţ���װ�򼯳ɿͻ���</b></font></td>
              <td width="58%" height="49"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="42%" height="55"> 
                <div align="right"><font color="#0000FF">ɾ���ͻ���ţ����ɿͻ���</font></div>
              </td>
              <td width="58%" height="55"> 
                <input type="text" name="khbh2" size="20" maxlength="7" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="����" onClick="f_do(selectform)">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�����ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh2)=="") {
		alert("������[ɾ���ͻ����]��");
		FormName.khbh2.focus();
		return false;
	}

	if (FormName.khbh.value==FormName.khbh2.value)
	{
		alert("[�����ͻ����]��[ɾ���ͻ����]������ͬ��");
		FormName.khbh2.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
