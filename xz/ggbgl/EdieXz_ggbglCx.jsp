<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%  
String ggfw = request.getParameter("ggfw");//公告范围
String bmfgs = request.getParameter("bmfgs");//公司名称 
String xzfgs = request.getParameter("xzfgs");//公司名称 
String xzbm = request.getParameter("xzbm");//部门名称 
String ggbh = request.getParameter("ggbh");//公告编号 

if (ggfw==null || ggfw.equals(""))
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String yhdlm=null;
String yhmc=null;
String dwbh=null;
String dwmc=null;
String outStr="";
try {
	conn=cf.getConnection();

	int count=0;

	if (ggfw.equals("3"))//3：公告部门
	{
		ls_sql="select dwbh,dwmc ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+bmfgs+"'";
		ls_sql+=" order by dwbh";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			dwbh=rs.getString(1);
			dwmc=rs.getString(2);

			ls_sql="select count(*)";
			ls_sql+=" from  xz_ggbm";
			ls_sql+=" where ggbh='"+ggbh+"' and ggbm='"+dwbh+"'";
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
				%>
					parent.main.addOption(parent.main.insertform.ggbm,"<%=dwbh%>","<%=dwmc%>",true);
				<%
			}
			else{
				%>
					parent.main.addOption(parent.main.insertform.ggbm,"<%=dwbh%>","<%=dwmc%>",false);
				<%
			}
		}
		rs.close();
		ps.close();


	}
	else if (ggfw.equals("5"))//选择某个员工 
	{
		if (!xzbm.equals(""))//部门名称 被选择
		{
			outStr="";
			ls_sql="select yhdlm,'（'||dwmc||'）'||yhmc";
			ls_sql+=" from  sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sq_yhxx.dwbh='"+xzbm+"' and sfzszg in('Y','N')";
			ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				yhdlm=rs.getString(1);
				yhmc=rs.getString(2);

				ls_sql="select count(*)";
				ls_sql+=" from  xz_ggdx";
				ls_sql+=" where ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"'";
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
					%>
						parent.main.addOption(parent.main.insertform.yhdlm,"<%=yhdlm%>","<%=yhmc%>",true);
					<%
				}
				else{
					%>
						parent.main.addOption(parent.main.insertform.yhdlm,"<%=yhdlm%>","<%=yhmc%>",false);
					<%
				}

			}
			rs.close();
			ps.close();
		}
		else if (!xzfgs.equals(""))//公司名称 被选择
		{
			if (xzfgs.equals("all"))//全部公司
			{
				//用户
				ls_sql="select yhdlm,'（'||dwmc||'）'||yhmc";
				ls_sql+=" from  sq_yhxx,sq_dwxx";
				ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N')";
				ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				while (rs.next())
				{
					yhdlm=rs.getString(1).trim();
					yhmc=rs.getString(2);


					ls_sql="select count(*)";
					ls_sql+=" from  xz_ggdx";
					ls_sql+=" where ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"'";
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
						%>
							parent.main.addOption(parent.main.insertform.yhdlm,"<%=yhdlm%>","<%=yhmc%>",true);
						<%
					}
					else{
						%>
							parent.main.addOption(parent.main.insertform.yhdlm,"<%=yhdlm%>","<%=yhmc%>",false);
						<%
					}

				}
				rs.close();
				ps.close();
			}
			else{
				//部门 
				ls_sql="select dwbh,dwmc ";
				ls_sql+=" from sq_dwxx";
				ls_sql+=" where sq_dwxx.cxbz='N' and dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+xzfgs+"'";
				ls_sql+=" order by dwbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				while (rs.next())
				{
					dwbh=rs.getString(1);
					dwmc=rs.getString(2);

					%>
						parent.main.addOption(parent.main.insertform.xzbm,"<%=dwbh%>","<%=dwmc%>");
					<%

				}
				rs.close();
				ps.close();

				//用户
				ls_sql="select yhdlm,'（'||dwmc||'）'||yhmc";
				ls_sql+=" from  sq_yhxx,sq_dwxx";
				ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sq_yhxx.ssfgs='"+xzfgs+"' and sfzszg in('Y','N')";
				ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				while (rs.next())
				{
					yhdlm=rs.getString(1).trim();
					yhmc=rs.getString(2);

					ls_sql="select count(*)";
					ls_sql+=" from  xz_ggdx";
					ls_sql+=" where ggbh='"+ggbh+"' and yhdlm='"+yhdlm+"'";
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
						%>
							parent.main.addOption(parent.main.insertform.yhdlm,"<%=yhdlm%>","<%=yhmc%>",true);
						<%
					}
					else{
						%>
							parent.main.addOption(parent.main.insertform.yhdlm,"<%=yhdlm%>","<%=yhmc%>",false);
						<%
					}

				}
				rs.close();
				ps.close();
			}
		}
	}

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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

//-->
</SCRIPT>

