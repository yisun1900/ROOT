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
	String lrbm=request.getParameter("lrbm");
	String lrr=cf.GB2Uni(request.getParameter("lrr"));
	String qdy=request.getParameter("qdy");

	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and crm_zxkhxx.ssfgs='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	}
	if (sjs!=null)
	{
		if (!(sjs.equals("")))	wheresql+=" and  crm_zxkhxx.sjs='"+sjs+"'";
	}
	if (lrbm!=null)
	{
		if (!(lrbm.equals("")))	wheresql+=" and  crm_zxkhxx.zxdjbm='"+lrbm+"'";
	}
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  crm_zxkhxx.lrr='"+lrr+"'";
	}




	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		wheresql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
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
  <B>�ɵ�ͳ��
  <BR>(�ɵ�ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>

<tr bgcolor="#CCCCCC"  align="center">
  <td  width="12%">�ɵ�ԭ��</td>
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



	String hfsbyybm=null;
	String sbyymc=null;
	ls_sql="select distinct crm_qysbdj.hfsbyybm,sbyymc";
	ls_sql+=" FROM crm_qysbdj,dm_sbyybm,crm_zxkhxx  ";
	ls_sql+=" where crm_qysbdj.hfsbyybm=dm_sbyybm.sbyybm";
	ls_sql+=" and crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=wheresql;
	ls_sql+=" and crm_qysbdj.sbsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_qysbdj.sbsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by hfsbyybm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		hfsbyybm=rs1.getString("hfsbyybm");
		sbyymc=rs1.getString("sbyymc");


		//������ռ��
		%>
		<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td><%=sbyymc%></td>
		<%

		for (int i=0;i<yuesl ;i++ )
		{
			String startDate=yue[i*2+1];
			String endDate  =yue[i*2+2];


			//ȫ������
			int sl=0;
			ls_sql="select count(*)";
			ls_sql+=" FROM crm_qysbdj,dm_sbyybm,crm_zxkhxx  ";
			ls_sql+=" where crm_qysbdj.hfsbyybm=dm_sbyybm.sbyybm";
			ls_sql+=" and crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
			ls_sql+=wheresql;
			ls_sql+=" and crm_qysbdj.sbsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and crm_qysbdj.sbsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sl=rs.getInt(1);
			}
			rs.close();
			ps.close();

			//��Ŀ����
			int xmsl=0;
			ls_sql="select count(*),count(distinct crm_qysbdj.khbh)";
			ls_sql+=" FROM crm_qysbdj,dm_sbyybm,crm_zxkhxx  ";
			ls_sql+=" where crm_qysbdj.hfsbyybm=dm_sbyybm.sbyybm";
			ls_sql+=" and crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
			ls_sql+=wheresql;
			ls_sql+=" and crm_qysbdj.sbsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and crm_qysbdj.sbsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_qysbdj.hfsbyybm='"+hfsbyybm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xmsl=rs.getInt(1);
			}
			rs.close();
			ps.close();


			//����ռ��
			double xmbl=0;

			if (sl!=0)
			{
				xmbl=cf.round(xmsl*100.0/sl,2);
			}
			else{
				xmbl=0;
			}


			if (xmbl==0)//�����
			{
				%>
				  <td>-</td>
				<%
			}
			else{
				%>
				  <td><%=xmbl%>%</td>
				<%
			}
		}

		%>
		</tr>
		<%
	}
	ps1.close();
	rs1.close();

	%>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="12%">�ɵ�����</td>
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



	String hfsbkhlx=null;
	ls_sql="select distinct crm_qysbdj.hfsbkhlx";
	ls_sql+=" FROM crm_qysbdj,crm_zxkhxx  ";
	ls_sql+=" where crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=wheresql;
	ls_sql+=" and crm_qysbdj.sbsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_qysbdj.sbsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_qysbdj.hfsbkhlx is not null";
	ls_sql+=" order by crm_qysbdj.hfsbkhlx";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		hfsbkhlx=rs1.getString("hfsbkhlx");


		//������ռ��
		%>
		<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td><%=hfsbkhlx%></td>
		<%

		for (int i=0;i<yuesl ;i++ )
		{
			String startDate=yue[i*2+1];
			String endDate  =yue[i*2+2];


			//ȫ������
			int sl=0;
			ls_sql="select count(*)";
			ls_sql+=" FROM crm_qysbdj,crm_zxkhxx  ";
			ls_sql+=" where crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
			ls_sql+=wheresql;
			ls_sql+=" and crm_qysbdj.sbsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and crm_qysbdj.sbsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sl=rs.getInt(1);
			}
			rs.close();
			ps.close();

			//��Ŀ����
			int xmsl=0;
			ls_sql="select count(*),count(distinct crm_qysbdj.khbh)";
			ls_sql+=" FROM crm_qysbdj,crm_zxkhxx  ";
			ls_sql+=" where crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
			ls_sql+=wheresql;
			ls_sql+=" and crm_qysbdj.sbsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and crm_qysbdj.sbsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_qysbdj.hfsbkhlx='"+hfsbkhlx+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xmsl=rs.getInt(1);
			}
			rs.close();
			ps.close();


			//����ռ��
			double xmbl=0;

			if (sl!=0)
			{
				xmbl=cf.round(xmsl*100.0/sl,2);
			}
			else{
				xmbl=0;
			}


			if (xmbl==0)//�����
			{
				%>
				  <td>-</td>
				<%
			}
			else{
				%>
				  <td><%=xmbl%>%</td>
				<%
			}
		}

		%>
		</tr>
		<%
	}
	ps1.close();
	rs1.close();

%> 
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