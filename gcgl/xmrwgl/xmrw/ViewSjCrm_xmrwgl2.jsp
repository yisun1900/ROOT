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
	font-family: "隶书";
}
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

	//109/6=18.17
	//126/7=18

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<center>
    <span class="STYLE2">计划时间与实际对比</span>  </center>

  <table border="1" cellspacing="0" cellpadding="1" width="400%" style='FONT-SIZE: 12px' >
<%
	int bs=18;

	//取起点、终点＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String minjhkssjStr=null;
	String maxjhjssjStr=null;
	java.sql.Date minjhkssj=null;
	java.sql.Date minjhkssj1=null;
	java.sql.Date maxjhjssj=null;
	int dyce=0;

	ls_sql="select min(jhkssj),max(jhjssj),min(jhkssj)-2,LAST_DAY(min(jhkssj))-min(jhkssj)";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		minjhkssj=rs.getDate(1);
		maxjhjssj=rs.getDate(2);
		minjhkssj1=rs.getDate(3);
		dyce=rs.getInt(4);
	}
	rs.close();
	ps.close();

	//若小于3天，增加两天
	if (dyce<3)
	{
		minjhkssj=minjhkssj1;
	}

	minjhkssjStr=minjhkssj.toString();
	maxjhjssjStr=maxjhjssj.toString();
	//取起点、终点＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	
	int year1=0;
	int month1=0;
	int day1=0;

	int year2=0;
	int month2=0;
	int day2=0;

	int cd=0;//总天数
	int xqt=0;//首天星期几
	
	ls_sql="select TO_CHAR(?,'YYYY') ,TO_CHAR(?,'MM'),TO_CHAR(?,'DD')";
	ls_sql+="     ,TO_CHAR(?,'YYYY') ,TO_CHAR(?,'MM'),TO_CHAR(?,'DD') ";
	ls_sql+=" ,max(?-?),to_char(?,'D')";
	ls_sql+=" from  sq_xtcsb";
	ls_sql+=" where rownum<2";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minjhkssj);
	ps.setDate(2,minjhkssj);
	ps.setDate(3,minjhkssj);
	ps.setDate(4,maxjhjssj);
	ps.setDate(5,maxjhjssj);
	ps.setDate(6,maxjhjssj);
	ps.setDate(7,maxjhjssj);
	ps.setDate(8,minjhkssj);
	ps.setDate(9,minjhkssj);
	rs =ps.executeQuery();
	if (rs.next())
	{
		year1=rs.getInt(1);
		month1=rs.getInt(2);
		day1=rs.getInt(3);
		year2=rs.getInt(4);
		month2=rs.getInt(5);
		day2=rs.getInt(6);
		cd=rs.getInt(7);
		xqt=rs.getInt(8);
	}
	rs.close();
	ps.close();

	%>
    <tr align="center" bgcolor="#FFFFCC" height="34"> 
		<td align="left">
	<%
	//输出年月＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=year1 ;i<year2+1;i++ )
	{
		for (int j=month1 ;j<month2+1;j++ )
		{

			if (j==month1)
			{
				out.print(Integer.toString(i).substring(2,4)+"年"+cf.addZero(j+"",2)+"月");

				//取当月最后一天
				int lastDay=0;

				ls_sql="select TO_CHAR(LAST_DAY(TO_DATE('"+i+"-"+month1+"-01','YYYY-MM-DD')),'DD')";
				ls_sql+=" from  sq_xtcsb";
				ls_sql+=" where rownum<2";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lastDay=rs.getInt(1);
				}
				rs.close();
				ps.close();

				for (int k=day1+3 ;k<lastDay+1;k++ )
				{
					out.print("&nbsp;&nbsp;&nbsp;");
				}
			}
			else if (j==month2)
			{
				out.print("|"+Integer.toString(i).substring(2,4)+"年"+cf.addZero(j+"",2)+"月");

				for (int k=4 ;k<day2+1;k++ )
				{
					out.print("&nbsp;&nbsp;&nbsp;");
				}
			}
			else{
				out.print("|"+Integer.toString(i).substring(2,4)+"年"+cf.addZero(j+"",2)+"月");

				//取当月最后一天
				int lastDay=0;

				ls_sql="select TO_CHAR(LAST_DAY(TO_DATE('"+i+"-"+j+"-01','YYYY-MM-DD')),'DD')";
				ls_sql+=" from  sq_xtcsb";
				ls_sql+=" where rownum<2";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lastDay=rs.getInt(1);
				}
				rs.close();
				ps.close();

				for (int k=4 ;k<lastDay+1;k++ )
				{
					out.print("&nbsp;&nbsp;&nbsp;");
				}
			}
		}
	}

	//输出年月＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	%>
		</td>
	</tr>


	<tr align="center"> 
		<td align="left">
	<%
	//输出日期＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=year1 ;i<year2+1;i++ )
	{
		for (int j=month1 ;j<month2+1;j++ )
		{
			if (j==month1)
			{
				//取当月最后一天
				int lastDay=0;

				ls_sql="select TO_CHAR(LAST_DAY(TO_DATE('"+i+"-"+month1+"-01','YYYY-MM-DD')),'DD')";
				ls_sql+=" from  sq_xtcsb";
				ls_sql+=" where rownum<2";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lastDay=rs.getInt(1);
				}
				rs.close();
				ps.close();

				for (int k=day1 ;k<lastDay+1;k++ )
				{
					out.print(cf.addZero(k+"",2)+"|");
				}
			}
			else if (j==month2)
			{
				for (int k=1 ;k<day2+1;k++ )
				{
					out.print(cf.addZero(k+"",2)+"|");
				}
			}
			else{
				//取当月最后一天
				int lastDay=0;

				ls_sql="select TO_CHAR(LAST_DAY(TO_DATE('"+i+"-"+j+"-01','YYYY-MM-DD')),'DD')";
				ls_sql+=" from  sq_xtcsb";
				ls_sql+=" where rownum<2";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lastDay=rs.getInt(1);
				}
				rs.close();
				ps.close();

				for (int k=1 ;k<lastDay+1;k++ )
				{
					out.print(cf.addZero(k+"",2)+"|");
				}
			}
		}
	}

	//输出日期＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	%>
		</td>
	</tr>

	<tr align="center"> 
		<td align="left">
	<%
	//输出星期几＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=0 ;i<cd+1;i++ )
	{
		String xqtStr=null;
		if (xqt==1)
		{
			xqtStr="日|";
		}
		else if (xqt==2)
		{
			xqtStr="一|";
		}
		else if (xqt==3)
		{
			xqtStr="二|";
		}
		else if (xqt==4)
		{
			xqtStr="三|";
		}
		else if (xqt==5)
		{
			xqtStr="四|";
		}
		else if (xqt==6)
		{
			xqtStr="五|";
		}
		else if (xqt==7)
		{
			xqtStr="六|";
		}
		out.print(xqtStr);

		xqt++;
		if (xqt==8)
		{
			xqt=1;
		}
	}

	//输出星期几＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	%>
		</td>
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
	String sjkssj="";
	String sjjssj="";
	int sjgzr=0;

	
	int maxjishu=0;
	ls_sql="select max(crm_xmrwgl.jishu)";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		maxjishu=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String qzrwmc="";
	int jhqdcd=0;
	int jhtxcd=0;
	int sjqdcd=0;
	int sjtxcd=0;
	ls_sql="select rwxh,rwbm,rwmc,changdu,jishu,jishucd,jhkssj,jhjssj,jhgzr,sjkssj,sjjssj,sjgzr,jhkssj-? jhqdcd,jhjssj-jhkssj+1 jhtxcd,sjkssj-? sjqdcd,sjjssj-sjkssj+1 sjtxcd";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minjhkssj);
	ps.setDate(2,minjhkssj);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwxh=rs.getInt("rwxh");
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		changdu=rs.getInt("changdu");
		jishu=rs.getInt("jishu");
		jishucd=rs.getInt("jishucd");
		jhkssj=cf.fillHtml(rs.getDate("jhkssj"));
		jhjssj=cf.fillHtml(rs.getDate("jhjssj"));
		jhgzr=rs.getInt("jhgzr");
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjgzr=rs.getInt("sjgzr");
		jhqdcd=rs.getInt("jhqdcd");
		jhtxcd=rs.getInt("jhtxcd");
		sjqdcd=rs.getInt("sjqdcd");
		sjtxcd=rs.getInt("sjtxcd");

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
			qzrwmc+="、["+cf.fillNull(rs1.getString("qzrwbm"))+"]";
		}
		rs1.close();
		ps1.close();
		if (!qzrwmc.equals(""))
		{
			qzrwmc="前置任务："+qzrwmc.substring(1);
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

		//处理左侧符号＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
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
//				leftStr+="号";
			}

			for (int i=2;i<jishu ;i++ )
			{
				int markInt2=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_xmrwljgx";
				ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and crm_xmrwgl.khbh='"+khbh+"')";
				ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and crm_xmrwgl.khbh='"+khbh+"')";
				ls_sql+="   and rwjs="+i;
				ls_sql+=" and khbh='"+khbh+"'";
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
					leftStr+="│";
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

		//处理左侧符号＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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
			ls_sql+=" and khbh='"+khbh+"'";
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
				leftBolt="├--";
			}
			else{
				leftBolt="└--";
			}
		}


		//处理右侧符号＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String rightBolt="";

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwljgx";
		ls_sql+=" where  qzrwbm='"+rwbm+"'";
		ls_sql+=" and khbh='"+khbh+"'";
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
			//后置最大级数
			int maxjs=0;
			ls_sql="select max(crm_xmrwgl.jishu)";
			ls_sql+=" from  crm_xmrwljgx,crm_xmrwgl";
			ls_sql+=" where  crm_xmrwljgx.rwbm=crm_xmrwgl.rwbm and crm_xmrwljgx.qzrwbm='"+rwbm+"'";
			ls_sql+=" and  crm_xmrwgl.khbh='"+khbh+"'";
			ls_sql+=" and  crm_xmrwljgx.khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				maxjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//从第一级开始依次处理
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
				ls_sql+=" and khbh='"+khbh+"'";
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
				ls_sql+=" and khbh='"+khbh+"'";
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
						rightBolt+="┼";
					}
					else
					{
						rightBolt+="╪";
					}
				}
				else{
					if (markInt1>0)
					{
						rightBolt+="┬";
					}
					else
					{
						rightBolt+="--";
					}
				}


				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+i;
				ls_sql+=" and  khbh='"+khbh+"'";
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
//					rightBolt+="开";
				}

			}

			markInt2=0;
			ls_sql="select count(*)";
			ls_sql+=" from  crm_xmrwljgx";
			ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
			ls_sql+="   and rwjs="+maxjs;
			ls_sql+=" and  khbh='"+khbh+"'";
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
				rightBolt+="┤";
			}
			else{
				rightBolt+="┐";
			}

			if (maxjs<maxjishu)
			{
				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+maxjs;
				ls_sql+=" and  khbh='"+khbh+"'";
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
//					rightBolt+="号";
				}

				for (int i=maxjs+1;i<maxjishu ;i++ )
				{
					markInt2=0;
					ls_sql="select count(*)";
					ls_sql+=" from  crm_xmrwljgx";
					ls_sql+=" where qzrwbm in(select rwbm from crm_xmrwgl where rwxh < "+rwxh+" and khbh='"+khbh+"')";
					ls_sql+="   and rwbm   in(select rwbm from crm_xmrwgl where rwxh > "+rwxh+" and khbh='"+khbh+"')";
					ls_sql+="   and rwjs="+i;
					ls_sql+=" and  khbh='"+khbh+"'";
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
						rightBolt+="│";
					}
					else{
						rightBolt+="&nbsp;&nbsp;";
					}

					ls_sql="select jishucd";
					ls_sql+=" from  crm_xmrwgl";
					ls_sql+=" where jishu="+i;
					ls_sql+=" and  khbh='"+khbh+"'";
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
				ls_sql+=" and  khbh='"+khbh+"'";
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
					rightBolt+="│";
				}
				else{
					rightBolt+="&nbsp;&nbsp;";
				}
			}
		}
		else{
			//从第一级开始依次处理
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
				ls_sql+=" and  khbh='"+khbh+"'";
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
					rightBolt+="│";
				}
				else{
					rightBolt+="&nbsp;&nbsp;";
				}

				ls_sql="select jishucd";
				ls_sql+=" from  crm_xmrwgl";
				ls_sql+=" where jishu="+i;
				ls_sql+=" and  khbh='"+khbh+"'";
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
			ls_sql+=" and  khbh='"+khbh+"'";
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
				rightBolt+="│";
			}
			else{
				rightBolt+="&nbsp;&nbsp;";
			}

		}
		//处理右侧符号＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		ls_sql="select min(jhkssj),max(jhjssj)";
		ls_sql+=" from  crm_xmrwgl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			minjhkssj=rs1.getDate(1);
			maxjhjssj=rs1.getDate(2);
		}
		rs1.close();
		ps1.close();

		String jhqdcdStr="";
		for (int i=0;i<jhqdcd ;i++ )
		{
			jhqdcdStr+="&nbsp;&nbsp;&nbsp;";
		}
		String sjqdcdStr="";
		for (int i=0;i<sjqdcd ;i++ )
		{
			sjqdcdStr+="&nbsp;&nbsp;&nbsp;";
		}

		//190/16=11.875

		%>
		<tr align="center"  height="32"> 
			<td align="left">
			<%=jhqdcdStr%><img src="/images/ColuGif.gif" width="<%=jhtxcd*bs%>" height="10" >(<%=jhkssj%>--<%=jhjssj%>)
			<BR>	
			<%=sjqdcdStr%><img src="/images/ColuGif1.gif" width="<%=sjtxcd*bs%>" height="10" >(<%=sjkssj%>--<%=sjjssj%>)
			</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

//－￣┐┑┓┈┅┇┋┬┃│└├└ ┤○◎◆●★ ┼ ┬ ┴ ┤├ ╪ ╤ │┃╬  
%>

  <div   id="a"   style="position:absolute;font-size:9pt;display:none;border:1px   solid   black;background:lightyellow">   </div>   
	</table>

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

    
  //页面内元素的onmouseover事件的处理方法   

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
