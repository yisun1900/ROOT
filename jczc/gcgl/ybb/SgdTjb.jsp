<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%

String sjfw=null;
String sjfw2=null;


sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");

String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
if (hflxbm!=null)
{
	if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
}

int all=0;
int hbsl=0;

String ls=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//��Ч�ط���������������6��δ��ϵ�ϡ�7��δ����
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		all=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (all==0)
	{
		out.println("�޻ط�����");
		return;
	}

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM dm_hfjgbm ";
	ls_sql+=" where hflxbm='21'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hbsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>ʩ����<<%=hflxmc%>>�ط�ͳ�ƣ���Ч�طô�����<%=all%>��<BR>
  (<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
      
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="20%">������Ŀ</td>
    <td  width="20%">�طý��</td>
    <td  width="15%">����</td>
    <td  width="30%">�ٷֱ� </td>
  </tr>



<%
//�������,��ȡ����

	int all1=0;
	int all2=0;
	int all3=0;
	int dxsl=0;
	double dxslbfb=0;

	String hfjgbm=null;
	String hfjgmc=null;
//=============================ʩ���ӷ���̬��==================================================
	//ʩ���ӷ���̬���н�����ط�����
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.fwsz=dm_hfjgbm.hfjgbm ";//���ʦ��Ʒ���
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";//�طý��:6:δ��ϵ�ϡ�7:δ����
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		all1=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql =" SELECT hfjgbm,hfjgmc,sum(sl)";
	ls_sql+=" FROM ( ";

	ls_sql+=" SELECT dm_hfjgbm.hfjgbm,hfjgmc,count(crm_khxx.khbh) sl";
	ls_sql+=" FROM crm_hfjl,crm_khxx,dm_hfjgbm ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.fwsz=dm_hfjgbm.hfjgbm ";
    ls_sql+=wheresql;
	ls_sql+=" group by dm_hfjgbm.hfjgbm,hfjgmc ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT hfjgbm,hfjgmc,0 sl";
	ls_sql+=" FROM dm_hfjgbm ";
	ls_sql+=" where hflxbm='21'";

	ls_sql+=" ) ";

	ls_sql+=" group by hfjgbm,hfjgmc ";
	ls_sql+=" order by hfjgbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if (all1==0)
		{
			dxslbfb=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/all1,2);
		}

		%>
		  <tr align="center"> 
			<td rowspan="<%=hbsl%>">ʩ���ӷ���̬��</td>
			<td ><%=hfjgmc%></td>
			<td  align="right"><%=dxsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=2*dxslbfb%>" height="14">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}


	while (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if (all1==0)
		{
			dxslbfb=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/all1,2);
		}

		%>
		  <tr align="center"> 
			<td ><%=hfjgmc%></td>
			<td  align="right"><%=dxsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=2*dxslbfb%>" height="14">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

//=============================ʩ����ʩ������==================================================

	//ʩ����ʩ�������н�����ط�����
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.sgzl=dm_hfjgbm.hfjgbm ";//
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		all2=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	ls_sql =" SELECT hfjgbm,hfjgmc,sum(sl)";
	ls_sql+=" FROM ( ";

	ls_sql+=" SELECT dm_hfjgbm.hfjgbm,hfjgmc,count(crm_khxx.khbh) sl";
	ls_sql+=" FROM crm_hfjl,crm_khxx,dm_hfjgbm ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.sgzl=dm_hfjgbm.hfjgbm ";
    ls_sql+=wheresql;
	ls_sql+=" group by dm_hfjgbm.hfjgbm,hfjgmc ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT hfjgbm,hfjgmc,0 sl";
	ls_sql+=" FROM dm_hfjgbm ";
	ls_sql+=" where hflxbm='21'";

	ls_sql+=" ) ";

	ls_sql+=" group by hfjgbm,hfjgmc ";
	ls_sql+=" order by hfjgbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if (all2==0)
		{
			dxslbfb=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/all2,2);
		}

		%>
		  <tr align="center"> 
			<td  rowspan="<%=hbsl%>">ʩ����ʩ������</td>
			<td ><%=hfjgmc%></td>
			<td  align="right"><%=dxsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=2*dxslbfb%>" height="14">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}

	while (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if (all2==0)
		{
			dxslbfb=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/all2,2);
		}

		%>
		  <tr align="center"> 
			<td ><%=hfjgmc%></td>
			<td  align="right"><%=dxsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=2*dxslbfb%>" height="14">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

//=============================ʩ���ӹ�������==================================================

	//ʩ���ӹ��������н�����ط�����
	ls_sql="SELECT count(crm_khxx.khbh)";
	ls_sql+=" FROM crm_hfjl,dm_hfjgbm,crm_khxx ";
	ls_sql+=" where crm_hfjl.grsz=dm_hfjgbm.hfjgbm ";//
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		all3=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	ls_sql =" SELECT hfjgbm,hfjgmc,sum(sl)";
	ls_sql+=" FROM ( ";

	ls_sql+=" SELECT dm_hfjgbm.hfjgbm,hfjgmc,count(crm_khxx.khbh) sl";
	ls_sql+=" FROM crm_hfjl,crm_khxx,dm_hfjgbm ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.grsz=dm_hfjgbm.hfjgbm ";
    ls_sql+=wheresql;
	ls_sql+=" group by dm_hfjgbm.hfjgbm,hfjgmc ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT hfjgbm,hfjgmc,0 sl";
	ls_sql+=" FROM dm_hfjgbm ";
	ls_sql+=" where hflxbm='21'";

	ls_sql+=" ) ";

	ls_sql+=" group by hfjgbm,hfjgmc ";
	ls_sql+=" order by hfjgbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if (all3==0)
		{
			dxslbfb=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/all3,2);
		}

		%>
		  <tr align="center"> 
			<td  rowspan="<%=hbsl%>">ʩ���ӹ�������</td>
			<td ><%=hfjgmc%></td>
			<td  align="right"><%=dxsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=2*dxslbfb%>" height="14">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}

	while (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if (all3==0)
		{
			all3=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/all3,2);
		}

		%>
		  <tr align="center"> 
			<td ><%=hfjgmc%></td>
			<td  align="right"><%=dxsl%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=2*dxslbfb%>" height="14">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	</table>

	<P><div align="center">ʩ�����������ͳ�Ʊ�</div>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>

<%
	ls_sql =" SELECT hfjgbm,hfjgmc,sum(sl)";
	ls_sql+=" FROM ( ";

	ls_sql+=" SELECT dm_hfjgbm.hfjgbm,hfjgmc,count(crm_khxx.khbh) sl";
	ls_sql+=" FROM crm_hfjl,crm_khxx,dm_hfjgbm ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.fwsz=dm_hfjgbm.hfjgbm ";
    ls_sql+=wheresql;
	ls_sql+=" group by dm_hfjgbm.hfjgbm,hfjgmc ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT dm_hfjgbm.hfjgbm,hfjgmc,count(crm_khxx.khbh) sl";
	ls_sql+=" FROM crm_hfjl,crm_khxx,dm_hfjgbm ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.sgzl=dm_hfjgbm.hfjgbm ";
    ls_sql+=wheresql;
	ls_sql+=" group by dm_hfjgbm.hfjgbm,hfjgmc ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT dm_hfjgbm.hfjgbm,hfjgmc,count(crm_khxx.khbh) sl";
	ls_sql+=" FROM crm_hfjl,crm_khxx,dm_hfjgbm ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.grsz=dm_hfjgbm.hfjgbm ";
    ls_sql+=wheresql;
	ls_sql+=" group by dm_hfjgbm.hfjgbm,hfjgmc ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT hfjgbm,hfjgmc,0 sl";
	ls_sql+=" FROM dm_hfjgbm ";
	ls_sql+=" where hflxbm='21'";

	ls_sql+=" ) ";

	ls_sql+=" group by hfjgbm,hfjgmc ";
	ls_sql+=" order by hfjgbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hfjgbm=rs.getString(1);
		hfjgmc=rs.getString(2);
		dxsl=rs.getInt(3);

		if ((all1+all2+all3)==0)
		{
			dxslbfb=0;
		}
		else{
			dxslbfb=cf.round(100.0*dxsl/(all1+all2+all3),2);
		}

		%>
		  <tr height="40"> 
			<td width="35%" align="right"><%=hfjgmc%></td>
			<td width="65%"><img src="/images/ColuGif.gif" width="<%=4*dxslbfb%>" height="20">&nbsp;<%=dxslbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	%>	
	</table>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

	



</body>
</html>

