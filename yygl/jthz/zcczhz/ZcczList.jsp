<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ĳ�ֵ���ܱ�</title>
</head>

<body>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String date_ss=null;
String date_se=null;
String date_bs=null;
String date_be=null;
String zqs=request.getParameter("zqs");//������
try
{
	conn=cf.getConnection();

	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs='"+zqs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();
	
%>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr >
<td colspan="14" align="center">���Ĳ�ֵ���ܱ�</td>
</tr>
<tr class=xl96 height=28 >
 <td width="11%" height="28" align="right">�������ڣ�</td>
 <td width="20%"><%=date_ss%> �� <%=date_se%></td>
<td width="11%" align="right">�������ڣ�</td>
 <td width="20%" ><%=date_bs%> �� <%=date_be%></td>
  <td colspan="10">&nbsp;</td>
  </tr>
  </table>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
 <tr height=28  align="center" bgcolor="#CCCCCC"  >
  <td width="10%">�ֹ�˾</td>
  <td width="7%">�����ۼ�</td>
  <td width="6%">���ʦ����</td>
  <td width="7%">�������ʦ�˾����Ĳ�ֵ</td>
  <td width="6%">�Ҿӹ�������</td>
  <td width="7%">���¼Ҿӹ����˾����Ĳ�ֵ</td>
  <td width="7%">ȥ��ͬ���¶����Ĳ�ֵ</td>
  <td width="7%">���Ĳ�ֵ���¼ƻ�</td>
  <td width="7%">���´����</td>
  <td width="7%">�����ۼƹ��̲�ֵ</td>
  <td width="7%">��������/����ռ��</td>
  <td width="7%">���ܼƻ�</td>
  <td width="7%">�������</td>
  <td width="7%">����Ԥ��</td>
  </tr>
<%
	
	double sjsrjcz=0;//�������ʦ�˾����Ĳ�ֵ
	double jjgwrjcz=0;//���¼Ҿӹ����˾����Ĳ�ֵ
	double bydcl=0;//���´����
	double zcgczb=0;//��������/����ռ��

	int xjsjsrs=0;//���ʦ����
	int xjjjgwrs=0;//�Ҿӹ�������

	double xjyy_jjbqntq=0;//ȥ��ͬ���¶����Ĳ�ֵ
	double xjyy_jjbbyjh=0;//���¼ƻ�
	double xjyy_jjbylj=0;//�����ۼ�
	double xjyy_jjbszjh=0;//���ܼƻ�
	double xjyy_jjbszwc=0;//�������
	double xjyy_jjbbzyj=0;//����Ԥ��

	double xjyy_jjbdmbylj=0;//�������汾���ۼƹ��̲�ֵ

	String dwmc=null;
	String dwbh=null;
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx in('F0') and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps1=conn.prepareStatement(ls_sql);
    rs1=ps1.executeQuery();
	while(rs1.next())
	{
		dwbh=rs1.getString("dwbh");	
		dwmc=rs1.getString("dwmc");

		int sjsrs=0;//���ʦ����
		int jjgwrs=0;//�Ҿӹ�������

		double yy_jjbqntq=0;//ȥ��ͬ���¶����Ĳ�ֵ
		double yy_jjbbyjh=0;//���¼ƻ�
		double yy_jjbylj=0;//�����ۼ�
		double yy_jjbszjh=0;//���ܼƻ�
		double yy_jjbszwc=0;//�������
		double yy_jjbbzyj=0;//����Ԥ��

		double yy_jjbdmbylj=0;//�������汾���ۼƹ��̲�ֵ


		ls_sql="select count(*) jjgwrs,sum(yy_jjb.yy_jjbqntq),sum(yy_jjb.yy_jjbylj)";
		ls_sql+=" ,sum(yy_jjb.yy_jjbszjh),sum(yy_jjb.yy_jjbszwc),sum(yy_jjb.yy_jjbbzyj),sum(yy_jjb.yy_jjbdmbylj) ";
		ls_sql+=" from yy_jjb";
		ls_sql+=" where  ssfgs='"+dwbh+"' and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			jjgwrs=rs.getInt(1);
			yy_jjbqntq=rs.getDouble(2);

			yy_jjbylj=rs.getDouble(3);

			yy_jjbszjh=rs.getDouble(4);
			yy_jjbszwc=rs.getDouble(5);
			yy_jjbbzyj=rs.getDouble(6);
			yy_jjbdmbylj=rs.getDouble(7);
		}
		rs.close();
		ps.close();


		ls_sql="select yy_sjjjb_byjh ";
		ls_sql+=" from YY_SJ";
		ls_sql+=" where yy_sj_fgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_jjbbyjh=rs.getDouble("yy_sjjjb_byjh");
		}
		rs.close();
		ps.close();

		ls_sql="select count(*) sjsrs ";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where  ssfgs='"+dwbh+"' and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			sjsrs=rs.getInt("sjsrs");
		}
		rs.close();
		ps.close();

		if(sjsrs==0)
		{
			sjsrjcz=0;
		}
		else{
			sjsrjcz=cf.round(yy_jjbylj/sjsrs,2);
		}

		if(jjgwrs==0)
		{
			jjgwrjcz=0;
		}
		else{
			jjgwrjcz=cf.round(yy_jjbylj/jjgwrs,2);
		}

		if(yy_jjbbyjh==0)
		{
			bydcl=0;
		}
		else
		{
			bydcl=cf.round(yy_jjbylj*100.0/yy_jjbbyjh,2);
		}

		if(yy_jjbdmbylj==0)
		{
			zcgczb=0;
		}
		else
		{
			zcgczb=cf.round(yy_jjbylj*100.0/yy_jjbdmbylj,2);
		}

		xjsjsrs+=sjsrs;//���ʦ����
		xjjjgwrs+=jjgwrs;//�Ҿӹ�������

		xjyy_jjbqntq+=yy_jjbqntq;//ȥ��ͬ���¶����Ĳ�ֵ
		xjyy_jjbbyjh+=yy_jjbbyjh;//���¼ƻ�
		xjyy_jjbylj+=yy_jjbylj;//�����ۼ�
		xjyy_jjbszjh+=yy_jjbszjh;//���ܼƻ�
		xjyy_jjbszwc+=yy_jjbszwc;//�������
		xjyy_jjbbzyj+=yy_jjbbzyj;//����Ԥ��

		xjyy_jjbdmbylj+=yy_jjbdmbylj;//�������汾���ۼƹ��̲�ֵ

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=dwmc%></td>
			<td><%=yy_jjbylj%></td>
			<td><%=sjsrs%></td>
			<td><%=sjsrjcz%></td>
			<td><%=jjgwrs%></td>
			<td><%=jjgwrjcz%></td>

			<td><%=yy_jjbqntq%></td>
			<td><%=yy_jjbbyjh%></td>

			<td><%=bydcl%>%</td>

			<td><%=yy_jjbdmbylj%></td>
			<td><%=zcgczb%>%</td>
			<td><%=yy_jjbszjh%></td>
			<td><%=yy_jjbszwc%></td>
			<td><%=yy_jjbbzyj%></td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	if(xjsjsrs==0)
	{
		sjsrjcz=0;
	}
	else{
		sjsrjcz=cf.round(xjyy_jjbylj/xjsjsrs,2);
	}

	if(xjjjgwrs==0)
	{
		jjgwrjcz=0;
	}
	else{
		jjgwrjcz=cf.round(xjyy_jjbylj/xjjjgwrs,2);
	}

	if(xjyy_jjbbyjh==0)
	{
		bydcl=0;
	}
	else
	{
		bydcl=cf.round(xjyy_jjbylj*100.0/xjyy_jjbbyjh,2);
	}

	if(xjyy_jjbdmbylj==0)
	{
		zcgczb=0;
	}
	else
	{
		zcgczb=cf.round(xjyy_jjbylj*100.0/xjyy_jjbdmbylj,2);
	}
%>
<tr bgcolor="#FFFFFF" align="center">
	<td>С��</td>
	<td><%=cf.round(xjyy_jjbylj,2)%></td>
	<td><%=xjsjsrs%></td>
	<td><%=cf.round(sjsrjcz,2)%></td>
	<td><%=xjjjgwrs%></td>
	<td><%=cf.round(jjgwrjcz,2)%></td>

	<td><%=cf.round(xjyy_jjbqntq,2)%></td>
	<td><%=cf.round(xjyy_jjbbyjh,2)%></td>

	<td><%=cf.round(bydcl,2)%>%</td>

	<td><%=cf.round(xjyy_jjbdmbylj,2)%></td>
	<td><%=cf.round(zcgczb,2)%>%</td>
	<td><%=cf.round(xjyy_jjbszjh,2)%></td>
	<td><%=cf.round(xjyy_jjbszwc,2)%></td>
	<td><%=cf.round(xjyy_jjbbzyj,2)%></td>
</tr>
</table>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
