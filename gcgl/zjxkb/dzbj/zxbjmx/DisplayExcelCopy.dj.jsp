<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ά��ģ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String dzbj=cf.GB2Uni(request.getParameter("dzbj"));

String bjjb=null;
String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString(1);
		ssfgs=rs.getString(2);
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString(1);
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>���鿽����Excel�ļ��Ƿ���ȷ����������������¿���</b>
		<input name="khbh" type="hidden" value="<%=khbh%>">
		<input name="bjjb" type="hidden" value="<%=bjjb%>">
		<input name="ssfgs" type="hidden" value="<%=ssfgs%>">
		<input name="dqbm" type="hidden" value="<%=dqbm%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="����">
          <input type="radio" name="czfs" value="1">
          �滻ԭ����
          <input name="czfs" type="radio" value="2" checked>
          ���ӵ�ԭ����</td>
    </tr>
    <tr>
      <td width="68%" height="57"><table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
            <td width="10%"><strong>����</strong></td>
            <td width="17%"><strong>��Ŀ���</strong></td>
            <td width="45%"><strong>��Ŀ����</strong></td>
            <td width="9%"><strong>������λ</strong></td>
            <td width="9%"><strong>����</strong></td>
            <td width="10%"><strong>������</strong></td>
          </tr>
<%

	String[] lineStr=dzbj.split("\r\n");
	if (lineStr==null || lineStr.length<2)
	{
		out.println("<BR>����δ¼�뱨������");
		return;
	}

	//�����˳���Ƿ���ȷ��������������������������������ʼ
	String rowData=lineStr[0];
	String[] colStr=rowData.split("	");
	if (colStr==null || colStr.length!=6)
	{
		out.println("<BR>�������������㣬Ӧ����6�У�ʵ���У�"+colStr.length);
		return;
	}

	if (!colStr[0].trim().equals("����"))
	{
		out.println("<BR>���󣡵�1��Ӧ���ǡ����䡿�������ǣ�"+colStr[0]);
		return;
	}
	if (!colStr[1].trim().equals("��Ŀ���"))
	{
		out.println("<BR>���󣡵�2��Ӧ���ǡ���Ŀ��š��������ǣ�"+colStr[1]);
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
	//�����˳���Ƿ���ȷ====================����

	//ȡ���ݣ�������������������������������ʼ
	for (int i=1;i<lineStr.length ;i++ )
	{
		rowData=lineStr[i];
		colStr=rowData.split("	");
		if (colStr==null || colStr.length!=6)
		{
			out.println("<BR>��["+(i+1)+"]�д������������㣬Ӧ����6�У��������ݱ�������ʵ���У�"+colStr.length);
			continue;
		}

		String jgwzbm=colStr[0].trim();
		String xmbh=colStr[1].trim();
		String xmmc=colStr[2].trim();
		String jldwmc=colStr[3].trim();
		String djStr=colStr[4].trim();
		String slStr=colStr[5].trim();


		//�����Ŀ���Ƶ��Ƿ���ȷ��������������������������������ʼ
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_jzbjb";
		ls_sql+=" where xmbh='"+xmbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//��Ŀ��Ų�����
		{
//			out.println("<BR>��["+(i+1)+"]�д�����Ŀ��Ų����ڣ�"+xmbh);

			double dj=0;
			try{
				dj=Double.parseDouble(djStr);

				djStr="<font color='#0000CC'>"+dj+"</font>";
			}
			catch (Exception e){
//				out.println("<BR>��["+(i+1)+"]�д��󣡵��۲������֣�"+djStr);

				djStr=djStr+"<font color='#FF0000'>����������֣�</font>";
			}

			xmbh="<font color='#0000CC'><B>"+xmbh+"������</B></font>";
			xmmc="<font color='#0000CC'>"+xmmc+"</font>";
			jldwmc="<font color='#0000CC'>"+jldwmc+"</font>";


			double sl=0;
			try{
				sl=Double.parseDouble(slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>" ><%=jgwzbm%></td>
					<td><input name="xmbh" type="text" value="������ȷֵ" size="15" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<%=xmbh%>
					</td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>
					<td><input name="sl" type="hidden" value="<%=sl%>" ><%=sl%></td>
				</tr>
				<%
			}
			catch (Exception e){
//				out.println("<BR>��["+(i+1)+"]�д��󣡹������������֣�"+slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>" ><%=jgwzbm%></td>
					<td><input name="xmbh" type="text" value="������ȷֵ" size="15" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<%=xmbh%>
					</td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>
					<td><input name="sl" type="text" value="������ȷֵ" size="9" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<font color='#0000CC'><B>[<%=slStr%>]������</B></font>
					</td>
				</tr>
				<%
			}


		}
		else{//��Ŀ��Ŵ���
			String getxmmc=null;
			String getjldwmc=null;
			double getbj=0;
			ls_sql="SELECT xmmc,jldwmc,bj";
			ls_sql+=" FROM bj_jzbjb,jdm_jldwbm";
			ls_sql+=" where bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getxmmc=rs.getString("xmmc");
				getjldwmc=rs.getString("jldwmc");
				getbj=rs.getDouble("bj");
			}
			rs.close();
			ps.close();

			double dj=0;
			try{
				dj=Double.parseDouble(djStr);

				if (getbj!=dj)//����Ƿ�ͱ�׼��ͬ
				{
	//				out.println("<BR>��["+(i+1)+"]�У���Ŀ���["+xmbh+"]���󣡵��۲���ȷ����ȷΪ��"+getbj+"����������Ϊ��"+djStr+"��");
					djStr=djStr+"<font color='#FF0000'>������ӦΪ"+getbj+"��</font>";
				}
			}
			catch (Exception e){
//				out.println("<BR>��["+(i+1)+"]�д��󣡵��۲������֣�"+djStr);
				djStr=djStr+"<font color='#FF0000'>����������֣�ӦΪ"+getbj+"��</font>";
			}

			if (!getxmmc.equals(xmmc))//����Ƿ�ͱ�׼��ͬ
			{
//				out.println("<BR>��["+(i+1)+"]�У���Ŀ���["+xmbh+"]������Ŀ���Ʋ���ȷ����ȷΪ��"+getxmmc+"����������Ϊ��"+xmmc+"��");
				xmmc=xmmc+"<font color='#FF0000'>������ӦΪ��"+getxmmc+"����</font>";
			}
			if (!getjldwmc.equals(jldwmc))//����Ƿ�ͱ�׼��ͬ
			{
//				out.println("<BR>��["+(i+1)+"]�У���Ŀ���["+xmbh+"]���󣡼�����λ����ȷ����ȷΪ��"+getjldwmc+"����������Ϊ��"+jldwmc+"��");
				jldwmc=jldwmc+"<font color='#FF0000'>������ӦΪ��"+getjldwmc+"����</font>";
			}

			double sl=0;
			try{
				sl=Double.parseDouble(slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>"><%=jgwzbm%></td>
					<td><input name="xmbh" type="hidden" value="<%=xmbh%>"><%=xmbh%></td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>
					<td><input name="sl" type="hidden" value="<%=sl%>"><%=sl%></td>
				</tr>
				<%
			}
			catch (Exception e){
//				out.println("<BR>��["+(i+1)+"]�д��󣡹������������֣�"+slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>"><%=jgwzbm%></td>
					<td><input name="xmbh" type="hidden" value="<%=xmbh%>"><%=xmbh%></td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>

					<td><input name="sl" type="text" value="������ȷֵ" size="9" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<font color='#0000CC'><B>[<%=slStr%>]������</B></font>
					</td>
				</tr>
				<%
			}

		}

		//�����Ŀ���Ƶ��Ƿ���ȷ����������������������������������
		
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
	FormName.action="SaveExcelCopy.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
