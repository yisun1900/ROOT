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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������


	//����Ƿ�����ĩ��ת
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center"> <b>�ؽ�����</b> <BR>
	<BR>
    <table width="50%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
    <td width="100%" height="83" >������˾ 
      <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	
	
<%
	if (kfgssq.equals("2"))//2����Ȩ����ֹ�˾
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
                </select>
    </td>
  </tr>
            
  <tr bgcolor="#FFFFFF" align="center"> 
        <td width="100%"> 
          <input type="button" value="�ؽ�����" onClick="f_do(insertform)">
        </td>
  </tr>
</table>
  
  </div>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.action="SaveCjgh.jsp";

	FormName.submit();
	return true;
}

//-->
</SCRIPT>

