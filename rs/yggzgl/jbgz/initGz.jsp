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

String ssfgs =null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ssfgs = up.getParameter("ssfgs");

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
<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="14%">��������</td>
	<td  width="6%">Ա�����</td>
	<td  width="8%">����</td>
	<td  width="8%">Ա������</td>
	<td  width="10%">����ְ��</td>
	<td  width="6%">�������</td>
	<td  width="6%">��Ч���ʻ���</td>
	<td  width="6%">��������</td>
	<td  width="6%">��λ����</td>
	<td  width="6%">���乤��</td>
	<td  width="6%">��ͨ����</td>
	<td  width="6%">ͨѶ����</td>
	<td  width="6%">��������</td>
	<td  width="6%">��������</td>
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


		String gzlb="";
		if (outStr[i][5].trim().equals("�̶�����"))
		{
			gzlb="1";
		}
		else if (outStr[i][5].trim().equals("��������"))
		{
			gzlb="2";
		}
		else{
			out.println("Ա��["+outStr[i][3]+"]����[�������]ֻ����[�̶�����]��[��������]");
			return;
		}

		if (outStr[i][6].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[��Ч���ʻ���]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][6].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[��Ч���ʻ���]������");
				return;
			}
		}
		if (outStr[i][7].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[��������]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][7].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[��������]������");
				return;
			}
		}

		if (outStr[i][8].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[��λ����]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][8].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[��λ����]������");
				return;
			}
		}
		if (outStr[i][9].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[���乤��]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][9].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[���乤��]������");
				return;
			}
		}

		if (outStr[i][10].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[��ͨ����]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][10].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[��ͨ����]������");
				return;
			}
		}

		if (outStr[i][11].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[ͨѶ����]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][11].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[ͨѶ����]������");
				return;
			}
		}

		if (outStr[i][12].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[��������]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][12].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[��������]������");
				return;
			}
		}

		if (outStr[i][13].trim().equals(""))
		{
			out.println("Ա��["+outStr[i][3]+"]����[��������]����Ϊ��");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][13].trim());
			}
			catch (Exception e){
				out.println("Ա��["+outStr[i][3]+"]����[��������]������");
				return;
			}
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
      <td><%=outStr[i][5]%>
        <input name="gzlb" type="hidden" value="<%=gzlb%>">
      </td>
      <td><%=outStr[i][6]%>
        <input name="khgz" type="hidden" value="<%=outStr[i][6]%>">
      </td>
      <td> <%=outStr[i][7]%>
        <input name="jbgz" type="hidden" value="<%=outStr[i][7]%>" >
	  </td>
      <td><%=outStr[i][8]%> 
        <input name="gwgz" type="hidden" value="<%=outStr[i][8]%>" >
      </td>
      <td><%=outStr[i][9]%> 
        <input name="glgz" type="hidden" value="<%=outStr[i][9]%>" >
      </td>
      <td><%=outStr[i][10]%> 
        <input name="jtbt" type="hidden" value="<%=outStr[i][10]%>" >
      </td>
      <td><%=outStr[i][11]%> 
        <input name="dhbt" type="hidden" value="<%=outStr[i][11]%>" >
      </td>
      <td><%=outStr[i][12]%> 
        <input name="cb" type="hidden" value="<%=outStr[i][12]%>" >
      </td>
      <td><%=outStr[i][13]%> 
        <input name="buzhu" type="hidden" value="<%=outStr[i][13]%>">
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
