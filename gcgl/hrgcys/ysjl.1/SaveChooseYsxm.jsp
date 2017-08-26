<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yscsjlh=request.getParameter("yscsjlh");
String khbh=request.getParameter("khbh");
String[] gcysxmbm=request.getParameterValues("gcysxmbm");

java.sql.Date yssj=null;
String ysr=null;
String lrbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
String gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));

String zpml=cf.today("YYYYMM");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<gcysxmbm.length ;i++ )
	{
		//��ȡ�ͻ��طú͹��̽�����Ϣ
		String nowgcjdbm=null;
		java.sql.Date nowhfrq=null;
		String nowhflxbm=null;
		String nowsfxhf=null;
		String nowysjlh=null;
		String nowzqysxmbm=null;
		String hfszjlh=null;
		java.sql.Date nowszqsj=null;
		double fwmj = 0;
		ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,ysjlh,zqysxmbm,sgyssj,fwmj";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			nowhflxbm=cf.fillNull(rs.getString("hflxbm"));
			nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
			nowhfrq=rs.getDate("hfrq");
			nowysjlh=cf.fillNull(rs.getString("ysjlh"));
			nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
			nowszqsj=rs.getDate("sgyssj");
			fwmj=rs.getDouble("fwmj");
		}
		rs.close();
		ps.close();

		//��ȡ������Ŀ��Ϣ
		String gcysxmmc=null;
		String xmlx=null;
		int yszxsl=0;//������������
		ls_sql="SELECT gcysxmmc,xmlx,yszxsl";
		ls_sql+=" FROM dm_heysxm ";
		ls_sql+=" where  gcysxmbm='"+gcysxmbm[i]+"' ";
		ls_sql+=" and  gcysbbh='"+gcysbbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
			xmlx=cf.fillNull(rs.getString("xmlx"));
			yszxsl=rs.getInt("yszxsl");
		}
		rs.close();
		ps.close();

		String xlrmx = "1";//��¼����ϸ  1������¼�룻2����¼��
		if (yszxsl>0)
		{
			xlrmx="2";
		}

		int isxm=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from crm_heysjl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ls_sql+=" and gcysxmbm='"+gcysxmbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			isxm=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (isxm>0)
		{
			conn.rollback();
			out.println("����������Ŀ��¼�룺"+isxm);
			return;
		}

		String ysjlh = null;
		int count=0;
		ls_sql=" select substr(max(ysjlh),8,3) ";
		ls_sql+=" from crm_heysjl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ysjlh=khbh.trim()+cf.addZero(count+1,3);

		ls_sql="insert into crm_heysjl ( ysjlh,yscsjlh,khbh,gcysxmbm,gcysxmmc,yssj,ysr,sjs,sgd,zjxm    ,sfszhf,hfszjlh,gcjdbm,sfsgjdb,jdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm,yysjlh,   ygcysxmbm,yyssj,lrbm,lrr,lrsj,bz,xlrmx   ,sjysjg,clbz,zpsl,fdxbz,gcysbbh,yszxsl,padlrbz,xmlx,zpml ) ";
		ls_sql+=" values (             ?,?,?,?,?,?,?,?,?,?                                           ,?,?,?,?,?,?,?,?,?,?                                                         ,?,?,?,? ,SYSDATE,?,?                    ,0     ,'9' ,0   ,'1',?,?,'0',?,?) ";//9��¼��δ��ɣ�0��û���⣻1:δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysjlh);
		ps.setString(2,yscsjlh);
		ps.setString(3,khbh);
		ps.setString(4,gcysxmbm[i]);
		ps.setString(5,gcysxmmc);
		ps.setDate(6,yssj);
		ps.setString(7,ysr);
		ps.setString(8,sjs);
		ps.setString(9,sgd);
		ps.setString(10,zjxm);

		ps.setString(11,"N");//Y���ǣ�N����
		ps.setString(12,"");
		ps.setString(13,"");
		ps.setString(14,"N");//Y��������N��������
		ps.setString(15,"");
		ps.setString(16,"");
		ps.setString(17,"");
		ps.setDate(18,null);
		ps.setString(19,"");
		ps.setString(20,nowysjlh);

		ps.setString(21,nowzqysxmbm);
		ps.setDate(22,nowszqsj);
		ps.setString(23,lrbm);
		ps.setString(24,lrr);
		ps.setString(25,bz);
		ps.setString(26,xlrmx);
		ps.setString(27,gcysbbh);
		ps.setInt(28,yszxsl);
		ps.setString(29,xmlx);
		ps.setString(30,zpml);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set ysjlh=?,sgyssj=?,zqysxmbm=?";//zqysxmbm���������Ŀ
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysjlh);
		ps.setDate(2,yssj);
		ps.setString(3,gcysxmbm[i]);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

/*
	//���Ͷ���
	ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
	String retStr=dxxt.gcysKhFs(conn,yscsjlh,lrr);//���÷��Ͷ��ź���
	if (retStr.equals(""))
	{
		System.out.println("���ŷ��ͳɹ�");
	}
	else{
		System.out.println(retStr);//�����ͽ����ʾ��ҳ����
	}
*/
	response.sendRedirect("EditCrm_heysjl.jsp?yscsjlh="+yscsjlh);
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
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>