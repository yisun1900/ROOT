<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "����";
}
.STYLE8 {color: #CC0033; font-weight: bold; }
.STYLE10 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>


<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<form method="post" action="SaveEditSjQkCrm_xmrwgl.jsp" name="insertform">
<center><span class="STYLE2">��Ŀ����</span>  </center>
  <table border="1" cellspacing="0" cellpadding="1" width="200%" style='FONT-SIZE: 12px' >
    <tr align="center" bgcolor="#FFFFCC" height="25"> 
		<td width="2%"><B>���</B></td>
		<td width="2%">&nbsp;</td>
		<td width="10%"><B>��������</B></td>
		<td width="4%"><B>ԭ��ʼʱ��</B></td>
		<td width="4%"><B>ԭ����ʱ��</B></td>
		<td width="2%"><B>ԭ����</B></td>
		<td width="4%"><span class="STYLE10">�ƻ���ʼʱ��</span></td>
		<td width="4%"><span class="STYLE10">�ƻ�����ʱ��</span></td>
		<td width="2%"><span class="STYLE10">�ƻ�����</span></td>
		<td width="4%"><span class="STYLE8">ʵ�ʿ�ʼʱ��</span></td>
		<td width="4%"><span class="STYLE8">ʵ�ʽ���ʱ��</span></td>
		<td width="2%"><span class="STYLE8">ʵ�ʹ���</span></td>
		<td ><B>�߼���ϵ</B></td>
	</tr>
<%

	int count=0;
	int rwxh=0;
	String rwbm=null;
	String rwmc=null;
	int changdu=0;
	int jishu=0;
	int jishucd=0;
	int jgchangdu=0;
	String csjhkssj="";
	String csjhjssj="";
	int csjhgzr=0;
	String jhkssj="";
	String jhjssj="";
	int jhgzr=0;
	String sjkssj="";
	String sjjssj="";
	int sjgzr=0;
	
	ls_sql="update crm_xmrwgl set changdu=length(rwmc)+1,jishu=1";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��ȡ������������������������������������������������������ʼ
	ls_sql="select rwbm,jishu ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		jishu=rs.getInt("jishu");

		int maxjishu=0;
		ls_sql="select max(crm_xmrwgl.jishu)+1 ";
		ls_sql+=" from  crm_xmrwljgx,crm_xmrwgl";
		ls_sql+=" where  crm_xmrwljgx.qzrwbm=crm_xmrwgl.rwbm and crm_xmrwljgx.rwbm='"+rwbm+"'";
		ls_sql+=" and  crm_xmrwgl.khbh='"+khbh+"'";
		ls_sql+=" and  crm_xmrwljgx.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			maxjishu=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (maxjishu==0)
		{
			maxjishu=1;
		}

		ls_sql="update crm_xmrwgl set jishu="+maxjishu;
		ls_sql+=" where  rwbm='"+rwbm+"' and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//��ȡ�������������������������������������������������������

	//����������ȣ�����ǰ�á������������ӿ�ȣ�ÿ����2������������������������������������������������ʼ
	ls_sql="select rwbm,jishu,changdu";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by jishu";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=rs.getString("rwbm");
		jishu=rs.getInt("jishu");
		changdu=rs.getInt("changdu");


		//�жϱ����Ƿ���ǰ������
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  rwbm in(select rwbm from crm_xmrwgl where jishu="+jishu+" and khbh='"+khbh+"')";
		ls_sql+=" and  khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//�м�2
		{
			changdu+=2;
		}

		//�жϱ����Ƿ��к�������
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  qzrwbm in(select rwbm from crm_xmrwgl where jishu="+jishu+" and khbh='"+khbh+"')";
		ls_sql+=" and  khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//�м�2
		{
			changdu+=1;
		}

		ls_sql="update crm_xmrwgl set jgchangdu="+changdu;
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ls_sql+=" and  khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//����������ȣ�����ǰ�á������������ӿ�ȣ�ÿ����2�������������������������������������������������

	//��ȡ���������ȣ�����������������������������������������������ʼ
	ls_sql="select rwbm,jishu ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		jishu=rs.getInt("jishu");

		int maxjgchangdu=0;
		ls_sql="select max(crm_xmrwgl.jgchangdu)";
		ls_sql+=" from  crm_xmrwgl";
		ls_sql+=" where  jishu="+jishu+" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			maxjgchangdu=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="update crm_xmrwgl set jishucd="+maxjgchangdu;
		ls_sql+=" where  rwbm='"+rwbm+"' and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	//��ȡ���������ȣ������������������������������������������������




	//��ȡ��ÿ���ۼƿ�ȣ�����������������������������������������������ʼ
	int maxjishu=0;
	ls_sql="select max(crm_xmrwgl.jishu)";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		maxjishu=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//ÿ�����
	int perjikd[]=new int[maxjishu];
	int row=0;
	ls_sql="select distinct jishu,jishucd";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ls_sql+=" order by jishu";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jishu=rs.getInt(1);
		jishucd=rs.getInt(2);

		perjikd[row]=jishucd;

		row++;
	}
	rs.close();
	ps.close();

	//��ȡ��ÿ���ۼƿ�ȣ������������������������������������������������


	ls_sql="update crm_xmrwljgx set rwjs=(select jishu from crm_xmrwgl where crm_xmrwgl.rwbm=crm_xmrwljgx.rwbm and crm_xmrwgl.khbh='"+khbh+"')";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_xmrwljgx set qzrwjs=(select jishu from crm_xmrwgl where crm_xmrwgl.rwbm=crm_xmrwljgx.qzrwbm and crm_xmrwgl.khbh='"+khbh+"')";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String qzrwmc="";
	int allrow=0;
	ls_sql="select rwxh,rwbm,rwmc,changdu,jishu,jishucd,csjhkssj,csjhjssj,csjhgzr,jhkssj,jhjssj,jhgzr,sjkssj,sjjssj,sjgzr ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwxh=rs.getInt("rwxh");
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		changdu=rs.getInt("changdu");
		jishu=rs.getInt("jishu");
		jishucd=rs.getInt("jishucd");
		csjhkssj=cf.fillHtml(rs.getDate("csjhkssj"));
		csjhjssj=cf.fillHtml(rs.getDate("csjhjssj"));
		csjhgzr=rs.getInt("csjhgzr");
		jhkssj=cf.fillHtml(rs.getDate("jhkssj"));
		jhjssj=cf.fillHtml(rs.getDate("jhjssj"));
		jhgzr=rs.getInt("jhgzr");
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=rs.getInt("sjgzr");

		allrow++;

		qzrwmc="";
		ls_sql="select qzrwbm";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where crm_xmrwljgx.rwbm='"+rwbm+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ls_sql+=" order by qzrwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			qzrwmc+="��["+cf.fillNull(rs1.getString("qzrwbm"))+"]";
		}
		rs1.close();
		ps1.close();
		if (!qzrwmc.equals(""))
		{
			qzrwmc="ǰ������"+qzrwmc.substring(1);
		}

		String qzrwbm=null;
		ls_sql="select qzrwbm";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qzrwbm=cf.fillNull(rs1.getString("qzrwbm"));
		}
		rs1.close();
		ps1.close();

		//���������ţ�������������������������������������������ʼ
		String leftStr="";
		if (jishu>1)
		{
			int jishucd1=0;
			ls_sql="select jishucd";
			ls_sql+=" from  crm_xmrwgl";
			ls_sql+=" where jishu="+1;
			ls_sql+=" and khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jishucd1=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			for (int j=0;j<jishucd1 ;j++ )
			{
				leftStr+="&nbsp;&nbsp;";
//				leftStr+="��";
			}

			for (int i=2;i<jishu ;i++ )
			{
				int markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_xmrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwjs="+i;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					leftStr+="��";
				}
				else{
					leftStr+="&nbsp;&nbsp;";
				}

				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+i;
				ls_sql+=" and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd1=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd1 ;j++ )
				{
					leftStr+="&nbsp;&nbsp;";
				}

			}
		}

		//���������ţ���������������������������������������������

		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  rwbm='"+rwbm+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		String leftBolt="";
		int markInt2=0;
		if (count>0)
		{
			ls_sql="select count(*)";
			ls_sql+=" from  crm_xmrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwjs="+jishu;
			ls_sql+="   and khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				markInt2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (markInt2>0)
			{
				leftBolt="��--";
			}
			else{
				leftBolt="��--";
			}
		}


		//�����Ҳ���ţ�������������������������������������������ʼ
		String rightBolt="";

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  qzrwbm='"+rwbm+"'";
		ls_sql+="   and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			//���������
			int maxjs=0;
			ls_sql="select max(crm_xmrwgl.jishu)";
			ls_sql+=" from  crm_xmrwljgx,crm_xmrwgl";
			ls_sql+=" where  crm_xmrwljgx.rwbm=crm_xmrwgl.rwbm and crm_xmrwljgx.qzrwbm='"+rwbm+"'";
			ls_sql+="   and crm_xmrwljgx.khbh='"+khbh+"' and crm_xmrwgl.khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				maxjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�ӵ�һ����ʼ���δ���
			int kgcd=0;
			if (jishu==1)
			{
				kgcd=jishucd-changdu;
			}
			else{
				kgcd=jishucd-changdu-2;
			}
			for (int j=0;j<kgcd ;j++ )
			{
				rightBolt+="--";
			}

			for (int i=jishu+1;i<maxjs ;i++ )
			{
				int markInt1=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_xmrwljgx";
				ls_sql+=" where qzrwbm='"+rwbm+"' and rwjs="+i;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt1=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_xmrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwjs="+i;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					if (markInt1>0)
					{
						rightBolt+="��";
					}
					else
					{
						rightBolt+="�n";
					}
				}
				else{
					if (markInt1>0)
					{
						rightBolt+="��";
					}
					else
					{
						rightBolt+="--";
					}
				}


				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+i;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd ;j++ )
				{
					rightBolt+="--";
//					rightBolt+="��";
				}

			}

			markInt2=0;
			ls_sql="select count(*)";
			ls_sql+=" from  crm_xmrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwjs="+maxjs;
			ls_sql+="   and khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				markInt2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (markInt2>0)
			{
				rightBolt+="��";
			}
			else{
				rightBolt+="��";
			}

			if (maxjs<maxjishu)
			{
				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+maxjs;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd ;j++ )
				{
					rightBolt+="&nbsp;&nbsp;";
//					rightBolt+="��";
				}

				for (int i=maxjs+1;i<maxjishu ;i++ )
				{
					markInt2=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_xmrwljgx";
					ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
					ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
					ls_sql+="   and rwjs="+i;
					ls_sql+="   and khbh='"+khbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						markInt2=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					if (markInt2>0)
					{
						rightBolt+="��";
					}
					else{
						rightBolt+="&nbsp;&nbsp;";
					}

					ls_sql="select jishucd";
					ls_sql+=" from  crm_xmrwgl";
					ls_sql+=" where jishu="+i;
					ls_sql+="   and khbh='"+khbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						jishucd=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					for (int j=1;j<jishucd ;j++ )
					{
						rightBolt+="&nbsp;&nbsp;";
					}

				}

				markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_xmrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwjs="+maxjishu;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					rightBolt+="��";
				}
				else{
					rightBolt+="&nbsp;&nbsp;";
				}
			}
		}
		else{
			//�ӵ�һ����ʼ���δ���
			int kgcd=0;
			if (jishu==1)
			{
				kgcd=jishucd-changdu;
			}
			else{
				kgcd=jishucd-changdu-2;
			}
			for (int j=0;j<kgcd ;j++ )
			{
				rightBolt+="&nbsp;&nbsp;";
			}

			for (int i=jishu+1;i<maxjishu ;i++ )
			{
				markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_xmrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
				ls_sql+="   and rwjs="+i;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					markInt2=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (markInt2>0)
				{
					rightBolt+="��";
				}
				else{
					rightBolt+="&nbsp;&nbsp;";
				}

				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+i;
				ls_sql+="   and khbh='"+khbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jishucd=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				for (int j=1;j<jishucd ;j++ )
				{
					rightBolt+="&nbsp;&nbsp;";
				}

			}

			markInt2=0;
			ls_sql="select count(*)";
			ls_sql+=" from  crm_xmrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwjs="+maxjishu;
			ls_sql+="   and khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				markInt2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (markInt2>0)
			{
				rightBolt+="��";
			}
			else{
				rightBolt+="&nbsp;&nbsp;";
			}

		}
		//�����Ҳ���ţ���������������������������������������������

		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwgl";
		ls_sql+=" where khbh='"+khbh+"' and rwbm='"+rwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (sjkssj.equals(""))
		{
			sjkssj="&nbsp;";
		}
		if (sjjssj.equals(""))
		{
			sjjssj="&nbsp;";
		}
		if (sjgzr==0)
		{
			sjgzr=0;
		}

		String strcsjhgzr="";
		if (csjhgzr==0)
		{
			strcsjhgzr="&nbsp;";
		}
		else{
			strcsjhgzr=csjhgzr+"";
		}

		String strjhgzr="";
		if (jhgzr==0)
		{
			strjhgzr="&nbsp;";
		}
		else{
			strjhgzr=jhgzr+"";
		}

		String strsjgzr="";
		if (sjgzr==0)
		{
			strsjgzr="&nbsp;";
		}
		else{
			strsjgzr=sjgzr+"";
		}

		%>
		<tr align="center"> 
			<td ><%=allrow%></td>
			<td >
				<A HREF="XmgzCrm_xmrwgl.jsp?khbh=<%=khbh%>&rwbm=<%=rwbm%>" target="_blank">����</A>			</td>
			<td><A HREF="ViewCrm_xmrwgl.jsp?khbh=<%=khbh%>&rwbm=<%=rwbm%>" target="_blank"><%=rwmc%></A></td>
			<td ><%=csjhkssj%></td>
			<td ><%=csjhjssj%></td>
			<td ><%=strcsjhgzr%></td>
			<td ><%=jhkssj%></td>
			<td ><%=jhjssj%></td>
			<td ><%=strjhgzr%></td>
			<td ><%=sjkssj%>			</td>
			<td ><%=sjjssj%>			</td>
			<td ><%=strsjgzr%>			</td>
			<td align="left"><div hint="<%=qzrwmc%>" ><%=leftStr%><%=leftBolt%>��<%=rwmc%><%=rightBolt%></div></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

//�������������������Щ��������� �ȡ������ �� �� �� �ȩ� �n �h �����p  
%>

  <div   id="a"   style="position:absolute;font-size:9pt;display:none;border:1px   solid   black;background:lightyellow">   </div>   
	</table>
</form>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<script>   

//document.onmousemove=function()
document.onmouseover=function()
{   
	if(event.srcElement.hint) 
	{   
		a.style.display="block";   
		a.innerHTML=event.srcElement.hint;   
		a.style.left=window.event.clientX+10;   
		a.style.top=window.event.clientY+10;   
		setTimeout("a.style.display='none'",800000);   
	}
	else{   
		a.style.display="none"   
	}   
} 

</script>   

