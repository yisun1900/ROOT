<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String zklx=request.getParameter("zklx");
String xgr=null;
java.sql.Date xgsj=null;
xgr=cf.GB2Uni(request.getParameter("xgr"));
ls=request.getParameter("xgsj");
try{
	if (!(ls.equals("")))  xgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xgsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸�ʱ��]����ת����������:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));

String khbh=request.getParameter("khbh");
String khxm=cf.GB2Uni(request.getParameter("khxm"));

double gxqzkl=0;
double gxhzkl=0;
ls=request.getParameter("gxqzkl");
try{
	if (!(ls.equals("")))  gxqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxqzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǰֱ�ӷ��ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhzkl");
try{
	if (!(ls.equals("")))  gxhzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º�ֱ�ӷ��ۿ���]����ת����������:"+e);
	return;
}


double gxqcdzwjmje=0;
ls=request.getParameter("gxqcdzwjmje");
try{
	if (!(ls.equals("")))  gxqcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxqcdzwjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǰ��ͬ�����]����ת����������:"+e);
	return;
}
double gxhcdzwjmje=0;
ls=request.getParameter("gxhcdzwjmje");
try{
	if (!(ls.equals("")))  gxhcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhcdzwjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º��ͬ�����]����ת����������:"+e);
	return;
}

double gxqzjxzkl=0;
double gxhzjxzkl=0;
ls=request.getParameter("gxqzjxzkl");
try{
	if (!(ls.equals("")))  gxqzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxqzjxzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǰ�������ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("gxhzjxzkl");
try{
	if (!(ls.equals("")))  gxhzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhzjxzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º��������ۿ���]����ת����������:"+e);
	return;
}
double gxqglfjmje=0;
ls=request.getParameter("gxqglfjmje");
try{
	if (!(ls.equals("")))  gxqglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxqglfjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǰ����Ѽ����]����ת����������:"+e);
	return;
}
double gxqsjjmje=0;
ls=request.getParameter("gxqsjjmje");
try{
	if (!(ls.equals("")))  gxqsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxqsjjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǰ˰������]����ת����������:"+e);
	return;
}
double gxhglfjmje=0;
ls=request.getParameter("gxhglfjmje");
try{
	if (!(ls.equals("")))  gxhglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhglfjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º����Ѽ����]����ת����������:"+e);
	return;
}
double gxhsjjmje=0;
ls=request.getParameter("gxhsjjmje");
try{
	if (!(ls.equals("")))  gxhsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gxhsjjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���º�˰������]����ת����������:"+e);
	return;
}


String[] sfxmbm =request.getParameterValues("sfxmbm");
String[] gxqdxzklstr =request.getParameterValues("gxqdxzkl");
String[] gxhdxzklstr =request.getParameterValues("gxhdxzkl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh =null;
	double suijinbfb=0;
	int fwmj=0;
	ls_sql="select suijinbfb,fwmj,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		suijinbfb=rs.getDouble("suijinbfb");
		fwmj=rs.getInt("fwmj");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	
	double qdhdzk=10;
	double glfzk=10;
	double zjxhdzk=10;
	ls_sql="select qdhdzk,glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
		zjxhdzk=rs.getDouble("zjxhdzk");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//�޸ļ�¼����������������������
	ls_sql ="insert into cw_zkxgjl (khbh,xgsj,khxm,fgsbh,xgr,zklx,gxqzkl,gxqzjxzkl,gxqcdzwjmje,gxqglfjmje,gxqsjjmje   ,gxhzkl,gxhzjxzkl,gxhcdzwjmje,gxhglfjmje,gxhsjjmje,bz)";
	ls_sql+=" values(?,SYSDATE,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,fgsbh);
	ps.setString(4,xgr);
	ps.setString(5,zklx);
	ps.setDouble(6,gxqzkl);
	ps.setDouble(7,gxqzjxzkl);
	ps.setDouble(8,gxqcdzwjmje);
	ps.setDouble(9,gxqglfjmje);
	ps.setDouble(10,gxqsjjmje);

	ps.setDouble(11,gxhzkl);
	ps.setDouble(12,gxhzjxzkl);
	ps.setDouble(13,gxhcdzwjmje);
	ps.setDouble(14,gxhglfjmje);
	ps.setDouble(15,gxhsjjmje);
	ps.setString(16,bz);
	ps.executeUpdate();
	ps.close();


	if (sfxmbm!=null)
	{
		for (int i=0;i<sfxmbm.length ;i++ )
		{
			double gxqdxzkl=0;
			double gxhdxzkl=0;

			try{
				gxqdxzkl=Double.parseDouble(gxqdxzklstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[����ǰ�����ۿ���]����ת����������");
				return;
			}

			try{
				gxhdxzkl=Double.parseDouble(gxhdxzklstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[���º����ۿ���]����ת����������");
				return;
			}


			if (gxhdxzkl<0 || gxhdxzkl>10)
			{
				conn.rollback();
				out.println("���󣡡����º����ۿ��ʡ�ֻ����0��10֮��");
				return;
			}


			ls_sql="update bj_sfxmmx set dxzkl=?,sfje=zqsfje*cxhdzkl/10.0*?/10.0";
			ls_sql+=" where  khbh='"+khbh+"' and  sfxmbm='"+sfxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,gxhdxzkl);
			ps.setDouble(2,gxhdxzkl);
			ps.executeUpdate();
			ps.close();

			ls_sql ="insert into cw_dxzkxgmx (khbh,xgsj,sfxmbm,gxqdxzkl,gxhdxzkl)";
			ls_sql+=" values(?,SYSDATE,?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,sfxmbm[i]);
			ps.setDouble(3,gxhdxzkl);
			ps.setDouble(4,gxhdxzkl);
			ps.executeUpdate();
			ps.close();
		}
	}

	//�޸ļ�¼������������������������������


	//�����������������������������
	double guanlifzk=10;//������ۿ�
	ls_sql="SELECT dxzkl";
	ls_sql+=" FROM bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"' and sflx='5'";//1��ֱ�ӷѰٷֱȣ�2���̶����(�ɸ�)��3��˰��(�ٷֱ�)��4���̶����(���ɸ�)��5�������(�ٷֱ�)
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		guanlifzk=rs.getDouble("dxzkl");
	}
	rs.close();
	ps.close();

	
	//�޸�������
	String zjxxh=null;
	double zjje=0;//��ǰ���������
	double zqzjxguanlif=0;//��ǰ����������
	ls_sql="select zjxxh,zjje,zqguanlif";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zjxxh=rs.getString("zjxxh");
		zjje=rs.getDouble("zjje");
		zqzjxguanlif=rs.getDouble("zqguanlif");

		double jzjje=zjje*gxhzjxzkl/10;//�ۺ����������
		jzjje=jzjje*zjxhdzk/10;//�����������
		jzjje=cf.round(jzjje,2);


		double zjxguanlif=zqzjxguanlif*guanlifzk/10*zjxhdzk/10;
		zjxguanlif=cf.round(zjxguanlif,2);


		double zjxsuijin=(jzjje+zjxguanlif)*suijinbfb/100;//������˰��
		zjxsuijin=cf.round(zjxsuijin,2);

		ls_sql=" update crm_zjxdj set jzjje=?,zhguanlif=?,zjxsuijin=?";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ps1=conn.prepareStatement(ls_sql);
		ps1.setDouble(1,jzjje);
		ps1.setDouble(2,zjxguanlif);
		ps1.setDouble(3,zjxsuijin);
		ps1.executeUpdate();
		ps1.close();
	
	}
	rs.close();
	ps.close();
	
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzhguanlif=0;

	ls_sql="select sum(jzjje),sum(zjxsuijin),sum(zhguanlif)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljzjje=rs.getDouble(1);
		allzjxsuijin=rs.getDouble(2);
		allzhguanlif=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	//�������������������������������������


	//����ǩԼ���������������������

	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"yz");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");

	ls_sql="update crm_zxkhxx set spzkl=?,zjxzkl=?,zklx=?,dzbjze=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzkl);
	ps.setDouble(2,gxhzjxzkl);
	ps.setString(3,zklx);
	ps.setDouble(4,dzbjze);
	ps.executeUpdate();
	ps.close();


	double qye=dzbj.getZhBjje(conn,khbh,"sxyd");//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շѣ���������������ǩԼ���Ŀ
	qye=qye-gxhcdzwjmje;//�������������
	qye=cf.round(qye,2);

	double guanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//��ȡ�ۺ󡺹���ѽ�
	guanlif=guanlif-gxhglfjmje;//�������������
	guanlif=cf.round(guanlif,2);

	double suijin=dzbj.getZhSuijinJe(conn,khbh,"yz");//��ȡ�ۺ�˰���
	suijin=suijin-gxhsjjmje;//�������������
	suijin=cf.round(suijin,2);

	double zhwjrqyexm=dzbj.getZhWjrJe(conn,khbh,"yz");//��ȡ��δ����ǩԼ����Ŀ���ơ���������˰�𡢹���ѡ���Ʒ�

	
	String xghzxjwbm=null;
	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xghzxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	int xghpmjj=0;
	if (fwmj==0)
	{
		xghpmjj=0;
	}
	else{
		xghpmjj=(int)qye/fwmj;
	}
	
	ls_sql=" update crm_khxx set zkl=?,zjxzkl=?,qye=?,cdzwjmje=?,guanlif=?,glfjmje=?,suijin=?,sjjmje=?  ,zhzjxje=?,zjxsuijin=?,zjxguanlif=?,zhwjrqyexm=?  ,pmjj=?,zxjwbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzkl);
	ps.setDouble(2,gxhzjxzkl);
	ps.setDouble(3,qye);
	ps.setDouble(4,gxhcdzwjmje);
	ps.setDouble(5,guanlif);
	ps.setDouble(6,gxhglfjmje);
	ps.setDouble(7,suijin);
	ps.setDouble(8,gxhsjjmje);

	ps.setDouble(9,alljzjje);
	ps.setDouble(10,allzjxsuijin);
	ps.setDouble(11,allzhguanlif);
	ps.setDouble(12,zhwjrqyexm);

	ps.setInt(13,xghpmjj);
	ps.setString(14,xghzxjwbm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql=" update cw_qmjzmx set zkl=?,zjxzkl=?,qye=?,cdzwjmje=?,guanlif=?,glfjmje=?,suijin=?,sjjmje=?  ,zhzjxje=?,zjxsuijin=?,zjxguanlif=?,zhwjrqyexm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzkl);
	ps.setDouble(2,gxhzjxzkl);
	ps.setDouble(3,qye);
	ps.setDouble(4,gxhcdzwjmje);
	ps.setDouble(5,guanlif);
	ps.setDouble(6,gxhglfjmje);
	ps.setDouble(7,suijin);
	ps.setDouble(8,gxhsjjmje);

	ps.setDouble(9,alljzjje);
	ps.setDouble(10,allzjxsuijin);
	ps.setDouble(11,allzhguanlif);
	ps.setDouble(12,zhwjrqyexm);
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>