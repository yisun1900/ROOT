<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String dqbm=request.getParameter("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>


<body bgcolor="#FFFFFF">
<CENTER>
  <B>���ӱ��ۣ��汾����</B><BR>
  <HR>
<form method="post" action="" name="insertform" >
    <table width="100%" border="0">
      <tr align="center">
        <td height="34" align="right"><span class="STYLE1">*</span>������</td>
        <td height="34" align="left"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
          </select>
        </td>
      </tr>
      
      <tr align="center"> 
        <td width="29%" height="33" align="right"><span class="STYLE1">*</span>�����ư汾��</td>
        <td width="71%" height="33" align="left">
		<select name="oldbjbbh" style="FONT-SIZE:12PX;WIDTH:315PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm order by bj_dzbjbb.dqbm,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,bjbbh","");
	}
%>
        </select></td>
      </tr>
      <tr align="center"> 
        <td width="29%" height="33" align="right"><span class="STYLE1">*</span>���ư汾��</td>
        <td width="71%" height="33" align="left">
		<select name="newbjbbh" style="FONT-SIZE:12PX;WIDTH:315PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,bjbbh","");
	}
%>
        </select></td>
      </tr>
       <tr align="center">
        <td height="157" align="right"><span class="STYLE1">*</span>ѡ�񣭸�������</td>
        <td height="157" align="left">
			<input type="checkbox" name="gcbj" value="1">���̱���
			<BR>
			<input type="checkbox" name="tcjg" value="2">�ײͣ��۸��
			<BR>
			<input type="checkbox" name="tcsj" value="3">�ײͣ�������۱�
			<BR>
			<input type="checkbox" name="tcbzgc" value="4">�ײͣ���׼������Ŀ
			<BR>
			<input type="checkbox" name="tcbzzc" value="5">�ײͣ���׼������Ŀ
			<BR>
			<input type="checkbox" name="tczcbj" value="6">�ײͣ����ı���	     </td>
      </tr>
     
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onClick="f_onclick(insertform)">
          </p>        </td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.oldbjbbh)=="") {
		alert("��ѡ��[�����ư汾��]��");
		FormName.oldbjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.newbjbbh)=="") {
		alert("��ѡ��[���ư汾��]��");
		FormName.newbjbbh.focus();
		return false;
	}

	if (FormName.oldbjbbh.value==FormName.newbjbbh.value)
	{
		alert("����[�����ư汾��]������[���ư汾��]��ͬ");
		FormName.newbjbbh.focus();
		return false;
	}
	if(	FormName.gcbj.checked==false && FormName.tcjg.checked==false  && FormName.tcsj.checked==false && FormName.tcbzgc.checked==false && FormName.tcbzzc.checked==false && FormName.tczcbj.checked==false) 
	{
		alert("��ѡ��[��������]��");
		FormName.gcbj.focus();
		return false;
	}


	FormName.action="bjbfzChoose.jsp";
	FormName.submit();
	return true;
} 


//-->
</script>