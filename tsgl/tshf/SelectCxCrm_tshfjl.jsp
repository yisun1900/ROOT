<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('A0','A1','F0','F1') order by ssdw,dwbh");
%>

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

<form method="post" action="Crm_tshfjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,hfbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="18%"> 
                <div align="right">�طò���</div>
              </td>
              <td width="32%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_tsjl_fwdz" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_sjs" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ʼ�Ա</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_zjy" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
					if (yhjs.equals("A0") || yhjs.equals("A1"))
					{
						cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��'||DECODE(sq_sgd.cxbz,'Y','��������','N','') from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
					}
					else{
						cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��'||DECODE(sq_sgd.cxbz,'Y','��������','N','') from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
					}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">�طü�¼��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tshfjl_hfjlh" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">�ط���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tshfjl_hfr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">�ط�ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="crm_tshfjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_tshfjl_hfsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC">�ͻ��ط����</td>
              <td colspan="3"> 
                <input type="text" name="crm_tshfjl_khhfqk" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                <div align="right">�ط��г��ֵ�������</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="crm_tshfjl_cxxwt" size="73" value="">
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
	if(!(isDatetime(FormName.crm_tshfjl_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tshfjl_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
