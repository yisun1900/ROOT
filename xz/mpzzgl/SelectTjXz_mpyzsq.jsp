<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
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
      <div align="center">��Ƭ���������ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Xz_mpyzsqTjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">�ֹ�˾</td>
              <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,xz_mpyzsq_dwbh,"+dwstr+");\">");
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
              <td width="18%" align="right">���벿��</td>
              <td width="32%"> 
                <select name="xz_mpyzsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F2") || yhjs.equals("F1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_xm" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">ְ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_zw" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�������� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_sqrq" size="20" value="" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_sqrq2" size="20"  value=""  maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ʱ�� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_wcsj" size="20" value="" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_wcsj2" size="20"  value=""  maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">��Ƭ�汾</td>
              <td width="32%"> 
                <select name="mpbb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mpbb c1,mpbb c2 from xz_mpbb ","");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">����</td>
              <td width="32%">
                <input type="text" name="dj" size="20"  value=""  maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ������</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="xz_mpyzsq_sfywc" value="Y" checked>
                ��� 
                <input type="radio" name="xz_mpyzsq_sfywc" value="N">
                �� </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">�������</td>
              <td width="32%"> 
                <input type="text" name="xz_mpyzsq_sqxh" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">ͳ����</td>
              <td colspan="3"> ��һ�� 
                <input type="hidden" name="tj1name" value="���벿��">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value="dwmc">���벿��</option>
                  <option value="xz_mpyzsq.xm">����</option>
                  <option value="xz_mpyzsq.zw">ְ��</option>
                  <option value="xz_mpyzsq.mpbb">��Ƭ�汾</option>
                  <option value="TO_CHAR(xz_mpyzsq.dj)">����</option>
                  <option value="xz_mpyzsq.yqsl">Ҫ������</option>
                  <option value="xz_mpyzsq.yqjfrq">Ҫ�󽻸�����</option>
                  <option value="xz_mpyzsq.wcsj">���ʱ��</option>
                  <option value="xz_mpyzsq.wcsl">�������</option>
                  <option value="xz_mpyzsq.sqrq">��������</option>
                </select>
                �ڶ��� 
                <input type="hidden" name="tj2name" value="����">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">���벿��</option>
                  <option value="xz_mpyzsq.xm">����</option>
                  <option value="xz_mpyzsq.zw">ְ��</option>
                  <option value="xz_mpyzsq.mpbb">��Ƭ�汾</option>
                  <option value="TO_CHAR(xz_mpyzsq.dj)" selected>����</option>
                  <option value="xz_mpyzsq.yqsl">Ҫ������</option>
                  <option value="xz_mpyzsq.yqjfrq">Ҫ�󽻸�����</option>
                  <option value="xz_mpyzsq.wcsj">���ʱ��</option>
                  <option value="xz_mpyzsq.wcsl">�������</option>
                  <option value="xz_mpyzsq.sqrq">��������</option>
                </select>
                ������ 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">���벿��</option>
                  <option value="xz_mpyzsq.xm">����</option>
                  <option value="xz_mpyzsq.zw">ְ��</option>
                  <option value="xz_mpyzsq.mpbb">��Ƭ�汾</option>
                  <option value="TO_CHAR(xz_mpyzsq.dj)">����</option>
                  <option value="xz_mpyzsq.yqsl">Ҫ������</option>
                  <option value="xz_mpyzsq.yqjfrq">Ҫ�󽻸�����</option>
                  <option value="xz_mpyzsq.wcsj">���ʱ��</option>
                  <option value="xz_mpyzsq.wcsl">�������</option>
                  <option value="xz_mpyzsq.sqrq">��������</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">��ʾ���</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��Ƭͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">
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
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.xz_mpyzsq_sqrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_mpyzsq_sqrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_mpyzsq_wcsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_mpyzsq_wcsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

