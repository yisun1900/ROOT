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
String wlllbz=null;
String wlllbzmc=null;
String wlbm=null;
String glmc=null;
String cldlbm=null;
String cldlmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String jldwmc=null;

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
    �������-���ϼ۸��
    <BR><font color="#FF0000"><b>��ע�⣺</b></font><b>����</b><font color="#FF0000"><b>[<%=yxdqmc%>]
	</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="5%">�赽��������</td>
		<td width="16%">�������</td>
		<td width="8%">�������ϱ���</td>
		<td width="20%">��������</td>
		<td width="17%">�ͺŹ��</td>
		<td width="18%">Ʒ��</td>
		<td width="8%">������λ</td>
		<td width="8%">����</td>
    </tr>
    <%
	//���ļ�
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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

		if (outStr[i][2].equals(""))
		{
			break;
		}

		wlllbzmc=outStr[i][0].trim();
		cldlmc=outStr[i][1].trim();
		wlbm=outStr[i][2].trim();
		glmc=outStr[i][3].trim();
		xhgg=outStr[i][4].trim();
		pp=outStr[i][5].trim();
		jldwmc=outStr[i][6].trim();
		djstr=outStr[i][7].trim();

		if (wlllbzmc.equals(""))
		{
			out.println("���������ϱ���["+wlbm+"]����[�赽��������]Ϊ��");
			return;
		}
		else if (wlllbzmc.equals("��Ҫ"))
		{
			wlllbz="Y";
		}
		else if (wlllbzmc.equals("��"))
		{
			wlllbz="N";
		}
		else
		{
			out.println("���������ϱ���["+wlbm+"]����[�赽��������]ֻ��Ϊ[��Ҫ]��[��]");
			return;
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
			dj=0;
			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}


		if (wlbm.equals(""))
		{
			out.println("����������[�������ϱ���]Ϊ��");
			return;
		}
		if (glmc.equals(""))
		{
			out.println("���������ϱ���["+wlbm+"]����[��������]Ϊ��");
			return;
		}




		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=wlllbzmc%>
        <input name="wlllbz" type="hidden" value="<%=wlllbz%>" >
      </td>
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
