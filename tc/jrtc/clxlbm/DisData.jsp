<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������� </title>
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

String dwbh=null;
String fgsmc=null;
String clxlbm=null;
String clxlmc=null;
String bzlyblStr=null;
String lyblxxStr=null;
String lyblsxStr=null;

String mark=null;

double bzlybl=0;
double lyblxx=0;
double lyblsx=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();


	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">���븨�����ñ���</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%">�ֹ�˾</td>
      <td width="5%">����С��</td>
	  <td width="4%">��׼���ñ���</td>
      <td width="9%">���ñ�������</td>
      <td width="4%">���ñ�������</td>

    </tr>

	<%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] bzlyblStrStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<5)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		fgsmc=outStr[i][0].trim();
		clxlmc=outStr[i][1].trim();
		bzlyblStr=outStr[i][2].trim();
		lyblxxStr=outStr[i][3].trim();
		lyblsxStr=outStr[i][4].trim();


		mark="";

		if (bzlyblStr.equals(""))
		{
			out.println("�������к�["+row+"]�����ڲ�����Ϊ��");
			return;
		}

		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+fgsmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dwbh = rs.getString(1);			    
		}
		else{
			out.println("���������["+i+"]���󣬲����ڵ�[�ֹ�˾]��"+fgsmc);
			return;
		}
		rs.close();
		ps.close();


		sql=" select clxlbm" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clxlbm = rs.getString(1);			    
		}
		else{
			out.println("���������["+i+"]���󣬲����ڵ�[����С��]��"+clxlmc);
			return;
		}
		rs.close();
		ps.close();


		if (bzlyblStr.equals(""))
		{
			bzlybl=0;
		}
		else{
			try{
				bzlybl=Double.parseDouble(bzlyblStr.trim());
			}
			catch (Exception e){
				out.println("<BR>���������["+i+"]����[��׼���ñ���:"+bzlyblStr+"]��������:"+e);
				return;
			}
		}
		if (lyblxxStr.equals(""))
		{
			lyblxx=0;
		}
		else{
			try{
				lyblxx=Double.parseDouble(lyblxxStr.trim());
			}
			catch (Exception e){
				out.println("<BR>���������["+i+"]����[���ñ�������:"+lyblxxStr+"]��������:"+e);
				return;
			}
		}

		if (lyblsxStr.equals(""))
		{
			lyblsx=0;
		}
		else{
			try{
				lyblsx=Double.parseDouble(lyblsxStr.trim());
			}
			catch (Exception e){
				out.println("<BR>���������["+i+"]����[���ñ�������:"+lyblsxStr+"]��������:"+e);
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fgsmc%>
        <input name="dwbh" type="hidden" value="<%=dwbh%>">
      </td>
      <td><%=clxlmc%>
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>">
      </td>
      <td> <%=bzlyblStr%>
        <input name="bzlybl" type="hidden" value="<%=bzlybl%>" >
      </td>
	  <td align="center"> <%=lyblxxStr%>
        <input name="lyblxx" type="hidden" value="<%=lyblxx%>" >
      </td>
	  <td align="center"> <%=lyblsxStr%>
        <input name="lyblsx" type="hidden" value="<%=lyblsx%>" >
      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("<P>����ʧ�ܣ�Exception:" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	try{
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
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
      �赼����Ŀ����<%=row%>
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
