<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴���ι���������Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ysjlh=request.getParameter("ysjlh");

String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/gcgl/gcjdgz/fxys/fxysimages";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	if ((dir.isDirectory())&&(filename!=null))//ִ��ɾ������
	{
		for (int i=0;i<filename.length ;i++ )
		{
			filename[i]=cf.GB2Uni(filename[i]);
			lsFile=new java.io.File(ls+"/"+filename[i]);
			if (lsFile.exists())
			{
				if (lsFile.delete())
				{
					ls_sql=" delete from crm_gcfxyszp";
					ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					out.println("�ɹ�ɾ��ͼƬ��"+filename[i]);
				}
				else{
					out.println("<BR>��������ɾ��ͼƬʧ�ܣ�"+filename[i]);
				}
			}
			else{
				ls_sql=" delete from crm_gcfxyszp";
				ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				out.println("�ɹ�ɾ��ͼƬ��"+filename[i]);
			}
		}

		int zpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_gcfxyszp";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql="update crm_gcfxysjl set zpsl=?";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zpsl);
		ps.executeUpdate();
		ps.close();
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>���ռ�¼�ţ�<%=ysjlh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="15%"> 
	<div align="center"><font color="#000099">ѡ���ļ�</font></div>
  </td>
  <td width="25%"> 
	<div align="center"><font color="#000099">�ļ�����</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">��Ƭ</font></div>
  </td>
</tr>
<%

	String yszpmc=null;
	ls_sql="SELECT yszpmc";
	ls_sql+=" FROM crm_gcfxyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="15%"> 
			<div align="center"><input name="filename" type=checkbox value="<%=yszpmc%>"></div>
		  </td>
		  <td width="25%"> 
			<div align="center"><%=yszpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="/gcgl/gcjdgz/fxys/ViewImage.jsp?zhaopian=/gcgl/gcjdgz/fxys/fxysimages/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/gcgl/gcjdgz/fxys/fxysimages/<%=yszpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("���ذ����Ƭʧ�ܣ�Exception:" + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
	<tr bgcolor="#FFFFFF">
	<td colspan="3" height="2"> 
	<input type=button value='ɾ��ѡ�е���Ϣ' onclick="f_onclick(editform)">
	</td>
	</tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if ( confirm("ȷʵҪ������?") )	{
		FormName.submit();
		return true;
	}
} 
//-->
</script>