<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER > <B><font size="3">�鿴���۵��ۣ�������<%=khbh%>�� </font></B></CENTER>
<table border="1" width="140%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="4%">��������</td>
	<td  width="6%">��Ŀ���</td>
	<td  width="14%">��Ŀ����</td>
	<td  width="4%" bgcolor="#E8E8FF">���ⵥ��</td>
	<td  width="5%" bgcolor="#E8E8FF">�ϼƣ����ۣ�</td>
	<td  width="3%">����</td>
	<td  width="4%" bgcolor="#E8E8FF">С��</td>
	<td  width="3%">�赽��������</td>
	<td  width="4%">����</td>
	<td  width="4%">������ϱ���</td>
	<td  width="11%">��������</td>
	<td  width="8%">Ʒ��</td>
	<td  width="6%">�ͺŹ��</td>
	<td  width="4%">������λ</td>
	<td  width="4%">���ϵ���</td>
	<td  width="5%">Ӧ���������</td>
	<td  width="5%">ʵ���������</td>
	<td  width="5%">���Ϸ�</td>
</tr>
<%

	String xmbh=null;
	String xmmc=null;
	String bjlx=null;
	double dwdj=0;
	double cbdj=0;

	String glmc=null;
	String cljldwmc=null;
	String pp=null;
	String xhgg=null;
	double dj=0;
	double ylclyl=0;
	double slclyl=0;
	double clf=0;
	String wlbm=null;
	String wlllbz=null;
	String lx=null;

	int bjxmxh=0;//��Ŀ���

	ls_sql="SELECT xmbh,xmmc,dwbjdj,cbdj,DECODE(bjlx,'1','��׼','2','�Զ���','3','������Ŀ') bjlx";
	ls_sql+=" FROM cw_dejsmx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjxmxh++;

		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		dwdj=rs.getDouble("dwbjdj");
		cbdj=rs.getDouble("cbdj");
		bjlx=cf.fillNull(rs.getString("bjlx"));

		if (bjlx.equals("�Զ���") || bjlx.equals("������Ŀ"))//1:��׼��Ŀ;2:�Զ�����Ŀ;3:������Ŀ
		{
			//����С��
			double clxjje=0;
			int xjsl=0;
			ls_sql="SELECT sum(xhl*dj),count(*)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='1'  ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				clxjje=rs2.getDouble(1);
				xjsl=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();

			clxjje=cf.doubleTrim(clxjje,2);

			//�˹�С��
			double rgxjje=0;
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='2'  ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				rgxjje=rs2.getDouble(1);
			}
			rs2.close();
			ps2.close();

			//��еС��
			double jjxjje=0;
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='3'  ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				jjxjje=rs2.getDouble(1);
			}
			rs2.close();
			ps2.close();

			//�ϼƣ����ۣ�
			double hjje=cf.doubleTrim(clxjje+rgxjje+jjxjje);
			int hjsl=xjsl+2;

			int rowspan=hjsl;//�кϲ�

			//���������ϸ
			ls_sql="SELECT wlbm,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,glmc,pp,xhgg,cljldwmc,xhl,dj,xhl*dj clf";
			ls_sql+=" FROM bj_khglfxb,bdm_cljldwbm  ";
			ls_sql+=" where bj_khglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) ";
			ls_sql+=" and khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='1'  ";
			ls_sql+=" order by bj_khglfxb.wlbm";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				wlbm=cf.fillHtml(rs2.getString("wlbm"));
				wlllbz=cf.fillHtml(rs2.getString("wlllbz"));
				glmc=cf.fillNull(rs2.getString("glmc"));
				pp=cf.fillHtml(rs2.getString("pp"));
				xhgg=cf.fillHtml(rs2.getString("xhgg"));
				cljldwmc=cf.fillNull(rs2.getString("cljldwmc"));
				ylclyl=rs2.getDouble("xhl");
				dj=rs2.getDouble("dj");
				clf=rs2.getDouble("clf");


				if (rowspan==hjsl)//��ʼ�µı�����Ŀ
				{
					rowspan--;

					%>
					<tr align="center">
						<td rowspan="<%=hjsl%>"><%=bjxmxh%></td>
						<td rowspan="<%=hjsl%>"><%=bjlx%></td>
						<td rowspan="<%=hjsl%>"><%=xmbh%></td>
						<td rowspan="<%=hjsl%>"><%=xmmc%></td>
						<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=dwdj%></td>
						<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=hjje%></td>
						<td rowspan="<%=xjsl%>">����</td>
						<td rowspan="<%=xjsl%>" bgcolor="#E8E8FF"><%=clxjje%></td>
						<td><%=wlllbz%></td>
						<td>&nbsp;</td>
						<td><%=wlbm%></td>
						<td><%=glmc%></td>
						<td><%=pp%></td>
						<td><%=xhgg%></td>
						<td><%=cljldwmc%></td>
						<td><%=dj%></td>
						<td><%=ylclyl%></td>
						<td><%=slclyl%></td>
						<td><%=clf%></td>
					</tr>
					<%
				}
				else{
					rowspan--;
					%>
					<tr align="center">
						<td><%=wlllbz%></td>
						<td><%=wlbm%></td>
						<td><%=glmc%></td>
						<td><%=pp%></td>
						<td><%=xhgg%></td>
						<td><%=cljldwmc%></td>
						<td><%=dj%></td>
						<td><%=ylclyl%></td>
						<td><%=slclyl%></td>
						<td><%=clf%></td>
					</tr>
					<%
				}

			}
			rs2.close();
			ps2.close();

			if (xjsl==0)
			{
				%>
				<tr align="center">
					<td rowspan="<%=hjsl%>"><%=bjxmxh%></td>
					<td rowspan="<%=hjsl%>"><%=bjlx%></td>
					<td rowspan="<%=hjsl%>"><%=xmbh%></td>
					<td rowspan="<%=hjsl%>"><%=xmmc%></td>
					<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=dwdj%></td>
					<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=hjje%></td>
					<td >�˹�</td>
					<td bgcolor="#E8E8FF"><%=rgxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<tr align="center">
					<td >��е</td>
					<td bgcolor="#E8E8FF"><%=jjxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<%
			}
			else{
				%>
				<tr align="center">
					<td >�˹�</td>
					<td bgcolor="#E8E8FF"><%=rgxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<tr align="center">
					<td >��е</td>
					<td bgcolor="#E8E8FF"><%=jjxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<%
			}
		}
		else//1:��׼��Ŀ
		{
			//����С�ƣ���Ҫ��������
			double clxjje=0;
			int xjsl=0;
			ls_sql="SELECT ROUND(sum(clf),2),count(*)";
			ls_sql+=" FROM cw_dejsxmclmx  ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				clxjje=rs2.getDouble(1);
				xjsl=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();


			//����С�ƣ�����Ҫ��������
			ls_sql="SELECT sum(xhl*dj),count(*)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='1' and wlllbz='N' ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				clxjje+=rs2.getDouble(1);
				xjsl+=rs2.getInt(2);
			}
			rs2.close();
			ps2.close();

			clxjje=cf.doubleTrim(clxjje,2);

			//�˹�С��
			double rgxjje=0;
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='2'  ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				rgxjje=rs2.getDouble(1);
			}
			rs2.close();
			ps2.close();

			//��еС��
			double jjxjje=0;
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxb  ";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='3'  ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				jjxjje=rs2.getDouble(1);
			}
			rs2.close();
			ps2.close();

			//�ϼƣ����ۣ�
			double hjje=cf.doubleTrim(clxjje+rgxjje+jjxjje,2);
			int hjsl=xjsl+2;

			int rowspan=hjsl;//�кϲ�

			//���������ϸ
			ls_sql="SELECT wlbm,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,DECODE(lx,'1','�����ж�Ӧ����','2','�޶�Ӧ����') lx,glmc,pp,xhgg,cljldwmc,ylclyl,slclyl,dj,clf";
			ls_sql+=" FROM cw_dejsxmclmx,bdm_cljldwbm  ";
			ls_sql+=" where cw_dejsxmclmx.jldwbm=bdm_cljldwbm.cljldwbm(+) ";
			ls_sql+=" and khbh='"+khbh+"' and xmbh='"+xmbh+"'";

			ls_sql+=" UNION ALL ";

			ls_sql+=" SELECT wlbm,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,'',glmc,pp,xhgg,cljldwmc,xhl,0,dj,ROUND(xhl*dj,2)";
			ls_sql+=" FROM bj_khglfxb,bdm_cljldwbm  ";
			ls_sql+=" where bj_khglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) ";
			ls_sql+=" and khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ls_sql+=" and bj_khglfxb.glflbm='1' and bj_khglfxb.wlllbz='N' ";//ֻȡ�����࣬��������Ҫ��������

			
			ls_sql+=" order by wlbm";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				wlbm=cf.fillHtml(rs2.getString("wlbm"));
				wlllbz=cf.fillHtml(rs2.getString("wlllbz"));
				lx=cf.fillHtml(rs2.getString("lx"));
				glmc=cf.fillNull(rs2.getString("glmc"));
				pp=cf.fillHtml(rs2.getString("pp"));
				xhgg=cf.fillHtml(rs2.getString("xhgg"));
				cljldwmc=cf.fillNull(rs2.getString("cljldwmc"));
				ylclyl=rs2.getDouble("ylclyl");
				slclyl=rs2.getDouble("slclyl");
				dj=rs2.getDouble("dj");
				clf=rs2.getDouble("clf");


				if (rowspan==hjsl)//��ʼ�µı�����Ŀ
				{
					rowspan--;

					%>
					<tr align="center">
						<td rowspan="<%=hjsl%>"><%=bjxmxh%></td>
						<td rowspan="<%=hjsl%>"><%=bjlx%></td>
						<td rowspan="<%=hjsl%>"><%=xmbh%></td>
						<td rowspan="<%=hjsl%>"><%=xmmc%></td>
						<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=dwdj%></td>
						<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=hjje%></td>
						<td rowspan="<%=xjsl%>">����</td>
						<td rowspan="<%=xjsl%>" bgcolor="#E8E8FF"><%=clxjje%></td>
						<td><%=wlllbz%></td>
						<td><%=lx%></td>
						<td><%=wlbm%></td>
						<td><%=glmc%></td>
						<td><%=pp%></td>
						<td><%=xhgg%></td>
						<td><%=cljldwmc%></td>
						<td><%=dj%></td>
						<td><%=ylclyl%></td>
						<td><%=slclyl%></td>
						<td><%=clf%></td>
					</tr>
					<%
				}
				else{
					rowspan--;
					%>
					<tr align="center">
						<td><%=wlllbz%></td>
						<td><%=lx%></td>
						<td><%=wlbm%></td>
						<td><%=glmc%></td>
						<td><%=pp%></td>
						<td><%=xhgg%></td>
						<td><%=cljldwmc%></td>
						<td><%=dj%></td>
						<td><%=ylclyl%></td>
						<td><%=slclyl%></td>
						<td><%=clf%></td>
					</tr>
					<%
				}

			}
			rs2.close();
			ps2.close();

			if (xjsl==0)
			{
				%>
				<tr align="center">
					<td rowspan="<%=hjsl%>"><%=bjxmxh%></td>
					<td rowspan="<%=hjsl%>"><%=bjlx%></td>
					<td rowspan="<%=hjsl%>"><%=xmbh%></td>
					<td rowspan="<%=hjsl%>"><%=xmmc%></td>
					<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=dwdj%></td>
					<td rowspan="<%=hjsl%>" bgcolor="#E8E8FF"><%=hjje%></td>
					<td >�˹�</td>
					<td bgcolor="#E8E8FF"><%=rgxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<tr align="center">
					<td >��е</td>
					<td bgcolor="#E8E8FF"><%=jjxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<%
			}
			else{
				%>
				<tr align="center">
					<td >�˹�</td>
					<td bgcolor="#E8E8FF"><%=rgxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<tr align="center">
					<td >��е</td>
					<td bgcolor="#E8E8FF"><%=jjxjje%></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td colspan="9">&nbsp;</td>
				</tr>
				<%
			}

		}
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
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
</table>

</body>
</html>