<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����Excel�ļ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=request.getParameter("zjxxh");

String dataStr=cf.GB2Uni(request.getParameter("dataStr"));

String gtbcpp=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

 	ls_sql="select bcpp";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gtbcpp=rs.getString("bcpp");
	}
	rs.close();
	ps.close();

 %>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>��������ţ�<%=zjxxh%>,������ţ�<%=gtxh%><P>���鿽����Excel�ļ��Ƿ���ȷ����������������¿���</b>
		<input name="gtxh" type="hidden" value="<%=gtxh%>">
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
          <input name="button" type="button" onClick="f_do(editform)"  value="����">
          <input type="radio" name="czfs" value="1">
          �滻�������а��
          <input name="czfs" type="radio" value="2" checked>
          �����°��</td>
    </tr>
    <tr>
      <td>
	 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
			<td  width="14%">�������</td>
			<td  width="9%">�������</td>
			<td  width="9%">��ĺ��(mm)</td>
			<td  width="7%">��(mm)</td>
			<td  width="7%">��(mm)</td>
			<td  width="6%">����</td>
			<td  width="8%"><font color="#0000FF">����</font></td>
			<td  width="9%"><font color="#0000FF">���</font></td>
			<td  width="31%">��ע</td>
          </tr>
<%

	String[] lineStr=dataStr.split("\r\n");
	if (lineStr==null || lineStr.length<2)
	{
		out.println("<BR>����δ¼�뱨������");
		return;
	}

	//�����˳���Ƿ���ȷ��������������������������������ʼ
	String rowData=lineStr[0];
	String[] colStr=rowData.split("	");
	if (colStr==null || colStr.length!=7)
	{
		out.println("<BR>�������������㣬Ӧ����7�У�ʵ���У�"+colStr.length);
		return;
	}

/*
	if (!colStr[0].trim().equals("�������"))
	{
		out.println("<BR>���󣡵�1��Ӧ���ǡ�������͡��������ǣ�"+colStr[0]);
		return;
	}
	if (!colStr[1].trim().equals("�������"))
	{
		out.println("<BR>���󣡵�2��Ӧ���ǡ�������ơ��������ǣ�"+colStr[1]);
		return;
	}
	if (!colStr[2].trim().equals("��Ŀ����"))
	{
		out.println("<BR>���󣡵�3��Ӧ���ǡ���Ŀ���ơ��������ǣ�"+colStr[2]);
		return;
	}
	if (!colStr[3].trim().equals("������λ"))
	{
		out.println("<BR>���󣡵�4��Ӧ���ǡ�������λ���������ǣ�"+colStr[3]);
		return;
	}
	if (!colStr[4].trim().equals("����"))
	{
		out.println("<BR>���󣡵�5��Ӧ���ǡ����ۡ��������ǣ�"+colStr[4]);
		return;
	}
	if (!colStr[5].trim().equals("������"))
	{
		out.println("<BR>���󣡵�6��Ӧ���ǡ����������������ǣ�"+colStr[5]);
		return;
	}
*/
	//�����˳���Ƿ���ȷ====================����

	//ȡ���ݣ�������������������������������ʼ
	for (int i=1;i<lineStr.length ;i++ )
	{
		rowData=lineStr[i];
		colStr=rowData.split("	",7);
		if (colStr==null || colStr.length<6)
		{
			out.println("<BR>��["+(i+1)+"]�д������������㣬Ӧ����7�У��������ݱ�������ʵ���У�"+colStr.length);
			return;
		}

		String bclx=colStr[0].trim();
		String bjmc=colStr[1].trim();
		String bchd=colStr[2].trim();
		String cdStr=colStr[3].trim();
		String kdStr=colStr[4].trim();
		String slStr=colStr[5].trim();
		String bz=null;
		if (colStr.length==7)
		{
			bz=colStr[6].trim();
		}
		else{
			bz="";
		}


		//���[�������]���Ƿ���ȷ��������������������������������ʼ
		int count=0;
		//[�������]�Ƿ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jc_jjbjbj";
		ls_sql+=" where bclx='"+bclx+"' and bcpp='"+gtbcpp+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//�������
		{
			out.println("<BR>��["+(i+1)+"]�д�����Ʒ�ơ�"+gtbcpp+"���С�������ͣ�"+bclx+"��������");
			return;
		}

		//[�������]�Ƿ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_gtbjmc";
		ls_sql+=" where bjmc='"+bjmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//�������
		{
			out.println("<BR>��["+(i+1)+"]�д���[�������]�����ڣ�"+bjmc);
			return;
		}

		int cd=0;
		try{
			cd=Integer.parseInt(cdStr);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[��]�������֣�"+cdStr);
			return;
		}
		int kd=0;
		try{
			kd=Integer.parseInt(kdStr);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[��]�������֣�"+kdStr);
			return;
		}

		int sl=0;
		try{
			sl=Integer.parseInt(slStr);
		}
		catch (Exception e){
			out.println("<BR>��["+(i+1)+"]�д���[����]�������֣�"+slStr);
			return;
		}

		double dj=0;
		ls_sql="select dj";
		ls_sql+=" from jc_jjbjbj";
		ls_sql+=" where  bclx='"+bclx+"' and bchd="+bchd;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dj=rs.getDouble("dj");
		}
		else{
			out.println("<BR>��["+(i+1)+"]�д���[����]�����ڣ�������[�������]��[��ĺ��]����ȷ��SQL="+ls_sql);
			return;
		}
		rs.close();
		ps.close();

		double bzdj=dj;
		double zqje=cf.round(bzdj*cd/1000*kd/1000*sl,2);


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="bclx" type="hidden" value="<%=bclx%>"><%=bclx%></td>
			<td><input name="bjmc" type="hidden" value="<%=bjmc%>"><%=bjmc%></td>
			<td><input name="bchd" type="hidden" value="<%=bchd%>"><%=bchd%></td>
			<td><input name="cd" type="hidden" value="<%=cd%>"><%=cd%></td>
			<td><input name="kd" type="hidden" value="<%=kd%>"><%=kd%></td>
			<td><input name="sl" type="hidden" value="<%=sl%>"><%=sl%></td>
			<td><input name="bzdj" type="hidden" value="<%=bzdj%>"><%=bzdj%></td>
			<td><input name="zqje" type="hidden" value="<%=zqje%>"><%=zqje%></td>
			<td><input name="bz" type="hidden" value="<%=bz%>"><%=bz%></td>
		</tr>
		<%
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


      </table></td>
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
	FormName.action="SaveExcelCopyBj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
