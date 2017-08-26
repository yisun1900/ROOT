<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ckdh=cf.GB2Uni(request.getParameter("ckdh"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String[] wlbm=request.getParameterValues("wlbm");
String[] slStr=request.getParameterValues("sl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double sl=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<wlbm.length ;i++ )
	{
		//[单价]是否为空
		if (slStr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[出库数量]为空");
			return;
		}

		sl=0;
		try{
			sl=java.lang.Double.parseDouble(slStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！物流材料编码为["+cf.GB2Uni(wlbm[i])+"]的[出库数量]输入不正确:"+slStr[i].trim());
			return;
		}


		//材料出库明细
		ls_sql="insert into bj_clckmx (ckdh,wlbm,jswlbm,dqbm,cldlbm,glmc,pp,xhgg,jldwbm,jsjldwbm,wljsbz,dj,sl,je)";
		ls_sql+=" select '"+ckdh+"',wlbm,jswlbm,dqbm,cldlbm,glmc,pp,xhgg,jldwbm,jsjldwbm,wljsbz,dj,"+sl+",dj*"+sl;
		ls_sql+=" from bj_jzcljgb";
		ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("<BR>存盘失败！物流材料编码["+cf.GB2Uni(wlbm[i])+"]不存在");
			return;
		}
		ps.close();

	}


	double ckzsl=0;
	double ckzje=0;

	ls_sql="select sum(sl),sum(je) ";
	ls_sql+=" from  bj_clckmx";
	ls_sql+=" where  (ckdh='"+ckdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckzsl=rs.getDouble(1);
		ckzje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_clckd set ckzsl="+ckzsl+",ckzje="+ckzje;
	ls_sql+=" where ckdh='"+ckdh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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