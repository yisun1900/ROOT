<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	cwgl.Cwgl cwgl=new cwgl.Cwgl();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		int sqjl=0;
		ls_sql="select count(*)";
		ls_sql+=" from cw_sgdjssqjl";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ls_sql+=" and zt='1'";//1��δ�����ѣ�2���Ѳ�����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sqjl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (sqjl>0)
		{
			conn.rollback();
			out.println("<BR>�������в�������Ȩ��¼����δ�����ѣ���������Ȩ");
			return;
		}

		String gdjsjd=null;
		double wdzgce=0;
		double qye=0;

		double zqljzjx=0;
		double zhljzjx=0;
		double cwsfke=0;
		ls_sql="select gdjsjd,wdzgce,qye,zqljzjx,zhljzjx,cwsfke";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");
			zqljzjx=rs.getDouble("zqljzjx");
			zhljzjx=rs.getDouble("zhljzjx");
			cwsfke=rs.getDouble("cwsfke");

			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		double khpck=0;
		double yqf=0;
		double jsyh=0;
		ls_sql="select khpck,yqf,jsyh";
		ls_sql+=" from crm_khqye";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khpck=rs.getDouble("khpck");
			yqf=rs.getDouble("yqf");
			jsyh=rs.getDouble("jsyh");
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("F"))//E	�ڶ��β�����
		{
			conn.rollback();
			out.println("<BR>�������ͻ����["+khbh[i]+"]����״̬����ȷ���Ѳ�������");
			return;
		}

		double yfkze=cwgl.getAllFkje(khbh[i]);

		if (yfkze-jsyh-khpck-yqf-cwsfke>100)
		{
			conn.rollback();
			out.println("<BR>�������ͻ����["+khbh[i]+"]���󣬿ͻ�Ƿ�����100Ԫ�����ܽ��㣬����ǿ�ƽ�������<P>Ӧ�����ܶ�:"+yfkze+"<BR>�����Ż�:"+jsyh+"���ͻ��⳥��:"+khpck+"�����ڷ�:"+yqf+"<BR>ʵ����:"+cwsfke+"<P>Ƿ��:"+cf.round(yfkze-jsyh-khpck-yqf-cwsfke,2));
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_gcfxysjl  ";
		ls_sql+=" where crm_gcfxysjl.khbh='"+khbh[i]+"' and crm_gcfxysjl.ysjg='2' ";//'1','�ϸ�','2','���ϸ�'
		ls_sql+=" order by crm_gcfxysjl.ysjlh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("<BR>�������ͻ����["+khbh[i]+"]��������δͨ�������ܲ�����");
			return;
		}

		String setgdjsjd="X";//X	�����깤����

		ls_sql="update crm_khxx set gdjsjd='"+setgdjsjd+"'";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdjssqjl ";
		ls_sql+=" where  khbh='"+khbh[i]+"' and gdjsjd='"+setgdjsjd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		String sqr=(String)session.getAttribute("yhmc");
		String sqbm=(String)session.getAttribute("dwbh");

		ls_sql =" insert into cw_sgdjssqjl (khbh      ,gdjsjd      ,ygdjsjd      ,sqr      ,sqsj   ,sqbm      ,zt ,bz) ";
		ls_sql+="                    values('"+khbh[i]+"','"+setgdjsjd+"','"+gdjsjd+"','"+sqr+"',SYSDATE,'"+sqbm+"','1','')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}



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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>