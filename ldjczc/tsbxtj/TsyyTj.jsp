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
	String yzcdbm=request.getParameter("yzcdbm");

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
		if (!(zrbm.equals("")))	wheresql+=" and  crm_tsbm.dwbh='"+zrbm+"'";
	}
	if (zrr!=null)
	{
		if (!(zrr.equals("")))	wheresql+=" and  crm_tsbm.zrr='"+zrr+"'";
	}
	if (yzcdbm!=null)
	{
		if (!(yzcdbm.equals("")))	wheresql+=" and  crm_tsjl.yzcdbm='"+yzcdbm+"'";
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
  <B>Ͷ��ԭ��ͳ��
  <BR>(¼��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>

<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">����</td>
  <td  width="12%">С��</td>
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
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();



	String tslxbm=null;
	String tslxmc=null;
	ls_sql =" SELECT tslxbm,tslxmc ";
	ls_sql+=" FROM dm_tslxbm ";
	ls_sql+=" where tsdl='2'";//1�����ޣ�2��Ͷ�� 
	ls_sql+=" order by px,tslxbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		tslxbm=rs2.getString("tslxbm");
		tslxmc=rs2.getString("tslxmc");

		//��������С������
		int xlsl=0;
		ls_sql="select count(*)";
		ls_sql+=" FROM dm_tsxlbm";
		ls_sql+=" where tslxbm='"+tslxbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			xlsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//������ռ��
		%>
		<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td rowspan="<%=xlsl+1%>"><%=tslxmc%></td>
		  <td><B>����ռ��</B></td>
		<%

		for (int i=0;i<yuesl ;i++ )
		{
			String startDate=yue[i*2+1];
			String endDate  =yue[i*2+2];


			//ȫ������
			int tssl=0;
			int khsl=0;
			ls_sql="select count(*),count(distinct crm_tsjl.khbh)";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,crm_khxx  ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
			ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
			ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
			ls_sql+=" and crm_tsjl.clzt!='9'";//9:������
			ls_sql+=wheresql;
			ls_sql+=" and crm_tsjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tssl=rs.getInt(1);
				khsl=rs.getInt(2);
			}
			rs.close();
			ps.close();


			//��������
			int dltssl=0;
			int dlkhsl=0;
			ls_sql="select count(*),count(distinct crm_tsjl.khbh)";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,crm_khxx  ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
			ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
			ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
			ls_sql+=" and crm_tsjl.clzt!='9'";//9:������
			ls_sql+=" and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=wheresql;
			ls_sql+=" and crm_tsjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				dltssl=rs1.getInt(1);
				dlkhsl=rs1.getInt(2);
			}
			rs1.close();
			ps1.close();


			//����ռ��
			double dltsbl=0;
			double dlkhbl=0;

			if (tssl!=0)
			{
				dltsbl=cf.round(dltssl*100.0/tssl,2);
			}
			else{
				dltsbl=0;
			}

			if (khsl!=0)
			{
				dlkhbl=cf.round(dlkhsl*100.0/khsl,2);
			}
			else{
				dlkhbl=0;
			}


			if (dltsbl==0)//�����
			{
				%>
				  <td>-</td>
				<%
			}
			else{
				%>
				  <td><%=dltsbl%>%</td>
				<%
			}
		}

		%>
		</tr>
		<%
		//���С��ͳ��
		String tsxlbm=null;
		String tsxlmc=null;
		ls_sql="select tsxlbm,tsxlmc";
		ls_sql+=" FROM dm_tsxlbm";
		ls_sql+=" where tslxbm='"+tslxbm+"'";
		ls_sql+=" order by px,tsxlbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			tsxlbm=rs1.getString("tsxlbm");
			tsxlmc=rs1.getString("tsxlmc");

			%>
			<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td><%=tsxlmc%></td>
			<%

			for (int i=0;i<yuesl ;i++ )
			{
				String startDate=yue[i*2+1];
				String endDate  =yue[i*2+2];


				//��������
				int dltssl=0;
				int dlkhsl=0;
				ls_sql="select count(*),count(distinct crm_tsjl.khbh)";
				ls_sql+=" FROM crm_tsjl,crm_tsbm,crm_khxx  ";
				ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
				ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
				ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
				ls_sql+=" and crm_tsjl.clzt!='9'";//9:������
				ls_sql+=" and crm_tsbm.tslxbm='"+tslxbm+"'";
				ls_sql+=wheresql;
				ls_sql+=" and crm_tsjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
				ls_sql+=" and crm_tsjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					dltssl=rs.getInt(1);
					dlkhsl=rs.getInt(2);
				}
				rs.close();
				ps.close();


				//С������
				int xltssl=0;
				int xlkhsl=0;
				ls_sql="select count(*),count(distinct crm_tsjl.khbh)";
				ls_sql+=" FROM crm_tsjl,crm_tsbm,crm_khxx  ";
				ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
				ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
				ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
				ls_sql+=" and crm_tsjl.clzt!='9'";//9:������
				ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"'";
				ls_sql+=" and crm_tsbm.tslxbm='"+tslxbm+"'";
				ls_sql+=wheresql;
				ls_sql+=" and crm_tsjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
				ls_sql+=" and crm_tsjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					xltssl=rs.getInt(1);
					xlkhsl=rs.getInt(2);
				}
				rs.close();
				ps.close();

				//С��ռ��
				double xltsbl=0;
				double xlkhbl=0;

				if (dltssl!=0)
				{
					xltsbl=cf.round(xltssl*100.0/dltssl,2);
				}
				else{
					xltsbl=0;
				}

				if (dlkhsl!=0)
				{
					xlkhbl=cf.round(xlkhsl*100.0/dlkhsl,2);
				}
				else{
					xlkhbl=0;
				}

				if (xltsbl==0)//�����
				{
					%>
					  <td>-</td>
					<%
				}
				else{
					%>
					  <td><%=xltsbl%>%</td>
					<%
				}


			}

			%>
			</tr>
			<%
		}
		ps1.close();
		rs1.close();
	}
	ps2.close();
	rs2.close();



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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
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