<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String shbz="";
	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;
	ls_sql="select shbz,sfwc,khbh,zjxjme,glfjmje,sjjmje";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shbz=rs.getString("shbz");
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N") )//N��δ��ɣ�Y�����
	{
		out.println("����������δ��ɣ�����ɾ��");
		return;
	}

	if ( shbz.equals("Y") || shbz.equals("S"))//N��δ��ˣ�Y�����ͨ����S�����δͨ����M���������
	{
		out.println("��������������ˣ�����ɾ��");
		return;
	}


	String newzjxxh="";
	String gcjdbm="";
	String gdjsjd="";
	String sjsjsbz="";
	ls_sql="select gcjdbm,zjxxh,gdjsjd,sjsjsbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
	}
	rs.close();
	ps.close();

	if (sjsjsbz.equals("2"))//0��δ���㣻1��ǩ�����㣻2���깤����
	{
		out.println("�������ʦ�ѽ��㣬������ɾ��");
		return;
	}
	if (gdjsjd.equals("1"))//0��δ���㣻1���ѽ���
	{
		out.println("����ʩ�����ѽ��㣬������ɾ��");
		return;
	}


	ls_sql="select zjxxh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";//N��δ��ɣ�Y�������
	ls_sql+=" and lx in('3','4')";//1�����������2����������������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
	ls_sql+=" order by zjxxh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		newzjxxh=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!newzjxxh.equals(zjxxh))
	{
		out.println("����ֻ��ɾ�����µ��������¼:"+newzjxxh);
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="delete from crm_zjxtckhqye ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//���������
	ls_sql="update crm_zjxdj set zjje=0,jzjje=0,zqguanlif=0,zhguanlif=0,zqzjxsuijin=0,zjxsuijin=0";
	ls_sql+=" ,gczxzq=0,gcjxzq=0,gczxzh=0,gcjxzh=0,kglf=0,zjxrzf=0,zjxdjjje=0";
	ls_sql+=" ,zqzjze=0,zhzjze=0  ,zqqtsf=0,zhqtsf=0,qtsfsm=null  ,zqwjrqyexm=0,zhwjrqyexm=0,wjrqyexmsm=null,zqsjf=0,zhsjf=0";
	ls_sql+=" ,sfwc='N',shbz='M'";//N��δ��ˣ�Y����ˣ�M���������
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//������ˣ���ԭ������Ϣ
	if (shbz.equals("M"))//N��δ��ˣ�Y�����ͨ����S�����δͨ����M���������
	{

		String bjjb = null;
		ls_sql="select bjjb";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bjjb=rs.getString("bjjb");
		}
		rs.close();
		ps.close();

		String lx="";
		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lx=rs.getString("lx");
		}
		rs.close();
		ps.close();

		if (lx.equals("2"))//1�����ײͣ�2���ײ�
		{
			dzbj.Tc tc=new dzbj.Tc();
			double zctcje=tc.getZctcjeQ(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
			double wntcje=tc.getWntcjeQ(conn,zjxxh,khbh,"yz");//��ȡ:��ů�ײͽ��
			double jytcje=tc.getJytcjeQ(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��
			double sctcje=tc.getSctcjeQ(conn,zjxxh,khbh,"yz");//��ȡ:ɫ���ײͽ��
			double jktcje=tc.getJktcjeQ(conn,zjxxh,khbh,"yz");//��ȡ:�����ײͽ��

			ls_sql=" update crm_tckhqye set zctcjezjx=?,wntcjezjx=?,jytcjezjx=?,sctcjezjx=?,jktcjezjx=? ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,zctcje);
			ps.setDouble(2,wntcje);
			ps.setDouble(3,jytcje);
			ps.setDouble(4,sctcje);
			ps.setDouble(5,jktcje);
			ps.executeUpdate();
			ps.close();

			
			//��ʼ��
			dzbj.Zjx zjx=new dzbj.Zjx();
			//ɾ�����������ײ����Ķ����ֽ�
			zjx.DelZjxTcDdfj(conn,khbh,zjxxh,yhmc,lrbm,"yz");
		}
		
		
		//���������������Ϣ�����������������������������������
	}
	//��ԭ������Ϣ


	
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>