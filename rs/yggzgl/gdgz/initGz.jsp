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
	f.close();

	%> 
<form method="post" action="saveInitGz.jsp" name="editform" >
<div align="center">���빤�ʳ�ʼ����Ϣ</div>
<input type="hidden" name="xh" value="<%=xh%>">
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      </td>
    </tr>


    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="10%">��������</td>
	<td  width="5%">Ա�����</td>
	<td  width="8%">����</td>
	<td  width="7%">Ա������</td>
	<td  width="8%">����ְ��</td>
	<td  width="5%">ʵ�ʳ�������</td>
	<td  width="5%">�¼�����</td>
	<td  width="5%">��������</td>

	<td  width="5%">��Ч��ֵ</td>


	<td  width="5%">�Ӱ��</td>
	<td  width="5%">�۱���</td>

	<td  width="5%">���</td>
	<td  width="5%">����</td>
	<td  width="5%">���ٿۿ�</td>

	<td  width="5%">��������</td>

	<td  width="12%">��ע</td>
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
      <td><%=outStr[i][0]%> 
      </td>
      <td><%=outStr[i][1]%>
        <input name="ygbh" type="hidden" value="<%=outStr[i][1]%>" >
			</td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
      <td> <%=outStr[i][5]%>
        <input name="cqts" type="hidden" value="<%=outStr[i][5]%>">
			</td>
      <td> <%=outStr[i][6]%>
        <input name="sjts" type="hidden" value="<%=outStr[i][6]%>">
			</td>
      <td> <%=outStr[i][7]%>
        <input name="bjts" type="hidden" value="<%=outStr[i][7]%>" >
      </td>
      <td><%=outStr[i][8]%>
        <input name="jxfz" type="hidden" value="<%=outStr[i][8]%>" >
      </td>
      <td><%=outStr[i][9]%> 
        <input name="jbf" type="hidden" value="<%=outStr[i][9]%>" >
      </td>
      <td><%=outStr[i][10]%> 
        <input name="yjsxe" type="hidden" value="<%=outStr[i][10]%>" >
      </td>
      <td><%=outStr[i][11]%> 
        <input name="tc" type="hidden" value="<%=outStr[i][11]%>" >
      </td>
      <td><%=outStr[i][12]%> 
        <input name="jf" type="hidden" value="<%=outStr[i][12]%>" >
      </td>
      <td><%=outStr[i][13]%> 
        <input name="cjkk" type="hidden" value="<%=outStr[i][13]%>" >
      </td>
      <td><%=outStr[i][14]%> 
        <input name="qtkk" type="hidden" value="<%=outStr[i][14]%>" >
      </td>
      <td><%=outStr[i][15]%> 
        <input name="bz" type="hidden" value="<%=outStr[i][15]%>" >
      </td>
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
