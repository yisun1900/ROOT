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
.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE4 {color: #0000CC}
-->
</style>
</head>


<%
String khbh=request.getParameter("khbh");
String jjrksg="1";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
int allrow=0;
try {
	conn=cf.getConnection();

	ls_sql="select jjrksg";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjrksg=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (jjrksg.equals(""))
	{
		jjrksg="1";//1���ڡ����ղ���ʩ����2�����ղ���ʩ���� 9��������
	}
%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<form method="post" action="SaveEditJhSjCrm_xmrwgl.jsp" name="insertform">
<center>
  <span class="STYLE2"> ¼���ʼ�ƻ�ʱ��</span> ��<span class="STYLE3"><span class="STYLE4">�ڼ��տ�ʩ��</span>
	<INPUT type="radio" name="jjrksg" value="1" <%if (jjrksg.equals("1")) out.println("CHECKED");%> onClick="changeJr()">�ڡ����ղ���ʩ��
	<INPUT type="radio" name="jjrksg" value="2" <%if (jjrksg.equals("2")) out.println("CHECKED");%>  onclick="changeJr()">���ղ���ʩ��
	<INPUT type="radio" name="jjrksg" value="9" <%if (jjrksg.equals("9")) out.println("CHECKED");%>  onclick="changeJr()">������
  </span>
  ��  
</center>
  <table border="0" cellspacing="0" cellpadding="1" width="200%" style='FONT-SIZE: 12px' >
    <tr align="left" bgcolor="#999999"> 
		<td colspan="6">&nbsp;</td> 
		<td>
			<input type="hidden" name="khbh"  value="<%=khbh%>" >
			<input type="button"  value="����" onClick="f_do(insertform)">
			<input type="reset"  value="����" name="reset">      
		</td>
    </tr>
    <tr align="center" bgcolor="#FFFFCC" height="25"> 
		<td width="2%"><B><u>���</u></B></td>
		<td width="3%"><B><u>�������</u></B></td>
		<td width="10%"><B><u>��������</u></B></td>
		<td width="3%"><B><u>�ƻ�����</u></B></td>
		<td width="5%"><B><u>�ƻ���ʼʱ��</u></B></td>
		<td width="5%"><B><u>�ƻ�����ʱ��</u></B></td>
		<td align="left"><B><u>�߼���ϵ</u></B></td>
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
	String jhkssj="";
	String jhjssj="";
	int jhgzr=0;
	
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
	ls_sql="select rwxh,rwbm,rwmc,changdu,jishu,jishucd,jhkssj,jhjssj,jhgzr ";
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
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhgzr=rs.getInt("jhgzr");

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

		String strjhgzr="";
		if (jhgzr==0)
		{
			strjhgzr="";
		}
		else{
			strjhgzr=jhgzr+"";
		}

		String bgcolor="#E8E8FF";
		if (allrow%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		%>
		<tr align="left" bgcolor="<%=bgcolor%>"> 
			<td ><%=allrow%></td>
			<td >
				<input type="hidden" name="rwbm"  value="<%=rwbm%>" >
				<A HREF="/gcgl/xmrwgl/bzrwbm/ViewDm_bzrwbm.jsp?rwbm=<%=rwbm%>" target="_blank"><%=rwbm%></A>
			</td>
			<td ><%=rwmc%></td>
			<td >
                <input type="text" name="jhgzr" value="<%=strjhgzr%>" size="5" maxlength="10"  onblur="getDay3(<%=(allrow-1)%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<td >
                <input type="text" name="jhkssj" value="<%=jhkssj%>" size="10" maxlength="10" onBlur="getDay1(<%=(allrow-1)%>)" onDblClick="JSCalendar(this)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<td >
                <input type="text" name="jhjssj" value="<%=jhjssj%>" size="10" maxlength="10"  onblur="getDay2(<%=(allrow-1)%>)" onDblClick="JSCalendar(this)"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<td><div hint="<%=qzrwmc%>" ><%=leftStr%><%=leftBolt%>��<%=rwmc%><%=rightBolt%></div></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

//�������������������Щ��������� �ȡ������ �� �� �� �ȩ� �n �h �����p  
%>

  <div   id="a"   style="position:absolute;font-size:9pt;display:none;border:1px   solid   black;background:lightyellow">   </div>   
    <tr align="left" bgcolor="#999999"> 
		<td colspan="6">&nbsp;</td> 
	  <td>
			<input type="button"  value="����" onClick="f_do(insertform)">
			<input type="reset"  value="����" name="reset">
			<input type="button" value="�鿴" onClick="window.open('ViewJhCrm_xmrwglMain.jsp?khbh=<%=khbh%>')">		</td>
    </tr>
  </table>
</form>

</body>
</html>

<%
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

var row=-1;
var lx="";
function getDay1(xh) 
{
	if (insertform.jhkssj[xh].value=="" || insertform.jhgzr[xh].value=="")
	{
		return;
	}
 

	lx="1";
	row=xh;
	var actionStr="getDay1.jsp?jjrksg="+getRadio(insertform.jjrksg)+"&jhkssj="+insertform.jhkssj[xh].value+"&jhgzr="+insertform.jhgzr[xh].value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getDay2(xh) 
{
	if (insertform.jhgzr[xh].value=="" || insertform.jhjssj[xh].value=="")
	{
		return;
	}
 

	lx="2";
	row=xh;
	var actionStr="getDay2.jsp?jjrksg="+getRadio(insertform.jjrksg)+"&jhjssj="+insertform.jhjssj[xh].value+"&jhgzr="+insertform.jhgzr[xh].value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getDay3(xh) 
{
	if (insertform.jhkssj[xh].value=="" || insertform.jhgzr[xh].value=="")
	{
		return;
	}
 
	lx="3";
	row=xh;
	var actionStr="getDay3.jsp?jjrksg="+getRadio(insertform.jjrksg)+"&jhkssj="+insertform.jhkssj[xh].value+"&jhgzr="+insertform.jhgzr[xh].value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		insertform.jhjssj[row].value=ajaxRetStr;
		row=-1;
	}
	else if (lx=="2")
	{
		insertform.jhkssj[row].value=ajaxRetStr;
		row=-1;
	}
	else if (lx=="3")
	{
		insertform.jhjssj[row].value=ajaxRetStr;
		row=-1;
	}
}


function changeJr()//����FormName:Form������
{
	for (var i=0;i<<%=allrow%> ;i++ )
	{
		if (insertform.jhkssj[i].value!="" && insertform.jhgzr[i].value!="")
		{
			getDay3(i) 
		}
		else{
			insertform.jhjssj[i].value="";
		}

		while (row!=-1)
		{
			alert("��"+(row+1)+"��ƻ����ա������¼��㣬ϵͳ�����Ż���ִ˴��ڣ���ϵͳ�ܿ죬�򲻻���ִ�������Ϣ");
		}
	}
}

function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
