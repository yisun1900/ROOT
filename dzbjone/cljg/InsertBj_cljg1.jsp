<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=request.getParameter("dqbm");
String cldlbm=request.getParameter("cldlbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<title>��װ���Ϸ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style3 {
	color: #FF0000;
	font-size: 14px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="SaveInsertBj_jzcljgb.jsp" name="editform" target="_blank">
<div align="center">¼���������ϼ۸��<span class="style3">(ע��:���ϱ������������</span>) </div>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr> 
      <td width="20%">���� 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:82PX">
          <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
        </select>
      </td>
      <td width="38%">������� 
        <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:180PX">
          <%
	cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm where cldlbm='"+cldlbm+"' order by cldlmc","");
					%> 
        </select>
      </td>
      <td width="19%">¼���� 
        <input type="text" name="lrr" size="10" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
      <td width="23%">¼��ʱ�� 
        <input type="text" name="lrsj" size="11" maxlength="10"  value="<%=cf.today()%>" >
      </td>
    </tr>
  </table>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="4%">���</td>
      <td width="8%">�������ϱ���</td>
      <td width="20%">������������</td>
      <td width="20%">�ͺŹ��</td>
      <td width="20%">Ʒ�� </td>
      <td width="8%">������λ</td>
      <td width="10%">���� </td>
      <td width="8%">������ϱ���</td>
      <td width="8%">����/���������λ��ֵ</td>
    </tr>
    <%
	String bgcolor=null;

	for (int row=0;row<15 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td><%=(row+1)%></td>
      <td>
        <input type="text" name="wlbm" size="15" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jswlbm[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="glmc" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glmc[<%=row%>])">
      </td>
      <td>
        <input type="text" name="xhgg" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=(row)%>])">
      </td>
      <td> 
        <input type="text" name="pp" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(cldlbm[<%=(row+1)%>])">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(dj[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc","");
					%> 
        </select>
      </td>
      <td>
        <input name="dj" type="text" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wlbm[<%=(row+1)%>])" size="6" maxlength="15">
</td>
      <td> 
        <select name="jswlbm" style="FONT-SIZE:12PX;WIDTH:182PX">
          <option value=""></option>
          <%
			cf.selectItem(out,"select wlbm,glmc||NVL2(pp,'('||pp||','||cljldwmc||')','') c2 from bj_jscljgb,bdm_cljldwbm where bj_jscljgb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_jscljgb.dqbm='"+dqbm+"' and bj_jscljgb.cldlbm='"+cldlbm+"' order by c2","");
			%> 
        </select>
      </td>
      <td> 
        <input name="wljsbz" type="text" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(wlbm[<%=(row+1)%>])" size="6" maxlength="15">
      </td>
    </tr>
    <%

	}
%> 
    <tr> 
      <td colspan="7" height="47" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)" name="savebutton">
          <input type="reset"  value="����">
        </div>
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
     if(javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
