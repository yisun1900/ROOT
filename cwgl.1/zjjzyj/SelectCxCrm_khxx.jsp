<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 24px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
      <div align="center">
        ���ӽ�תҵ��
        <p class="STYLE1">��©���Ŀͻ����ӵ����µ�ҵ����
      </div>

          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">ѡ�����޸ĵķֹ�˾</td>
              <td width="32%"> 
			  <select name="fgsbh" size="35" multiple style="FONT-SIZE:12PX;WIDTH:252PX" >
			  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%> 
        </select>
			</td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="����" onClick="f_do(selectform)"></td>
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
	if(	!selectChecked(FormName.fgsbh)) {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	FormName.action="Crm_khxxCxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
