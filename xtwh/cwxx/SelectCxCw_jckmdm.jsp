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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dqbm=(String)session.getAttribute("dqbm");


String gysstr=null;

if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	gysstr=cf.getItemData("select gysmc c1,gysmc c2,DECODE(gyslb,'1','21','2','22','3','24','4','23') from sq_gysxx order by gyslb,dqbm,gysmc");
}
else{
	gysstr=cf.getItemData("select gysmc c1,gysmc c2,DECODE(gyslb,'1','21','2','22','3','24','4','23') from sq_gysxx where dqbm='"+dqbm+"' order by gyslb,gysmc");
}

%>
<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jckmdmCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���</td>
      <td width="35%"> 
        <input type="text" name="cw_jckmdm_xuhao" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">��Ŀ����</td>
      <td width="35%"> 
        <input type="text" name="cw_jckmdm_kmdm" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��Ŀ����</td>
      <td width="35%"> 
        <input type="text" name="cw_jckmdm_kmmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="cw_jckmdm_yefx" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" height="22" align="right">�տ�����</td>
      <td height="22" colspan="3"> 
        <input type="radio" name="cw_jckmdm_fklxbm" value="21" onClick="makeItem('21',cw_jckmdm_gysbh,<%=gysstr%>)">
        ľ�ſ� 
        <input type="radio" name="cw_jckmdm_fklxbm" value="22" onClick="makeItem('22',cw_jckmdm_gysbh,<%=gysstr%>)">
        ����� 
        <input type="radio" name="cw_jckmdm_fklxbm" value="23" onClick="makeItem('23',cw_jckmdm_gysbh,<%=gysstr%>)">
        ���Ŀ� 
        <input type="radio" name="cw_jckmdm_fklxbm" value="24" onClick="makeItem('24',gysbh,<%=gysstr%>)">
        �Ҿ߿�
        <input type="radio" name="cw_jckmdm_fklxbm" value="81" onClick="makeItem('81',gysbh,<%=gysstr%>)" >
        ���� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��Ӧ��</td>
      <td width="35%">
        <select name="cw_jckmdm_gysbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
//	cf.selectItem(out,"select gysmc c1,gysmc c2 from sq_gysxx order by dqbm,gysmc","");
%> 
        </select>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�����־</td>
      <td width="35%"> <%
	cf.radioToken(out, "cw_jckmdm_jdbz","1+�裨�˿&0+�����տ","");
%> </td>
      <td align="right" width="15%">�ֹ�˾����</td>
      <td width="35%"> 
        <select name="cw_jckmdm_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
}
else{
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') ans dwbh='"+ssfgs+"' order by dwbh","");
}

%> 
        </select>
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
	if(!(isNumber(FormName.cw_jckmdm_xuhao, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
