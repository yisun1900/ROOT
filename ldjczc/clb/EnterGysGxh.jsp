<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>


<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">��Ӧ�����۱������ɼҾӣ�</div>      </td>
    </tr>
    
    <tr> 
      <td align="right" width="30%" height="42">�ֹ�˾</td>
      <td height="42" width="70%"> 

		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%> 
		</select>		</td>
    </tr>
    
    <tr> 
      <td align="right" width="30%" height="44"><font color="#0000CC"><b>Ʒ������</b></font></td>
      <td height="44" width="70%">
	  
	  <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:252PX" >
        <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select distinct jxc_ppxx.ppmc c1,jxc_ppxx.ppmc c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+ssfgs+"' order by jxc_ppxx.ppmc","");
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
%>
      </select></td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="43">ǩ��ʱ��</td>
      <td height="43" width="70%"> �� 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' onDblClick="JSCalendar(this)">
        ---->�� 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' onDblClick="JSCalendar(this)">      </td>
    </tr>
    
    <tr> 
      <td align="right" width="30%" height="46">��ʾ���</td>
      <td height="46" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <p>
          <input type="hidden" name="nian" value="<%=nian%>">
          <input type="hidden" name="yue" value="<%=yue%>">
          <input type="button"  value="��ʼͳ��" onClick="f_do(selectform)"  name="tj" >
          <input type="button"  value="����ͳ��" onClick="tj.disabled=false">
      </p>        </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

function changeFgs(FormName) 
{
	FormName.ppbm.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToItem2(selectform.ppbm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("������[�ֹ�˾ ]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ǩ��ʱ�� ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ǩ��ʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ǩ��ʱ�� ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ǩ��ʱ�� "))) {
		return false;
	}

	FormName.action="GysGxh.jsp";
	FormName.submit();
	FormName.tj.disabled=true;
	return true;
}

//-->
</SCRIPT>
