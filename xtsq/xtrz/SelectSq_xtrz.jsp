<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%	
	String dwbh=(String)session.getAttribute("dwbh");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx order by ssfgs,dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011501'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ϵͳ��־]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post"  name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                �ֹ�˾              </td>
              <td width="33%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
                  <%
				if (yhjs.equals("A0") || yhjs.equals("A1"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
				}
				else{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
				}
			%> 
                </select>              </td>
              <td width="17%" align="right"> 
                ������λ              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				if (yhjs.equals("A0") || yhjs.equals("A1"))
				{
					out.println("<option value=\"\"></option>");
//					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  order by ssfgs,dwbh","");
				}
				else if (yhjs.equals("F0") || yhjs.equals("F1"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  ssfgs='"+ssfgs+"' order by dwbh","");
				}
				else if (yhjs.equals("F2"))
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
				}
			%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ���              </td>
              <td width="33%"> 
                <input type="text" name="xh" size="20" maxlength="16" >              </td>
              <td width="17%" align="right"> 
                IP��ַ              </td>
              <td width="33%"> 
                <input type="text" name="ip" size="20" maxlength="30" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �û���½��              </td>
              <td width="33%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16" >              </td>
              <td width="17%" align="right"> 
                �û�����              </td>
              <td width="33%"> 
                <input type="text" name="yhmc" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��½ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="dlsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="dlsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ְ��</td>
              <td><select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%>
              </select></td>
              <td align="right" >&nbsp;</td>
              <td >&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �˳�ʱ��              </td>
              <td width="33%"> 
                <input type="text" name="tcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" width="17%" >��ʾ���</td>
              <td width="33%" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="button"  value="��½����ͳ��" onClick="f_do1(selectform)">
                <input type="button" onClick="f_do2(selectform)"  value="IP��ַͳ��">
                <input type="button" onClick="f_do3(selectform)"  value="���ɵ�½">
                <input type="button"  value="�����־" onClick="window.open('DeleteXtrz.jsp')">
                <input name="button" type="button" onClick="window.open('DeleteCfXtrz.jsp')"  value="����ظ���־">
                <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj2, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcsj, "�˳�ʱ��"))) {
		return false;
	}
	FormName.action="Sq_xtrzList.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj2, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcsj, "�˳�ʱ��"))) {
		return false;
	}
	FormName.action="yhtj.jsp";
	FormName.submit();

	return true;
}
function f_do2(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj2, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcsj, "�˳�ʱ��"))) {
		return false;
	}
	FormName.action="iptj.jsp";
	FormName.submit();

	return true;
}
function f_do3(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj2, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcsj, "�˳�ʱ��"))) {
		return false;
	}
	FormName.action="kydl.jsp";
	FormName.submit();

	return true;
}
//-->
</SCRIPT>