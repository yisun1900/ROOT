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
      <div align="center">������ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="OrderList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			 <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ѯ����</div>              </td>
              <td> 
                <select name="cx" onchange="tz()">
				<option value="1">�������</option>
				<option value="2">�ͻ����</option>
				</td>
            </tr>
            <tr id="d" bgcolor="#FFFFFF" style="display:block"> 
              <td width="18%"> 
                <div align="right">�������</div>              </td>
              <td> 
                <input type="text" name="orderId" size="30" maxlength="30" >                              </td>
            </tr>
			<tr id="k"bgcolor="#FFFFFF" style="display:none"> 
              <td width="18%"> 
                <div align="right">�ͻ����</div>              </td>
              <td> 
                <input type="text" name="custId" size="30" maxlength="20" >                              </td>
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
	if(javaTrim(FormName.cx)=="1")
	if(javaTrim(FormName.orderId)=="") {
		alert("������Ų���Ϊ��");
		return false;
	}
	
	if(javaTrim(FormName.cx)=="2")
	if(javaTrim(FormName.custId)=="") {
		alert("�ͻ���Ų���Ϊ��");
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
