<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String dsksjbz=request.getParameter("dsksjbz");

String sksj=request.getParameter("sksj");
String sksj2=request.getParameter("sksj2");

String fgs=request.getParameter("fgs");
String fgsmc=null;
String dwbh=request.getParameter("dwbh");
String dwmc=null;

String zffsbm = null;
String zffsmc = null;
String fklxbm=null;
String fkcs=null;
double fkje=0;

double jz1=0;//һ�ڿ�
double jz2=0;//���ڿ�
double jz3=0;//β��
double mm=0;//ľ��
double jdcp1=0;//����
double jdcp2=0;//�Ҿ�
double zc=0;//����
double htdj=0;//��ͬ����
double lfdj=0;//��������
double sjf=0;//��Ʒ�
double zffszj=0;//С��

double zjz1=0;
double zjz2=0;
double zjz3=0;
double zmm=0;
double zjdcp1=0;
double zjdcp2=0;
double zzc=0;
double zhtdj=0;
double zlfdj=0;
double zsjf=0;
double zj=0;

Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

try 
{

conn=cf.getConnection();

ls_sql="select dwmc from sq_dwxx where dwbh='"+fgs+"'";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery(ls_sql);
if(rs.next())
{
	fgsmc=rs.getString("dwmc");
}
rs.close();
ps.close();

ls_sql="select dwmc from sq_dwxx where dwbh='"+dwbh+"'";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery(ls_sql);
if(rs.next())
{
	dwmc=rs.getString("dwmc");
}
rs.close();
ps.close();

if (fgs!=null)
{
	if (!(fgs.equals("")))
	{
		wheresql+=" and  fgsbh='"+fgs+"'";
		out.println("<br>�ֹ�˾��"+fgsmc+"</br>");
	}	
}

if (dwbh!=null)
{
	if (!(dwbh.equals("")))
	{
		wheresql+=" and  dwbh='"+dwbh+"'";
		out.println("<br>ǩԼ���棺"+dwmc+"</br>");
	}
	
}

if (sksj!=null)
{
	if (!(sksj.equals("")))	
	{
		wheresql+=" and  sksj>=TO_DATE('"+sksj+"','YYYY-MM-DD')";
		out.println("<br>�տ�ʱ�䣺");
		out.println("��");
		out.println(sksj);
	}
}

if (sksj2!=null)
{
	if (!(sksj2.equals(""))) 
	{
		wheresql+=" and  sksj<=TO_DATE('"+sksj2+"','YYYY-MM-DD')";
		out.println("��");
		out.println(sksj2);
		out.println("</br>");
	}
}

if (dsksjbz!=null)
{
	if (!(dsksjbz.equals("")))
	{
		wheresql+=" and  dsksjbz='"+dsksjbz+"'";
		if(dsksjbz.equals("Y"))
			out.println("<br>�Ƿ���ˣ������</br>");
		else{
			out.println("<br>�Ƿ���ˣ�δ���</br>");
		}
	}	
}



%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�����տ�ͳ��</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
<td  width="11%">���</td>
  <td  width="9%">��ͬ����</td>
  <td  width="9%">��������</td>
  <td  width="8%">һ�ڿ�</td>
  <td  width="8%">���ڿ�</td>
  <td  width="8%">β��</td>
  <td  width="8%">��Ʒ�</td>
  <td  width="8%">����</td>
  <td  width="8%">���ز�Ʒ</td>
  <td  width="8%">�����ڴ���</td>
  <td  width="15%">С��</td>
</tr>
<%
	ls_sql="SELECT zffsbm,zffsmc";
	ls_sql+=" FROM cw_zffsbm";
//	ls_sql+=" where zffsbm not in ('15','16')";
	ls_sql+=" order by zffsbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		zffsbm=rs.getString("zffsbm");
		zffsmc=rs.getString("zffsmc");

		jz1=0;
		jz2=0;
		jz3=0;
		mm=0;
		jdcp1=0;
		jdcp2=0;
		zc=0;
		htdj=0;
		lfdj=0;
		sjf=0;
		zffszj=0;

		ls_sql="SELECT fklxbm,fkcs,sum(fkje) fkje";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where zffs='"+zffsbm+"'";
		ls_sql+=wheresql;
		ls_sql+=" and fklxbm in ('11','21','22','23','24','51','52','53') and scbz='N'";
		ls_sql+=" group by fklxbm,fkcs";
		ls_sql+=" order by fklxbm";
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);

		while(rs1.next())	
		{
			fklxbm=rs1.getString("fklxbm");
			fkcs=rs1.getString("fkcs");
			fkje=rs1.getDouble("fkje");

			if(fklxbm.equals("11"))
			{
				if(fkcs.equals("1"))
				{
					jz1=fkje;
					zjz1+=fkje;
				}
				if(fkcs.equals("2"))
				{
					jz2=fkje;
					zjz2+=fkje;
				}
				if(fkcs.equals("3"))
				{
					jz3=fkje;
					zjz3+=fkje;
				}
			}

			if(fklxbm.equals("21"))
			{
				mm=fkje;
				zmm+=fkje;
			}

			if(fklxbm.equals("22"))
			{
				jdcp1=fkje;
				zjdcp1+=fkje;
			}

			if(fklxbm.equals("24"))
			{
				jdcp2=fkje;
				zjdcp2+=fkje;
			}

			if(fklxbm.equals("23"))
			{
				zc=fkje;
				zzc+=fkje;
			}
			if(fklxbm.equals("51"))
			{
				htdj=fkje;
				zhtdj+=fkje;
			}
			if(fklxbm.equals("52"))
			{
				lfdj=fkje;
				zlfdj+=fkje;
			}
			if(fklxbm.equals("53"))
			{
				sjf=fkje;
				zsjf+=fkje;
			}
			zffszj+=fkje;
		}
		rs1.close();
		ps1.close();
		zj+=zffszj;
%>
<tr   align="center">
	<td ><%=zffsmc%></td>
	<td ><%=htdj%></td>
	<td ><%=lfdj%></td>
	<td ><%=jz1%></td>
	<td ><%=jz2%></td>
	<td ><%=jz3%></td>
	<td ><%=sjf%></td>
	<td ><%=zc%></td>
	<td ><%=(jdcp1+jdcp2)%></td>
	<td ><%=mm%></td>
	<td ><%=zffszj%></td>
</tr>
<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("��������: " + ls_sql);
	return;
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
<tr bgcolor="#CCCCCC"  align="center">
	<td >�ܼ�</td>
	<td ><%=zhtdj%></td>
	<td ><%=zlfdj%></td>
	<td ><%=zjz1%></td>
	<td ><%=zjz2%></td>
	<td ><%=zjz3%></td>
	<td ><%=zsjf%></td>
	<td ><%=zzc%></td>
	<td ><%=(zjdcp1+zjdcp2)%></td>
	<td ><%=zmm%></td>
	<td ><%=zj%></td>
</tr>
</table>

</body>
</html>