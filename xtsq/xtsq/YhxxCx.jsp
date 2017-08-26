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
String lx=cf.GB2Uni(request.getParameter("lx"));
String xzfgs=cf.GB2Uni(request.getParameter("fgs"));
String xzdwbh=cf.GB2Uni(request.getParameter("dwbh"));
String xzzwbm=cf.GB2Uni(request.getParameter("zwbm"));
String yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));
String[] xzyhdlm=request.getParameterValues("yhdlm");

if (yhzbh.equals("") && xzfgs.equals("") && xzzwbm.equals("") )
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

	if (lx.equals("1"))//已分配用户名
	{
		//内部
		ls_sql ="select sq_yhssz.yhdlm,sq_yhssz.yhdlm||yhmc||'（'||dwmc||'）'||'（'||zwmc||'）'  ";
		ls_sql+=" from sq_yhssz,sq_yhxx,sq_dwxx,dm_zwbm  ";
		ls_sql+=" where sq_yhssz.yhdlm=sq_yhxx.yhdlm and sq_yhxx.zwbm=dm_zwbm.zwbm(+) ";
		ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh(+) and yhzbh='"+yhzbh+"' and yhjs!='S0' ";
		ls_sql+=" order by sq_yhxx.dwbh,yhmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			yhdlm=rs.getString(1);
			yhmc=rs.getString(2);

			%>
				parent.main.addYh("<%=yhdlm.trim()%>","<%=yhmc%>");
			<%

		}
		rs.close();
		ps.close();

		//供应商
		ls_sql ="select jxc_ppgysdzb.yhdlm,jxc_ppgysdzb.yhdlm||yhmc||'（供应商用户）' ";
		ls_sql+=" from jxc_ppgysdzb,sq_yhssz ";
		ls_sql+=" where sq_yhssz.yhdlm=jxc_ppgysdzb.yhdlm and yhzbh='"+yhzbh+"' ";
		ls_sql+=" order by yhmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			yhdlm=rs.getString(1);
			yhmc=rs.getString(2);

			%>
				parent.main.addYh("<%=yhdlm%>","<%=yhmc%>");
			<%

		}
		rs.close();
		ps.close();
	}
	else{//未分配用户名 
		//内部
		ls_sql ="select yhdlm,yhdlm||yhmc||'（'||dwmc||'）'||'（'||zwmc||'）' ";
		ls_sql+=" from sq_yhxx,sq_dwxx,dm_zwbm ";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+) and yhjs!='S0' ";
		ls_sql+=" and yhdlm is not null and yhdlm not in(select yhdlm from sq_yhssz where yhzbh='"+yhzbh+"') ";

		if (xzfgs!=null)
		{
			if (!(xzfgs.equals("")))	ls_sql+=" and  (sq_yhxx.ssfgs='"+xzfgs+"')";
		}
		if (xzdwbh!=null)
		{
			if (!(xzdwbh.equals("")))	ls_sql+=" and  (sq_yhxx.dwbh='"+xzdwbh+"')";
		}
		if (xzzwbm!=null)
		{
			if (!(xzzwbm.equals("")))	ls_sql+=" and  (sq_yhxx.zwbm='"+xzzwbm+"')";
		}

		String xzyhdlmStr=cf.arrayToSQL(xzyhdlm);
		if (xzyhdlmStr!=null && !xzyhdlmStr.equals(""))
		{
			ls_sql+=" and  (sq_yhxx.yhdlm not in ("+xzyhdlmStr+"))";
		}

		ls_sql+=" order by sq_yhxx.dwbh,yhmc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			yhdlm=rs.getString(1);
			yhmc=rs.getString(2);

			%>
				parent.main.addYh1("<%=yhdlm.trim()%>","<%=yhmc%>");
			<%

		}
		rs.close();
		ps.close();


		//供应商
		ls_sql ="select yhdlm,yhdlm||yhmc||'（供应商用户）' ";
		ls_sql+=" from jxc_ppgysdzb  ";
		ls_sql+=" where yhdlm not in(select yhdlm from sq_yhssz where yhzbh='"+yhzbh+"') ";

		if (xzfgs!=null)
		{
			if (!(xzfgs.equals("")))	ls_sql+=" and  (jxc_ppgysdzb.ssfgs='"+xzfgs+"')";
		}
		ls_sql+=" order by yhmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			yhdlm=rs.getString(1);
			yhmc=rs.getString(2);

			%>
				parent.main.addYh1("<%=yhdlm%>","<%=yhmc%>");
			<%

		}
		rs.close();
		ps.close();
	}

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

