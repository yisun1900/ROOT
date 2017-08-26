<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String gysddph=cf.GB2Uni(request.getParameter("gysddph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//�����ⵥ״̬
	String rkdzt=null;
	String dqbm=null;
	ls_sql="select rkdzt,dqbm ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
		dqbm=rs.getString("dqbm");
	}
	else{
		out.print("������ⵥ["+rkph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	{
		out.print("������ⵥ���ύ��������¼�����ݣ�");
		return;
	}


	//��ѯ������Ʒ����
	int rkxh=0;
	ls_sql="select max(rkxh) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//д�������ϸ
	ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm            ,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc            ,cldlbm,clxlbm,rksl                             ,rkj             ,rkje                                                ,zcpsl                            ,scrq,scph,hjbh,hwbh,ccpsl,wldssl,thpsl,bfpsl,ccpzkl,zcpfkcsl,ccpfkcsl,bfpfkcsl ) ";
	ls_sql+=" select              ?,?+rownum,jxc_gysddmx.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,jxc_gysddmx.gysmc,cldlbm,clxlbm,jxc_gysddmx.dhsl-jxc_gysddmx.pssl,jxc_cljgb.dfgsjg,(jxc_gysddmx.dhsl-jxc_gysddmx.pssl)*jxc_cljgb.dfgsjg,jxc_gysddmx.dhsl-jxc_gysddmx.pssl,?   ,?   ,?   ,?   ,0,0,0,0,10,0,0,0 ";
	ls_sql+=" from  jxc_gysddmx,jxc_cljgb";
	ls_sql+=" where jxc_gysddmx.clbm=jxc_cljgb.clbm and jxc_gysddmx.gysddph='"+gysddph+"' and jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_gysddmx.dhsl-jxc_gysddmx.pssl>0 ";
	ls_sql+=" order by dhxh";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setInt(2,rkxh);
	ps.setDate(3,null);
	ps.setString(4,"");
	ps.setString(5,"");
	ps.setString(6,"");
	ps.executeUpdate();
	ps.close();

	//��Ӧ�̶�����ϸ
	ls_sql="update jxc_gysddmx set pssl=dhsl";
	ls_sql+=" where gysddph='"+gysddph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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