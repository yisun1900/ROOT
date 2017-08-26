<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String[] khbhbox=request.getParameterValues("khbhbox");
String[] khbh=request.getParameterValues("khbh");
String[] sjwjrqstr=request.getParameterValues("sjwjrq");
String[] bxjzsjstr=request.getParameterValues("bxjzsj");
String[] xh=request.getParameterValues("xh");

java.sql.Date sjwjrq=null;
java.sql.Date bxjzsj=null;
java.sql.Date sjjgrq=null;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jgcjdbm=null;
String jgcjdmc=null;
java.sql.Date jsjwjrq=null;

try {
	conn=cf.getConnection();

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
			out.println("<BR>！！！错误，序号为【"+xh[i]+"】的客户编号选择了多个");
			ii++;
		}
		else{
			oldxh=xh[i];
		}

	}
	if (ii>0)
	{
		out.println("<BR>存盘失败！！");
		return;
	}


	conn.setAutoCommit(false);

	int js=0;
	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}

		try{
			sjwjrq=java.sql.Date.valueOf(sjwjrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>序号为["+xh[i]+"]的[实竣工日期]格式输入不正确:"+sjwjrqstr[i]);
			return;
		}

		try{
			bxjzsj=java.sql.Date.valueOf(bxjzsjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>序号为["+xh[i]+"]的[保修截止时间]格式输入不正确:"+bxjzsjstr[i]);
			return;
		}


		js++;


		ls_sql="SELECT crm_khxx.gcjdbm,gcjdmc,sjwjrq,sjjgrq";
		ls_sql+=" FROM crm_khxx,dm_gcjdbm ";
		ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			jgcjdmc=cf.fillNull(rs.getString("gcjdmc"));
			jsjwjrq=rs.getDate("sjwjrq");
			sjjgrq=rs.getDate("sjjgrq");
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，序号为："+xh[i]+"的客户编号["+khbh[i]+"]不存在");
			return;
		}
		ps.close();
		rs.close();

		if (jgcjdbm.equals("5"))
		{
//			conn.rollback();
			out.println("<BR>！！！提醒，序号为【"+xh[i]+"】的客户编号【"+khbh[i]+"】已完结");
//			return;
		}


		if (!jgcjdbm.equals("5"))
		{
			
			String djjlh=null;
			ls_sql="select NVL(max(substr(djjlh,8,2)),0)";
			ls_sql+=" from  crm_gcjddjjl";
			ls_sql+=" where khbh='"+khbh[i]+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			djjlh=khbh[i]+cf.addZero(count+1,2);
			
			
			ls_sql="insert into crm_gcjddjjl ( djjlh,khbh,gcjdbm,djsj,ygcjdbm,lrr,lrsj,lrdw) ";
			ls_sql+=" values ( ?,?,?,?,?,?,TRUNC(SYSDATE),? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,djjlh);
			ps.setString(2,khbh[i]);
			ps.setString(3,"5");
			ps.setDate(4,sjwjrq);
			ps.setString(5,jgcjdbm);
			ps.setString(6,yhmc);
			ps.setString(7,lrdw);
			ps.executeUpdate();
			ps.close();
		}


		ls_sql="update crm_khxx set sjwjrq=?,gcjdbm='5',kbxbz='Y',bybxsm=null,bxkssj=?,bxjzsj=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sjwjrq);
		ps.setDate(2,sjjgrq);
		ps.setDate(3,bxjzsj);
		ps.executeUpdate();
		ps.close();


	}

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