<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<CENTER><B>����EXCEL</B><BR><HR>
<form method="post" action="readDate.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXCEL�ļ�</b><br>
		</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onClick="f_onclick(loadform)">
          </p>
		  <hr>
        </td>
      </tr>
	  <tr> 
        <td colspan="2" align="left"> 
          <p>&nbsp;</p>
          <p> 
           <font color="blue" size="2">
		   <b>ע��:</b>����ǰ׺+�������ݲ��ܳ���60����,�����޷�����!<br>
		   <b>����ǰ׺������:</b>����ǰ׺Ϊ��ѡ����,����:����������"������",���߿��Բ�����,���������Ķ���ǰ׺��"������",����������"ף������˳��!",ϵͳ������"������,ף������˳��!"
		   </font>
          </p>
        </td>
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
	if(	javaTrim(FormName.loadName)=="") {
		alert("��ѡ��[�����ļ�]��");
		FormName.loadName.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>