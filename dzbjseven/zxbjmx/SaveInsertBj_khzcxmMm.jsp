<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String khbh=request.getParameter("khbh");
String tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));


String bzmc=null;
String cpbm=null;
bzmc=cf.GB2Uni(cf.getParameter(request,"bzmc"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	String ssfgs=null;
	String khbjjbbm=null;
	ls_sql="SELECT zxzt,ssfgs,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		ssfgs=rs.getString("ssfgs");
		khbjjbbm=rs.getString("bjjb");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1��δ��ɣ�2����ɣ�3��ҵ����ת
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("���󣡿ͻ���ǩ�����������޸ı���");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("���󣡿ͻ�ǩ��ʧ�ܣ��������޸ı���");
		return;
	}

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	double sjjmsl=0;
	ls_sql="select sjjmsl";
	ls_sql+=" FROM tc_csrjkhmmjmj";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		sjjmsl=rs1.getInt("sjjmsl");
	}
	rs1.close();
	ps1.close();

	if (sjjmsl>0)
	{
		out.println("�Ѽ��ⲻ����ѡ�񣬼�������:"+sjjmsl);
		return;
	}
	
	conn.setAutoCommit(false);

	long sxh=0;
	ls_sql="select NVL(max(sxh),0)";
	ls_sql+=" from  tc_csrjkhzcqd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	if (!cpbm.equals(""))
	{
		String getcpbm=null;
		String bjjbbm=null;
		ls_sql=" select cpbm,bjjbbm";
		ls_sql+=" FROM tc_csrjzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcpbm=rs.getString("cpbm");
			bjjbbm=rs.getString("bjjbbm");


			//�����Ƿ����
			double dj=0;
			String lx="1";//1�����䣻2������
			if (!khbjjbbm.equals(bjjbbm))
			{
				double sjsfj=0;
				String sfdz="";
				String dzkssj="";
				String dzjzsj="";
				double dzsjsfj=0;
				ls_sql="SELECT sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj";
				ls_sql+=" FROM tc_csrjzcsjcjb";
				ls_sql+=" where cpbm='"+getcpbm+"' and  bjjbbm='"+khbjjbbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sjsfj=rs1.getDouble("sjsfj");
					sfdz=cf.fillNull(rs1.getString("sfdz"));
					dzkssj=cf.fillNull(rs1.getDate("dzkssj"));
					dzjzsj=cf.fillNull(rs1.getDate("dzjzsj"));
					dzsjsfj=rs1.getDouble("dzsjsfj");
				}
				rs1.close();
				ps1.close();

				if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1�����ۿۣ�2������
				{
					sjsfj=dzsjsfj;
				}

				dj=sjsfj;
				lx="2";//1�����䣻2������
			}


			ls_sql="insert into tc_csrjkhzcqd (sxh,khbh,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,dj,lx,sfyx,yxkssj,yxjzsj,bz,bjjbbm,jgwzbm,sl,xdsl,ptcpsm,cplx,fjddbh)";
			ls_sql+=" select              ?+rownum,?   ,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,? ,? ,sfyx,yxkssj,yxjzsj,bz,bjjbbm,''    ,0 ,0   ,''    ,'1' ,''";//1��ľ�ţ�2������3����ߣ�4����ש��5�����۰壻6���ذ�
			ls_sql+=" FROM tc_csrjzck";
			ls_sql+=" where cpbm='"+getcpbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setLong(1,sxh);
			ps1.setString(2,khbh);
			ps1.setDouble(3,dj);
			ps1.setString(4,lx);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();
	}
	else{
		String getcpbm=null;
		String bjjbbm=null;
		ls_sql=" select cpbm,bjjbbm";
		ls_sql+=" FROM tc_csrjzck";
		ls_sql+=" where tccplbbm='"+tccplbbm+"'";
		ls_sql+=" and bzmc='"+bzmc+"' ";
		ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
		ls_sql+=" order by bzmc,cpmc,xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getcpbm=rs.getString("cpbm");
			bjjbbm=rs.getString("bjjbbm");



			//�����Ƿ����
			double dj=0;
			String lx="1";//1�����䣻2������
			if (!khbjjbbm.equals(bjjbbm))
			{
				double sjsfj=0;
				String sfdz="";
				String dzkssj="";
				String dzjzsj="";
				double dzsjsfj=0;
				ls_sql="SELECT sjsfj,sfdz,dzkssj,dzjzsj,dzsjsfj";
				ls_sql+=" FROM tc_csrjzcsjcjb";
				ls_sql+=" where cpbm='"+getcpbm+"' and  bjjbbm='"+khbjjbbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sjsfj=rs1.getDouble("sjsfj");
					sfdz=cf.fillNull(rs1.getString("sfdz"));
					dzkssj=cf.fillNull(rs1.getDate("dzkssj"));
					dzjzsj=cf.fillNull(rs1.getDate("dzjzsj"));
					dzsjsfj=rs1.getDouble("dzsjsfj");
				}
				rs1.close();
				ps1.close();

				if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1�����ۿۣ�2������
				{
					sjsfj=dzsjsfj;
				}

				dj=sjsfj;
				lx="2";//1�����䣻2������
			}


			ls_sql="insert into tc_csrjkhzcqd (sxh,khbh,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,dj,lx,sfyx,yxkssj,yxjzsj,bz,bjjbbm,jgwzbm,sl,xdsl,ptcpsm,cplx,fjddbh)";
			ls_sql+=" select              ?+rownum,?   ,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,? ,? ,sfyx,yxkssj,yxjzsj,bz,bjjbbm,''    ,0 ,0   ,''    ,'1' ,''";//1��ľ�ţ�2������3����ߣ�4����ש��5�����۰壻6���ذ�
			ls_sql+=" FROM tc_csrjzck";
			ls_sql+=" where cpbm='"+getcpbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setLong(1,sxh);
			ps1.setString(2,khbh);
			ps1.setDouble(3,dj);
			ps1.setString(4,lx);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();
		

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxmMm.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>";
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����������ʧ�ܣ�������ѡ��");
		window.close();
	//-->
	</SCRIPT>
	<%

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