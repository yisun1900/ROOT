<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


Connection conn = null;
String wheresql="";
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String zqs=request.getParameter("zqs");//������

String date_bs=null;//���ܿ�ʼʱ��
String date_be=null;
String date_ss=null;//�������ڿ�ʼ
String date_se=null;


try{
	conn=cf.getConnection();

	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs="+zqs;
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

<div align="center">������������</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">�������ڣ�</td>
 <td width="20%"><%=date_ss%> �� <%=date_se%></td>
<td width="11%" align="right">�������ڣ�</td>
 <td width="20%" ><%=date_bs%> �� <%=date_be%></td>
 <td width="38%" >&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
<tr height=28 bgcolor="#CCCCCC"  >
  <td width="118" rowspan=2 align="center">�ֹ�˾</td>
    <td width="60" rowspan=2 align="center">��װ��������</td>
  <td height="28" colspan=7 align="center">Ŀ��ͻ�����</td>
  <td colspan=7 align="center">��ȡ��������</td>
 </tr>
 <tr bgcolor="#CCCCCC">
  <td  width="80" height="31" align="center">���¼ƻ�</td>
  <td  width="80" align="center">�����ۼ�</td>
  <td  width="80" align="center">���´����</td>
  <td  width="80" align="center">�����˾���Լ��</td>
  <td  width="80" align="center">���ܼƻ�</td>
  <td  width="80"align="center">�������</td>
  <td  width="80" align="center">����Ԥ��</td>
  <td  width="80"align="center">���¼ƻ�</td>
  <td  width="80" align="center">�����ۼ�</td>
  <td  width="80" align="center">���´����</td>
  <td  width="80" align="center">���¶���ɹ���</td>
  <td  width="80" align="center">���ܼƻ�</td>
  <td  width="80" align="center">�������</td>
  <td  width="80" align="center">����Ԥ��</td>
 </tr>
 <tr>
  <%
	int xjsl=0;

	int xjkh_byjh=0;//Ŀ��ͻ��������¼ƻ�
	int xjkh_bylj=0;//Ŀ��ͻ����������ۼ�
	int xjkh_szjh=0;//Ŀ��ͻ��������ܼƻ�
	int xjkh_szwc=0;//Ŀ��ͻ������������
	int xjkh_bzyj=0;//Ŀ��ͻ���������Ԥ��

	int xjdj_byjh=0;//��ȡ�����¼ƻ�
	int xjdj_bylj=0;//��ȡ�������ۼ�
	int xjdj_szjh=0;//��ȡ�������ܼƻ�
	int xjdj_szwc=0;//��ȡ�����������
	int xjdj_bzyj=0;//��ȡ������Ԥ��

	//Ŀ��ͻ�����-���´����	 
	double kh_bydcl=0;
	//����-���´����	 
	double dj_bydcl=0;
	//���¶���ɹ���
	double djcgl=0;

	double kh_rjyy=0;//�����˾���Լ��=�����ۼ�/��װ��������

	String dwmc=null;
	String dwbh=null;
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("dwbh");	
		dwmc=rs.getString("dwmc");	


		int sl=0;
		ls_sql="select count(*) rs"; 
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs="+zqs;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sl=rs1.getInt("rs");
		}
		rs1.close();
		ps1.close();

		int kh_byjh=0;//Ŀ��ͻ��������¼ƻ�
		int kh_bylj=0;//Ŀ��ͻ����������ۼ�
		int kh_szjh=0;//Ŀ��ͻ��������ܼƻ�
		int kh_szwc=0;//Ŀ��ͻ������������
		int kh_bzyj=0;//Ŀ��ͻ���������Ԥ��

		int dj_byjh=0;//��ȡ�����¼ƻ�
		int dj_bylj=0;//��ȡ�������ۼ�
		int dj_szjh=0;//��ȡ�������ܼƻ�
		int dj_szwc=0;//��ȡ�����������
		int dj_bzyj=0;//��ȡ������Ԥ��

		ls_sql="select sum(yy_qtqdkh_byjh),sum(yy_qtqdkh_bylj),sum(yy_qtqdkh_szjh),sum(yy_qtqdkh_szwc),sum(yy_qtqdkh_bzyj) ";
		ls_sql+="     ,sum(yy_qtqddj_byjh),sum(yy_qtqddj_bylj),sum(yy_qtqddj_szjh),sum(yy_qtqddj_szwc),sum(yy_qtqddj_bzyj)";
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			kh_byjh=rs1.getInt(1);
			kh_bylj=rs1.getInt(2);
			kh_szjh=rs1.getInt(3);
			kh_szwc=rs1.getInt(4);
			kh_bzyj=rs1.getInt(5);

			dj_byjh=rs1.getInt(6);
			dj_bylj=rs1.getInt(7);
			dj_szjh=rs1.getInt(8);
			dj_szwc=rs1.getInt(9);
			dj_bzyj=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();


		//Ŀ��ͻ�����-���´����	 
		if (kh_byjh!=0)
		{
			kh_bydcl=cf.round(kh_bylj*100.0/kh_byjh,2);
		}
		else{
			kh_bydcl=0;
		}

		//����-���´����	 
		if (dj_byjh!=0)
		{
			dj_bydcl=cf.round(dj_bylj*100.0/dj_byjh,2);
		}
		else{
			dj_bydcl=0;
		}

		//���¶���ɹ���=�����ۼ�/��װ��������
		if (sl!=0)
		{
			djcgl=cf.round(dj_bylj*100.0/sl,2);
		}
		else{
			djcgl=0;
		}

		//�����˾���Լ��=�����ۼ�/��װ��������
		if (sl!=0)
		{
			kh_rjyy=cf.round(kh_bylj/sl,2);
		}
		else{
			kh_rjyy=0;
		}

		xjsl+=sl;
		xjkh_byjh+=kh_byjh;//Ŀ��ͻ��������¼ƻ�
		xjkh_bylj+=kh_bylj;//Ŀ��ͻ����������ۼ�
		xjkh_szjh+=kh_szjh;//Ŀ��ͻ��������ܼƻ�
		xjkh_szwc+=kh_szwc;//Ŀ��ͻ������������
		xjkh_bzyj+=kh_bzyj;//Ŀ��ͻ���������Ԥ��

		xjdj_byjh+=dj_byjh;//��ȡ�����¼ƻ�
		xjdj_bylj+=dj_bylj;//��ȡ�������ۼ�
		xjdj_szjh+=dj_szjh;//��ȡ�������ܼƻ�
		xjdj_szwc+=dj_szwc;//��ȡ�����������
		xjdj_bzyj+=dj_bzyj;//��ȡ������Ԥ��


		%>
		<tr align="center">
			<td><%=dwmc%></td>
			<td><%=sl%></td>

			<td ><%=kh_byjh%></td> 
			<td ><%=kh_bylj%></td>  
			<td ><%=kh_bydcl%>%</td>  
			<td><%=kh_rjyy%></td>
			<td ><%=kh_szjh%></td>  
			<td ><%=kh_szwc%></td>  
			<td ><%=kh_bzyj%></td>  

			<td ><%=dj_byjh%></td>  
			<td ><%=dj_bylj%></td>  
			<td ><%=dj_bydcl%>%</td>  
			<td ><%=djcgl%>%</td>  
			<td ><%=dj_szjh%></td>  
			<td ><%=dj_szwc%></td>  
			<td ><%=dj_bzyj%></td>  
		</tr>
		<%
    
    }
	rs.close();
	ps.close();
  
	//Ŀ��ͻ�����-���´����	 
	if (xjkh_byjh!=0)
	{
		kh_bydcl=cf.round(xjkh_bylj*100.0/xjkh_byjh,2);
	}
	else{
		kh_bydcl=0;
	}

	//����-���´����	 
	if (xjdj_byjh!=0)
	{
		dj_bydcl=cf.round(xjdj_bylj*100.0/xjdj_byjh,2);
	}
	else{
		dj_bydcl=0;
	}

	//���¶���ɹ���=�����ۼ�/��װ��������
	if (xjsl!=0)
	{
		djcgl=cf.round(xjdj_bylj*100.0/xjsl,2);
	}
	else{
		djcgl=0;
	}

	//�����˾���Լ��=�����ۼ�/��װ��������
	if (xjsl!=0)
	{
		kh_rjyy=cf.round(xjkh_bylj/xjsl,2);
	}
	else{
		kh_rjyy=0;
	}


	%>
	<tr align="center">
		<td>С��</td>
		<td><%=xjsl%></td>

		<td ><%=xjkh_byjh%></td> 
		<td ><%=xjkh_bylj%></td>  
		<td ><%=kh_bydcl%>%</td>  
		<td><%=kh_rjyy%></td>
		<td ><%=xjkh_szjh%></td>  
		<td ><%=xjkh_szwc%></td>  
		<td ><%=xjkh_bzyj%></td>  

		<td ><%=xjdj_byjh%></td>  
		<td ><%=xjdj_bylj%></td>  
		<td ><%=dj_bydcl%>%</td>  
		<td ><%=djcgl%>%</td>  
		<td ><%=xjdj_szjh%></td>  
		<td ><%=xjdj_szwc%></td>  
		<td ><%=xjdj_bzyj%></td>  
	</tr>
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

</table>

</body>

</html>
