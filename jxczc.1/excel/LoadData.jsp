<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String count=cf.executeQuery("select count(*) from jxc_kcb where cllb='0'");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>�������Ŀ��</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr align="center">
        <td width="48%" height="33" align="right">�Ѵ��ڿ�桺<%=count%>������</td>
        <td width="52%" height="33" align="left">&nbsp;</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onClick="f_onclick(loadform)">
                <P>
			  <A HREF="CSH17-����ʼ��.xls"><B>����Ҽ����Ϊ�����ء�����ʼ����ģ��</B></A>			 
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
function f_delete(FormName)
{
	FormName.target="_blank";
	FormName.action="deleteBjxm.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	FormName.target="";
	FormName.action="DisData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>