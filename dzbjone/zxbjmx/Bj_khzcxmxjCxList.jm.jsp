<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int xmpx=0;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="130%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td width="7%">�ṹλ��</td>
	  <td width="16%">��������</td>
	  <td width="4%">����</td>
	  <td width="8%">����</td>
	  <td width="8%">��Ʒ���</td>
	  <td width="4%">��ѡ��</td>
	  <td width="4%">�ײ���</td>
	  <td width="4%">����</td>
	  <td width="5%">ʵ������</td>
	  <td width="5%">��������</td>
	  <td width="5%">��׼����</td>
	  <td width="4%">�����շ�</td>
	<td  width="4%">�Ƿ�ɼ���</td>
	<td  width="5%">�����������</td>
	<td  width="5%">ʵ�ʼ�������</td>
	<td  width="4%">�Ƿ�ɸ���</td>
	<td  width="5%">�ɻ��������</td>
	</tr>

	<tr bgcolor="#FFCCCC" align="center" height="25">
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>�ײ�ѡ������</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><a>ѡ��</a></td>
	  
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>

	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFCCCC" align="center" height="25">
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>���䵥���շ�</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><a>ѡ��</a></td>
	  
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>

	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
<%
  
	String jgwzbm=null;
	String tccplbbm=null;
	String tccplbmc=null;
	double sjsl=0;
	double bzsl=0;
	String sfxzsl=null;
	String sfbxx=null;
	String sfyxsj=null;
	String sfyxsjMc=null;
	String bjjbmc=null;
	String khbjjbbm=null;
	String zcbjjbbm=null;
	String tcsjflbm=null;
	String tcsjflmc=null;
	String sjsfycx=null;
	double sjjmsl=0;

	ls_sql="SELECT distinct jgwzbm";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"'";
    ls_sql+=" order by bj_khzcxmxj.jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		//ͬ���䡾���������
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int row=0;//ͬ�������к�

		ls_sql="SELECT distinct bj_khzcxmxj.tcsjflbm,tcsjflmc";
		ls_sql+=" FROM bj_khzcxmxj,bj_tcsjflbm ";
		ls_sql+=" where bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm";
		ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by bj_khzcxmxj.tcsjflbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			tcsjflbm=rs2.getString("tcsjflbm");
			tcsjflmc=cf.fillNull(rs2.getString("tcsjflmc"));


			//ͬ�������ࡾ���������
			int count1=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_khzcxmxj";
			ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm='"+tcsjflbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count1=rs.getInt(1);
			}
			rs.close();
			ps.close();

			int row1=0;
			
			//�ײ������������:��Ϊ��
			String jldw=null;
			String sfkjm=null;
			String sfkjmStr=null;
			double yxjmzdsl=0;
			String sfkgh=null;
			String sfkghStr=null;
			double khzdsl=0;
			ls_sql="SELECT bj_khzcxmxj.sjsfycx,bj_khzcxmxj.khbjjbbm,bj_khzcxmxj.bjjbbm,bj_khzcxmxj.tccplbbm,clxlmc,sjsl,bzsl,DECODE(bj_khzcxmxj.sfxzsl,'1','�����Ӽ�','2','���ɳ���','3','������') sfxzsl,DECODE(sfbxx,'Y','��ѡ','N','') sfbxx,sfyxsj,DECODE(sfyxsj,'Y','�շ�','N','��') sfyxsjMc";
			ls_sql+=" ,sjjmsl,jldw,bj_khzcxmxj.sfkjm,DECODE(bj_khzcxmxj.sfkjm,'1','����','2','�ɼ���') sfkjmStr,bj_khzcxmxj.yxjmzdsl,sfkgh,DECODE(sfkgh,'1','���ɻ�','2','�ɻ�') sfkghStr,khzdsl";
			ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+)  ";
			ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm='"+tcsjflbm+"'";
			ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khzcxmxj.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				sjsfycx=cf.fillNull(rs.getString("sjsfycx"));
				tccplbbm=rs.getString("tccplbbm");
				tccplbmc=rs.getString("clxlmc");
				sjsl=rs.getDouble("sjsl");
				bzsl=rs.getDouble("bzsl");
				sfxzsl=rs.getString("sfxzsl");
				sfbxx=cf.fillNull(rs.getString("sfbxx"));
				sfyxsj=rs.getString("sfyxsj");
				sfyxsjMc=rs.getString("sfyxsjMc");
//				bjjbmc=rs.getString("bjjbmc");
				khbjjbbm=rs.getString("khbjjbbm");
				zcbjjbbm=rs.getString("bjjbbm");

				sjjmsl=rs.getDouble("sjjmsl");
				jldw=cf.fillNull(rs.getString("jldw"));
				sfkjm=cf.fillNull(rs.getString("sfkjm"));
				sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
				yxjmzdsl=rs.getDouble("yxjmzdsl");
				sfkgh=cf.fillNull(rs.getString("sfkgh"));
				sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
				khzdsl=rs.getDouble("khzdsl");

				ls_sql="SELECT bjjbmc";
				ls_sql+=" FROM bdm_bjjbbm";
				ls_sql+=" where bjjbbm='"+zcbjjbbm+"'";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					bjjbmc=rs3.getString(1);
				}
				rs3.close();
				ps3.close();

				if (sjsfycx.equals("2") || sjsfycx.equals("3"))//1���޴�����2�����������ƴ�����3�����������ƴ���
				{
					bjjbmc=bjjbmc+"(����)";
				}

				row++;
				row1++;

				if (row%2==0)
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}

				if (!khbjjbbm.equals(zcbjjbbm))
				{
					bjjbmc="<font color=\"#FF0000\"><B>"+bjjbmc+"</B></font>";
				}

				if (row==1)//�����ڵ�һ��
				{
					//���ÿ������
					%>
					<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="<%=count%>"><%=jgwzbm%></td>
					  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>��
						  <a href="zcsj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">����</a>
						  <a href="zcjj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">����</a>
						  <a href="hyjb.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">��ԭ</a>
					  </td>
<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						if (sjjmsl>0)//�Ѽ���
						{
							%>
							  <td  rowspan="<%=count1%>"><a href="qxzcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">ȡ������</a></td>
							<%
						}
						else{
							%>
							  <td  rowspan="<%=count1%>"><a href="zcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">����</a></td>
							<%
						}
					}
					else{
						%>
						<td rowspan="<%=count1%>">&nbsp;</td>
						<%
					}

%>							

					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">�ײ���ѡ��</a></td>
<%
					if (sfkgh.equals("2"))//1�����ɻ���2���ɻ�
					{
						%>
					  <td><a href="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
						  
%>
					  
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					  <td><%=khzdsl%></td>
					</tr>
					<%
				}
				else{
					if (row1==1)//���������һ��
					{
						//���ÿ������
						%>
						<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td align="right"  rowspan="<%=count1%>"><%=tcsjflmc%>��
							  <a href="zcsj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">����</a>
							  <a href="zcjj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">����</a>
							  <a href="hyjb.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>">��ԭ</a>
						  </td>
<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						if (sjjmsl>0)//�Ѽ���
						{
							%>
							  <td  rowspan="<%=count1%>"><a href="qxzcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">ȡ������</a></td>
							<%
						}
						else{
							%>
							  <td  rowspan="<%=count1%>"><a href="zcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">����</a></td>
							<%
						}
					}
					else{
						%>
						<td rowspan="<%=count1%>">&nbsp;</td>
						<%
					}

%>							
						
						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">�ײ���ѡ��</a></td>
<%
					if (sfkgh.equals("2"))//1�����ɻ���2���ɻ�
					{
						%>
					  <td><a href="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
						  
%>
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					  <td><%=khzdsl%></td>
						</tr>
						<%
					}
					else{
						//���ÿ������
						%>
						<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
						  <td><%=bjjbmc%></td>
						  <td><%=tccplbmc%></td>
						  <td><%=sfbxx%></td>
						  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">�ײ���ѡ��</a></td>
<%
					if (sfkgh.equals("2"))//1�����ɻ���2���ɻ�
					{
						%>
					  <td><a href="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
						  
%>
						  <td><%=sjsl%></td>
						  <td><%=sfxzsl%></td>
						  <td><%=bzsl%></td>
						  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					  <td><%=khzdsl%></td>
						</tr>
						<%
					}
				}

			}
			rs.close();
			ps.close();
		}
		rs2.close();
		ps2.close();

		//�����ײ�����������롿Ϊ�գ�����������
		int count1=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm is null";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int row1=0;
		String jldw=null;
		String sfkjm=null;
		String sfkjmStr=null;
		double yxjmzdsl=0;
		String sfkgh=null;
		String sfkghStr=null;
		double khzdsl=0;
		ls_sql="SELECT bj_khzcxmxj.khbjjbbm,bj_khzcxmxj.bjjbbm,bj_khzcxmxj.tccplbbm,clxlmc,sjsl,bzsl,DECODE(bj_khzcxmxj.sfxzsl,'1','�����Ӽ�','2','���ɳ���','3','������') sfxzsl,DECODE(sfbxx,'Y','��ѡ','N','') sfbxx,sfyxsj,DECODE(sfyxsj,'Y','�շ�','N','��') sfyxsjMc";
		ls_sql+=" ,sjjmsl,jldw,bj_khzcxmxj.sfkjm,DECODE(bj_khzcxmxj.sfkjm,'1','����','2','�ɼ���') sfkjmStr,bj_khzcxmxj.yxjmzdsl,sfkgh,DECODE(sfkgh,'1','���ɻ�','2','�ɻ�') sfkghStr,khzdsl";
		ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
		ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+)  ";
		ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.jgwzbm='"+jgwzbm+"' and bj_khzcxmxj.tcsjflbm is null";
		ls_sql+=" order by jxc_clxlbm.cldlmc,bj_khzcxmxj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccplbmc=rs.getString("clxlmc");
			sjsl=rs.getDouble("sjsl");
			bzsl=rs.getDouble("bzsl");
			sfxzsl=rs.getString("sfxzsl");
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfyxsj=rs.getString("sfyxsj");
			sfyxsjMc=rs.getString("sfyxsjMc");
			khbjjbbm=rs.getString("khbjjbbm");
			zcbjjbbm=rs.getString("bjjbbm");

			sjjmsl=rs.getDouble("sjjmsl");
			jldw=cf.fillNull(rs.getString("jldw"));
			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
			yxjmzdsl=rs.getDouble("yxjmzdsl");
			sfkgh=cf.fillNull(rs.getString("sfkgh"));
			sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
			khzdsl=rs.getDouble("khzdsl");

			ls_sql="SELECT bjjbmc";
			ls_sql+=" FROM bdm_bjjbbm";
			ls_sql+=" where bjjbbm='"+zcbjjbbm+"'";
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			if (rs3.next())
			{
				bjjbmc=rs3.getString(1);
			}
			rs3.close();
			ps3.close();

			row++;
			row1++;

			if (row%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			if (!khbjjbbm.equals(zcbjjbbm))
			{
				bjjbmc="<font color=\"#FF0000\"><B>"+bjjbmc+"</B></font>";
			}
          
			if (row==1)//��һ��
			{
				//���ÿ������
				%>
				<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=count%>"><%=jgwzbm%></td>
				  <td rowspan="<%=count1%>">&nbsp;</td>
<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
					  <td ><a href="zcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
%>
				  <td><%=bjjbmc%></td>
				  <td><%=tccplbmc%></td>
				  <td><%=sfbxx%></td>
				  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">�ײ���ѡ��</a></td>
<%
					if (sfkgh.equals("2"))//1�����ɻ���2���ɻ�
					{
						%>
					  <td><a href="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
						  
%>
				  <td><%=sjsl%></td>
				  <td><%=sfxzsl%></td>
				  <td><%=bzsl%></td>
				  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					  <td><%=khzdsl%></td>
				</tr>
				<%
			}
			else{
				if (row1==1)
				{
					//���ÿ������
					%>
					<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
					  <td rowspan="<%=count1%>">&nbsp;</td>
					
<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						if (sjjmsl>0)
						{
							%>
							  <td ><a href="qxzcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">ȡ������</a></td>
							<%
						}
						else{
							%>
							  <td  ><a href="zcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">����</a></td>
							<%
						}
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
%>
					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">�ײ���ѡ��</a></td>
<%
					if (sfkgh.equals("2"))//1�����ɻ���2���ɻ�
					{
						%>
					  <td><a href="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
					  
%>
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					  <td><%=khzdsl%></td>
					</tr>
					<%
				}
				else{
					//���ÿ������
					%>
					<tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						if (sjjmsl>0)
						{
							%>
							  <td ><a href="qxzcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">ȡ������</a></td>
							<%
						}
						else{
							%>
							  <td ><a href="zcjm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tcsjflbm=<%=tcsjflbm%>" target="_blank">����</a></td>
							<%
						}
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
%>
					  <td><%=bjjbmc%></td>
					  <td><%=tccplbmc%></td>
					  <td><%=sfbxx%></td>
					  <td><a href="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">�ײ���ѡ��</a></td>
<%
					if (sfkgh.equals("2"))//1�����ɻ���2���ɻ�
					{
						%>
					  <td><a href="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						<td>&nbsp;</td>
						<%
					}
%>
					  <td><%=sjsl%></td>
					  <td><%=sfxzsl%></td>
					  <td><%=bzsl%></td>
					  <td><%=sfyxsjMc%></td>

					  <td><%=sfkjmStr%></td>
					  <td><%=yxjmzdsl%></td>
					  <td><%=sjjmsl%></td>
					  <td><%=sfkghStr%></td>
					  <td><%=khzdsl%></td>
					</tr>
					<%
				}
			}

		}
		rs.close();
		ps.close();
		  
	}
	rs1.close();
	ps1.close();

}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
      </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

