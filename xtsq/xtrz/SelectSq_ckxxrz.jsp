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
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011502'");
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

//out.println(cf.jmm("00-1A-64-A2-36-41"));
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
      <div align="center"> �鿴�ؼ���Ϣ��־</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post"  name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">�ֹ�˾</div>
              </td>
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
                </select>
              </td>
              <td width="17%"> 
                <div align="right">������λ</div>
              </td>
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
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xh" size="20" maxlength="16" >
              </td>
              <td width="17%"> 
                <div align="right">IP��ַ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ip" size="20" maxlength="30" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�û���½��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16" >
              </td>
              <td width="17%"> 
                <div align="right">�û�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�鿴ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="dlsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="dlsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <input type="text" name="bz" size="73" maxlength="300" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ʾ���</td>
              <td width="33%">
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
              <td align="right" width="17%" >&nbsp;</td>
              <td width="33%" >&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="button"  value="ͳ��" onClick="f_do1(selectform)">
                <input type="button"  value="�����־" onClick="window.open('DeleteSq_ckxxrz.jsp')">
                <input type="reset"  value="����">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj, "�鿴ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj2, "�鿴ʱ��"))) {
		return false;
	}

	FormName.action="Sq_ckxxrzList.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj, "�鿴ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dlsj2, "�鿴ʱ��"))) {
		return false;
	}
	FormName.action="Sq_ckxxrzTj.jsp";
	FormName.submit();

	return true;
}
//-->
</SCRIPT>
