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
<form method="post" action="saveInitGz.jsp" name="editform" target="_blank">
<div align="center">���빤�ʳ�ʼ����Ϣ</div>
<input type="hidden" name="xh" value="<%=xh%>">
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">���</td>
	<td  width="7%">��������</td>
	<td  width="4%">Ա�����</td>
	<td  width="5%">����</td>
	<td  width="5%">Ա������</td>
	<td  width="3%">ȫ������</td>
	<td  width="3%">��������</td>
	<td  width="6%">���乤��</td>
	<td  width="6%">��λ����</td>
	<td  width="6%">��н</td>
	<td  width="6%">��ͨ����</td>
	<td  width="6%">�Ͳ�</td>
	<td  width="6%">�绰��</td>
	<td  width="6%">�۱���</td>
	<td  width="6%">����</td>
	<td  width="5%">��������</td>
	<td  width="6%">�����ۿ�</td>
	<td  width="6%">���</td>
	<td  width="5%">˰ǰ����</td>
	<td  width="5%">��˰��</td>
	<td  width="5%">˰����</td>
	<td  width="6%">��ע</td>
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
        <input name="id" type="hidden" value="<%=outStr[i][0]%>">
        <input name="ygbh" type="hidden" value="<%=outStr[i][2]%>" >
        <input name="bianhao" type="hidden" value="<%=outStr[i][3]%>">
      </td>
      <td><%=outStr[i][1]%></td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
      <td> <%=outStr[i][5]%></td>
      <td> <%=outStr[i][6]%></td>
      <td> 
        <input name="glgz" type="text" value="<%=outStr[i][7]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glgz[<%=i%>])">
      </td>
      <td>
        <input name="gwgz" type="text" value="<%=outStr[i][8]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gwgz[<%=i%>])">
      </td>
      <td> 
        <input name="jbgz" type="text" value="<%=outStr[i][9]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jbgz[<%=i%>])">
      </td>
      <td> 
        <input name="jtbt" type="text" value="<%=outStr[i][10]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jtbt[<%=i%>])">
      </td>
      <td> 
        <input name="cb" type="text" value="<%=outStr[i][11]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cb[<%=i%>])">
      </td>
      <td> 
        <input name="dhbt" type="text" value="<%=outStr[i][12]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dhbt[<%=i%>])">
      </td>
      <td> 
        <input name="yjsxe" type="text" value="<%=outStr[i][13]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(yjsxe[<%=i%>])">
      </td>
      <td> 
        <input name="jj" type="text" value="<%=outStr[i][14]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jj[<%=i%>])">
      </td>
      <td> 
        <input name="qtbt" type="text" value="<%=outStr[i][15]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qtbt[<%=i%>])">
      </td>
      <td> 
        <input name="qtkk" type="text" value="<%=outStr[i][16]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qtkk[<%=i%>])">
      </td>
      <td> 
        <input name="tc" type="text" value="<%=outStr[i][17]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(tc[<%=i%>])">
      </td>
      <td> 
        <input name="sqgz" type="text" value="<%=outStr[i][18]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sqgz[<%=i%>])">
      </td>
      <td> 
        <input name="ksk" type="text" value="<%=outStr[i][19]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(ksk[<%=i%>])">
      </td>
      <td> 
        <input name="shgz" type="text" value="<%=outStr[i][20]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(shgz[<%=i%>])">
      </td>
      <td> 
        <input name="bz" type="text" value="<%=outStr[i][21]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=i%>])">
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
