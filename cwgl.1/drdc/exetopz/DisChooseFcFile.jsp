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
String khxm=null;
String sgd=null;
String sgdmc=null;
String jskstr=null;
double jsk=0;
double alljsk=0;

int errorMark=0;

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
<form method="post" action="SaveChooseFcFile.jsp" name="editform" target="_blank">
  <div align="center"><b>����תƾ֤�����루��Ŀ���룺<%=kmdm%>�� <BR>
    ��ע�⣺���ݴӵ�2�п�ʼ��[������]��2�У�[���Ϸ�]��6�У�</b></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="6"> 
        <input name="kmdm" type="hidden" value="<%=kmdm%>">
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
        <input type="button"  value="תΪƾ֤" name="bc" onClick="f_do(editform)">
        <input type="button"  value="����ת��" onClick="bc.disabled=false;bc1.disabled=false;">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="5%">���</td>
      <td width="10%" bgcolor="#FFCCFF">������</td>
	  <td width="12%">�ͻ�����</td>
      <td width="10%">�������</td>
      <td width="10%">������</td>
      <td width="10%" bgcolor="#FFCCFF">���Ϸ�</td>
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
		hth=outStr[i][1].trim();
		khxm=outStr[i][2].trim();
		sgd=outStr[i][3].trim();
		sgdmc=outStr[i][4].trim();
		jskstr=outStr[i][5].trim();

		String lskhxm="";
		String lssgd="";
		String lssgdmc="";

		//������
		if (hth!=null && !hth.equals(""))
		{
			hth=hth.trim();

			
			sql=" select khxm,crm_khxx.sgd,sgdmc" ;
			sql+=" from crm_khxx,sq_sgd " ;
			sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.hth='"+hth+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				lskhxm = rs.getString("khxm");			    
				lssgd = rs.getString("sgd");			    
				lssgdmc = rs.getString("sgdmc");			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>���������["+xuhao+"]���󣬲����ڵ�[������]��"+hth);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			out.println("�����ѣ����["+xuhao+"]��[������]Ϊ�գ��������ݱ�����");
			break;
		}

		if (!lskhxm.equals(khxm))
		{
			out.println("<BR>���������["+xuhao+"]��[�ͻ�������"+khxm+"]��ϵͳ�е�[�ͻ�������"+lskhxm+"]��һ��");
			errorMark=1;
//			return;
		}
		if (!lssgd.equals(sgd))
		{
			out.println("<BR>���������["+xuhao+"]��[������ţ�"+sgd+"]��ϵͳ�е�[������ţ�"+lssgd+"]��һ��");
			errorMark=1;
//			return;
		}
		if (!lssgdmc.equals(sgdmc))
		{
			out.println("<BR>���������["+xuhao+"]��[��������"+sgdmc+"]��ϵͳ�е�[��������"+lssgdmc+"]��һ��");
			errorMark=1;
//			return;
		}


		//ʵ�տ�
		jsk=0;
		if (jskstr!=null && !jskstr.trim().equals(""))
		{
			try{
				jsk=Double.parseDouble(jskstr.trim());
			}
			catch (Exception e) {
				out.print("���["+xuhao+"]����[���Ϸ�]�����֣�" + jskstr);
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
      <td><%=khxm%></td>
      <td><%=sgd%></td>
      <td><%=sgdmc%></td>
      <td bgcolor="#FFCCFF"><%=jsk%>
        <input name="jsk" type="hidden" value="<%=jsk%>">
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
      <td colspan="2">�� ��</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=alljsk%></td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="6"> 
        <input type="hidden"  value="<%=errorMark%>" name="errorMark" >
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
