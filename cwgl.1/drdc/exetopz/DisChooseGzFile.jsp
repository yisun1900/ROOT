<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���ʵ�������</title>
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
String fexp=null;
String blxs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int count=0;

String xuhao=null;
String yhmc=null;
String dwmc=null;
String hth=null;
String khxm=null;
String qye=null;
String jzss=null;
String jjss=null;
String yfhj=null;
String hjsfstr=null;
double hjsf=0;
double allhjsf=0;
String bz=null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	kmdm = up.getParameter("kmdm");
	fgsbh = up.getParameter("fgsbh");
	fexp = up.getParameter("fexp");
	blxs = up.getParameter("blxs");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\cwgl\\drdc\\impdata\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

%> 
<form method="post" action="SaveChooseCzFile.jsp" name="editform" target="_blank">
<div align="center">���ʵ������루��Ŀ���룺<%=kmdm%>��
<BR>��ע�⣺���ݴӵ�2�п�ʼ��[������]��2�У�[���]��3�У�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="14"> 
        <input name="kmdm" type="hidden" value="<%=kmdm%>">
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
        <input name="fexp" type="hidden" value="<%=fexp%>">
        <input name="blxs" type="hidden" value="<%=blxs%>">
        <input type="button"  value="תΪƾ֤" name="bc" onClick="f_do(editform)">
        <input type="button"  value="����ת��" onClick="bc.disabled=false;bc1.disabled=false;">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="5%">˳���</td>
	  <td width="5%">Excel���</td>
      <td width="9%" bgcolor="#FFCCFF">������</td>
      <td width="12%" bgcolor="#FFCCFF">���</td>
      <td width="8%" bgcolor="#FFCCFF">Ա������</td>
      <td width="14%">����</td>
      <td width="8%">�ͻ���</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(2001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
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
		hjsfstr=outStr[i][2];
		yhmc=outStr[i][3];
		dwmc=outStr[i][4];
		khxm=outStr[i][9];
//		qye=outStr[i][10];
//		jzss=outStr[i][11];
//		jjss=outStr[i][12];
//		yfhj=outStr[i][30];
//		bz=outStr[i][37];

		//������
		if (hth!=null && !hth.equals(""))
		{
			row++;
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
		else
		{
			continue;
//			out.println("<BR>���������["+xuhao+"]����[������]����Ϊ��");
//			return;
		}


		//�ϼ�ʵ��
		hjsf=0;
		if (hjsfstr!=null && !hjsfstr.trim().equals(""))
		{
			try{
				hjsf=Double.parseDouble(hjsfstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[�ϼ�ʵ��]�����֣�" + hjsfstr);
				return;
			}
		}

		hjsf=cf.round(hjsf,Integer.parseInt(blxs));

		allhjsf+=hjsf;
%> 

	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%></td>
      <td><%=xuhao%></td>
      <td bgcolor="#FFCCFF"><%=hth%> 
        <input name="hth" type="hidden" value="<%=hth%>">
      </td>
      <td bgcolor="#FFCCFF"><%=hjsf%>
        <input name="hjsf" type="hidden" value="<%=hjsf%>">
	  </td>
      <td bgcolor="#FFCCFF"><%=yhmc%></td>
      <td><%=dwmc%></td>
      <td><%=khxm%></td>
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
      <td colspan="3">�� ��</td>
      <td><%=allhjsf%></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="11"> 
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
