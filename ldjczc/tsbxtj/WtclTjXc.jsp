<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String yhjs=(String)session.getAttribute("yhjs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ



	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String sjs=cf.GB2Uni(request.getParameter("sjs"));
	String sgd=request.getParameter("sgd");
	String zrbm=request.getParameter("zrbm");
	String zrr=cf.GB2Uni(request.getParameter("zrr"));

	String lrbm=request.getParameter("lrbm");
	String lrr=cf.GB2Uni(request.getParameter("lrr"));

	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and crm_khxx.fgsbh='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (sjs!=null)
	{
		if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
	}
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  crm_khxx.sgd='"+sgd+"'";
	}
	if (zrbm!=null)
	{
		if (!(zrbm.equals("")))	wheresql+=" and  gdm_gdjcjl.dwbh='"+zrbm+"'";
	}
	if (zrr!=null)
	{
		if (!(zrr.equals("")))	wheresql+=" and  gdm_gdjcjl.zrr='"+zrr+"'";
	}

	if (lrbm!=null)
	{
		if (!(lrbm.equals("")))	wheresql+=" and  gdm_gdjcjl.lrdw='"+lrbm+"'";
	}
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  gdm_gdjcjl.lrr='"+lrr+"'";
	}


	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

//��ȡ�·�����
String[] yue=cf.getMons(sjfw,sjfw2);;
int yuesl=Integer.parseInt(yue[0]);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>����Ѳ�����շ���
  <BR>(¼��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>


<tr bgcolor="#CCCCCC"  align="center">
  <td  width="12%">&nbsp;</td>
  <%
	for (int i=1;i<yuesl*2+1 ;i=i+2 )
	{
		%>
		  <td  width="5%"><%=yue[i].substring(0,7)%></td>
		<%
	}

  %>

  </tr>


<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();




	%>
	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXz.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>

	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>������������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and gdm_gdjcjl.jssj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzCl.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>�������ܾ���������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.jssj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.jssj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and gdm_gdjcjl.clzt='E'";//E������ʵ
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzJj.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>�������������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.sjjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.sjjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzWc.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>�������ܾ������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.hfwjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.hfwjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzWcsb.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>�������������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzJa.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>��������ʱ��������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and gdm_gdjcjl.clzt='5'";//5���᰸
		ls_sql+=" and gdm_gdjcjl.sfjslx='Y'";//Y����ʱ��ϵ
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzJajs.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>��������������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and gdm_gdjcjl.clzt='5'";//5���᰸
		ls_sql+=" and gdm_gdjcjl.zzjgbm='1'";//1������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcXzJamy.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>

	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>��ĩ��������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;

		ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and gdm_gdjcjl.jssj>TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcQmDcl.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>

	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>��ĩ��������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;

		ls_sql+=" and gdm_gdjcjl.jssj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj>TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcQmCl.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>��ĩ�������������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//ȫ������
		int tssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;

		ls_sql+=" and gdm_gdjcjl.sjjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj>TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tssl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (tssl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><A HREF="ViewXcQmDwj.jsp?sjfw=<%=startDate%>&sjfw2=<%=endDate%>&wheresql=<%=wheresql%>" target="_blank"><%=tssl%></A></td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>����ܾ���</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];

		//�ڼ��������ܾ���������
		int xzjjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.jssj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.jssj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and gdm_gdjcjl.clzt='E'";//E������ʵ
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xzjjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//�ڼ�������������
		int xzsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xzsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//�ڳ�������������������
		int qcylsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.sjjjsj>TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qcylsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		double xzjjl=0;
		if ((xzsl+qcylsl)==0)//�����
		{
			xzjjl=0;
		}
		else{
			xzjjl=cf.round(xzjjsl*100.0/(xzsl+qcylsl),2);
		}

		if (xzjjl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><%=xzjjl%>%</td>
			<%
		}
	}

	%>
	</tr>

	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>���⴦����</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//�ڼ��������������������
		int clwcsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.sjjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.sjjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clwcsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//�ڳ�������������������
		int qcylsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.jssj<=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.sjjjsj>TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qcylsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//�ڼ�������������������
		int clsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;

		ls_sql+=" and gdm_gdjcjl.jssj>=TO_DATE('"+startDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and gdm_gdjcjl.jssj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clsl=rs.getInt(1);
		}
		rs.close();
		ps.close();


		double xzjjl=0;
		if ((qcylsl+clsl)==0)//�����
		{
			xzjjl=0;
		}
		else{
			xzjjl=cf.round(clwcsl*100.0/(qcylsl+clsl),2);
		}

		if (xzjjl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><%=xzjjl%>%</td>
			<%
		}
	}
	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>�������ܾ���</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];

		//�ڼ��������ܾ������������
		int wwjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.hfwjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.hfwjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wwjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//�ڼ��������������������
		int clwcsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clwcsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//�ڳ��������������
		int dwjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;

		ls_sql+=" and gdm_gdjcjl.sjjjsj<=TO_DATE('"+startDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj>TO_DATE('"+startDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dwjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		double wjjjl=0;
		if ((dwjsl+clwcsl)==0)//�����
		{
			wjjjl=0;
		}
		else{
			wjjjl=cf.round(wwjsl*100.0/(dwjsl+clwcsl),2);
		}

		if (wjjjl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><%=wjjjl%>%</td>
			<%
		}

	}

	%>
	</tr>

	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>���⴦��ʱ��</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//�ڼ��������������������
		int wjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();


		//�ڼ���������ʱ��������
		int jssl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and gdm_gdjcjl.clzt='5'";//5���᰸
		ls_sql+=" and gdm_gdjcjl.sfjslx='Y'";//Y����ʱ��ϵ
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jssl=rs.getInt(1);
		}
		rs.close();
		ps.close();


		double jsl=0;
		if (wjsl==0)//�����
		{
			jsl=0;
		}
		else{
			jsl=cf.round(jssl*100.0/wjsl,2);
		}

		if (jsl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><%=jsl%>%</td>
			<%
		}

	}

	%>
	</tr>


	<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	  <td>���⴦��������</td>
	<%

	for (int i=0;i<yuesl ;i++ )
	{
		String startDate=yue[i*2+1];
		String endDate  =yue[i*2+2];


		//�ڼ��������������������
		int wjsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();


		//�ڼ���������������������
		int mysl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM gdm_gdjcjl,crm_khxx  ";
		ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.qrjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.qrjjsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and gdm_gdjcjl.clzt='5'";//5���᰸
		ls_sql+=" and gdm_gdjcjl.zzjgbm='1'";//1������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mysl=rs.getInt(1);
		}
		rs.close();
		ps.close();


		double myl=0;
		if (wjsl==0)//�����
		{
			myl=0;
		}
		else{
			myl=cf.round(mysl*100.0/wjsl,2);
		}

		if (myl==0)//�����
		{
			%>
			  <td>-</td>
			<%
		}
		else{
			%>
			  <td><%=myl%>%</td>
			<%
		}

	}

	%>
	</tr>

</table>

<%

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("����ʧ��,��������: " + ls_sql);
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



</body>
</html>


<script>

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

</script> 