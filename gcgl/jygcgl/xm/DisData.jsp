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
String xmdlmc=null;
String xmdlbm=null;
String xmxlmc=null;
String xmxlbm=null;

String xmbm=null;
String xmmc=null;
String wgjbbm=null;
String wgjbmc=null;

String xzzwbm=null;
String zgyq=null;


String bz=null;



String ygkfStr=null;
double ygkf=0;

String ygfkjeStr=null;
double ygfkje=0;

String sgdfkjeStr=null;
double sgdfkje=0;

String sgdkfStr=null;
double sgdkf=0;



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
<div align="center">���뾫�湤����Ŀ</div>
  <table width="110%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="8%">��Ŀ����</td>
		<td width="8%">��ĿС��</td>
		<td width="6%">��Ŀ���</td>
		<td width="12%">��Ŀ����</td>
		<td width="6%">Υ�漶��</td>
		<td width="9%">����Ҫ��</td>
		<td width="8%">������Աְ��</td>

		<td width="6%">Ա��������</td>
		<td width="6%">Ա���۷�</td>
		<td width="6%">ʩ���ӷ�����</td>
		<td width="6%">ʩ���ӿ۷�</td>
		<td width="57%">��ע</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xmbmStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("����!��"+i+"��[����]Ϊ��,����������Զ�������");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<12)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		xmdlmc=outStr[i][0].trim();
		xmxlmc=outStr[i][1].trim();

		xmbm=outStr[i][2].trim();
		xmmc=outStr[i][3].trim();

		wgjbmc=outStr[i][4].trim();
		zgyq=outStr[i][5].trim();
		xzzwbm=outStr[i][6].trim();


		ygfkjeStr=outStr[i][7].trim();
		ygkfStr=outStr[i][8].trim();
		sgdfkjeStr=outStr[i][9].trim();
		sgdkfStr=outStr[i][10].trim();
		bz=outStr[i][11].trim();


		if (xmbm.equals(""))
		{
			out.println("�������к�["+row+"]������Ŀ���Ϊ��");
			return;
		}



		sql=" select xmdlbm" ;
		sql+=" from gdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("��������Ŀ���["+xmbm+"]���󣬲����ڵ�[��Ŀ����]��"+xmdlbm);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from gdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlmc+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("��������Ŀ���["+xmbm+"]���󣬲����ڵ�[��ĿС��]��"+xmxlbm);
			return;
		}
		rs.close();
		ps.close();

		if (!zgyq.equals(""))
		{
			sql=" select zgyq" ;
			sql+=" from gdm_zgyq " ;
			sql+=" where zgyq='"+zgyq+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				zgyq = rs.getString("zgyq");			    
			}
			else{
				out.println("��������Ŀ���["+xmbm+"]���󣬲����ڵ�[����Ҫ��]��"+zgyq);
				return;
			}
			rs.close();
			ps.close();
		}


		if (wgjbmc.equals(""))
		{
			out.println("��������Ŀ���["+xmbm+"]����[Υ�漶��]Ϊ��");
			return;
		}
		else{
			sql=" select wgjbbm" ;
			sql+=" from gdm_wgjbbm " ;
			sql+=" where wgjbmc='"+wgjbmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				wgjbbm = rs.getString(1);			    
			}
			rs.close();
			ps.close();

			if (wgjbbm==null || wgjbbm.equals(""))
			{
				out.println("��������Ŀ���["+xmbm+"]���󣬲����ڵ�[Υ�漶��]��"+wgjbmc);
				return;
			}
		}

		if (xzzwbm.equals(""))
		{
			out.println("��������Ŀ���["+xmbm+"]����[������Աְ��]Ϊ��");
			return;
		}
		else{
			int count=0;
			sql=" select count(*)" ;
			sql+=" from gdm_cfry " ;
			sql+=" where xzzwbm='"+xzzwbm+"' and wgjbbm='"+wgjbbm+"'" ;
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
				out.println("��������Ŀ���["+xmbm+"]���󣬲����ڵ�[������Աְ��]��"+xzzwbm);
//				return;
			}
		}


		if (ygkfStr.equals(""))
		{
			ygkf=0;
		}
		else{
			try{
				ygkf=Double.parseDouble(ygkfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>����������[Ա���۷�:"+ygkfStr+"]��������:"+e);
				return;
			}
		}



		if (ygfkjeStr.equals(""))
		{
			ygfkje=0;
		}
		else{
			try{
				ygfkje=Double.parseDouble(ygfkjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>����������[Ա��������:"+ygfkjeStr+"]��������:"+e);
				return;
			}
		}


		if (sgdkfStr.equals(""))
		{
			sgdkf=0;
		}
		else{
			try{
				sgdkf=Double.parseDouble(sgdkfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>����������[ʩ���ӿ۷�:"+sgdkfStr+"]��������:"+e);
				return;
			}
		}

		if (sgdfkjeStr.equals(""))
		{
			sgdfkje=0;
		}
		else{
			try{
				sgdfkje=Double.parseDouble(sgdfkjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>����������[ʩ���ӷ�����:"+sgdfkjeStr+"]��������:"+e);
				return;
			}
		}


		%> 



	  <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xmdlmc%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=xmxlmc%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=xmbm%>
        <input name="xmbm" type="hidden" value="<%=xmbm%>" >
      </td>
	  <td align="center"> <%=xmmc%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
	  <td align="center"> <%=wgjbmc%>
        <input name="wgjbbm" type="hidden" value="<%=wgjbbm%>" >
      </td>
      <td> <%=zgyq%>
        <input name="zgyq" type="hidden" value="<%=zgyq%>" >
      </td>
      <td> <%=xzzwbm%>
        <input name="xzzwbm" type="hidden" value="<%=xzzwbm%>" >
      </td>
      <td> <%=ygfkjeStr%>
        <input name="ygfkje" type="hidden" value="<%=ygfkje%>" >
      </td>
        <td> <%=ygkfStr%>
        <input name="ygkf" type="hidden" value="<%=ygkf%>" >
      </td>
    <td> <%=sgdfkjeStr%>
        <input name="sgdfkje" type="hidden" value="<%=sgdfkje%>" >
      </td>
      <td> <%=sgdkfStr%>
        <input name="sgdkf" type="hidden" value="<%=sgdkf%>" >
      </td>
      <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
      ��������Ŀ����<%=row%>
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
