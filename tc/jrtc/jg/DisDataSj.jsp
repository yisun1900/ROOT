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

String bjbbh = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String tcsjflbm = null;
String tcsjflmc=null;
String bjjbbm=null;
String bjjbmc=null;
String bjjbbm1=null;
String bjjbmc1=null;
String jldw=null;
String sjcjStr=null;

double sjcj=0;

String sjsfycxstr=null;
String cxsjcjstr=null;
String cxkssjstr=null;
String cxjssjstr=null;

String sjsfycx=null;
double cxsjcj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjssj=null;

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

	dqbm =up.getParameter("dqbm");
	bjbbh =up.getParameter("bjbbh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadDataSj.jsp" name="editform" target="_blank">
<div align="center">
    <p>�����ײͼ۸�</p>
    <p><font color="#FF0000"><b>��ע�⣺</b></font><b>�汾��</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>��</b><b>����</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="15%">�ײ���������</td>
		<td width="10%">ԭ���ۼ���</td>
		<td width="10%">�������ۼ���</td>
		<td width="10%">������λ</td>
		<td width="10%">�������</td>
		<td  width="15%">�����Ƿ��д���</td>
		<td  width="10%">�����������</td>
		<td  width="10%">������ʼʱ��</td>
		<td  width="10%">��������ʱ��</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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
		if (len<9)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		tcsjflmc=outStr[i][0].trim();
		bjjbmc=outStr[i][1].trim();
		bjjbmc1=outStr[i][2].trim();
		jldw=outStr[i][3].trim();
		sjcjStr=outStr[i][4].trim();

		sjsfycxstr=outStr[i][5].trim();
		cxsjcjstr=outStr[i][6].trim();
		cxkssjstr=outStr[i][7].trim();
		cxjssjstr=outStr[i][8].trim();

		if (bjjbmc.equals(""))
		{
			out.println("�к�["+row+"]���󣡻���Ϊ��");
			return;
		}

		sql=" select tcsjflbm" ;
		sql+=" from bj_tcsjflbm " ;
		sql+=" where tcsjflmc='"+tcsjflmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tcsjflbm = rs.getString("tcsjflbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[�ײ���������]��"+tcsjflmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm = rs.getString("bjjbbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[ԭ���ۼ���]��"+bjjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc1+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm1 = rs.getString("bjjbbm");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[�������ۼ���]��"+bjjbmc1);
			return;
		}
		rs.close();
		ps.close();

		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("�к�["+row+"]���󣡲����ڵ�[������λ]��"+jldw);
			return;
		}
		rs.close();
		ps.close();



		if (sjcjStr.equals(""))
		{
			out.println("<BR>�к�["+row+"]����[�������]����Ϊ��");
			return;
		}
		else{
			try{
				sjcj=Double.parseDouble(sjcjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>�к�["+row+"]����[�������:"+sjcjStr+"]��������:"+e);
				return;
			}
		}

		
		//�Ƿ��д���
		sjsfycx="1";
		if (sjsfycxstr!=null && !sjsfycxstr.equals(""))
		{
			if (sjsfycxstr.equals("���������ƴ���"))
			{
				sjsfycx="2";
			}
			else if (sjsfycxstr.equals("���������ƴ���"))
			{
				sjsfycx="3";
			}
			else if (sjsfycxstr.equals("�޴���"))
			{
				sjsfycx="1";
			}
			else{
				out.println("<BR>�������к�["+row+"]����[�Ƿ��д���]ֻ���ǡ����������ƴ����������������ƴ��������޴�������"+sjsfycxstr);
				return;
			}
		}
		
		if (sjsfycx.equals("2") || sjsfycx.equals("3"))
		{
			//������
			if (cxsjcjstr==null || cxsjcjstr.trim().equals(""))
			{
				out.print("<BR>�к�["+row+"]������Ϊ�д�����[������]������");
				return;
			}
			//������ʼʱ��
			if (cxkssjstr==null || cxkssjstr.trim().equals(""))
			{
				out.print("<BR>�к�["+row+"]������Ϊ�д�����[������ʼʱ��]������");
				return;
			}
			//��������ʱ��
			if (cxjssjstr==null || cxjssjstr.trim().equals(""))
			{
				out.print("<BR>�к�["+row+"]������Ϊ�д�����[��������ʱ��]������");
				return;
			}
		}
		else{
			//������
			if (cxsjcjstr!=null && !cxsjcjstr.trim().equals("") && !cxsjcjstr.trim().equals("0"))
			{
				out.print("�к�["+row+"]������Ϊû�д�����������[������]");
				return;
			}
			//������ʼʱ��
			if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
			{
				out.print("�к�["+row+"]������Ϊû�д�����������[������ʼʱ��]");
				return;
			}
			//��������ʱ��
			if (cxjssjstr!=null && !cxjssjstr.trim().equals(""))
			{
				out.print("�к�["+row+"]������Ϊû�д�����������[��������ʱ��]");
				return;
			}
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>">
      </td>
      <td><%=bjjbmc1%>
        <input name="bjjbbm1" type="hidden" value="<%=bjjbbm1%>">
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>">
      </td>
      </td>
      <td><%=sjcj%>
        <input name="sjcj" type="hidden" value="<%=sjcj%>" >
      </td>
      <td><%=sjsfycxstr%>
        <input name="sjsfycx" type="hidden" value="<%=sjsfycx%>" >
      </td>
      <td><%=cxsjcjstr%>
        <input name="cxsjcj" type="hidden" value="<%=cxsjcjstr%>" >
      </td>
      <td><%=cxkssjstr%>
        <input name="cxkssj" type="hidden" value="<%=cxkssjstr%>" >
      </td>
      <td><%=cxjssjstr%>
        <input name="cxjssj" type="hidden" value="<%=cxjssjstr%>" >
      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
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
        <input type="button" name="bc" value="����" onClick="f_do(editform)">
        <input type="reset"  value="����" onClick="bc.disabled=false">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
