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
String xcmlxbm=null;
String xcmlxmc=null;
String jjpjflbm=null;
String bklxxh=null;
String mbcl=null;
String xbpz=null;
String zsxt=null;
String jjfs=null;
String jjfsStr=null;
String pmdjStr=null;
String ymdjStr=null;
String zpmc=null;
String bz=null;

double pmdj=0;
double ymdj=0;

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
<form method="post" action="SaveImpAddDataBgm.jsp" name="editform" >
  <div align="center">����[�Ͳ���]����</div>
  <table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td  width="3%">���</td>
		<td  width="5%">�Ͳ�������</td>
		<td align="left" width="10%"><strong>������</strong>���߿��ͺ�<BR>
	      <strong>����</strong>������<BR>
          <strong>����</strong>������<BR>
          <strong>�������</strong>������</td>
		<td align="left" width="10%"><strong>������</strong>������<BR>
		  <strong>����</strong>����ɫ<BR>
		  <strong>����</strong>����ɫ<BR>
	      <strong>�������</strong>������</td>
		<td  width="9%">о������</td>
		<td  width="9%">װ������</td>
		<td  width="7%">�Ƽ۷�ʽ</td>
		<td  width="6%">ƽ�׵���</td>
		<td  width="6%">���׵���</td>
		<td  width="8%">��Ƭ����</td>
		<td  width="27%">��ע</td>
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
		xcmlxmc=outStr[i][1].trim();
		bklxxh=outStr[i][2].trim();
		mbcl=outStr[i][3].trim();
		xbpz=outStr[i][4].trim();
		zsxt=outStr[i][5].trim();
		jjfsStr=outStr[i][6].trim();
		pmdjStr=outStr[i][7].trim();
		ymdjStr=outStr[i][8].trim();
		zpmc=outStr[i][9].trim();
		bz=outStr[i][10].trim();

		if (xcmlxmc.equals("������"))//01:�����ţ�02�����ܣ�03��������04���������
		{
			xcmlxbm="01";
		}
		else if (xcmlxmc.equals("����"))
		{
			xcmlxbm="02";
		}
		else if (xcmlxmc.equals("����"))
		{
			xcmlxbm="03";
		}
		else if (xcmlxmc.equals("�������"))
		{
			xcmlxbm="04";
		}
		else if (xcmlxmc.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[�Ͳ�������]����Ϊ��");
			return;
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[�Ͳ�������]ֻ���ǡ������š����ܡ�������������š�֮һ��¼��Ϊ��"+xcmlxmc);
			return;
		}

		if (bklxxh.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[�߿�ϵ���ͺ�]����Ϊ��");
			return;
		}
		if (mbcl.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[������]����Ϊ��");
			return;
		}

		if (jjfsStr.equals("ƽ�׵���"))//1��ƽ�׵��ۡ�2��ƽ�׵��ۼӷ�����׵���
		{
			jjfs="1";
		}
		else if (jjfsStr.equals("ƽ�׵��ۼӷ�����׵���"))
		{
			jjfs="2";
		}
		else if (jjfsStr.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����[�Ƽ۷�ʽ]����Ϊ��");
			return;
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[�Ƽ۷�ʽ]ֻ���ǡ�ƽ�׵��ۡ�ƽ�׵��ۼӷ�����׵��ۡ�֮һ��¼��Ϊ��"+jjfsStr);
			return;
		}

		//ƽ�׵���
		pmdj=0;
		if (pmdjStr!=null && !pmdjStr.trim().equals(""))
		{
			try{
				pmdj=Double.parseDouble(pmdjStr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[ƽ�׵���]�����֣�" + pmdjStr);
				return;
			}
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[ƽ�׵���]����Ϊ��");
			return;
		}

		if (pmdj==0)
		{
			out.println("<BR>���������["+xuhao+"]����[ƽ�׵���]����Ϊ0");
			return;
		}

		//���׵���
		ymdj=0;
		if (ymdjStr!=null && !ymdjStr.trim().equals(""))
		{
			try{
				ymdj=Double.parseDouble(ymdjStr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[���׵���]�����֣�" + ymdjStr);
				return;
			}
		}

		if (jjfs.equals("1"))//1��ƽ�׵��ۣ�2��ƽ�׵��ۣ�������׵���
		{
			if (ymdj!=0)
			{
				out.println("<BR>���������["+xuhao+"]����ֻ��ƽ�׼Ƽۣ�[���׵���]����Ϊ0��¼��Ϊ��"+ymdj);
				return;
			}
		}
		else{
			if (ymdj==0)
			{
				out.println("<BR>���������["+xuhao+"]���󣬼Ƽ۰�ƽ�׵��ۣ�������׵��ۣ�[���׵���]����Ϊ0��¼��Ϊ��"+ymdj);
				return;
			}
		}

		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		  <td><%=xuhao%> 
			<input name="xuhao" type="hidden" value="<%=xuhao%>">
		  </td>
		  <td><%=xcmlxmc%> 
			<input name="xcmlxbm" type="hidden" value="<%=xcmlxbm%>">
		  </td>
		  <td><%=bklxxh%>
			<input name="bklxxh" type="hidden" value="<%=bklxxh%>" >
		  </td>
		  <td><%=mbcl%>
			<input name="mbcl" type="hidden" value="<%=mbcl%>" >
		  </td>
		  <td><%=xbpz%>
			<input name="xbpz" type="hidden" value="<%=xbpz%>" >
		  </td>
		  <td><%=zsxt%>
			<input name="zsxt" type="hidden" value="<%=zsxt%>" >
		  </td>
		  <td><%=jjfsStr%>
			<input name="jjfs" type="hidden" value="<%=jjfs%>" >
		  </td>
		  <td><%=pmdj%>
			<input name="pmdj" type="hidden" value="<%=pmdj%>" >
		  </td>
		  <td><%=ymdjStr%>
			<input name="ymdj" type="hidden" value="<%=ymdj%>" >
		  </td>
		  <td ><%=zpmc%>
			<input name="zpmc" type="hidden" value="<%=zpmc%>" >
		  </td>
		  <td align="left"><%=bz%>
			<input name="bz" type="hidden" value="<%=bz%>" >
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
