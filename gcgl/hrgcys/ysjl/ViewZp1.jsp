<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ysjlh=request.getParameter("ysjlh");
String getstart=request.getParameter("start");
String getend=request.getParameter("end");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int curpage=1;
int pages=9;
int lines=3;

int s1=1;
int e1=pages;

if (getstart==null || getstart.equals(""))
{
}
else{
	s1=Integer.parseInt(getstart);
}

if (getend==null || getend.equals(""))
{
}
else{
	e1=Integer.parseInt(getend);
}
try 
{
	conn=cf.getConnection();

	int sl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();


%>
<body bgcolor="#FFFFFF">
<CENTER><B>验收记录号：<%=ysjlh%></B><BR><HR>
</CENTER>

  <%
	for (int i=0;i<sl*1.0/pages ;i++ )
	{
		int start=0;
		int end=0;

		start=i*pages+1;
		end=(i+1)*pages;
		if (end>sl)
		{
			end=sl;
		}

		if (start==end)
		{
			out.println("<A HREF='ViewZp1.jsp?ysjlh="+ysjlh+"&start="+start+"&end="+end+"'>"+start+"</A>&nbsp;&nbsp;");
		}
		else{
			out.println("<A HREF='ViewZp1.jsp?ysjlh="+ysjlh+"&start="+start+"&end="+end+"'>"+start+"-"+end+"</A>&nbsp;&nbsp;");
		}

	}
  %>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<%

	String yszpmc=null;
	String zpxm=null;
	String zplx=null;
	String zpsm=null;
	String zpml=null;
	String kkzpbz=null;
	String zpshbz=null;
	String shr=null;
	String shsj=null;
	String shsm=null;
	int js=0;
	ls_sql="SELECT yszpmc,zpxm,zplx,zpsm,zpml,DECODE(kkzpbz,'0','不可看','1','可看') kkzpbz,DECODE(zpshbz,'Y','合格','B','不合格','C','不合格重拍','N','未审核') zpshbz,shr,shsj,shsm";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ls_sql+=" order by yszpmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);
		zpxm=cf.fillNull(rs.getString(2));
		zplx=cf.fillNull(rs.getString("zplx"));
		zpsm=cf.fillNull(rs.getString("zpsm"));
		zpml=cf.fillNull(rs.getString("zpml"));
		kkzpbz=cf.fillHtml(rs.getString("kkzpbz"));
		zpshbz=cf.fillHtml(rs.getString("zpshbz"));
		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shsm=cf.fillHtml(rs.getString("shsm"));

		js++;

		if (js>=s1 && js<=e1)
		{
			if (lines==1)
			{
				%>
				<tr bgcolor="#FFFFFF" valign="top"> 
				  <td width="33%"> 
					<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="300"></A>
					<BR>文件名称：<%=yszpmc%>
					<BR>对应项目：<%=zpxm%>
					<BR>照片说明：<%=zpsm%>	
					<BR>审核标志：<%=zpshbz%>&nbsp;&nbsp;&nbsp;&nbsp;客户可看照片：<%=kkzpbz%>	
					<BR>审核人：<%=shr%>（<%=shsj%>）	
					<BR>审核说明：<%=shsm%>	
				</tr>
				<%
			}
			else{
				if (js%lines==1)
				{
					%>
					<tr bgcolor="#FFFFFF" valign="top"> 
					  <td width="33%"> 
						<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="300"></A>
						<BR>文件名称：<%=yszpmc%>
						<BR>对应项目：<%=zpxm%>
						<BR>照片说明：<%=zpsm%>	
						<BR>审核标志：<%=zpshbz%>&nbsp;&nbsp;&nbsp;&nbsp;客户可看照片：<%=kkzpbz%>	
						<BR>审核人：<%=shr%>（<%=shsj%>）	
						<BR>审核说明：<%=shsm%>	
					  </td>
					<%
				}
				else if (js%lines==0)
				{
					%>
					  <td width="34%"> 
						<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="300"></A>
						<BR>文件名称：<%=yszpmc%>
						<BR>对应项目：<%=zpxm%>
						<BR>照片说明：<%=zpsm%>	
						<BR>审核标志：<%=zpshbz%>&nbsp;&nbsp;&nbsp;&nbsp;客户可看照片：<%=kkzpbz%>	
						<BR>审核人：<%=shr%>（<%=shsj%>）	
						<BR>审核说明：<%=shsm%>	
					  </td>
					</tr>
					<%
				}
				else
				{
					%>
					  <td width="33%"> 
						<A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="300"></A>
						<BR>文件名称：<%=yszpmc%>
						<BR>对应项目：<%=zpxm%>
						<BR>照片说明：<%=zpsm%>	
						<BR>审核标志：<%=zpshbz%>&nbsp;&nbsp;&nbsp;&nbsp;客户可看照片：<%=kkzpbz%>	
						<BR>审核人：<%=shr%>（<%=shsj%>）	
						<BR>审核说明：<%=shsm%>	
					  </td>
					<%
				}
			}
		}

	}
	rs.close();
	ps.close();

	if (lines==1)
	{
	}
	else{
		if (js%lines!=0)
		{
			for (int j=js%lines;j<lines ;j++ )
			{
				%>
				  <td width="34%">&nbsp;</td>
				<%
			}

			%>
			</tr>
			<%
		}
	}
}
catch (Exception e) {
  out.print("上载照片失败，Exception:" + e);
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
</table>
</body>
</html>