<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrph = request.getParameter("lrph");
String[] khbhbox=request.getParameterValues("khbhbox");
String[] khbh=request.getParameterValues("khbh");
String[] xh=request.getParameterValues("xh");
String[] zjxm=request.getParameterValues("zjxm");
String[] sgbz=request.getParameterValues("sgbz");

String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int zdxh=0;
String jzjxm=null;
String jsgbz=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT zdxh";
	ls_sql+=" FROM crm_lrph ";
	ls_sql+=" where lrph="+lrph;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zdxh=rs.getInt("zdxh");
	}
	ps.close();
	rs.close();

	int count=0;
	int ii=0;
	String oldxh="";
	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}
		if (oldxh.equals(xh[i]))
		{
			out.println("<BR>！！！错误，序号为:"+xh[i]+"的客户编号选择了多个");
			ii++;
		}
		else{
			oldxh=xh[i];
		}

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_lrphmx ";
		ls_sql+=" where lrph="+lrph+" and khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();
		if (count>0)
		{
			out.println("<BR>*****错误！序号为:"+xh[i]+"的客户编号["+khbh[i]+"]已被保存在该批次中");
			ii++;
		}

		if (zjxm[i].equals(""))
		{
			out.println("<BR>*****错误！序号为:"+xh[i]+"的客户编号["+khbh[i]+"]工程担当为空");
			ii++;
		}
		if (sgbz[i].equals(""))
		{
			out.println("<BR>警告！序号为:"+xh[i]+"的客户编号["+khbh[i]+"]施工班组为空");
		}

	}
	if (ii>0)
	{
		out.println("<P>*****存盘失败！！");
		return;
	}

	conn.setAutoCommit(false);

	int row=0;
	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}
		row++;

		ls_sql="SELECT zjxm,sgbz";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jsgbz=cf.fillNull(rs.getString("sgbz"));
			jzjxm=cf.fillNull(rs.getString("zjxm"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为:"+xh[i]+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		ps.close();
		rs.close();

		ls_sql="insert into crm_lrphmx(lrph,khbh,lrxh,sfsz,jzjxm,xzjxm,jsgbz,xsgbz) values(?,?,?,'N',?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lrph);
		ps.setString(2,khbh[i]);
		ps.setInt(3,(zdxh+row));

		ps.setString(4,jzjxm);
		ps.setString(5,cf.GB2Uni(zjxm[i]));
		ps.setString(6,jsgbz);
		ps.setString(7,cf.GB2Uni(sgbz[i]));
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_lrph set zdxh=zdxh+1 where lrph="+lrph;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set zjxm=?,sgbz=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(zjxm[i]));
		ps.setString(2,cf.GB2Uni(sgbz[i]));
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_lrph set sl=(select count(*) from crm_lrphmx where lrph="+lrph+") where lrph="+lrph;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	conn.commit();


	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where zjxm='"+cf.GB2Uni(zjxm[i])+"' and kgrq=(select kgrq from crm_khxx where khbh='"+khbh[i]+"')";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();

		if (count>1)
		{
			out.println("<BR>*****警告！序号为:"+xh[i]+"的客户编号["+khbh[i]+"]的工程担当["+cf.GB2Uni(zjxm[i])+"]当天有["+count+"]个工地开工");
		}

	}


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