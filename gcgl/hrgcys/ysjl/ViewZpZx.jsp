<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ysjlh=request.getParameter("ysjlh");
String zpxmbm=request.getParameter("zpxmbm");

String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/yblimg/gcys/";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	String zpml="";
	ls_sql="SELECT zpml";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpml=cf.fillNull(rs.getString("zpml"));
	}
	rs.close();
	ps.close();

	if ((dir.isDirectory())&&(filename!=null))//ִ��ɾ������
	{
		for (int i=0;i<filename.length ;i++ )
		{
			filename[i]=cf.GB2Uni(filename[i]);
			lsFile=new java.io.File(ls+"/"+zpml+"/"+filename[i]);
			if (lsFile.exists())
			{
				if (lsFile.delete())
				{
					ls_sql=" delete from crm_heyszp";
					ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					out.println("<BR>�ɹ�ɾ��ͼƬ��"+filename[i]);
				}
				else{
					out.println("<BR>��������ɾ��ͼƬʧ�ܣ�"+filename[i]);
				}
			}
			else{
				ls_sql=" delete from crm_heyszp";
				ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+filename[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				out.println("�ɹ�ɾ��ͼƬ��"+filename[i]);
			}
		}


		int zpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_heyszp";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="update crm_heysjl set zpsl=?";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zpsl);
		ps.executeUpdate();
		ps.close();
	}


%>
<body bgcolor="#FFFFFF">
<CENTER><B>���ռ�¼�ţ�<%=ysjlh%></B><BR><HR>
<form method="post" action="ViewZpZx.jsp" name="editform">
<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
<input type="hidden" name="zpxmbm" value="<%=zpxmbm%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="4%">ѡ���ļ�</td>
  <td width="4%">���</td>
  <td width="18%">�ļ�����</td>
  <td width="14%">��Ƭ��Ӧ��Ŀ</td>
  <td width="30%">��Ƭ˵��</td>
  <td width="44%">��Ƭ</td>
</tr>
<%

	String yszpmc=null;
	String zpxm=null;
	String zplx=null;
	String zpsm=null;
	int row=0;
	ls_sql="SELECT yszpmc,zpxm,zplx,zpsm";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ls_sql+=" and  zpxmbm='"+zpxmbm+"'";
	ls_sql+=" order by yszpmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);
		zpxm=cf.fillNull(rs.getString(2));
		zplx=cf.fillNull(rs.getString("zplx"));
		zpsm=cf.fillNull(rs.getString("zpsm"));

		row++;


		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td  > 
			<div align="center"><input name="filename" type=checkbox value="<%=yszpmc%>"></div>
		  </td>
		  <td><%=row%></td>
		  <td><%=yszpmc%></td>
		  <td><%=zpxm%></td>
		  <td> 
			<input type="text" name="zpsm" size="39" maxlength="50" value="<%=zpsm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			<input type="hidden" name="yszpmc" value="<%=yszpmc%>">
		  </td>
		  <td > 
			<div align="center"><A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("������Ƭʧ�ܣ�Exception:" + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
	<tr bgcolor="#FFFFFF">
	<td colspan="6"> 
		<input type=button value='ɾ��ѡ�е���Ϣ' onclick="f_del(editform)">
		<input type=button value='�޸���Ƭ˵��' onclick="f_xg(editform)">
	</td>
	</tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_del(FormName)
{
	if ( confirm("ȷʵҪ������?") )	
	{
		FormName.action="ViewZpZx.jsp";
		FormName.submit();
		return true;
	}
} 

function f_xg(FormName)
{

	FormName.action="SaveEditZpsm.jsp";
	FormName.submit();
	return true;

} 
//-->
</script>