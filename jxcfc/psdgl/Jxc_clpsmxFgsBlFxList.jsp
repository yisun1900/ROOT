<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%
String fgs=request.getParameter("fgs");
String tjsj=request.getParameter("tjsj");
String tjsj2=request.getParameter("tjsj2");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

double zjpsje=0;
double zjqye=0;
int zjkhs=0;

int xlsl=0;
double[] xlxj;

try {
	conn=cf.getConnection();


	//���С������
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
	ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xlsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//С��С�Ʊ��浽������
	xlxj=new double[xlsl];

	for (int i=0;i<xlsl ;i++ )
	{
		xlxj[i]=0;
	}

%>
<center><b>����ʹ�ñ�������
<BR>ʵ���깤ʱ�䣺��<%=tjsj%>����<%=tjsj2%>��
</b></center><br>
<table width="<%=(700+xlsl*400+550)%>" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="40" rowspan="2"><B>���</b></td>
		<td width="130" rowspan="2"><B>�ֹ�˾</b></td>
		<td width="80" rowspan="2"><B>�ͻ���</b></td>
		<td width="120" rowspan="2"><B>ǩԼ��</b></td>
<%
		//��ȡ��������
		String clxlmc="";
		ls_sql="SELECT jxc_clxlbm.cldlmc||'.'||jxc_clxlbm.clxlmc clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="400" colspan="4"><B><%=clxlmc%></b></td>
			<%
		}
		rs.close();
		ps.close();
%>
			<td width="480" colspan="4"><B>�� ��</b></td>
	</tr>

	<tr bgcolor="CCCCCC" align="center"> 
<%
		//��ȡ��������
		ls_sql="SELECT clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="100"><B>ʵ������</b></td>
			<td width="100"><B>����ʹ�ñ���</b></td>
			<td width="100"><B>��׼����</b></td>
			<td width="100"><B>������</b></td>
			<%
		}
		rs.close();
		ps.close();
%>
		<td width="120"><B>ʵ������</b></td>
		<td width="120"><B>����ʹ�ñ���</b></td>
		<td width="120"><B>��׼����</b></td>
		<td width="120"><B>������</b></td>
	</tr>
<%
	String bgcolor="";
	String fgsbh="";
	String fgsmc="";

	int row=0;
	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!fgs.equals(""))
	{
		ls_sql+=" and dwbh='"+fgs+"'";
	}
    ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		fgsbh=cf.fillNull(rs2.getString("dwbh"));
		fgsmc=cf.fillNull(rs2.getString("dwmc"));


		double qye=0;
		int khs=0;
		ls_sql=" select sum(NVL(guanlif,0)+NVL(suijin,0)+qye),count(*)";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and crm_khxx.gcjdbm in('4','5') ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+tjsj+"','YYYY/MM/DD')";
		ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+tjsj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qye=rs.getDouble(1);
			khs=rs.getInt(2);
		}
		rs.close();
		ps.close();

		zjqye+=qye;
		zjkhs+=khs;

		double allbzlybl=0;
		double alllyblxx=0;
		double alllyblsx=0;
		ls_sql=" select bzlybl,lyblxx,lyblsx";
		ls_sql+=" FROM sq_dwxx ";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allbzlybl=rs.getDouble(1);
			alllyblxx=rs.getDouble(2);
			alllyblsx=rs.getDouble(3);
		}
		rs.close();
		ps.close();

	

		row++;

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td ><%=row%></td>
			<td ><A HREF="ViewFgsBlJxc_clpsmx.jsp?dwbh=<%=fgsbh%>&tjsj=<%=tjsj%>&tjsj2=<%=tjsj2%>" target="_blank"><%=fgsmc%></A></td>
			<td ><%=khs%></td>
			<td ><%=qye%></td>
		<%

		double xjpsje=0;

		int dlxh=0;//С�����
		String clxlbm=null;
		ls_sql="SELECT jxc_clxlbm.clxlbm,jxc_clxlbm.clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			clxlmc=cf.fillNull(rs.getString("clxlmc"));

			double bzlybl=0;
			double lyblxx=0;
			double lyblsx=0;
			ls_sql=" select bzlybl,lyblxx,lyblsx";
			ls_sql+=" from jxc_fclybl";
			ls_sql+=" where dwbh='"+fgsbh+"' and clxlbm='"+clxlbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bzlybl=rs1.getDouble(1);
				lyblxx=rs1.getDouble(2);
				lyblsx=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			double psje=0;
			ls_sql="select sum(jxc_clpsmx.psje)  ";
			ls_sql+=" from jxc_clpsmx,jxc_clpsd,crm_khxx  ";
			ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph and jxc_clpsd.khbh=crm_khxx.khbh ";
			ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
			ls_sql+=" and jxc_clpsmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and jxc_clpsd.ssfgs='"+fgsbh+"' ";

			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' ";
			ls_sql+=" and crm_khxx.gcjdbm in('4','5') ";
			ls_sql+=" and crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+tjsj+"','YYYY/MM/DD')";
			ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+tjsj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss')";
				
			
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				psje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			xjpsje+=psje;//�ֹ�˾С��
			xjpsje=cf.round(xjpsje,2);

			zjpsje+=psje;//�ܼ�

			xlxj[dlxh]+=psje;//С��С��

			dlxh++;

			double sjbl=0;
			if (qye==0)
			{
				sjbl=0;
			}
			else{
				sjbl=psje*100/qye;
			}
		
			double cebl=0;
			if (bzlybl==0)
			{
				cebl=0;
			}
			else{
				cebl=(sjbl-bzlybl)*100/bzlybl;
			}

			%>
				<td ><%=psje%></td>
				<td ><%=cf.formatDouble(sjbl)%>%</td>
				<td ><%=bzlybl%>%</td>
				<td ><%=cf.formatDouble(cebl)%>%</td>
			<%
		}
		rs.close();
		ps.close();

		//����ͻ�С��
		double sjbl=0;//����ʹ�ñ���
		if (qye==0)
		{
			sjbl=0;
		}
		else{
			sjbl=xjpsje*100/qye;
		}
	
		double cebl=0;//������
		if (allbzlybl==0)
		{
			cebl=0;
		}
		else{
			cebl=(sjbl-allbzlybl)*100/allbzlybl;
		}

		%>
			<td ><%=xjpsje%></td>
			<td ><%=cf.formatDouble(sjbl)%>%</td>
			<td ><%=allbzlybl%>%</td>
			<td ><%=cf.formatDouble(cebl)%>%</td>
		<%


		%>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close();
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="2"><B>��  ��</B></td>
	<td ><%=zjkhs%></td>
	<td ><%=cf.formatDouble(zjqye)%></td>
<%
	//���С��С��
	for (int i=0;i<xlsl ;i++ )
	{
		double sjbl=0;//����ʹ�ñ���
		if (zjqye==0)
		{
			sjbl=0;
		}
		else{
			sjbl=xlxj[i]*100/zjqye;
		}
		%>
		<td><%=cf.formatDouble(xlxj[i])%></td>
		<td><%=cf.formatDouble(sjbl)%>%</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<%
	}

	zjpsje=cf.doubleTrim(zjpsje);

	double sjbl=0;//����ʹ�ñ���
	if (zjqye==0)
	{
		sjbl=0;
	}
	else{
		sjbl=zjpsje*100/zjqye;
	}
%>
	<td><%=cf.formatDouble(zjpsje)%></td>
	<td><%=cf.formatDouble(sjbl)%>%</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>
</body>
</html>