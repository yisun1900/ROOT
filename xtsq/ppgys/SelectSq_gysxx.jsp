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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
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

<form method="post" action="Sq_gysxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">Ʒ�ƹ�Ӧ�̱��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysxx_gysbh" size="20" maxlength="5" >
              </td>
              <td width="17%"> 
                <div align="right">Ʒ�ƹ�Ӧ������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sq_gysxx_gysmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <select name="sq_gysxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where  dqbm='"+dqbm+"'","");
	}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ӧ�����</div>
              </td>
              <td width="33%"> 
                <select name="sq_gysxx_gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+ľ��&2+����&3+�Ҿ�&4+����","");
%> 
                </select>
              </td>
              <td width="17%" align="right">�������</td>
              <td width="33%"> 
                <select name="sq_gysxx_zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">Ʒ�Ʊ���</td>
              <td width="33%"> 
                <input type="text" name="ppbm" size="20" maxlength="5" >
              </td>
              <td width="17%" align="right">��Ӧ�̱���</td>
              <td width="33%"> 
                <input type="text" name="gysbm" size="20" maxlength="5" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">Ʒ������</td>
              <td width="33%"> 
                <input type="text" name="ppmc2" size="20" maxlength="50" >
              </td>
              <td width="17%" align="right">Ʒ������</td>
              <td width="33%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from sq_ppxx order by ppmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��Ӧ������</td>
              <td width="33%"> 
                <input type="text" name="gys2" size="20" maxlength="50" >
              </td>
              <td width="17%" align="right">��Ӧ������</td>
              <td width="33%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select gys c1,gys||'��'||dqmc||'��' c2 from sq_gysbm,dm_dqbm where sq_gysbm.dqbm=dm_dqbm.dqbm(+)  order by sq_gysbm.dqbm,gys","");
	}
	else{
		cf.selectItem(out,"select gys c1,gys||'��'||dqmc||'��' c2 from sq_gysbm,dm_dqbm where sq_gysbm.dqbm=dm_dqbm.dqbm(+) and sq_gysbm.dqbm='"+dqbm+"' order by gys","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ѯ�������</div>
              </td>
              <td width="33%"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="sq_gysxx.gysmc">Ʒ�ƹ�Ӧ������</option>
                  <option value="sq_gysxx.gysbh">Ʒ�ƹ�Ӧ�̱��</option>
                  <option value="sq_gysxx.gyslb">��Ӧ�����</option>
                  <option value="sq_gysxx.zclb">�������</option>
                  <option value="sq_gysxx.ppbm">Ʒ�Ʊ���</option>
                  <option value="sq_gysxx.ppmc">Ʒ������</option>
                  <option value="sq_gysxx.gysbm">��Ӧ�̱���</option>
                  <option value="sq_gysxx.gys">��Ӧ������</option>
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�Ƿ����Ż�</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sfyyh" value="N">
                �� 
                <input type="radio" name="sfyyh" value="Y">
                �� </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
