<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���̲�ֵ���ܱ�</title>
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

	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
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
			yy_rqsd_szs=cf.fillNull(rs.getDate("yy_rqsd_szs"));
			yy_rqsd_sze=cf.fillNull(rs.getDate("yy_rqsd_sze"));
			yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
			yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
		}
		rs.close();
		ps.close();
	
%>
<body>

<div align="center">���̲�ֵ����</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">�������ڣ�</td>
 <td width="20%"><%=yy_rqsd_szs%> �� <%=yy_rqsd_sze%></td>
<td width="11%" align="right">�������ڣ�</td>
 <td width="20%" ><%=yy_rqsd_bzs%> �� <%=yy_rqsd_bze%></td>
 <td width="38%" >&nbsp;</td>

  </tr>
</table>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr height=28  align="center" bgcolor="#CCCCCC"  >
	<td rowspan="2" align="center" width="150">�ֹ�˾</td>
	<td rowspan="2" align="center" width="88">���ʦ����</td>
	<td height="21" colspan="10" align="center">��ȡ�������</td>
	<td colspan="8" align="center">���̲�ֵ</td>
	</tr>
	 <tr height=28  align="center" bgcolor="#CCCCCC"  >
	<td width="100">����(�Ǳ���)����</td>
	<td width="100">���¼ƻ�</td>
	<td width="100">�����ۼ�</td>
	<td width="100">���´����</td>
	<td width="100">�����˾���������</td>
	<td width="100">���ܼƻ�</td>
	<td width="100">�������</td>
	<td width="100">����Ԥ��</td>
	<td width="100">�����ۼ��˶���</td>
	<td width="100">�����ۼ��˶���</td>
	<td width="100">ȥ��ͬ���¶ȹ��̲�ֵ</td>
	<td width="100">���¼ƻ�</td>
	<td width="100">�����ۼ�</td>
	<td width="100">���´����</td>
	<td width="100">�����˾����̲�ֵ</td>
	<td width="100">���ܼƻ�</td>
	<td width="100">�������</td>
	<td width="100">����Ԥ��</td>
 <%
	int xjsjsrs=0;//���ʦ����
	double xjyy_sjbdj_sydjcb=0;//����(�Ǳ���)����

	double xjyy_sjbdj_byjh=0;//���¼ƻ�(����)
	double xjyy_sjbdj_bylj=0;//�����ۼ�(����)

	double xjyy_sjbdj_szjh=0;//���ܼƻ�
	double xjyy_sjbdj_szwc=0;//�������
	double xjyy_sjbdj_bzyj=0;//����Ԥ��

	double xjyy_sjbdj_bztdj=0;//�����˶���
	double xjyy_sjbdj_byljtdj=0;//�����ۼ��˶���

	double xjyy_sjsjb_tqgccz=0;//ȥ��ͬ���¶ȹ��̲�ֵ

	double xjyy_sjbgccz_byjh=0;//���¼ƻ�(gc)
	double xjyy_sjbgccz_bylj=0;//���̲�ֵ�����ۼ�

	double xjyy_sjbgccz_szjh=0;//���ܼƻ�
	double xjyy_sjbgccz_szwc=0;//�������
	double xjyy_sjbgccz_bzyj=0;//����Ԥ��

	double djdcl=0;//���´����(����)
	double rjdj=0;
	double gcdcl=0;//���´����(gc)
	double gcrj=0;

	String dwmc=null;
	String dwbh=null;

	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps1=conn.prepareStatement(ls_sql);
    rs1=ps1.executeQuery();
	while(rs1.next())
	{
		dwbh=rs1.getString("dwbh");	
		dwmc=rs1.getString("dwmc");
	
		int sjsrs=0;//���ʦ����
		double yy_sjbdj_sydjcb=0;//����(�Ǳ���)����

		double yy_sjbdj_byjh=0;//���¼ƻ�(����)
		double yy_sjbdj_bylj=0;//�����ۼ�(����)

		double yy_sjbdj_szjh=0;//���ܼƻ�
		double yy_sjbdj_szwc=0;//�������
		double yy_sjbdj_bzyj=0;//����Ԥ��

		double yy_sjbdj_bztdj=0;//�����˶���
		double yy_sjbdj_byljtdj=0;//�����ۼ��˶���

		double yy_sjsjb_tqgccz=0;//ȥ��ͬ���¶ȹ��̲�ֵ

		double yy_sjbgccz_byjh=0;//���¼ƻ�(gc)
		double yy_sjbgccz_bylj=0;//���̲�ֵ�����ۼ�

		double yy_sjbgccz_szjh=0;//���ܼƻ�
		double yy_sjbgccz_szwc=0;//�������
		double yy_sjbgccz_bzyj=0;//����Ԥ��

		ls_sql=" select count(*) sjsrs,sum(yy_sjbdj_sydjcb),sum(yy_sjbdj_byjh),sum(yy_sjbdj_bylj),sum(yy_sjbdj_szjh),sum(yy_sjbdj_szwc),sum(yy_sjbdj_bzyj),sum(yy_sjbdj_bztdj),sum(yy_sjbdj_byljtdj) ";
		ls_sql+=" ,sum(yy_sjbgccz_byjh),sum(yy_sjbgccz_bylj),sum(yy_sjbgccz_szjh),sum(yy_sjbgccz_szwc),sum(yy_sjbsjf_bzyj) ";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ls_sql+=" and yy_sjbgccz_byjh>0";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			sjsrs=rs.getInt("sjsrs");
			yy_sjbdj_sydjcb=yy_sjbdj_byjh=rs.getDouble(1);

			yy_sjbdj_byjh=rs.getDouble(2);
			yy_sjbdj_bylj=rs.getDouble(3);
			yy_sjbdj_szjh=rs.getDouble(4);
			yy_sjbdj_szwc=rs.getDouble(5);
			yy_sjbdj_bzyj=rs.getDouble(6);
			yy_sjbdj_bztdj=rs.getDouble(7);
			yy_sjbdj_byljtdj=rs.getDouble(8);

			yy_sjbgccz_byjh=rs.getDouble(9);
			yy_sjbgccz_bylj=rs.getDouble(10);
			yy_sjbgccz_szjh=rs.getDouble(11);
			yy_sjbgccz_szwc=rs.getDouble(12);
			yy_sjbgccz_bzyj=rs.getDouble(13);
		}
		rs.close();
		ps.close();

		out.println(ls_sql);
		out.println(yy_sjbgccz_byjh);


		ls_sql="select sum(yy_sjsjb_tqgccz)";
		ls_sql+=" from yy_sj";
		ls_sql+=" where yy_sj_fgs='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_sjsjb_tqgccz=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	


	  
		if(yy_sjbdj_byjh==0)
		{
			djdcl=0;
		}
		else
		{
			djdcl=cf.round(yy_sjbdj_bylj*100.0/yy_sjbdj_byjh,2);
		}

		if(sjsrs==0)
		{
			rjdj=0;
		}
		else
		{
			rjdj=cf.round(yy_sjbdj_bylj/sjsrs,2);
		}

		if(yy_sjbgccz_byjh==0)
		{
			gcdcl=0;
		}
		else
		{
			gcdcl=cf.round(yy_sjbgccz_bylj*100.0/yy_sjbgccz_byjh,2);
		}

		if(sjsrs==0)
		{
			gcrj=0;
		}
		else
		{
			gcrj=cf.round(yy_sjbgccz_bylj/sjsrs,2);
		}

		xjsjsrs+=sjsrs;//���ʦ����
		xjyy_sjbdj_sydjcb+=yy_sjbdj_sydjcb;//����(�Ǳ���)����

		xjyy_sjbdj_byjh+=yy_sjbdj_byjh;//���¼ƻ�(����)
		xjyy_sjbdj_bylj+=yy_sjbdj_bylj;//�����ۼ�(����)

		xjyy_sjbdj_szjh+=yy_sjbdj_szjh;//���ܼƻ�
		xjyy_sjbdj_szwc+=yy_sjbdj_szwc;//�������
		xjyy_sjbdj_bzyj+=yy_sjbdj_bzyj;//����Ԥ��

		xjyy_sjbdj_bztdj+=yy_sjbdj_bztdj;//�����˶���
		xjyy_sjbdj_byljtdj+=yy_sjbdj_byljtdj;//�����ۼ��˶���

		xjyy_sjsjb_tqgccz+=yy_sjsjb_tqgccz;//ȥ��ͬ���¶ȹ��̲�ֵ

		xjyy_sjbgccz_byjh+=yy_sjbgccz_byjh;//���¼ƻ�(gc)
		xjyy_sjbgccz_bylj+=yy_sjbgccz_bylj;//���̲�ֵ�����ۼ�

		xjyy_sjbgccz_szjh+=yy_sjbgccz_szjh;//���ܼƻ�
		xjyy_sjbgccz_szwc+=yy_sjbgccz_szwc;//�������
		xjyy_sjbgccz_bzyj+=yy_sjbgccz_bzyj;//����Ԥ��
			
		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td ><%=dwmc%></td>
			<td><%=sjsrs%></td>
			<td><%=yy_sjbdj_sydjcb%></td>
			<td><%=yy_sjbdj_byjh%></td>
			<td><%=yy_sjbdj_bylj%></td>
			<td><%=djdcl%>%</td>
			<td><%=rjdj%></td>

			<td><%=yy_sjbdj_szjh%></td>
			<td><%=yy_sjbdj_szwc%></td>
			<td><%=yy_sjbdj_bzyj%></td>
			<td><%=yy_sjbdj_bztdj%></td>
			<td><%=yy_sjbdj_byljtdj%></td>

			<td><%=yy_sjsjb_tqgccz%></td>

			<td><%=yy_sjbgccz_byjh%></td>
			<td><%=yy_sjbgccz_bylj%></td>
			<td><%=gcdcl%>%</td>
			<td><%=gcrj%></td>
			<td><%=yy_sjbgccz_szjh%></td>
			<td><%=yy_sjbgccz_szwc%></td>
			<td><%=yy_sjbgccz_bzyj%></td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	if(xjyy_sjbdj_byjh==0)
	{
		djdcl=0;
	}
	else
	{
		djdcl=cf.round(xjyy_sjbdj_bylj*100.0/xjyy_sjbdj_byjh,2);
	}

	if(xjsjsrs==0)
	{
		rjdj=0;
	}
	else
	{
		rjdj=cf.round(xjyy_sjbdj_bylj/xjsjsrs,2);
	}

	if(xjyy_sjbgccz_byjh==0)
	{
		gcdcl=0;
	}
	else
	{
		gcdcl=cf.round(xjyy_sjbgccz_bylj*100.0/xjyy_sjbgccz_byjh,2);
	}

	if(xjsjsrs==0)
	{
		gcrj=0;
	}
	else
	{
		gcrj=cf.round(xjyy_sjbgccz_bylj/xjsjsrs,2);
	}

%>
<tr bgcolor="#FFFFFF" align="center">
	<td >С��</td>
	<td><%=xjsjsrs%></td>
	<td><%=xjyy_sjbdj_sydjcb%></td>
	<td><%=xjyy_sjbdj_byjh%></td>
	<td><%=xjyy_sjbdj_bylj%></td>
	<td><%=djdcl%>%</td>
	<td><%=rjdj%></td>

	<td><%=xjyy_sjbdj_szjh%></td>
	<td><%=xjyy_sjbdj_szwc%></td>
	<td><%=xjyy_sjbdj_bzyj%></td>
	<td><%=xjyy_sjbdj_bztdj%></td>
	<td><%=xjyy_sjbdj_byljtdj%></td>

	<td><%=xjyy_sjsjb_tqgccz%></td>

	<td><%=xjyy_sjbgccz_byjh%></td>
	<td><%=xjyy_sjbgccz_bylj%></td>
	<td><%=gcdcl%>%</td>
	<td><%=gcrj%></td>
	<td><%=xjyy_sjbgccz_szjh%></td>
	<td><%=xjyy_sjbgccz_szwc%></td>
	<td><%=xjyy_sjbgccz_bzyj%></td>
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
