<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
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

String dqbm=null;
String dqmc=null;
String wlbm=null;
String glmc=null;
String cldlbm=null;
String cldlmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String jldwmc=null;

String jswlbm=null;
String jsglmc=null;
String jsjldwbm=null;
String jsjldwmc=null;
String wljsbzstr=null;
double wljsbz=0;

String djstr=null;
double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //�õ�����

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


	String yxdqmc=null;
	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		yxdqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveDisCljg.jsp" name="editform" target="_blank">
<div align="center">
    �����������ϼ۸��
    <BR><font color="#FF0000"><b>��ע�⣺</b></font><b>����</b><font color="#FF0000"><b>[<%=yxdqmc%>]
	</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td rowspan="2" width="3%">���</td>
      <td rowspan="2" width="10%">�������</td>
      <td rowspan="2" width="8%">�������ϱ���</td>
      <td rowspan="2" width="13%">��������</td>
      <td rowspan="2" width="10%">�ͺŹ��</td>
      <td rowspan="2" width="16%">Ʒ��</td>
      <td rowspan="2" width="5%">������λ</td>
      <td rowspan="2" width="5%">����</td>
      <td colspan="4">��Ӧ�Ľ������</td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="6%">���ϱ���</td>
      <td width="14%">��������</td>
      <td width="5%">������λ</td>
      <td width="5%">�������������λ��</td>
    </tr>


	
	<%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 


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

		if (outStr[i][1].equals(""))
		{
			break;
		}

		cldlmc=outStr[i][0].trim();
		wlbm=outStr[i][1].trim();
		glmc=outStr[i][2].trim();
		xhgg=outStr[i][3].trim();
		pp=outStr[i][4].trim();
		jldwmc=outStr[i][5].trim();
		djstr=outStr[i][6].trim();
		jswlbm=outStr[i][7].trim();
		jsglmc=outStr[i][8].trim();
		jsjldwmc=outStr[i][9].trim();
		wljsbzstr=outStr[i][10].trim();

		if (wljsbzstr.equals("0") || wljsbzstr.equals("0.0"))
		{
			wljsbzstr="";
		}

		sql=" select cldlbm" ;
		sql+=" from bdm_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldlbm = rs.getString("cldlbm");			    
		}
		else{
			out.println("���������ϱ���["+wlbm+"]���󣬲����ڵ�[�������]��"+cldlmc);
			return;
		}
		rs.close();
		ps.close();


		if (wlbm.equals(""))
		{
			out.println("�������ڲ��ϱ���["+wlbm+"]����[�������ϱ���]Ϊ��");
			return;
		}

		if (glmc.equals(""))
		{
			out.println("���������ϱ���["+wlbm+"]����[��������]Ϊ��");
			return;
		}

		if (jldwmc.equals(""))
		{
			out.println("���������ϱ���["+wlbm+"]����[������λ]Ϊ��");
			return;
		}
		else{
			sql=" select cljldwbm" ;
			sql+=" from bdm_cljldwbm " ;
			sql+=" where cljldwmc='"+jldwmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("cljldwbm");			    
			}
			else{
				out.println("���������ϱ���["+wlbm+"]���󣬲����ڵ�[������λ]��"+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (djstr.trim().equals(""))
		{
			out.println("���������ϱ���["+wlbm+"]����[����]Ϊ��");
			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}



		wljsbz=0;
		jsjldwbm="";
		if (!jswlbm.equals(""))
		{
			String getjsjldwbm="";
			sql=" select jldwbm" ;
			sql+=" from bj_jscljgb " ;
			sql+=" where dqbm='"+dqbm+"' and wlbm='"+jswlbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				getjsjldwbm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();

				out.println("<BR>���ѣ����ϱ���["+wlbm+"]���������ڵ�[������ϱ���]��"+jswlbm);
				return;
			}
			rs.close();
			ps.close();


			if (jsglmc.trim().equals(""))
			{
				out.println("���������ϱ���["+wlbm+"]����[���������������]Ϊ��");
				return;
			}

			if (jsjldwmc.equals(""))
			{
				out.println("���������ϱ���["+wlbm+"]����[������ϼ�����λ]Ϊ��");
				return;
			}
			else{
				sql=" select cljldwbm" ;
				sql+=" from bdm_cljldwbm " ;
				sql+=" where cljldwmc='"+jsjldwmc.trim()+"'" ;
				ps= conn.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next())
				{         
					jsjldwbm = rs.getString("cljldwbm");			    
				}
				else{
					out.println("���������ϱ���["+wlbm+"]���󣬲����ڵ�[������ϼ�����λ]��"+jsjldwmc);
					return;
				}
				rs.close();
				ps.close();
			}

			if (!getjsjldwbm.equals(jsjldwbm))
			{
				out.println("���������ϱ���["+wlbm+"]����[������ϼ�����λ]��ERP�в���");
				return;
			}

			if (wljsbzstr.trim().equals(""))
			{
				out.println("���������ϱ���["+wlbm+"]����[�������������λ��]Ϊ��");
				return;
			}
			else{
				wljsbz=Double.parseDouble(wljsbzstr.trim());
			}
			if (wljsbz==0)
			{
				out.println("���������ϱ���["+wlbm+"]����[�������������λ��]����Ϊ0");
				return;
			}
		}
		else{
			if (!jsglmc.trim().equals(""))
			{
				out.println("���������ϱ���["+wlbm+"]����[���������������]ӦΪ��");
				return;
			}

			if (!jsjldwmc.equals(""))
			{
				out.println("���������ϱ���["+wlbm+"]����[������ϼ�����λ]ӦΪ�գ�"+jsjldwmc);
				return;
			}
			if (!wljsbzstr.trim().equals(""))
			{
				out.println("���������ϱ���["+wlbm+"]����[�������������λ��]ӦΪ�գ�"+wljsbzstr);
				return;
			}

		}




		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=cldlmc%> 
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
      </td>
      <td><%=wlbm%> 
        <input name="wlbm" type="hidden" value="<%=wlbm%>" >
      </td>
      <td><%=glmc%> 
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=xhgg%> 
        <input name="xhgg" type="hidden" value="<%=xhgg%>" >
      </td>
      <td><%=pp%> 
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=jldwmc%> 
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=dj%> 
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=jswlbm%> 
        <input name="jswlbm" type="hidden" value="<%=jswlbm%>" >
      </td>
      <td><%=jsglmc%> 
      </td>
      <td><%=jsjldwmc%> 
        <input name="jsjldwbm" type="hidden" value="<%=jsjldwbm%>" >
      </td>
      <td><%=wljsbzstr%> 
        <input name="wljsbz" type="hidden" value="<%=wljsbzstr%>" >
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
        <input type="button"  value="����" onClick="f_do(editform)" name="bc">
        <input type="reset"  value="�������" onClick="bc.disabled=false;">
        <input type="reset"  value="����">
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
