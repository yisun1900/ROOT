<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���빤�ʳ�ʼ����Ϣ </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String xh =null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	xh = up.getParameter("xh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);

	%> 
<form method="post" action="saveInitKqsj.jsp" name="editform" target="_blank">
<div align="center">���빤�ʳ�ʼ����Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="5%">���</td>
	<td  width="10%">Ա������</td>
	<td  width="10%">���ں���</td>
	<td  width="15%">����</td>
	<td  width="20%">ǩ��ʱ��</td>
	<td  width="20%">ǩ��ʱ��</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 

	if (outStr==null)
	{
		out.println("����Execel�ļ��޷�ʶ�������¸���һ�����ļ�");
		return;
	}

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][2].equals(""))
		{
			out.println("����!��"+i+"��[Ա�����]Ϊ��,����������Զ�������");
			break;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%> 
      <td><%=outStr[i][0]%> 
        <input name="id" type="hidden" value="<%=i%>">
        <input name="yhmc" type="hidden" value="<%=outStr[i][0]%>">
        <input name="kqhm" type="hidden" value="<%=outStr[i][1]%>" >
        <input name="gzr" type="hidden" value="<%=outStr[i][2]%>" >
        <input name="sbsj" type="hidden" value="<%=outStr[i][3]%>" >
        <input name="xbsj" type="hidden" value="<%=outStr[i][4]%>" >
      </td>
      <td><%=outStr[i][1]%></td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
