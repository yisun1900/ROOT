<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh = request.getParameterValues("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		String ddbh=null;
		String fgsbh=null;
		String clzt=null;
		double jjzkl=0;
		ls_sql="select ddbh,fgsbh,clzt,jjzkl";
		ls_sql+=" from  jc_jjzjx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			ddbh=rs.getString("ddbh");
			fgsbh=rs.getString("fgsbh");
			clzt=rs.getString("clzt");
			jjzkl=rs.getDouble("jjzkl");
		}
		rs.close();
		ps.close();


		if (!clzt.equals("01"))
		{
			conn.rollback();
			out.println("���󣡴���״̬����ȷ��"+zjxxh[i]);
			return;
		}


		//��ȡ����С������������������������������ʼ
		int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jcddblxs=rs.getInt(1);
			jcddmxblxs=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (jcddblxs==-100)
		{
			conn.rollback();
			out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
			return;
		}

		if (jcddmxblxs==-100)
		{
			conn.rollback();
			out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
			return;
		}
		//��ȡ����С������������������������������������
		
		
		String maxzjxxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(zjxxh,10,2)),0)";
		ls_sql+=" from  jc_jjzjx";
		ls_sql+=" where ddbh='"+ddbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		maxzjxxh=ddbh+cf.addZero(count,2);

		if (!zjxxh[i].equals(maxzjxxh))
		{
			conn.rollback();
			out.println("<BR>������������š�"+zjxxh[i]+"��ɾ��ʧ�ܣ�ֻ��ɾ�����µ������"+maxzjxxh);
			return;
		}

		ls_sql="update jc_jjzjx set clzt='00',jjzjxje=0,xcmzjxje=0,cpjjzjxje=0,zjxze=0  ,zqjjzjxje=0,zqxcmzjxje=0,zqcpjjzjxje=0,zqzjxze=0";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"' and clzt='01'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String gtxh=null;
		String lx=null;
		int ysl=0;
		int xsl=0;
		ls_sql="select gtxh,lx,ysl,xsl";
		ls_sql+=" from  jc_gtzjxmx";
		ls_sql+=" where  zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			gtxh=rs.getString("gtxh");
			lx=rs.getString("lx");
			ysl=rs.getInt("ysl");
			xsl=rs.getInt("xsl");

			if (lx.equals("1"))//1�����2������
			{
				ls_sql="update jc_jjgtmx set zjhsl="+ysl;
				ls_sql+=" where  gtxh='"+gtxh+"' and ddbh='"+ddbh+"'  ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();

		String xcmxh=null;
		ysl=0;
		xsl=0;
		ls_sql="select xcmxh,lx,ysl,xsl";
		ls_sql+=" from  jc_xcmzjxmx";
		ls_sql+=" where  zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xcmxh=rs.getString("xcmxh");
			lx=rs.getString("lx");
			ysl=rs.getInt("ysl");
			xsl=rs.getInt("xsl");

			if (lx.equals("1"))//1�����2������
			{
				ls_sql="update jc_jjxcmmx set zjhsl="+ysl;
				ls_sql+=" where  xcmxh='"+xcmxh+"' and ddbh='"+ddbh+"'  ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();

		String cpjjbh=null;
		ysl=0;
		xsl=0;
		ls_sql="select cpjjbh,lx,ysl,xsl";
		ls_sql+=" from  jc_cpjjzjxmx";
		ls_sql+=" where  zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			cpjjbh=rs.getString("cpjjbh");
			lx=rs.getString("lx");
			ysl=rs.getInt("ysl");
			xsl=rs.getInt("xsl");

			if (lx.equals("1"))//1�����2������
			{
				ls_sql="update jc_cpjjddmx set zjhsl=?,zjhzj=ROUND(khdj*?,"+jcddmxblxs+"),zqzjhzj=bzdj*?";
				ls_sql+=" where  ddbh='"+ddbh+"' and cpjjbh='"+cpjjbh+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setInt(1,ysl);
				ps1.setInt(2,ysl);
				ps1.setInt(3,ysl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();

	//�����������
		double jjzjxje=0;
		double cpjjzjxje=0;
		double xcmzjxje=0;
		double zjxze=0;

		double zqjjzjxje=0;
		double zqcpjjzjxje=0;
		double zqxcmzjxje=0;
		double zqzjxze=0;

		ls_sql="select sum(jjzjxje),sum(xcmzjxje),sum(cpjjzjxje),sum(zjxze)  ,sum(zqjjzjxje),sum(zqxcmzjxje),sum(zqcpjjzjxje),sum(zqzjxze)";
		ls_sql+=" from  jc_jjzjx";
		ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjzjxje=rs.getDouble(1);
			xcmzjxje=rs.getDouble(2);
			cpjjzjxje=rs.getDouble(3);
			zjxze=rs.getDouble(4);

			zqjjzjxje=rs.getDouble(5);
			zqxcmzjxje=rs.getDouble(6);
			zqcpjjzjxje=rs.getDouble(7);
			zqzjxze=rs.getDouble(8);
		}
		rs.close();
		ps.close();


		ls_sql="update jc_jjdd set jjzjje=ROUND(jjje+?,"+jcddmxblxs+"),xcmzjje=ROUND(xcmje+?,"+jcddmxblxs+"),cpjjzjje=ROUND(cpjjje+?,"+jcddmxblxs+"),zjhze=ROUND(htze+?,"+jcddblxs+")";
		ls_sql+=" ,zqjjzjje=zqjjje+?,zqxcmzjje=zqxcmje+?,zqcpjjzjje=zqcpjjje+?,zqzjhze=wdzje+?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,jjzjxje);
		ps.setDouble(2,xcmzjxje);
		ps.setDouble(3,cpjjzjxje);
		ps.setDouble(4,zjxze);

		ps.setDouble(5,zqjjzjxje);
		ps.setDouble(6,zqxcmzjxje);
		ps.setDouble(7,zqcpjjzjxje);
		ps.setDouble(8,zqzjxze);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where  gjz='"+zjxxh[i]+"' and lx='3' and czlx='2'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>