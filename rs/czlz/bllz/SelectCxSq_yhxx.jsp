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
	//����Ƿ�����ĩ��ת
	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("����û�н��С���ת����");
		return;
	}
	else if (count==-1)
	{
		out.println("����");
		return;
	}

%>

<body bgcolor="#FFFFFF">
  <div align="center"> 
    <p>ѡ����ְ���� </p>
    <table width="100%" border="0">
      <tr> 
        
      <td width="43%" height="112">&nbsp;</td>
        
      <td width="57%" height="112"> 
        <p><A HREF="SelectCxRs_czsq.jsp">��Ҫ��ְ����</A> </p>
        <p><A HREF="SelectCxSq_yhxx1.jsp">����Ҫ��ְ����</A> </p>
      </td>
      </tr>
    </table>
  </div>
</body>
</html>


