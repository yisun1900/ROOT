<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
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
String ls_sql=null;
String bgcolor="";


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

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;'  >
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="0000526" >

  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td width="3%" >���</td>
	  <td width="9%" >����</td>
	  <td width="11%" >����</td>
	  <td width="14%" >��ƷС��</td>
	  <td width="7%" >�Ƿ�װ����</td>
	  <td width="7%" >�Ƿ��ѡ��</td>
	  <td width="7%" >��װ����</td>
	  <td width="7%" >��ѡ������</td>
	  <td width="7%" >����</td>
	  <td width="7%" >�Ѽ�������</td>
	  <td width="8%" >�Ƿ���������</td>
	  <td width="7%" >�����������</td>
	  <td width="8%" >�����շ�</td>
    </tr>

<%
	String tccplbbm=null;
	String tccpdlbm=null;
	String clxlmc=null;
	String cldlmc=null;
	String jgwzbm=null;
	String lx=null;
	double zdsl=0;//��׼����
	double sjjmsl=0;//ʵ�ʼ�������
	double sjsl=0;//ʵ������
	String sjslStr="";
	String sjjmslStr="";
	String sfxzsl=null;
	String tcnbz=null;
	String sfbxx=null;
	String sfxzslMc=null;
	String tcnbzMc=null;
	String sfbxxMc=null;
	String sfkjm=null;

	int hbsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhmmjmj ";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	
	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,zdsl,sjjmsl,sjsl ";
	ls_sql+=" ,tc_csrjkhmmjmj.sfkjm,tc_csrjkhmmjmj.sfxzsl,tc_csrjkhmmjmj.tcnbz,tc_csrjkhmmjmj.sfbxx,DECODE(tc_csrjkhmmjmj.sfxzsl,'1','����','2','����','3','�����շ�') sfxzslMc,DECODE(tc_csrjkhmmjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhmmjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
	ls_sql+=" from  tc_csrjkhmmjmj,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_csrjkhmmjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhmmjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		zdsl=rs.getDouble("zdsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}

		%>
		<tr height="27" bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">һ</td>
		  <td rowspan="<%=hbsl%>" align="center">��</td>
		  <td rowspan="<%=hbsl%>" align="center">&nbsp;</td>
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td><a href="zcjmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=cf.formatDouble(zdsl)%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmMmCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		zdsl=rs.getDouble("zdsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}

		%>
		<tr height="27" bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td><a href="zcjmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=cf.formatDouble(zdsl)%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmMmCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();


	//����ʼ:��������������������������������������������������������������
	hbsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhcgjmj ";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int row=0;

	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_csrjkhcgjmj";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		int fjhbsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_csrjkhcgjmj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjhbsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,jgwzbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
		ls_sql+=" ,zdsl,sjjmsl,sjsl";
		ls_sql+=" ,tc_csrjkhcgjmj.sfkjm,tc_csrjkhcgjmj.sfxzsl,tc_csrjkhcgjmj.tcnbz,tc_csrjkhcgjmj.sfbxx,DECODE(tc_csrjkhcgjmj.sfxzsl,'1','����','2','����','3','�����շ�') sfxzslMc,DECODE(tc_csrjkhcgjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhcgjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
		ls_sql+=" from  tc_csrjkhcgjmj,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_csrjkhcgjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhcgjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			jgwzbm=rs.getString("jgwzbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			zdsl=rs.getDouble("zdsl");
			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}

			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;

			if (row==1)//��һ��
			{
				%>
				<tr height="27" bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=hbsl%>" align="center">��</td>
				  <td rowspan="<%=hbsl%>" align="center">����</td>
				  <td rowspan="<%=fjhbsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
						  <td><a href="zcjmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td><%=sfxzslMc%></td>
				  <td><%=cf.formatDouble(zdsl)%></td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						%>
						  <td><a href="InsertBj_khzcxmCgCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}
			else{
				%>
				<tr height="27" bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=fjhbsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
						  <td align="center"><a href="zcjmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td><%=sfxzslMc%></td>
				  <td><%=cf.formatDouble(zdsl)%></td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						%>
						  <td><a href="InsertBj_khzcxmCgCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}
		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			zdsl=rs.getDouble("zdsl");
			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}

			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;

			%>
			<tr height="27" bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td align="center"><%=clxlmc%></td>
			  <td><%=tcnbzMc%></td>
			  <td><%=sfbxxMc%></td>
			<%
				if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
				{
					%>
					  <td><a href="InsertBj_khzcxmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			  <td><%=sjslStr%></td>
			<%
				if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
				{
					%>
					  <td align="center"><a href="zcjmCg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			  <td><%=sjjmslStr%></td>
			  <td><%=sfxzslMc%></td>
			  <td><%=cf.formatDouble(zdsl)%></td>
			<%
				if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
				{
					%>
					  <td><a href="InsertBj_khzcxmCgCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();

	//��߿�ʼ:��������������������������������������������������������������

	hbsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhjjjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	row=0;
	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_csrjkhjjjmj";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		int fjhbsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_csrjkhjjjmj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjhbsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
		ls_sql+=" ,sjjmsl,sjsl,bzsl";
		ls_sql+=" ,tc_csrjkhjjjmj.sfkjm,tc_csrjkhjjjmj.sfxzsl,tc_csrjkhjjjmj.tcnbz,tc_csrjkhjjjmj.sfbxx,DECODE(tc_csrjkhjjjmj.sfxzsl,'1','����','2','����','3','�����շ�') sfxzslMc,DECODE(tc_csrjkhjjjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhjjjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
		ls_sql+=" from  tc_csrjkhjjjmj,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_csrjkhjjjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhjjjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			zdsl=rs.getDouble("bzsl");
			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}

			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;

			if (row==1)//��һ��
			{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=hbsl%>" align="center">��</td>
				  <td rowspan="<%=hbsl%>" align="center">���</td>
				  <td align="center" rowspan="<%=fjhbsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
						  <td align="center"><a href="zcjmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td><%=sfxzslMc%></td>
				  <td><%=zdsl%></td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						%>
						  <td><a href="InsertBj_khzcxmJjCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center" rowspan="<%=fjhbsl%>"><%=jgwzbm%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
						  <td align="center"><a href="zcjmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td><%=sfxzslMc%></td>
				  <td><%=zdsl%></td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						%>
						  <td><a href="InsertBj_khzcxmJjCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}

		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}

			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;

			%>
			<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td align="center"><%=clxlmc%></td>
			  <td><%=tcnbzMc%></td>
			  <td><%=sfbxxMc%></td>
			<%
				if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
				{
					%>
					  <td><a href="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			  <td><%=sjslStr%></td>
			<%
				if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
				{
					%>
					  <td align="center"><a href="zcjmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			  <td><%=sjjmslStr%></td>
			  <td><%=sfxzslMc%></td>
			  <td><%=zdsl%></td>
			<%
				if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
				{
					%>
					  <td><a href="InsertBj_khzcxmJjCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();


	sfxzsl="3";


	//��ש��ʼ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhczjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	row=0;
	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_csrjkhczjmj";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		String fjmjStr="";
		int fjmj=0;
		ls_sql="select fjmj";
		ls_sql+=" from  bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjmj=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (fjmj!=0)
		{
			fjmjStr="("+fjmj+"�O)";
		}

		int fjhbsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_csrjkhczjmj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjhbsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
		ls_sql+=" ,sjjmsl,sjsl";
		ls_sql+=" ,tc_csrjkhczjmj.sfkjm,tc_csrjkhczjmj.tcnbz,tc_csrjkhczjmj.sfbxx,DECODE(tc_csrjkhczjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhczjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
		ls_sql+=" from  tc_csrjkhczjmj,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_csrjkhczjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhczjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}


			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;


			if (row==1)
			{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=hbsl%>" align="center">��</td>
				  <td rowspan="<%=hbsl%>" align="center">��ש</td>
				  <td align="center" rowspan="<%=fjhbsl%>" ><%=jgwzbm%><%=fjmjStr%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td><a href="InsertBj_khzcxmCzQt.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
						else{
							%>
							  <td><a href="InsertBj_khzcxmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td align="center"><a href="zcjmCzQt.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
							<%
						}
						else{
							%>
							  <td align="center"><a href="zcjmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td>����</td>
				  <td>&nbsp</td>
			<%
				if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
				{
					if (jgwzbm.equals("����"))
					{
						%>
						  <td><a href="InsertBj_khzcxmCzQtCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td><a href="InsertBj_khzcxmCzCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center" rowspan="<%=fjhbsl%>" ><%=jgwzbm%><%=fjmjStr%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td><a href="InsertBj_khzcxmCzQt.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
						else{
							%>
							  <td><a href="InsertBj_khzcxmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td align="center"><a href="zcjmCzQt.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
							<%
						}
						else{
							%>
							  <td align="center"><a href="zcjmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td>����</td>
				  <td>&nbsp</td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td><a href="InsertBj_khzcxmCzQtCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
						else{
							%>
							  <td><a href="InsertBj_khzcxmCzCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}
		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}


			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;


			%>
			<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td align="center"><%=clxlmc%></td>
			  <td><%=tcnbzMc%></td>
			  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td><a href="InsertBj_khzcxmCzQt.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
						else{
							%>
							  <td><a href="InsertBj_khzcxmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
			  <td><%=sjslStr%></td>
			<%
				if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
				{
					if (jgwzbm.equals("����"))
					{
						%>
						  <td align="center"><a href="zcjmCzQt.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td align="center"><a href="zcjmCz.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
				  <td><%=sjjmslStr%></td>
			  <td>����</td>
			  <td>&nbsp</td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						if (jgwzbm.equals("����"))
						{
							%>
							  <td><a href="InsertBj_khzcxmCzQtCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
						else{
							%>
							  <td><a href="InsertBj_khzcxmCzCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
							<%
						}
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();

	sfxzsl="3";

	//���۰忪ʼ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhlkbjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	row=0;
	ls_sql="select distinct jgwzbm";
	ls_sql+=" from  tc_csrjkhlkbjmj";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by jgwzbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=rs1.getString("jgwzbm");

		String fjmjStr="";
		int fjmj=0;
		ls_sql="select fjmj";
		ls_sql+=" from  bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjmj=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (fjmj!=0)
		{
			fjmjStr="("+fjmj+"�O)";
		}

		int fjhbsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  tc_csrjkhlkbjmj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fjhbsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
		ls_sql+=" ,sjjmsl,sjsl";
		ls_sql+=" ,tc_csrjkhlkbjmj.sfkjm,tc_csrjkhlkbjmj.tcnbz,tc_csrjkhlkbjmj.sfbxx,DECODE(tc_csrjkhlkbjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhlkbjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
		ls_sql+=" from  tc_csrjkhlkbjmj,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where tc_csrjkhlkbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhlkbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" order by  tccpdlbm,tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			sfkjm=cf.fillNull(rs.getString("sfkjm"));
			tcnbz=cf.fillNull(rs.getString("tcnbz"));
			sfbxx=cf.fillNull(rs.getString("sfbxx"));
			tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
			sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}

			if (sjjmsl!=0)
			{
				sjjmslStr=sjjmsl+"";
			}
			else{
				sjjmslStr="";
			}

			row++;

			if (row==1)
			{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td rowspan="<%=hbsl%>" align="center">��</td>
				  <td rowspan="<%=hbsl%>" align="center">���۰�</td>
				  <td align="center" rowspan="<%=fjhbsl%>"><%=jgwzbm%><%=fjmjStr%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmLkb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
						  <td align="center"><a href="zcjmLkb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td>����</td>
				  <td>&nbsp</td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						%>
						  <td><a href="InsertBj_khzcxmLkbCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				  <td align="center" rowspan="<%=fjhbsl%>"><%=jgwzbm%><%=fjmjStr%></td>
				  <td align="center"><%=clxlmc%></td>
				  <td><%=tcnbzMc%></td>
				  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmLkb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjslStr%></td>
				<%
					if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
					{
						%>
						  <td align="center"><a href="zcjmLkb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				  <td><%=sjjmslStr%></td>
				  <td>����</td>
				  <td>&nbsp</td>
				<%
					if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
					{
						%>
						  <td><a href="InsertBj_khzcxmLkbCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
				</tr>
				<%
			}
		}

		while (rs.next())
		{
			tccplbbm=rs.getString("tccplbbm");
			tccpdlbm=rs.getString("tccpdlbm");
			clxlmc=rs.getString("clxlmc");
			cldlmc=rs.getString("cldlmc");

			sjjmsl=rs.getDouble("sjjmsl");
			sjsl=rs.getDouble("sjsl");

			if (sjsl!=0)
			{
				sjslStr=sjsl+"";
			}
			else{
				sjslStr="";
			}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}

			row++;


			%>
			<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td align="center"><%=clxlmc%></td>
			  <td><%=tcnbzMc%></td>
			  <td><%=sfbxxMc%></td>
				<%
					if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
					{
						%>
						  <td><a href="InsertBj_khzcxmLkb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
						<%
					}
					else{
						%>
						  <td>&nbsp;</td>
						<%
					}
				%>
			  <td><%=sjslStr%></td>
			<%
				if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
				{
					%>
					  <td align="center"><a href="zcjmLkb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">����</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			  <td><%=sjjmslStr%></td>
			  <td>����</td>
			  <td>&nbsp</td>
			<%
				if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
				{
					%>
					  <td><a href="InsertBj_khzcxmLkbCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>" target="_blank">ѡ��</a></td>
					<%
				}
				else{
					%>
					  <td>&nbsp;</td>
					<%
				}
			%>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();

	sfxzsl="3";

	//�ذ忪ʼ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhdbjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,sjjmsl,sjsl";
	ls_sql+=" ,tc_csrjkhdbjmj.sfkjm,tc_csrjkhdbjmj.tcnbz,tc_csrjkhdbjmj.sfbxx,DECODE(tc_csrjkhdbjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhdbjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
	ls_sql+=" from  tc_csrjkhdbjmj,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_csrjkhdbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhdbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">��</td>
		  <td rowspan="<%=hbsl%>" align="center">�ذ�</td>
		  <td rowspan="<%=hbsl%>" align="center">&nbsp;</td>
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmDb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmDb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td>����</td>
		  <td>&nbsp</td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmDbCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmDb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmDb.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td>����</td>
		  <td>&nbsp</td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmDbCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	

	//�¹�ʼ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhygjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,sjjmsl,zdpms,sjpms";
	ls_sql+=" ,tc_csrjkhygjmj.sfkjm,tc_csrjkhygjmj.sfxzsl,tc_csrjkhygjmj.tcnbz,tc_csrjkhygjmj.sfbxx,DECODE(tc_csrjkhygjmj.sfxzsl,'1','����','2','����','3','�����շ�') sfxzslMc,DECODE(tc_csrjkhygjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhygjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
	ls_sql+=" from  tc_csrjkhygjmj,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_csrjkhygjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhygjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		zdsl=rs.getDouble("zdpms");
		sjsl=rs.getDouble("sjpms");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">��</td>
		  <td rowspan="<%=hbsl%>" align="center">�Ҿ�</td>
		  <td rowspan="<%=hbsl%>" align="center">&nbsp;</td>
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmYg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmYg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=zdsl%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmYgCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		zdsl=rs.getDouble("zdpms");
		sjsl=rs.getDouble("sjpms");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmYg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmYg.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=zdsl%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmYgCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();


	//��������ʼ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhwjdqjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,sjjmsl,bzsl,sjsl";
	ls_sql+=" ,tc_csrjkhwjdqjmj.sfkjm,tc_csrjkhwjdqjmj.sfxzsl,tc_csrjkhwjdqjmj.tcnbz,tc_csrjkhwjdqjmj.sfbxx,DECODE(tc_csrjkhwjdqjmj.sfxzsl,'1','����','2','����','3','�����շ�') sfxzslMc,DECODE(tc_csrjkhwjdqjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhwjdqjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
	ls_sql+=" from  tc_csrjkhwjdqjmj,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_csrjkhwjdqjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhwjdqjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		zdsl=rs.getDouble("bzsl");
		sjsl=rs.getDouble("sjsl");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">��</td>
		  <td rowspan="<%=hbsl%>" align="center">������</td>
		  <td rowspan="<%=hbsl%>" align="center">&nbsp;</td>
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmWj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmWj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=zdsl%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmWjCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		zdsl=rs.getInt("bzsl");
		sjsl=rs.getInt("sjsl");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmWj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmWj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=zdsl%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmWjCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	

	//����ʯ��ʼ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhgmsjmj";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,sjjmsl,zdpms,sjpms";
	ls_sql+=" ,tc_csrjkhgmsjmj.sfkjm,tc_csrjkhgmsjmj.sfxzsl,tc_csrjkhgmsjmj.tcnbz,tc_csrjkhgmsjmj.sfbxx,DECODE(tc_csrjkhgmsjmj.sfxzsl,'1','����','2','����','3','�����շ�') sfxzslMc,DECODE(tc_csrjkhgmsjmj.tcnbz,'Y','��װ��','N','��') tcnbzMc,DECODE(tc_csrjkhgmsjmj.sfbxx,'Y','��ѡ','N','��') sfbxxMc";
	ls_sql+=" from  tc_csrjkhgmsjmj,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_csrjkhgmsjmj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhgmsjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		zdsl=rs.getDouble("zdpms");
		sjsl=rs.getDouble("sjpms");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">��</td>
		  <td rowspan="<%=hbsl%>" align="center">ʯ��</td>
		  <td rowspan="<%=hbsl%>" align="center">&nbsp;</td>
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmGms.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmGms.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=zdsl%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmGmsCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjjmsl=rs.getDouble("sjjmsl");
		zdsl=rs.getDouble("zdpms");
		sjsl=rs.getDouble("sjpms");

		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcnbz=cf.fillNull(rs.getString("tcnbz"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfxzslMc=cf.fillNull(rs.getString("sfxzslMc"));
		tcnbzMc=cf.fillNull(rs.getString("tcnbzMc"));
		sfbxxMc=cf.fillNull(rs.getString("sfbxxMc"));

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}

		if (sjjmsl!=0)
		{
			sjjmslStr=sjjmsl+"";
		}
		else{
			sjjmslStr="";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td><%=tcnbzMc%></td>
		  <td><%=sfbxxMc%></td>
		<%
			if (tcnbz.equals("Y"))//Y���ײ��ڣ�N���ײ���
			{
				%>
				  <td><a href="InsertBj_khzcxmGms.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjslStr%></td>
		<%
			if (sfkjm.equals("2"))//1�����ɼ��⣻2���ɼ���
			{
				%>
				  <td align="center"><a href="zcjmGms.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">����</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		  <td><%=sjjmslStr%></td>
		  <td><%=sfxzslMc%></td>
		  <td><%=zdsl%></td>
		<%
			if (sfxzsl.equals("3"))//1�������ƣ�2����������3�����������շ�
			{
				%>
				  <td><a href="InsertBj_khzcxmGmsCl.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
				<%
			}
			else{
				%>
				  <td>&nbsp;</td>
				<%
			}
		%>
		</tr>
		<%
	}
	rs.close();
	ps.close();




	//�����ײ�����Ŀ:��������������������������������������������������������������
	ls_sql="select count(*)";
	ls_sql+=" from  tc_csrjkhcytcwxm";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select tccplbbm,tccpdlbm,jxc_clxlbm.clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" ,sjsl ";
	ls_sql+=" from  tc_csrjkhcytcwxm,jxc_cldlbm,jxc_clxlbm";
    ls_sql+=" where tc_csrjkhcytcwxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and tc_csrjkhcytcwxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
    ls_sql+=" order by tccpdlbm,tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjsl=rs.getDouble("sjsl");


		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}



		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=hbsl%>" align="center">ʮ</td>
		  <td rowspan="<%=hbsl%>" align="center" colspan="2">�����ײ�����Ŀ</td>
		  <td align="center"><%=clxlmc%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=sjslStr%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><a href="InsertBj_khzcxmTwzc.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
		</tr>
		<%
	}

	while (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		tccpdlbm=rs.getString("tccpdlbm");
		clxlmc=rs.getString("clxlmc");
		cldlmc=rs.getString("cldlmc");

		sjsl=rs.getDouble("sjsl");

		if (sjsl!=0)
		{
			sjslStr=sjsl+"";
		}
		else{
			sjslStr="";
		}



		%>
		<tr bgcolor="#FFFFFF" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td align="center"><%=clxlmc%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=sjslStr%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><a href="InsertBj_khzcxmTwzc.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>" target="_blank">ѡ��</a></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>	


  </table>

</form>
</body>
</html>

<%
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



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

