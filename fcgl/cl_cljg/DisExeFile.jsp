<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���¸��ļ۸�</title>
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


int row=0;

int count=0;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveDisExeFile.jsp" name="editform" target="_blank">
  <div align="center">���¸��ļ۸�<b>ע�⣺<font color="#FF0000">��ɫ</font>������ϱ��벻����</b>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">�к�</td>
      <td width="15%">�ֹ�˾</td>
      <td width="8%">���ϱ���</td>
      <td width="25%">��������</td>
      <td width="8%">�볧�ҽ����</td>
      <td width="8%">�ֹ�˾���ϵ���</td>
      <td width="8%">���Ӽ�</td>
      <td width="17%">�ֿ�����</td>
      <td width="6%">�Ƿ����</td>
    </tr>

    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(10000,filename); 


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
			out.println("����!��"+row+"��[����]Ϊ��,����������Զ�������");
			break;
		}

		String fgsmc=null;
		String clbm=null;
		String clmc=null;
		String cjjsjstr=null;
		String fgsdjstr=null;
		String gdjstr=null;
		String ckmc=null;
		String sfrkstr=null;

		fgsmc=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();

		cjjsjstr=outStr[i][3].trim();
		fgsdjstr=outStr[i][4].trim();
		gdjstr=outStr[i][5].trim();
		ckmc=outStr[i][6].trim();
		sfrkstr=outStr[i][7].trim();


		if (fgsmc.equals(""))
		{
			out.println("<BR>�������к�["+row+"]���󣬷ֹ�˾����Ϊ��");
			return;
		}
		if (clbm.equals(""))
		{
			out.println("<BR>�������к�["+row+"]���󣬲��ϱ��벻��Ϊ��");
			return;
		}


		String fgsbh=null;
		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+fgsmc+"' and dwlx='F0'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			fgsbh = rs.getString("dwbh");			    
		}
		else{
			rs.close();
			ps.close();

			out.println("<BR>�������к�["+row+"]���󣬲����ڵ�[�ֹ�˾]����"+fgsmc+"��");
			return;
		}
		rs.close();
		ps.close();


		//�볧�ҽ����
		double cjjsj=0;
		if (cjjsjstr!=null && !cjjsjstr.trim().equals(""))
		{
			try{
				cjjsj=Double.parseDouble(cjjsjstr.trim());
			}
			catch (Exception e) {
				out.print("�к�["+row+"]����[�볧�ҽ����]�����֣�" + cjjsjstr);
				return;
			}
		}
		//�ֹ�˾���ϵ���
		double fgsdj=0;
		if (fgsdjstr!=null && !fgsdjstr.trim().equals(""))
		{
			try{
				fgsdj=Double.parseDouble(fgsdjstr.trim());
			}
			catch (Exception e) {
				out.print("�к�["+row+"]����[�ֹ�˾���ϵ���]�����֣�" + fgsdjstr);
				return;
			}
		}
		//���Ӽ�
		double gdj=0;
		if (gdjstr!=null && !gdjstr.trim().equals(""))
		{
			try{
				gdj=Double.parseDouble(gdjstr.trim());
			}
			catch (Exception e) {
				out.print("�к�["+row+"]����[���Ӽ�]�����֣�" + gdjstr);
				return;
			}
		}



		//�Ƿ����
		String sfrk="N";
		if (sfrkstr!=null && !sfrkstr.equals(""))
		{
			if (sfrkstr.equals("��"))
			{
				sfrk="Y";
			}
			else if (sfrkstr.equals("��"))
			{
				sfrk="N";
			}
			else{
				out.println("<BR>�������к�["+row+"]����[�Ƿ����]ֻ���ǡ��ǡ��򡾷񡿣�"+sfrkstr);
				return;
			}
		}

		sql=" select count(*)" ;
		sql+=" from cl_jgmx " ;
		sql+=" where dwbh='"+fgsbh+"' and clbm='"+clbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			bgcolor="#FF0000";
		}
		else{
			bgcolor="#FFFFFF";
		}
%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%></td>
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
      </td>
      
      <td><%=clbm%>
        <input name="clbm" type="hidden" value="<%=clbm%>" >
      </td>
       <td><%=clmc%> 
      </td>
     <td><%=cjjsj%>
        <input name="cjjsj" type="hidden" value="<%=cjjsj%>" >
      </td>
      <td><%=fgsdj%>
        <input name="fgsdj" type="hidden" value="<%=fgsdj%>" >
      </td>
	  <td ><%=gdj%>
        <input name="gdj" type="hidden" value="<%=gdj%>" >
      </td>
      <td><%=ckmc%>
        <input name="ckmc" type="hidden" value="<%=ckmc%>" >
      </td>
	  <td><%=sfrkstr%>
        <input name="sfrk" type="hidden" value="<%=sfrk%>" >
      </td>

    </tr>
    <%
	}

	rwe=null;
}
catch (Exception e) {
	out.print("�к�["+row+"]����" + e);
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
        <input type="button"  value="���´���" name="bc2" onClick="bc.disabled=false">
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
