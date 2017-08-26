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

		String gdjsjd="";
		String gcjdbm="";
		double sfke=0;
		double cwsfke=0;
		String fgsbh="";
		String sgd="";
		ls_sql="select gdjsjd,gcjdbm,sfke,cwsfke,fgsbh,sgd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
			gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			sfke=rs.getDouble("sfke");
			cwsfke=rs.getDouble("cwsfke");
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			sgd=cf.fillNull(rs.getString("sgd"));
		}
		rs.close();
		ps.close();

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
			out.println("<BR>��������������δͨ�������ܲ�����");
			return;
		}

		//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5���ͻ���᣻7����ͬ�쳣��ֹ
		if (gcjdbm.equals("4"))
		{
			conn.rollback();
			out.println("<BR>���������󣬹����깤");
			return;
		}
		else if (gcjdbm.equals("5"))
		{
			conn.rollback();
			out.println("<BR>���������󣬿ͻ����");
			return;
		}
		else if (gcjdbm.equals("7"))
		{
			conn.rollback();
			out.println("<BR>���������󣬺�ͬ�쳣��ֹ");
			return;
		}

		if (sgd.equals(""))
		{
			conn.rollback();
			out.println("<BR>����������δ�ɵ�");
			return;
		}

		int ztjc=0;
		ls_sql="select count(*)";
		ls_sql+=" from dm_gdjsjd";
		ls_sql+=" where gdjsjd='"+gdjsjd+"' and ztlx='1'";//1����Ȩ��2�������ѣ�3�����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ztjc=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ztjc==0)
		{
			conn.rollback();
			out.println("����״̬����ȷ");
			return;
		}

		String nextzt="";//��һ��������ȱ���
		int bfcs=0;//��������
		ls_sql="select nextzt,bfcs";
		ls_sql+=" from dm_gdjsjd";
		ls_sql+=" where gdjsjd='"+gdjsjd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nextzt=cf.fillNull(rs.getString("nextzt"));//��һ��������ȱ���
			bfcs=rs.getInt("bfcs");//��������
		}
		rs.close();
		ps.close();
			
		String sksh="";//�����Ƿ���������
		String skshStr="";
		double fkbl=0;//Ҫ�󸶿����
		String yqgcjdmc="";//Ҫ�󹤳̽���
		ls_sql="select fkbl,sksh,DECODE(sksh,'Y','�����','N','�������') skshStr,gcjdmc";
		ls_sql+=" from dm_sgdjscsb";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fkbl=rs.getDouble("fkbl");
			sksh=rs.getString("sksh");
			skshStr=rs.getString("skshStr");
			yqgcjdmc=rs.getString("gcjdmc");
		}
		rs.close();
		ps.close();

		//����Ҫ�󹤳̽���
		int gcjdjc=0;
		ls_sql="select count(*)";
		ls_sql+=" from dm_yqgcjd";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs+" and gcjdbm='"+gcjdbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjdjc=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (gcjdjc==0)
		{
			conn.rollback();
			out.println("<BR>���������̽��ȴ���");
			return;
		}

		double fkze=cwgl.getAllFkje(khbh[i]);//��ȡӦ�����ܽ��

		if (sksh.equals("Y"))//�����Ƿ���������  Y������ˣ�N���������
		{
			if (cwsfke+1<cf.round(fkze*fkbl/100,2))
			{
				conn.rollback();
				out.println("<BR>���������󣬸���㣬���߲���δ��ˣ����Ӧ����:"+cf.round(fkze*fkbl/100,2)+"��ʵ��֧��:"+cwsfke);
				return;
			}
		}
		else {
			if (sfke+1<cf.round(fkze*fkbl/100,2))
			{
				conn.rollback();
				out.println("<BR>���������󣬸���㣬���Ӧ����:"+cf.round(fkze*fkbl/100,2)+"��ʵ��֧��:"+sfke);
				return;
			}
		}
		
		ls_sql="update crm_khxx set gdjsjd='"+nextzt+"'";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdjssqjl ";
		ls_sql+=" where  khbh='"+khbh[i]+"' and gdjsjd='"+nextzt+"' and zt='1'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		String sqr=(String)session.getAttribute("yhmc");
		String sqbm=(String)session.getAttribute("dwbh");

		ls_sql =" insert into cw_sgdjssqjl (khbh      ,gdjsjd      ,ygdjsjd      ,sqr      ,sqsj   ,sqbm      ,zt ,bz) ";
		ls_sql+="                    values('"+khbh[i]+"','"+nextzt+"','"+gdjsjd+"','"+sqr+"',SYSDATE,'"+sqbm+"','1','')";
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