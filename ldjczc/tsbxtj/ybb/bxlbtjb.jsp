<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ls_sql=null;
String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
String dwbhsql="";
if (fgs!=null)
{
//	if (!(fgs.equals("")))	wheresql+=" and  (crm_tsbm.dwbh in(select dwbh from sq_dwxx where dwlx in('A1','F1','F2') and ssdw='"+fgs+"'))";
	if (!(fgs.equals("")))	wheresql+=" and  (crm_tsbm.ssfgs='"+fgs+"')";
	if (!(fgs.equals("")))	dwbhsql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_tsbm.dwbh='"+dwbh+"'";
//	if (!(dwbh.equals("")))	dwbhsql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

String all=null;
String tslxbm=null;
String tslxmc=null;
String tsxlbm=null;
String tsxlmc=null;
String tsyymc=null;

String gysmc=null;
String tspp=null;

int[] mark={3,3,1,2,4};//������ʾ������
//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;

int dltssl=0;
int dlkhtssl=0;
int dlalltssl=0;
double dlbfb=0;

int xltssl=0;
int xlkhtssl=0;
int xlalltssl=0;
double xlbfb=0;

int yytssl=0;
int yykhtssl=0;
int yyalltssl=0;
double yybfb=0;

int xlsl=0;
int yysl=0;
int row=0;
int row1=0;
int row2=0;
String bgcolor="#E8E8FF";

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <div align="center"><b>���޴���ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>���޴���</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT tslxmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by tslxmc";
	ls_sql+=" order by tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tslxmc=rs.getString("tslxmc");
		dltssl=rs.getInt("tssl");
		dlkhtssl=rs.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

        %> 
        <tr height="30" bgcolor="<%=bgcolor%>"> 
          <td width="26%" align="center"><%=tslxmc%></td>
          <td width="24%" align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
          <td width="50%"><img src="/images/ColuGif.gif" width="<%=dlbfb*3%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>����С��ͳ��(<%=sjfw%>--<%=sjfw2%>) </b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="25%"> 
            <div align="center"><b>���޴���</b></div>
          </td>
          <td width="20%">
            <div align="center"><b>����С��</b></div>
          </td>
          <td width="20%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
<%
	row=0;
	ls_sql="SELECT crm_tsbm.tslxbm,tslxmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_tsbm.tslxbm,tslxmc";
	ls_sql+=" order by tssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tslxbm=rs1.getString("tslxbm");
		tslxmc=rs1.getString("tslxmc");
		dltssl=rs1.getInt("tssl");
		dlkhtssl=rs1.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

		xlalltssl=0;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlalltssl=rs.getInt("alltssl");
		}
		ps.close();
		rs.close();

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tsbm.tsxlbm) xlsl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		row1=0;
		bgcolor="#E8E8FF";
		ls_sql="SELECT tsxlmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by tsxlmc";
		ls_sql+=" order by tssl desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center" rowSpan="<%=xlsl%>"><%=tslxmc%>��<%=dltssl%>�Σ�</td>
			  <td align="center"><%=tsxlmc%></td>
			  <td align="center"><%=xltssl%>��<%=xlkhtssl%>��</td>
			  <td><img src="/images/ColuGif.gif" width="<%=xlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(xlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			if (row1%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}
			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center"><%=tsxlmc%></td>
			  <td align="center"><%=xltssl%>��<%=xlkhtssl%>��</td>
			  <td><img src="/images/ColuGif.gif" width="<%=xlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(xlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();

	}
	ps1.close();
	rs1.close();

%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>����ԭ��ͳ��(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="18%"> 
            <div align="center"><b>���޴���</b></div>
          </td>
          <td width="17%">
            <div align="center"><b>����С��</b></div>
          </td>
		  <td  width="20%">
            <div align="center"><b>����ԭ��</b></div>
		  </td>
          <td width="15%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="30%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
<%
	row=0;
	ls_sql="SELECT crm_tsbm.tslxbm,tslxmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_tsbm.tslxbm,tslxmc";
	ls_sql+=" order by tssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tslxbm=rs1.getString("tslxbm");
		tslxmc=rs1.getString("tslxmc");
		dltssl=rs1.getInt("tssl");
		dlkhtssl=rs1.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;


		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		xlsl=0;

		ls_sql="SELECT count(distinct crm_tsbm.tsyybm) xlsl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		row1=0;
		bgcolor="#E8E8FF";
		//С���һ��
		ls_sql="SELECT crm_tsbm.tsxlbm,tsxlmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_tsbm.tsxlbm,tsxlmc";
		ls_sql+=" order by tssl desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsxlbm=rs.getString("tsxlbm");
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			if (row1%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			yysl=0;

			ls_sql="SELECT count(distinct crm_tsbm.tsyybm) yysl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yysl=rs2.getInt("yysl");
			}
			ps2.close();
			rs2.close();

			yyalltssl=0;
			ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yyalltssl=rs2.getInt("alltssl");
			}
			ps2.close();
			rs2.close();

			//ԭ���һ��
			ls_sql="SELECT tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsyybm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.lx='2'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ls_sql+=" group by tsyymc";
			ls_sql+=" order by count(*) desc";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center" rowSpan="<%=xlsl%>"><%=tslxmc%>��<%=dltssl%>�Σ�</td>
				  <td align="center" rowSpan="<%=yysl%>"><%=tsxlmc%>��<%=xltssl%>�Σ�</td>
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>��<%=yykhtssl%>��</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}

			//ԭ���n��
			while (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>��<%=yykhtssl%>��</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}
			ps2.close();
			rs2.close();
		}

		//С���n��
		while (rs.next())
		{
			tsxlbm=rs.getString("tsxlbm");
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			if (row1%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			yysl=0;

			ls_sql="SELECT count(distinct crm_tsbm.tsyybm) yysl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yysl=rs2.getInt("yysl");
			}
			ps2.close();
			rs2.close();

			yyalltssl=0;
			ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yyalltssl=rs2.getInt("alltssl");
			}
			ps2.close();
			rs2.close();

			//ԭ���һ��
			ls_sql="SELECT tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsyybm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.lx='2'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ls_sql+=" group by tsyymc";
			ls_sql+=" order by count(*) desc";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center" rowSpan="<%=yysl%>"><%=tsxlmc%>��<%=xltssl%>�Σ�</td>
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>��<%=yykhtssl%>��</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}

			//ԭ���n��
			while (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>��<%=yykhtssl%>��</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}
			rs2.close();
			ps2.close();
		}
		rs.close();
		ps.close();

	}
	rs1.close();
	ps1.close();

%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>ľ�ű���ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	dlalltssl=0;
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsbm.tsxlbm='1202'";//1202��ľ�ű���
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT crm_tsbm.tspp,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsbm.tsxlbm='1202'";//1202��ľ�ű���
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by tspp";
	ls_sql+=" order by tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gysmc=rs.getString("tspp");
		dltssl=rs.getInt("tssl");
		dlkhtssl=rs.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

        %> 
        <tr height="30" bgcolor="<%=bgcolor%>"> 
          <td align="center"><%=gysmc%></td>
          <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
          <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*4%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>ľ�ű���ԭ��ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="15%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>����ԭ��</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	row=0;
	ls_sql="SELECT crm_tsbm.tspp,count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsbm.tsxlbm='1202'";//1202��ľ�ű���
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by crm_tsbm.tspp";
	ls_sql+=" order by alltssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tspp=rs1.getString("tspp");
		dlalltssl=rs1.getInt("alltssl");

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tsbm.tsyybm) xlsl";
		ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		ls_sql="SELECT crm_tsbm.tsyybm,'��<B>'||tsxlmc||'</B>��'||tsyymc tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tsbm,crm_tsjl,dm_tsyybm,dm_tsxlbm,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ls_sql+=" group by tsxlmc,crm_tsbm.tsyybm,tsyymc";
		ls_sql+=" order by tssl desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center" rowSpan="<%=xlsl%>"><%=gysmc%></td>
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();
	}
	rs1.close();
	ps1.close();

%> 
      </table>

    </td>
  </tr>

  
  <tr>
    <td> 
      <div align="center"><b>������ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	dlalltssl=0;
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsbm.tsxlbm='1201'";//1201��������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT crm_tsbm.tspp,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsbm.tsxlbm='1201'";//1201��������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by tspp";
	ls_sql+=" order by tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gysmc=rs.getString("tspp");
		dltssl=rs.getInt("tssl");
		dlkhtssl=rs.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

        %> 
        <tr height="30" bgcolor="<%=bgcolor%>"> 
          <td align="center"><%=gysmc%></td>
          <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
          <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*4%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>������ԭ��ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="15%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>����ԭ��</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	row=0;
	ls_sql="SELECT crm_tsbm.tspp,count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsbm.tsxlbm='1201'";//1201��������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by crm_tsbm.tspp";
	ls_sql+=" order by alltssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tspp=rs1.getString("tspp");
		dlalltssl=rs1.getInt("alltssl");

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tsbm.tsyybm) xlsl";
		ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		ls_sql="SELECT crm_tsbm.tsyybm,'��<B>'||tsxlmc||'</B>��'||tsyymc tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tsbm,crm_tsjl,dm_tsyybm,dm_tsxlbm,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ls_sql+=" group by tsxlmc,crm_tsbm.tsyybm,tsyymc";
		ls_sql+=" order by tssl desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center" rowSpan="<%=xlsl%>"><%=gysmc%></td>
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();
	}
	rs1.close();
	ps1.close();

%> 
      </table>

    </td>
  </tr>

  <tr>
    <td> 
      <div align="center"><b>�Ҿ߱���ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	dlalltssl=0;
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsbm,crm_tsjl,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh  and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsbm.tsxlbm='1204'";//1204���Ҿ߱���
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT gysmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='2'";
	ls_sql+=" and sq_gysxx.gyslb='3'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by gyslb,gysmc";
	ls_sql+=" order by gyslb ,tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gysmc=rs.getString("gysmc");
		dltssl=rs.getInt("tssl");
		dlkhtssl=rs.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

        %> 
        <tr height="30" bgcolor="<%=bgcolor%>"> 
          <td align="center"><%=gysmc%></td>
          <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
          <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*4%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>�Ҿ߱���ԭ��ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="15%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>����ԭ��</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	row=0;
	ls_sql="SELECT crm_tspp.tspp,sq_gysxx.gysmc,count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='2'";
	ls_sql+=" and sq_gysxx.gyslb='3'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by crm_tspp.tspp,sq_gysxx.gysmc";
	ls_sql+=" order by alltssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tspp=rs1.getString("tspp");
		gysmc=rs1.getString("gysmc");
		dlalltssl=rs1.getInt("alltssl");

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tspp.tsyybm) xlsl";
		ls_sql+=" FROM crm_tspp,crm_tsjl,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		ls_sql="SELECT crm_tspp.tsyybm,'��<B>'||tsxlmc||'</B>��'||tsyymc tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tspp,crm_tsjl,dm_tsyybm,dm_tsxlbm,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tspp.tsyybm=dm_tsyybm.tsyybm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ls_sql+=" group by tsxlmc,crm_tspp.tsyybm,tsyymc";
		ls_sql+=" order by tssl desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center" rowSpan="<%=xlsl%>"><%=gysmc%></td>
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();
	}
	rs1.close();
	ps1.close();

%> 
      </table>

    </td>
  </tr>

  <tr>
    <td> 
      <div align="center"><b>���ı���ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	dlalltssl=0;
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='2'";
	ls_sql+=" and sq_gysxx.gyslb='4'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT gysmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='2'";
	ls_sql+=" and sq_gysxx.gyslb='4'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by gyslb,gysmc";
	ls_sql+=" order by gyslb ,tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gysmc=rs.getString("gysmc");
		dltssl=rs.getInt("tssl");
		dlkhtssl=rs.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

        %> 
        <tr height="30" bgcolor="<%=bgcolor%>"> 
          <td align="center"><%=gysmc%></td>
          <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
          <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*4%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>

    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>���ı���ԭ��ͳ��</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="15%"> 
            <div align="center"><b>����Ʒ��</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>����ԭ��</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>���޴�����������</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>���޴����ٷֱ�</b></div>
          </td>
        </tr>
        <%

	row=0;
	ls_sql="SELECT crm_tspp.tspp,sq_gysxx.gysmc,count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='2'";
	ls_sql+=" and sq_gysxx.gyslb='4'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by crm_tspp.tspp,sq_gysxx.gysmc";
	ls_sql+=" order by alltssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tspp=rs1.getString("tspp");
		gysmc=rs1.getString("gysmc");
		dlalltssl=rs1.getInt("alltssl");

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tspp.tsyybm) xlsl";
		ls_sql+=" FROM crm_tspp,crm_tsjl,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		ls_sql="SELECT crm_tspp.tsyybm,'��<B>'||tsxlmc||'</B>��'||tsyymc tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tspp,crm_tsjl,dm_tsyybm,dm_tsxlbm,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp='"+tspp+"' and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tspp.tsyybm=dm_tsyybm.tsyybm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm";//1��ľ�ţ�2������3���Ҿߣ�4������
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ls_sql+=" group by tsxlmc,crm_tspp.tsyybm,tsyymc";
		ls_sql+=" order by tssl desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center" rowSpan="<%=xlsl%>"><%=gysmc%></td>
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

			row++;
			if (row%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>��<%=dlkhtssl%>��</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();
	}
	rs1.close();
	ps1.close();

%> 
      </table>

    </td>
  </tr>

<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
</table>
</body>
</html>
