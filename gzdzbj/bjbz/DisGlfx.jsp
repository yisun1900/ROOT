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
String wybh=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmdlmc=null;
String xmxlmc=null;
String xmxlbm=null;

String xh=null;
String bjjbbm=null;
String bjjbmc=null;
String glflbm=null;
String glflmc=null;
String glmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String jldwmc=null;
String xhlstr=null;
double xhl=0;
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
	f.write(buffer);
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
<form method="post" action="SaveDisGlfx.jsp" name="editform" target="_blank">
<div align="center">
    ���빤�Ϸ���
    <BR><font color="#FF0000"><b>��ע�⣺</b></font><b>����</b><font color="#FF0000"><b>[<%=yxdqmc%>]
	<BR>ǧ��Ҫ�ظ����̣����򽫵����ظ�����</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="3%">���</td>
		<td width="4%">����</td>
		<td width="6%">��Ŀ����</td>
		<td width="8%">��ĿС��</td>
		<td width="6%">��Ŀ���</td>
		<td width="14%">��Ŀ����</td>

		<td width="5%">���ۼ���</td>
		<td width="5%">���Ϸ���</td>
		<td width="13%">��������</td>
		<td width="5%">������λ</td>
		<td width="5%">������</td>
		<td width="5%">����</td>
		<td width="10%">Ʒ��</td>
		<td width="13%">�ͺŹ��</td>
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
			out.println("����!���["+xh+"]����һ�е�����Ϊ��,����������Զ�������");
			break;
		}

		xh=outStr[i][0];
		dqmc=outStr[i][1];
		xmdlmc=outStr[i][2];
		xmxlmc=outStr[i][3];
		xmbh=outStr[i][4];
		xmmc=outStr[i][5];
		bjjbmc=outStr[i][6];
		glflmc=outStr[i][7];
		glmc=outStr[i][8];
		jldwmc=outStr[i][9];
		xhlstr=outStr[i][10];
		djstr=outStr[i][11];
		pp=outStr[i][12];
		xhgg=outStr[i][13];

		if (!yxdqmc.equals(dqmc.trim()))
		{
			out.println("���������["+xh+"]����[����]����ȷ��"+dqmc);
			return;
		}

		sql=" select xmdlbm" ;
		sql+=" from bdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlmc.trim()+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("���������["+xh+"]���󣬲����ڵ�[��Ŀ����]��"+xmdlmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from bdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlmc.trim()+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("���������["+xh+"]������Ŀ�����в����ڵ�[��ĿС��]��"+xmxlmc);
			return;
		}
		rs.close();
		ps.close();


		String yxmmc="";
		if (xmbh.equals(""))
		{
			out.println("���������["+xh+"]����[��Ŀ���]Ϊ��");
			return;
		}
		else{
			sql=" select xmmc" ;
			sql+=" from bj_gzbjb " ;
			sql+=" where xmbh='"+xmbh.trim()+"' and dqbm='"+dqbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				yxmmc = rs.getString("xmmc");			    
			}
			else{
				out.println("���������["+xh+"]���󣬲����ڵ�[��Ŀ���]��"+xmbh);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xmmc.equals(""))
		{
			out.println("���������["+xh+"]����[��Ŀ����]Ϊ��");
			return;
		}
		else{
			if (!yxmmc.trim().equals(xmmc.trim()))
			{
				out.println("���������["+xh+"]���󣬼�װ���۱��е�[��Ŀ����]�뵼���ļ��в�һ�£���װ���۱�����Ŀ���ƣ�["+yxmmc+"]");
				return;
			}
		}
		if (glmc.equals(""))
		{
			out.println("���������["+xh+"]����[��������]Ϊ��");
			return;
		}

		if (bjjbmc.equals(""))
		{
			out.println("���������["+xh+"]����[���ۼ���]Ϊ��");
			return;
		}
		else{
			sql=" select bjjbbm" ;
			sql+=" from bdm_bjjbbm " ;
			sql+=" where bjjbmc='"+bjjbmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				bjjbbm = rs.getString("bjjbbm");			    
			}
			else{
				out.println("���������["+xh+"]���󣬲����ڵ�[���ۼ���]��"+bjjbmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (glflmc.equals(""))
		{
			out.println("���������["+xh+"]����[���Ϸ���]Ϊ��");
			return;
		}
		else{
			sql=" select glflbm" ;
			sql+=" from bdm_glflbm " ;
			sql+=" where glflmc='"+glflmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				glflbm = rs.getString("glflbm");			    
			}
			else{
				out.println("���������["+xh+"]���󣬲����ڵ�[���Ϸ���]��"+glflmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwmc.equals(""))
		{
			out.println("���������["+xh+"]����[������λ]Ϊ��");
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
				out.println("���������["+xh+"]���󣬲����ڵ�[������λ]��"+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xhlstr.trim().equals(""))
		{
			out.println("���������["+xh+"]����[������]Ϊ��");
			return;
		}
		else{
			xhl=Double.parseDouble(xhlstr.trim());
		}

		if (djstr.trim().equals(""))
		{
			out.println("���������["+xh+"]����[����]Ϊ��");
			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="xh" type="hidden" value="<%=xh%>">
      </td>
      <td><%=dqmc%> 
      </td>
      <td><%=xmdlmc%> 
      </td>
      <td><%=xmxlmc%> 
      </td>
      <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
      <td><%=xmmc%>
      </td>
      <td><%=bjjbmc%>
        <input name="bjjb" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=glflmc%>
        <input name="glflbm" type="hidden" value="<%=glflbm%>" >
      </td>
      <td><%=glmc%>
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=xhl%>
        <input name="xhl" type="hidden" value="<%=xhl%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=pp%>
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=xhgg%>
        <input name="xhgg" type="hidden" value="<%=xhgg%>" >
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
