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
String khbh=request.getParameter("khbh");
String khxm=null;

String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();
	
	ls_sql="SELECT khxm";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
	}
	rs.close();
	ps.close();

	//ִ��ɾ������
	if (filename!=null)
	{
		for (int i=0;i<filename.length ;i++ )
		{
			filename[i]=cf.GB2Uni(filename[i]);

			String ml=null;
			ls_sql="SELECT ml";
			ls_sql+=" FROM crm_sjzlk";
			ls_sql+=" where  khbh='"+khbh+"' and wjmc='"+filename[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ml=cf.fillNull(rs.getString("ml"));
			}
			rs.close();
			ps.close();

			if (ml!=null)
			{
				ls_sql=" delete from crm_sjzlk";
				ls_sql+=" where  khbh='"+khbh+"' and wjmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

			String ls=getServletContext().getRealPath("");
			String dirStr=ls+"/zlkxt/files/sjzlk/"+ml+"/";

			java.io.File lsFile=null;
			lsFile=new java.io.File(dirStr+"/"+filename[i]);

			if (lsFile.exists())
			{
				if (lsFile.delete())
				{
					out.println("<P>�ɹ�ɾ����"+filename[i]);
				}
				else{
					out.println("<BR>��������ɾ��ʧ�ܣ�"+filename[i]);
				}
			}
			else{
				out.println("<P>�ɹ�ɾ����"+filename[i]);
			}
		}
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>������ϣ��ͻ���<%=khxm%>��</B><BR><HR>
<form method="post" action="EditLoadWj.jsp" name="editform">
<input type="hidden" name="khbh" value="<%=khbh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="6%"> 
	<font color="#000099">ѡ���ļ�</font>
  </td>
  <td width="10%"> 
	<font color="#000099">����</font>
  </td>
  <td width="7%"> 
	<font color="#000099">���Ŀ¼</font>
  </td>
  <td width="30%"> 
	<font color="#000099">�ļ�����</font>
  </td>
  <td width="47%"> 
	<font color="#000099">�ļ�˵��</font>
  </td>
</tr>
<%

	String wjmc=null;
	String ml=null;
	String wjsm=null;
	ls_sql="SELECT wjmc,ml,wjsm";
	ls_sql+=" FROM crm_sjzlk";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wjmc=cf.fillNull(rs.getString("wjmc"));
		ml=cf.fillNull(rs.getString("ml"));
		wjsm=cf.fillNull(rs.getString("wjsm"));

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td> 
			<input name="filename" type=checkbox value="<%=wjmc%>">
		  </td>
		  <td>
			<a href="/zlkxt/files/sjzlk/<%=ml%>/<%=wjmc%>" >����Ҽ�����</a>
		  </td>
		  <td> 
			<div ><%=ml%>
		  </td>
		  <td> 
			<div ><%=wjmc%>
		  </td>
		  <td align="left"> 
			<%=wjsm%>
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
	<td colspan="5" > 
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