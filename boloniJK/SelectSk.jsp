<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�տ��ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SkList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			
            <tr id="d" bgcolor="#FFFFFF" style="display:block"> 
              <td width="18%"> 
                <div align="right">��ͬ���</div>              </td>
              <td> 
                <input type="text" name="contractId" size="30" maxlength="30" >                              </td>
            </tr>
			
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)"></td>
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


function tz()
{
	if(document.selectform.cx.value=='1')
	{
		document.getElementById("d").style.display="block";
		document.getElementById("k").style.display="none";
	}

	if(document.selectform.cx.value=='2')
	{
		document.getElementById("d").style.display="none";
		document.getElementById("k").style.display="block";
	}
}


function f_do(FormName)//����FormName:Form������
{
	if(javaTrim(FormName.contractId)=="") {
		alert("��ͬ��Ų���Ϊ��");
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
