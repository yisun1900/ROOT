<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���̽�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String kmdm=null;
String fgsbh=null;
String fexp=null;
String fexp1=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int count=0;

String xuhao=null;
String dwmc=null;
String hth=null;
String jjgw=null;
String khxm=null;
String getkhxm=null;

String clfstr=null;
double clf=0;
double allclf=0;

String rgfstr=null;
double rgf=0;
double allrgf=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	kmdm = up.getParameter("kmdm");
	fgsbh = up.getParameter("fgsbh");
	fexp = up.getParameter("fexp");
	fexp1 = up.getParameter("fexp1");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\cwgl\\drdc\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	buffer=null;

%> 
<form method="post" action="SaveChooseJzclfFile.jsp" name="editform" target="_blank">
  <div align="center"><b>��װ���Ϸѡ��˹��ѣ����루��Ŀ���룺<%=kmdm%>�� <BR>
    ��ע�⣺���ݴӵ�2�п�ʼ��[���]��1�У�[����]��2�У�[������]��3�У�[�ͻ�����]��4�У�[�˹���]��5�У�[���Ϸ�]��6�У�</b></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="7"> 
        <input name="kmdm" type="hidden" value="<%=kmdm%>">
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
        <input name="fexp" type="hidden" value="<%=fexp%>">
        <input name="fexp1" type="hidden" value="<%=fexp1%>">
        <input type="button"  value="תΪƾ֤" name="bc" onClick="f_do(editform)">
        <input type="button"  value="����ת��" onClick="bc.disabled=false;bc1.disabled=false;">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="8%">���</td>
      <td width="15%">����</td>
      <td width="15%">������</td>
	  <td width="19%">�ͻ�����</td>
	  <td width="15%" bgcolor="#FFCCFF">ERP�ͻ�����</td>
      <td width="14%" >�˹���</td>
      <td width="14%" >���Ϸ�</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(2001,filename); 


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

/*
		if (outStr[i][0].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
*/

		dwmc=outStr[i][1];
		hth=outStr[i][2];
		khxm=outStr[i][3];
		rgfstr=outStr[i][4];
		clfstr=outStr[i][5];

		//������
		if (hth!=null && !hth.equals(""))
		{
			hth=hth.trim();

			sql=" select khxm" ;
			sql+=" from crm_khxx " ;
			sql+=" where hth='"+hth+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				getkhxm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();

				out.println("<BR>���������["+row+"]���󣬲����ڵ�[������]��"+hth);
				return;
			}
			rs.close();
			ps.close();

		}
		else{
			out.println("�����ѣ����["+row+"]��[������]Ϊ�գ��������ݱ�����");
			break;
		}


		//�˹���
		rgf=0;
		if (rgfstr!=null && !rgfstr.trim().equals(""))
		{
			try{
				rgf=Double.parseDouble(rgfstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[���]�����֣�" + rgfstr);
				return;
			}
		}

		allrgf+=rgf;

		//���Ϸ�
		clf=0;
		if (clfstr!=null && !clfstr.trim().equals(""))
		{
			try{
				clf=Double.parseDouble(clfstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[���]�����֣�" + clfstr);
				return;
			}
		}

		allclf+=clf;

%> 
	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%></td>
      <td><%=dwmc%></td>
      <td ><%=hth%> 
        <input name="hth" type="hidden" value="<%=hth%>">
      </td>
      <td><%=khxm%></td>
      <td bgcolor="#FFCCFF"><%=getkhxm%></td>
      <td><%=rgf%>
        <input name="rgf" type="hidden" value="<%=rgf%>">
	  </td>
      <td><%=clf%>
        <input name="clf" type="hidden" value="<%=clf%>">
	  </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("���["+xuhao+"]����" + e);
	return;
}
finally 
{
	try{
		if (f != null) f.close(); 
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td >�� ��</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=allrgf%></td>
      <td><%=allclf%></td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="7"> 
        <input type="button"  value="תΪƾ֤" name="bc1" onClick="f_do(editform)">
        <input type="button"  value="����ת��" onClick="bc.disabled=false;bc1.disabled=false;">
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
	FormName.bc1.disabled=true;
	return true;
}
//-->
</SCRIPT>
