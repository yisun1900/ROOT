<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
String[] lrxh = request.getParameterValues("lrxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String dqbm=null;
	double mmzkl=10;
	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql="select sq_dwxx.dqbm,jc_mmydd.mmzkl,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		mmzkl=rs.getDouble("mmzkl");
		jcddblxs=rs.getInt("jcddblxs");
		jcddmxblxs=rs.getInt("jcddmxblxs");
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������

	conn.setAutoCommit(false);

	for (int i=0;i<lrxh.length ;i++ )
	{
		ls_sql="delete from jc_wjjddmx";
		ls_sql+=" where lrxh="+lrxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	
	double zqwjhtje=0;
	double wjhtje=0;
	ls_sql="select sum(bzdj*sl),sum(dj*sl)";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqwjhtje=rs.getDouble(1);
		wjhtje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double wdzje=0;
	double htje=0;
	ls_sql="select fwf+zqmmhtje+zqblhtje+"+zqwjhtje+",fwf+mmhtje+blhtje+"+wjhtje;
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzje=rs.getDouble(1);
		htje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_mmydd set zqwjhtje=? ,wjhtje=ROUND(?,"+jcddblxs+") ,wdzje=?  ,htje=ROUND(?,"+jcddblxs+")";
	ls_sql+="                  ,zqzjhwjje=?,zjhwjje=ROUND(?,"+jcddblxs+"),zqzjhze=?,zjhze=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqwjhtje);
	ps.setDouble(2,wjhtje);
	ps.setDouble(3,wdzje);
	ps.setDouble(4,htje);

	ps.setDouble(5,zqwjhtje);
	ps.setDouble(6,wjhtje);
	ps.setDouble(7,wdzje);
	ps.setDouble(8,htje);
	ps.executeUpdate();
	ps.close();
	
	//���ɶ���
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where gjz='"+yddbh+"' and lx='1' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htje);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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