<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���̽�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int count=0;

String xuhao=null;
String hth=null;
String jjgw=null;
String khxm=null;
String jskstr=null;
double jsk=0;
double alljsk=0;
String sskstr=null;
double ssk=0;
double allssk=0;
String ml=null;
String mll=null;
String bz=null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	kmdm = up.getParameter("kmdm");
	fgsbh = up.getParameter("fgsbh");

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
<form method="post" action="SaveChooseCsFile.jsp" name="editform" target="_blank">
  <div align="center"><b>���̽������루��Ŀ���룺<%=kmdm%>�� <BR>
    ��ע�⣺���ݴӵ�2�п�ʼ��[������]��2�У�[ʵ�տ�]��5�У�</b></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="14"> 
        <input name="kmdm" type="hidden" value="<%=kmdm%>">
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
        <input type="button"  value="תΪƾ֤" name="bc" onClick="f_do(editform)">
        <input type="button"  value="����ת��" onClick="bc.disabled=false;bc1.disabled=false;">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="5%">���</td>
      <td width="10%" bgcolor="#FFCCFF">������</td>
      <td width="10%">���Ϲ���</td>
	  <td width="12%">�ͻ�����</td>
      <td width="10%" bgcolor="#FFCCFF">ʵ�տ�</td>
      <td width="10%">�����</td>
      <td width="10%">ë��</td>
      <td width="8%">ë����</td>
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

		xuhao=outStr[i][0];
		hth=outStr[i][1];
		jjgw=outStr[i][2];
		khxm=outStr[i][3];
		sskstr=outStr[i][4];
		jskstr=outStr[i][5];
		ml=outStr[i][6];
		mll=outStr[i][7];

		//������
		if (hth!=null && !hth.equals(""))
		{
			hth=hth.trim();

			sql=" select count(*)" ;
			sql+=" from crm_khxx " ;
			sql+=" where hth='"+hth+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count==0)
			{
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[������]��"+hth);
				return;
			}
		}
		else{
			out.println("�����ѣ����["+row+"]��[������]Ϊ�գ��������ݱ�����");
			break;
		}


		//ʵ�տ�
		ssk=0;
		if (sskstr!=null && !sskstr.trim().equals(""))
		{
			try{
				ssk=Double.parseDouble(sskstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[ʵ�տ�]�����֣�" + sskstr);
				return;
			}
		}

		allssk+=ssk;

		//�����
		jsk=0;
		if (jskstr!=null && !jskstr.trim().equals(""))
		{
			try{
				jsk=Double.parseDouble(jskstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�����]�����֣�" + jskstr);
				return;
			}
		}

		alljsk+=jsk;
%> 
	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xuhao%></td>
      <td bgcolor="#FFCCFF"><%=hth%> 
        <input name="hth" type="hidden" value="<%=hth%>">
      </td>
      <td><%=jjgw%></td>
      <td><%=khxm%></td>
      <td bgcolor="#FFCCFF"><%=ssk%>
        <input name="ssk" type="hidden" value="<%=ssk%>">
	  </td>
      <td><%=jskstr%>
        <input name="jsk" type="hidden" value="<%=jsk%>">
	  </td>
      <td><%=ml%></td>
      <td><%=mll%></td>
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
      <td colspan="2">�� ��</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=allssk%></td>
      <td><%=alljsk%></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="14"> 
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
