<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����µ����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <B>�����µ����ı���</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ�����ı���EXECEL�ļ�</b></td>
      </tr>
      <tr  >
        <td align="right" ><font color="#FF0000">*</font>��������</td>
        <td><select name="dqbm" size="15" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
%>
        </select></td>
      </tr>
      <tr valign="bottom"  > 
        <td width="44%" height="49" align="right" ><font color="#FF0000">*</font>���ı������ɷ�ʽ��</td>
        <td width="56%">
          <input name="zcbmfs" type="radio" value="1" checked>
          ϵͳ�Զ�����
        <input type="radio" name="zcbmfs" value="2">����</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
          <input type="button"  value="����" onClick="f_onclick(loadform)">        </td>
	  </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if(	!selectChecked(FormName.dqbm)) {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.zcbmfs)) {
		alert("��ѡ��[���ı������ɷ�ʽ]��");
		FormName.zcbmfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.loadName)=="") {
		alert("��ѡ��[EXECEL�ļ�]��");
		FormName.loadName.focus();
		return false;
	}


	FormName.action="DisImpAddData.jsp";

	FormName.submit();
	return true;
} 

//-->
</script>