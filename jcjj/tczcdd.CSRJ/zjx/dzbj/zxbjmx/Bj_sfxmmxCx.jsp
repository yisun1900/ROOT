<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
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
String sfxmbm = request.getParameter("sfxmbm");//所属城区编码
String dqbm = request.getParameter("dqbm");//所属城区编码

if (sfxmbm==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sflx=null;
String sflxmc=null;
String bz=null;
double gdje=0;
String jldw=null;

try {
	conn=cf.getConnection();

	ls_sql="select sflx,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额（可改）','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额（不可改）','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflxmc,gdje,bz";
	ls_sql+=" ,jldw   ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where sfxmbm='"+sfxmbm+"' and dqbm='"+dqbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sflx=rs.getString(1);
		sflxmc=rs.getString(2);
		gdje=rs.getDouble(3);
		bz=cf.fillNull(rs.getString(4));
		jldw=cf.fillNull(rs.getString(5));

		if (sflx.equals("2"))//2：固定金额(设计师可改)
		{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="<%=gdje%>";
				parent.main.insertform.dj.value="<%=gdje%>";
				parent.main.insertform.dj.readOnly=false;
				parent.main.insertform.sl.readOnly=false;
				parent.main.insertform.sfbfb.value="不需录入，自动计算";
				parent.main.insertform.sfbfb.readOnly=true;
				parent.main.getJe(parent.main.insertform);
			<%
		}
		else if (sflx.equals("4"))//4：固定金额(设计师不可改)
		{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="<%=gdje%>";
				parent.main.insertform.dj.value="<%=gdje%>";
				parent.main.insertform.dj.readOnly=true;
				parent.main.insertform.sl.readOnly=false;
				parent.main.insertform.sfbfb.value="不需录入，自动计算";
				parent.main.insertform.sfbfb.readOnly=true;
				parent.main.getJe(parent.main.insertform);
			<%
		}
		else if (sflx.equals("1"))//1：工程直接费百分比(不可改)
		{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="";
				parent.main.insertform.dj.value="不需录入，自动计算";
				parent.main.insertform.dj.readOnly=true;
				parent.main.insertform.sfbfb.value="不需录入，自动计算";
				parent.main.insertform.sfbfb.readOnly=true;
				parent.main.insertform.sl.value="1";
				parent.main.insertform.sl.readOnly=true;
				parent.main.getJe(parent.main.insertform);
			<%
		}
		else if (sflx.equals("A"))//A：工程直接费百分比(可改)
		{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="";
				parent.main.insertform.dj.value="不需录入，自动计算";
				parent.main.insertform.dj.readOnly=true;
				parent.main.insertform.sfbfb.value="";
				parent.main.insertform.sfbfb.readOnly=false;
				parent.main.insertform.sl.value="1";
				parent.main.insertform.sl.readOnly=true;
				parent.main.getJe(parent.main.insertform);
			<%
		}
		else{
			%>
				parent.main.insertform.sflx.value="<%=sflxmc%>";
				parent.main.insertform.bz.value="<%=bz%>";
				parent.main.insertform.jldw.value="<%=jldw%>";
				parent.main.insertform.bzdj.value="";
				parent.main.insertform.dj.value="不需录入，自动计算";
				parent.main.insertform.dj.readOnly=true;
				parent.main.insertform.sl.value="1";
				parent.main.insertform.sl.readOnly=true;
				parent.main.insertform.sfbfb.value="不需录入，自动计算";
				parent.main.insertform.sfbfb.readOnly=true;
				parent.main.getJe(parent.main.insertform);
			<%
		}


	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



//-->
</SCRIPT>
