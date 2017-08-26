<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String[] zsxm=request.getParameterValues("zsxm");
String[] lx=request.getParameterValues("lx");
String[] slstr=request.getParameterValues("sl");

double sl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//��ʼ��
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();

	conn.setAutoCommit(false);

	double yzsjz=dzbjje.getZsjz(conn,khbh);//ԭ��������;�ֵ+��Ȩ���;�ֵ


	for (int i=0;i<zsxm.length ;i++ )
	{
		
		if (slstr[i]==null || slstr[i].trim().equals(""))
		{
			continue;
		}


		sl=Double.parseDouble(slstr[i]);

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khzsxx  ";
		ls_sql+=" where khbh='"+khbh+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
		ls_sql+=" and lx='"+lx[i]+"'";//1����ѡ��2����ѡ��3����Ȩ
		ls_sql+=" order by  zsxm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if (lx[i].equals("3"))
		{
			if (count>0)
			{
				ls_sql="update crm_khzsxx set zxzssl=?,zxzsjz=cbdj*?";
				ls_sql+=" where khbh='"+khbh+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
				ls_sql+=" and lx='"+lx[i]+"'";//1����ѡ��2����ѡ��3����Ȩ
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sl);
				ps.setDouble(2,sl);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into crm_khzsxx (khbh,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz,zxzssl,zxzsjz,lx,lrr,lrsj)";
				ls_sql+=" select ?,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,0,0,?,?*cbdj,'"+lx[i]+"','"+yhmc+"',SYSDATE";
				ls_sql+=" from jc_tqzsxx";
				ls_sql+=" where fgsbh='"+ssfgs+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setDouble(2,sl);
				ps.setDouble(3,sl);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			if (count>0)
			{
				ls_sql="update crm_khzsxx set zxzssl=?,zxzsjz=cbdj*?";
				ls_sql+=" where khbh='"+khbh+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
				ls_sql+=" and lx='"+lx[i]+"'";//1����ѡ��2����ѡ��3����Ȩ
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sl);
				ps.setDouble(2,sl);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into crm_khzsxx (khbh,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz,zxzssl,zxzsjz,lx,lrr,lrsj)";
				ls_sql+=" select ?,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,0,0,?,?*cbdj,'"+lx[i]+"','"+yhmc+"',SYSDATE";
				ls_sql+=" from jc_hdzsxx";
				ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setDouble(2,sl);
				ps.setDouble(3,sl);
				ps.executeUpdate();
				ps.close();
			}
		}
	}


	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khzsxx";
	ls_sql+=" where khbh='"+khbh+"' and lx='2' and sjsl!=0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		conn.rollback();
		out.println("����ֻ�ܡ���ѡһ����������Ŀ��������ѡ��"+count+"����");
		return;
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khzsxx";
	ls_sql+=" where khbh='"+khbh+"' and sjsl!=0 and (sjsl<zsslxx OR sjsl>zsslsx)";
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
		out.println("�����С�"+count+"�������������������ޣ���С������");
		return;
	}


	//����ë����
	double zxhtjz=0;//���º�ͬ��ֵ
	double zxsgcbj=0;//����ë����
	double yjjzcs=0;//ҵ����ֵ����
	double zxyjjz=0;//����ҵ����ֵ
	ls_sql="SELECT zxhtjz,zxsgcbj,yjjzcs,zxyjjz";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxhtjz=rs.getDouble("zxhtjz");
		zxsgcbj=rs.getDouble("zxsgcbj");
		yjjzcs=rs.getDouble("yjjzcs");
		zxyjjz=rs.getDouble("zxyjjz");
	}
	rs.close();
	ps.close();


	double zxzsjz=dzbjje.getZsjz(conn,khbh);//����;�ֵ+��Ȩ���;�ֵ

	double zsjz=cf.round(zxzsjz-yzsjz,2);//���Ͳ��

	//���º�ͬ��ֵ
	zxhtjz=zxhtjz-zsjz;
	zxhtjz=cf.round(zxhtjz,2);

	//����ë����
	double zxmle=cf.round(zxhtjz-zxsgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���

	double zxmll=cf.round(zxmle/zxhtjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ
	
	zxyjjz=zxyjjz-cf.round(zsjz*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

	ls_sql="update crm_khqye set zxzsjz=?,zxhtjz=?,zxmle=?,zxmll=?,zxyjjz=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zxzsjz);
	ps.setDouble(2,zxhtjz);
	ps.setDouble(3,zxmle);
	ps.setDouble(4,zxmll);
	ps.setDouble(5,zxyjjz);
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