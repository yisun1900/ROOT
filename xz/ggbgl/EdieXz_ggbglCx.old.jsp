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
String xzfbfw = request.getParameter("xzfbfw");//所属城区编码
String xzfgs = request.getParameter("xzfgs");//公司名称 
String xzbm = request.getParameter("xzbm");//部门名称 
String ggbh = request.getParameter("ggbh");//部门名称 

if (xzfbfw==null)
{
	return ;
}
//out.println(xzfbfw);

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
int count=0;
try {
	conn=cf.getConnection();

	if (xzfbfw.equals("all"))// 选择全部用户 
	{
		outStr="";
		ls_sql="select yhdlm,'（'||dwmc||'）'||yhmc";
		ls_sql+=" from  sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and yhdlm is not null and sfzszg in('Y','N')";
		ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
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
					parent.main.addYh("<%=yhdlm%>","<%=yhmc%>",true);
				<%
			}
			else{
				%>
					parent.main.addYh("<%=yhdlm%>","<%=yhmc%>",false);
				<%
			}


		}
		rs.close();
		ps.close();


	}
	else if (xzfbfw.equals("gs"))//选择公司用户 
	{
		if (!xzbm.equals(""))//部门名称 被选择
		{
			outStr="";
			ls_sql="select yhdlm,'（'||dwmc||'）'||yhmc";
			ls_sql+=" from  sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and yhdlm is not null and sq_yhxx.dwbh='"+xzbm+"' and sfzszg in('Y','N')";
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
						parent.main.addYh("<%=yhdlm%>","<%=yhmc%>",true);
					<%
				}
				else{
					%>
						parent.main.addYh("<%=yhdlm%>","<%=yhmc%>",false);
					<%
				}

			}
			rs.close();
			ps.close();
		}
		else if (!xzfgs.equals(""))//公司名称 被选择
		{
			outStr="";
			ls_sql="select yhdlm,'（'||dwmc||'）'||yhmc";
			ls_sql+=" from  sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and yhdlm is not null and sq_yhxx.ssfgs='"+xzfgs+"' and sfzszg in('Y','N')";
			ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc";
	//		out.println(ls_sql);
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
						parent.main.addYh("<%=yhdlm%>","<%=yhmc%>",true);
					<%
				}
				else{
					%>
						parent.main.addYh("<%=yhdlm%>","<%=yhmc%>",false);
					<%
				}

			}
			rs.close();
			ps.close();


			outStr="";
			ls_sql="select dwbh,dwmc ";
			ls_sql+=" from sq_dwxx";
			ls_sql+=" where dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+xzfgs+"'";
			ls_sql+=" order by dwbh";
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				dwbh=rs.getString(1);
				dwmc=rs.getString(2);

				outStr+="%"+dwbh+"+"+dwmc;

			}
			rs.close();
			ps.close();
			if (!outStr.equals(""))
			{
				outStr=outStr.substring(1);
			}

			%>
				parent.main.addXq(parent.main.insertform.xzbm,"<%=outStr%>");
			<%
		}
		else{//显示公司名称 
			outStr="";
			ls_sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0')";
			ls_sql+=" order by dwbh";
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				dwbh=rs.getString(1);
				dwmc=rs.getString(2);

				outStr+="%"+dwbh+"+"+dwmc;

			}
			rs.close();
			ps.close();
			if (!outStr.equals(""))
			{
				outStr=outStr.substring(1);
			}

			%>
				parent.main.insertform.yhdlm.length=0;
				parent.main.addXq(parent.main.insertform.xzfgs,"<%=outStr%>");
			<%
		}
	}

/*
*/

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

