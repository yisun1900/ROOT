<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����µļҾ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String jjpjflbm=null;
String jjpjflmc=null;
String gtpjmc=null;
String xinghao=null;
String guige=null;
String jldwmc=null;
String djStr=null;
String bz=null;
String jldwbmstr=null;


String jldwbm="";
double dj=0;

int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

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
<form method="post" action="SaveImpAddDataJjpj.jsp" name="editform" >
  <div align="center">�����µļҾ��������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">���</td>
	<td  width="9%">�������</td>
	<td  width="14%">�������</td>
	<td  width="18%">�ͺ�</td>
	<td  width="12%">���</td>
	<td  width="7%">������λ</td>
	<td  width="7%">����</td>
	<td  width="29%">��ע</td>
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
		jjpjflmc=outStr[i][1].trim();
		gtpjmc=outStr[i][2].trim();
		xinghao=outStr[i][3].trim();
		guige=outStr[i][4].trim();
		jldwmc=outStr[i][5].trim();
		djStr=outStr[i][6].trim();
		bz=outStr[i][7].trim();

		if (gtpjmc.equals(""))
		{
			out.println("<BR>���������["+xuhao+"]����������Ʋ���Ϊ��");
			return;
		}

		//�������
		jjpjflbm="";
		if (jjpjflmc!=null && !jjpjflmc.equals(""))
		{
			sql=" select jjpjflbm" ;
			sql+=" from jdm_jjpjflbm " ;
			sql+=" where jjpjflmc='"+jjpjflmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jjpjflbm = rs.getString(1);			    
			}
			else
			{
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[�������]��"+jjpjflmc);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[�������]����Ϊ��");
			return;
		}

		//������λ
		jldwbm="";
		if (jldwmc!=null && !jldwmc.equals(""))
		{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString(1);			    
			}
			else
			{
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[������λ]��"+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			out.println("<BR>���������["+xuhao+"]����[������λ]����Ϊ��");
			return;
		}

		//������
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
      <td><%=jjpjflmc%>
        <input name="jjpjflbm" type="hidden" value="<%=jjpjflbm%>" >
      </td>
      <td><%=gtpjmc%>
        <input name="gtpjmc" type="hidden" value="<%=gtpjmc%>" >
      </td>
	  <td ><%=xinghao%>
        <input name="xinghao" type="hidden" value="<%=xinghao%>" >
      </td>
      <td><%=guige%>
        <input name="guige" type="hidden" value="<%=guige%>" >
      </td>
	  <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
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
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	outStr=null; 
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
