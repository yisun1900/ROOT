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


<%  
String dqbm = cf.unescape(request.getParameter("dqbm"));
String wherexh = cf.unescape(request.getParameter("xh"));//型号
String wheregg = cf.unescape(request.getParameter("gg"));//规格
String wherecpjjcz = cf.unescape(request.getParameter("cpjjcz"));//材质
if (wherexh.equals(""))
{
	return;
}

String cpjjbh=null;
String cpjjfg=null;
String cpjjmc=null;
String xh=null;
String gg=null;
String cpjjxl=null;
String cpjjcz=null;
String dj=null;
String cktp=null;
String cptp=null;
String cpsm=null;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

String cpjjhs="";

String ggStr="";
String cpjjczStr="";
String cpjjhsStr="";

try {
	conn=cf.getConnection();    //得到连接

	if (!wherecpjjcz.equals(""))
	{
		ls_sql="select cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,dj,cktp,cptp,cpsm,bz ";
		ls_sql+=" from  jc_cpjjbj";
		ls_sql+=" where  dqbm='"+dqbm+"' and xh='"+wherexh+"' and gg='"+wheregg+"' and cpjjcz='"+wherecpjjcz+"'";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next())
		{  
			cpjjbh=cf.fillNull(rs.getString("cpjjbh"));
			cpjjfg=cf.fillNull(rs.getString("cpjjfg"));
			cpjjmc=cf.fillNull(rs.getString("cpjjmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			cpjjxl=cf.fillNull(rs.getString("cpjjxl"));
			cpjjcz=cf.fillNull(rs.getString("cpjjcz"));
			dj=cf.fillNull(rs.getString("dj"));
			cktp=cf.fillNull(rs.getString("cktp"));
			cptp=cf.fillNull(rs.getString("cptp"));
			cpsm=cf.fillNull(rs.getString("cpsm"));
			bz=cf.fillNull(rs.getString("bz"));

			ggStr=gg+"~"+gg;
			cpjjczStr=cpjjcz+"~"+cpjjcz;
		}
		rs.close();
		ps.close();

		ls_sql="select jdm_cpjjhs.cpjjhs";
		ls_sql+=" from  jdm_cpjjhs,jdm_cpjjcz";
		ls_sql+=" where jdm_cpjjhs.cpjjczbm=jdm_cpjjcz.cpjjczbm and jdm_cpjjcz.cpjjcz='"+wherecpjjcz+"'";
		ls_sql+=" order by jdm_cpjjhs.cpjjhs";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			cpjjhs=rs.getString(1);

			cpjjhsStr+="^"+cpjjhs+"~"+cpjjhs;

		}
		rs.close();
		ps.close();

		if (!cpjjhsStr.equals(""))
		{
			cpjjhsStr=cpjjhsStr.substring(1);
		}

		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
			parent.main.insertform.cpjjbh.value="<%=cpjjbh%>";
			parent.main.insertform.cpjjfg.value="<%=cpjjfg%>";
			parent.main.insertform.cpjjmc.value="<%=cpjjmc%>";
			parent.main.insertform.xh.value="<%=xh%>";
			parent.main.insertform.cpjjxl.value="<%=cpjjxl%>";
			parent.main.insertform.bzdj.value="<%=dj%>";
			parent.main.addCpjjhs("<%=cpjjhsStr%>");
			parent.main.insertform.cpbz.value="<%=bz%>";
			parent.main.insertform.cpsm.value='<%=cpsm%>';
			parent.main.f_jszj(parent.main.insertform);
		//-->
		</SCRIPT>
		<%
	}
	else if (!wheregg.equals(""))
	{
		ls_sql="select cpjjcz";
		ls_sql+=" from  jc_cpjjbj";
		ls_sql+=" where  dqbm='"+dqbm+"' and xh='"+wherexh+"' and gg='"+wheregg+"'";
		ls_sql+=" order by cpjjcz";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		while (rs.next())
		{  
			cpjjcz=cf.fillNull(rs.getString("cpjjcz"));

			cpjjczStr+="^"+cpjjcz+"~"+cpjjcz;
		}
		rs.close();
		ps.close();

		if (!cpjjczStr.equals(""))
		{
			cpjjczStr=cpjjczStr.substring(1);
		}

		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
			parent.main.addCpjjcz("<%=cpjjczStr%>");
		//-->
		</SCRIPT>
		<%
	}
	else if (!wherexh.equals(""))
	{
		ls_sql="select distinct gg";
		ls_sql+=" from  jc_cpjjbj";
		ls_sql+=" where  dqbm='"+dqbm+"' and xh='"+wherexh+"'";
		ls_sql+=" order by gg";
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		while (rs.next())
		{  
			gg=cf.fillNull(rs.getString("gg"));

			ggStr+="^"+gg+"~"+gg;
		}
		rs.close();
		ps.close();

		if (!ggStr.equals(""))
		{
			ggStr=ggStr.substring(1);
		}

		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
			parent.main.addGg("<%=ggStr%>");
		//-->
		</SCRIPT>
		<%
	}

}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

