<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���ӱ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;


String[][] outStr=null; 
String bgcolor=null;

String xuhao=null;
String jjpjflbm=null;
String bcpp=null;
String bclx=null;
String xinghao=null;
String guige=null;
String jldwmc=null;
String djStr=null;
String bchd=null;
String jldwbmstr=null;


String jldwbm="";
double dj=0;

int count=0;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\jjbj\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();
	
	%> 
<form method="post" action="SaveImpAddDataJjbj.jsp" name="editform" >
  <div align="center">����[�Ҿ߰��]����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td  width="5%">���</td>
		<td  width="30%">���Ʒ��</td>
		<td  width="35%">�������</td>
		<td  width="15%">��ĺ�ȣ�mm��</td>
		<td  width="15%">����</td>
    </tr>

	<%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}


		xuhao=outStr[i][0].trim();
		bcpp=outStr[i][1].trim();
		bclx=outStr[i][2].trim();
		bchd=outStr[i][3].trim();
		djStr=outStr[i][4].trim();

		if (bcpp.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[���Ʒ��]����Ϊ��");
			return;
		}
		if (bclx.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[�������]����Ϊ��");
			return;
		}

		//��ĺ��
		if (bchd!=null && !bchd.trim().equals(""))
		{
			try{
				Integer.parseInt(bchd.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[��ĺ��]�����֣�" + bchd);
				return;
			}
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[��ĺ��]����Ϊ��");
			return;
		}

		//����
		dj=0;
		if (djStr!=null && !djStr.trim().equals(""))
		{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[����]�����֣�" + djStr);
				return;
			}
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[����]����Ϊ��");
			return;
		}

		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		  <td><%=xuhao%> 
			<input name="xuhao" type="hidden" value="<%=xuhao%>">
		  </td>
		  <td><%=bcpp%>
			<input name="bcpp" type="hidden" value="<%=bcpp%>" >
		  </td>
		  <td><%=bclx%>
			<input name="bclx" type="hidden" value="<%=bclx%>" >
		  </td>
		  <td ><%=bchd%>
			<input name="bchd" type="hidden" value="<%=bchd%>" >
		  </td>
		  <td><%=dj%>
			<input name="dj" type="hidden" value="<%=dj%>" >
		  </td>
		</tr>
		<%
	}

	rwe=null;
}
catch (Exception e) {
	out.print("����" + e);
	return;
}
finally 
{
	outStr=null; 
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
        <input type="button"  value="����" name="bc" onClick="f_do(editform)">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
