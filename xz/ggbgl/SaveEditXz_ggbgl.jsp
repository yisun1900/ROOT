<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%

String ls=null;
String ggmc=null;
String ggnr=null;
java.sql.Date fbsj=null;
String fbr=null;
String fbbm=null;
String fbfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
ggmc=cf.GB2Uni(request.getParameter("ggmc"));
ggnr=cf.GB2Uni(request.getParameter("ggnr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fbsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
fbfgs=cf.GB2Uni(request.getParameter("fbfgs"));
fbbm=cf.GB2Uni(request.getParameter("fbbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
//��ggfgs,ggbm,ggyhz��Ϊ����
String[] yhdlm=request.getParameterValues("yhdlm");
String ggfw = request.getParameter("ggfw");
String[] ggfgs = request.getParameterValues("ggfgs");
String bmfgs = request.getParameter("bmfgs");
String[] ggbm = request.getParameterValues("ggbm");
String[] ggyhz = request.getParameterValues("ggyhz");

String ggbh=null;
ggbh=cf.GB2Uni(request.getParameter("ggbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
oracle.sql.CLOB   clob=null; 
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

//�������� ������Ϣ

	ls_sql=" update xz_ggbgl set ggmc=?,ggnr=EMPTY_CLOB(),fbsj=?,fbr=?,fbbm=?,fbfgs=?,lrr=?,lrsj=?,ggfw=? ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ggmc);
	ps.setDate(2,fbsj);
	ps.setString(3,fbr);
	ps.setString(4,fbbm);
	ps.setString(5,fbfgs);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,ggfw);
	ps.executeUpdate();
	ps.close();

	ls_sql="select ggnr";
	ls_sql+=" from  xz_ggbgl ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("ggnr");
	}
	rs.close();
	ps.close();

	clob.putString(1,ggnr);

	ls_sql="update xz_ggbgl set ggnr=? ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setClob(1,clob);
	
	ps.executeUpdate();
	ps.close();
//ɾ��xz_ggfgs���ԭ����Ϣ
	ls_sql="delete from xz_ggfgs ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
//ɾ��xz_ggbm���ԭ����Ϣ
	ls_sql="delete from xz_ggbm ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
//ɾ��xz_ggyhz���ԭ����Ϣ
	ls_sql="delete from xz_ggyhz ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from xz_ggdx ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from xz_ggckjl ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//1�����漯������Ա����2������ֹ�˾��3�����沿�ţ�4�������û��飻5���������Ա��

//����ֹ�˾��������xz_ggfgs����ֹ�˾��Ϣ
	if(ggfw.equals("2"))
	{	
		for(int i=0;i<ggfgs.length;i++)
		{
			ls_sql=" insert into xz_ggfgs ( ggbh,ggfgs ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ggbh);
			ps.setString(2,ggfgs[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

//���沿�ţ�������xz_ggbm���벿�������ֹ�˾�Ͳ�����Ϣ
	if(ggfw.equals("3"))
	{
		for(int i=0;i<ggbm.length;i++)
		{
			ls_sql=" insert into xz_ggbm ( ggbh,ggfgs,ggbm ) ";
			ls_sql+=" values ( ?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ggbh);
			ps.setString(2,bmfgs);
			ps.setString(3,ggbm[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

//�����û��飬������xz_ggyhz�����û�����Ϣ
	if(ggfw.equals("4"))
	{	
		for(int i=0;i<ggyhz.length;i++)
		{
			ls_sql=" insert into xz_ggyhz ( ggbh,ggyhz ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ggbh);
			ps.setString(2,ggyhz[i]);
			ps.executeUpdate();
			ps.close();
		}
	}
//��xz_ggdx���빫����� ���ݲ�ͬ�Ĺ��淶Χ����������Ĳ������ 
	if (ggfw.equals("1"))//1�����漯������Ա����2������ֹ�˾��3�����沿�ţ�4�������û��飻5��ѡ��ĳ��Ա��
	{
		ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
		ls_sql+=" select '"+ggbh+"',yhdlm,yhmc,ssfgs,dwbh";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where yhdlm is not null and sfzszg in('Y','N','C')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
//����ѡ��ֹ�˾����Ŀ���ж�β���
	else if (ggfw.equals("2"))
	{	
		for(int i=0;i<ggfgs.length;i++)
		{
			ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
			ls_sql+=" select '"+ggbh+"',yhdlm,yhmc,ssfgs,dwbh";
			ls_sql+=" from sq_yhxx";
			ls_sql+=" where yhdlm is not null and sfzszg in('Y','N') and ssfgs='"+ggfgs[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
//����ѡ���ŵ���Ŀ���ж�β���
	else if (ggfw.equals("3"))
	{	for(int i=0;i<ggbm.length;i++)
		{
			ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
			ls_sql+=" select '"+ggbh+"',yhdlm,yhmc,ssfgs,dwbh";
			ls_sql+=" from sq_yhxx";
			ls_sql+=" where yhdlm is not null and sfzszg in('Y','N') and dwbh='"+ggbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
//����ѡ���û������Ŀ���ж�β���
	else if (ggfw.equals("4"))
	{
		if (yhjs.equals("A0") || yhjs.equals("A1"))//�ܲ�
		{	
			for(int i=0;i<ggyhz.length;i++)
			{
				ls_sql =" select sq_yhssz.yhdlm ";
				ls_sql+=" from sq_yhxx,sq_yhssz";
				ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
				ps=conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())//��˾�ڲ��û�
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_yhxx.yhdlm,sq_yhxx.yhmc,sq_yhxx.ssfgs,sq_yhxx.dwbh";
					ls_sql+=" from sq_yhxx,sq_yhssz";
					ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_yhxx.yhdlm is not null and sq_yhxx.sfzszg in('Y','N')";
					ls_sql+=" and sq_yhxx.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//���ڲ���ʱʹ�õ����飬����һ���û����ڶ����ͻᷢ��������ͻ�����Լ��˺�һ������
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				else//��Ӧ��
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_gysbm.yhdlm,sq_gysbm.gys,sq_gysbm.ssfgs,sq_gysbm.ssdw";
					ls_sql+=" from sq_gysbm,sq_yhssz";
					ls_sql+=" where sq_gysbm.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_gysbm.yhdlm is not null";
					ls_sql+=" and sq_gysbm.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//���ڲ���ʱʹ�õ����飬����һ���û����ڶ����ͻᷢ��������ͻ�����Լ��˺�һ������
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				rs.close();
				ps.close();
			}
		}
		else//���ܲ�
		{	
			for(int i=0;i<ggyhz.length;i++)
			{
				ls_sql =" select sq_yhssz.yhdlm ";
				ls_sql+=" from sq_yhxx,sq_yhssz";
				ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
				ps=conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())//��˾�ڲ��û�
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_yhxx.yhdlm,sq_yhxx.yhmc,sq_yhxx.ssfgs,sq_yhxx.dwbh";
					ls_sql+=" from sq_yhxx,sq_yhssz";
					ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_yhxx.yhdlm is not null and sq_yhxx.sfzszg in('Y','N') and sq_yhxx.ssfgs='"+ssfgs+"'";
					ls_sql+=" and sq_yhxx.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//���ڲ���ʱʹ�õ����飬����һ���û����ڶ����ͻᷢ��������ͻ�����Լ��˺�һ������
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				else//��Ӧ��
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_gysbm.yhdlm,sq_gysbm.gys,sq_gysbm.ssfgs,sq_gysbm.ssdw";
					ls_sql+=" from sq_gysbm,sq_yhssz";
					ls_sql+=" where sq_gysbm.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_gysbm.yhdlm is not null and sq_gysbm.ssfgs='"+ssfgs+"'";
					ls_sql+=" and sq_gysbm.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//���ڲ���ʱʹ�õ����飬����һ���û����ڶ����ͻᷢ��������ͻ�����Լ��˺�һ������
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				rs.close();
				ps.close();
			}
		}
	}
	else if (ggfw.equals("5"))
	{
		if (yhdlm!=null)
		{
			for (int i=0;i<yhdlm.length ;i++ )
			{
				if (yhdlm[i].equals(""))
				{
					continue;
				}
				ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
				ls_sql+=" select ?,?,yhmc,ssfgs,dwbh";
				ls_sql+=" from sq_yhxx";
				ls_sql+=" where yhdlm='"+yhdlm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ggbh);
				ps.setString(2,yhdlm[i]);
				ps.executeUpdate();
				ps.close();
			}
		}
	}
	//����

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