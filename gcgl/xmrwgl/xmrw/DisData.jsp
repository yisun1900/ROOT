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

String jjrksg = null;
String khbh = null;
String khxm = null;


String[][] outStr=null; 
String bgcolor=null;

String rwxh=null;
String rwbm=null;
String rwmc=null;
String jhkssj=null;
String jhjssj=null;
String jhgzr=null;

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

	khbh =up.getParameter("khbh");
	jjrksg =up.getParameter("jjrksg");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select khxm" ;
	sql+=" from crm_khxx " ;
	sql+=" where khbh='"+khbh+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		khxm = rs.getString("khxm");			    
	}
	else{
		out.println("���󣡿ͻ�������");
		return;
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>������Ŀ�ƻ����ͻ���<font color="#FF0000"><b><%=khxm%></b></font>��</p>
  </div>
	<input type="hidden" name="jjrksg" value="<%=jjrksg%>">
	<input type="hidden" name="khbh" value="<%=khbh%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="6%">�������</td>
      <td width="54%">��������</td>
      <td width="15%">�ƻ���ʼʱ��</td>
      <td width="15%">�ƻ�����ʱ��</td>
      <td width="10%">�ƻ�����</td>
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

		row++;

		int len=outStr[i].length;
		if (len<3)
		{
			out.println("�����������°�Excelģ��");
			return;
		}

		rwxh=outStr[i][0].trim();
		rwmc=outStr[i][1].trim();
		jhkssj=outStr[i][2].trim();
		jhjssj=outStr[i][3].trim();
		jhgzr=outStr[i][4].trim();

		if (rwmc.equals(""))
		{
			out.println("�������к�["+i+"]����[��������]Ϊ��");
			return;
		}

		if (rwxh.equals(""))
		{
			out.println("<BR>�к�["+i+"]����[�������]����Ϊ��");
			return;
		}
		else{
			try
			{
				Integer.parseInt(rwxh.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>�к�["+i+"]����[�������]������������:" +rwxh);
				return;
			}
		}

		if (jhgzr.equals(""))//�ƻ�����Ϊ��
		{
			if (jhkssj.equals(""))//��ʼʱ��Ϊ��
			{
				out.println("<BR>�к�["+i+"]����[�ƻ���ʼʱ��]��[�ƻ�����]����ͬʱΪ��");
				return;
			}
			else{//��ʼʱ�䲻Ϊ��
				if (jhjssj.equals(""))//����ʱ��Ϊ��
				{
					out.println("<BR>�к�["+i+"]����[�ƻ�����ʱ��]��[�ƻ�����]����ͬʱΪ��");
					return;
				}
				else{//����ʱ�䲻Ϊ��,����[�ƻ���ʼʱ��]��[�ƻ�����ʱ��]�Զ�����[�ƻ�����]
					sql="select count(*)";
					sql+=" from  dm_gzrl";
					sql+=" where rq>=TO_DATE('"+jhkssj+"','YYYY-MM-DD') and rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2�����ղ���ʩ��
					{
						sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
					}
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						jhgzr=rs.getString(1);
					}
					rs.close();
					ps.close();
				}
			}

		}
		else{//�ƻ����ղ�Ϊ��
			try
			{
				Integer.parseInt(jhgzr.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>�к�["+i+"]����[�ƻ�����]������������:" +jhgzr);
				return;
			}

			if (jhkssj.equals(""))//��ʼʱ��Ϊ��
			{
				if (jhjssj.equals(""))
				{
					out.println("<BR>�к�["+i+"]����[�ƻ�����ʱ��]��[�ƻ���ʼʱ��]����ͬʱΪ��");
					return;
				}
				else{//���ݽ���ʱ���Զ�ȡ��ʼʱ��
					try{
						java.sql.Date.valueOf(jhjssj.trim());
					}
					catch (Exception e){
						out.println("<BR>�к�["+i+"]����[�ƻ�����ʱ��]������������:"+jhjssj);
						return;
					}

					sql="select rq";

					sql+=" from (";

					sql+=" select rq";
					sql+=" from  dm_gzrl";
					sql+=" where rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2�����ղ���ʩ��
					{
						sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
					}
					sql+=" order by rq desc";

					sql+=" )";

					sql+=" where rownum<="+jhgzr;
					sql+=" order by rq";
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						jhkssj=cf.fillNull(rs.getDate(1));
					}
					rs.close();
					ps.close();
				}
			}
			else{//��ʼʱ�䲻Ϊ��
				try{
					java.sql.Date.valueOf(jhkssj.trim());
				}
				catch (Exception e){
					out.println("<BR>�к�["+i+"]����[�ƻ���ʼʱ��]������������:"+jhkssj);
					return;
				}

				if (!jhjssj.equals(""))//������Ϊ�գ���鹤���Ƿ���ȷ
				{
					try{
						java.sql.Date.valueOf(jhjssj.trim());
					}
					catch (Exception e){
						out.println("<BR>�к�["+i+"]����[�ƻ�����ʱ��]������������:"+jhjssj);
						return;
					}

					String day=null;
					sql="select count(*)";
					sql+=" from  dm_gzrl";
					sql+=" where rq>=TO_DATE('"+jhkssj+"','YYYY-MM-DD') and rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2�����ղ���ʩ��
					{
						sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
					}
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						day=rs.getString(1);
					}
					rs.close();
					ps.close();

					if (!day.equals(jhgzr))
					{
						out.println("<BR>����["+i+"]����[�ƻ�����]����ȷ��ӦΪ��"+day);
						return;
					}
				}
				else{//����ʱ��Ϊ�գ����ݿ�ʼʱ���Զ�ȡ����ʱ��
					sql="select rq";

					sql+=" from (";

					sql+=" select rq";
					sql+=" from  dm_gzrl";
					sql+=" where rq>=TO_DATE('"+jhkssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2�����ղ���ʩ��
					{
						sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
					}
					sql+=" order by rq";

					sql+=" )";

					sql+=" where rownum<="+jhgzr;
					sql+=" order by rq desc";
				//	out.println(sql);
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						jhjssj=cf.fillNull(rs.getDate(1));
					}
					rs.close();
					ps.close();
				}
			}
		}




		sql=" select rwbm" ;
		sql+=" from dm_bzrwbm " ;
		sql+=" where rwmc='"+rwmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			rwbm = rs.getString("rwbm");			    
		}
		else{
			out.println("���������["+i+"]���󣬲����ڵ�[��������]��"+rwmc);
			return;
		}
		rs.close();
		ps.close();


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=rwxh%> 
        <input name="rwxh" type="hidden" value="<%=rwxh%>">
      </td>
      <td align="left">��������룺<%=rwbm%>��<%=rwmc%>
        <input name="rwbm" type="hidden" value="<%=rwbm%>">
        <input name="rwmc" type="hidden" value="<%=rwmc%>">
      </td>
      <td><%=jhkssj%> 
        <input name="jhkssj" type="hidden" value="<%=jhkssj%>">
      </td>
      <td> <%=jhjssj%>
        <input name="jhjssj" type="hidden" value="<%=jhjssj%>" >
      </td>
	  <td align="center"> <%=jhgzr%>
        <input name="jhgzr" type="hidden" value="<%=jhgzr%>" >
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
      ����������<%=row%>
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
