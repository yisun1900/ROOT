<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
int sjmj=0;
ls=request.getParameter("sjmj");
try{
	if (!(ls.equals("")))  sjmj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�����]����ת����������:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khwntcmch";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";//1����ů�ײͣ�2�������ײ�
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
		out.println("������ѡ��");
		return;
	}

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khwntcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lx='"+lx+"' and zjlx!='3'";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
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
		out.println("����ֻ��ѡ��һ��");
		return;
	}

	String zcsfxxz="";
	ls_sql="SELECT zcsfxxz";
	ls_sql+=" FROM bj_wntcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
    ls_sql+=" and bj_wntcmc.lx='"+lx+"'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsfxxz=rs.getString("zcsfxxz");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	ls_sql="insert into bj_khwntcmch ( zjxxh,khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,sjmj,zjlx ) ";
	ls_sql+=" select                   ?    ,?   ,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,?   ,'4'";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
	ls_sql+=" FROM bj_wntcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setInt(3,sjmj);
	ps.executeUpdate();
	ps.close();

	if (zcsfxxz.equals("1"))//1���Զ�ѡ��2���˹�ѡ��
	{
		ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
		ls_sql+=" select                  ?    ,?   ,cpmc,1   ,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,''    ,?  ,SYSDATE,? ,bz,'Y'";
		ls_sql+=" FROM bj_wntczcmx";
		ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,yhmc);
		ps.setString(4,lx);//1����ů�ײͣ�2�������ײ�
		ps.executeUpdate();
		ps.close();

		double tcjg=0;
		ls_sql="SELECT tcjg";
		ls_sql+=" FROM bj_khwntcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcjg=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double tcmxj=0;
		ls_sql="SELECT sum(ROUND(tcdj*sl,2))";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcmxj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (tcjg!=tcmxj)
		{
			conn.rollback();
			out.println("�����ײ��ܼ�["+tcjg+"]��������ϸ֮��["+tcmxj+"]");
			return;
		}
	}
	else{
		String cpmc=null;
		ls_sql="SELECT distinct cpmc";
		ls_sql+=" FROM bj_wntczcmx";
		ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
		ls_sql+=" order by cpmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			cpmc=rs.getString("cpmc");


			int cpsl=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_wntczcmx";
			ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"' and cpmc='"+cpmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cpsl=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (cpsl==1)//ֻ��һ������ѡ��
			{
				ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
				ls_sql+=" select                  ?    ,?   ,cpmc,1   ,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,''    ,?  ,SYSDATE,? ,bz,'Y'";
				ls_sql+=" FROM bj_wntczcmx";
				ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"' and cpmc='"+cpmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
				ps1.setString(3,yhmc);
				ps1.setString(4,lx);//1����ů�ײͣ�2�������ײ�
				ps1.executeUpdate();
				ps1.close();

			}
			else{//������Ҫѡ��
				ls_sql="insert into bj_khwntcmxh (zjxxh,khbh      ,cpmc      ,cpsl    ,dqbm      ,hxbm      ,tcmc      ,sl,lrr       ,lrsj   ,lx,sfbpx)";
				ls_sql+="            values('"+zjxxh+"','"+khbh+"','"+cpmc+"',"+cpsl+",'"+dqbm+"','"+hxbm+"','"+tcmc+"',0 ,'"+yhmc+"',SYSDATE,'"+lx+"','Y')";//1���Ҿ��ײͣ�2�������ƻ�
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}

		}
		rs.close();
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