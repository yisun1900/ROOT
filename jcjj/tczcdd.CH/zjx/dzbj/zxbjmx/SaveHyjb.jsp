<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

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

	String khbh=null;
	ls_sql="select khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	String bjjbbm=null;
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	String bjjbbmQ=null;
	String sjsfycxQ=null;
	double sjslQ=0;
	double sjjshslQ=0;
	double sjsfslQ=0;
	double sjcjQ=0;
	double sjsfjeQ=0;
	ls_sql="select bjjbbm,sjsfycx,sjsl,sjjshsl,sjsfsl,sjcj,sjsfje";
	ls_sql+=" from  bj_khzcxmxjq";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbmQ=cf.fillNull(rs.getString("bjjbbm"));
		sjsfycxQ=cf.fillNull(rs.getString("sjsfycx"));
		sjslQ=rs.getDouble("sjsl");
		sjjshslQ=rs.getDouble("sjjshsl");
		sjsfslQ=rs.getDouble("sjsfsl");
		sjcjQ=rs.getDouble("sjcj");
		sjsfjeQ=rs.getDouble("sjsfje");
	}
	rs.close();
	ps.close();

	String bjjbbmH=null;
	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbmH=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();
	if (bjjbbm.equals(bjjbbmH))//����û�з����仯��ֱ���Ƴ�
	{
		out.println("�ѻ�ԭ");
		return;
	}

	conn.setAutoCommit(false);

	if (bjjbbm.equals(bjjbbmQ))//�ָ�ԭ�����𣬲���ԭ�۸�ɾ������������
	{
		//ɾ����ԭ��Ŀ
		ls_sql=" delete from  bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and lx!='1'";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//��ԭԭ��Ŀ
		ls_sql=" update  bj_khzcxmxjh set bjjbbm='"+bjjbbm+"',sjsfycx='"+sjsfycxQ+"'";
		ls_sql+=" ,sjsl="+sjslQ+",sjjshsl="+sjjshslQ+",sjsfsl="+sjsfslQ+",sjcj="+sjcjQ+",sjsfje="+sjsfjeQ;
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{//��������������ļ���
		//����ѡ�����������������������������������ʼ
		//ɾ����ԭ��Ŀ���ٶ�ԭ��Ŀ������
		ls_sql=" delete from  bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and lx!='1'";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		long sxh=0;
		ls_sql="select NVL(max(sxh),0)";
		ls_sql+=" from  bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sxh=rs.getLong(1);
		}
		rs.close();
		ps.close();

		String oldsxh=null;
		String getxh=null;
		double oldsl=0;
		double oldxdsl=0;
		String fjddbh=null;

		ls_sql=" select  sxh,xh,sl,xdsl,fjddbh";
		ls_sql+=" from bj_khzcxmh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			oldsxh=cf.fillNull(rs1.getString("sxh"));
			getxh=cf.fillNull(rs1.getString("xh"));
			fjddbh=cf.fillNull(rs1.getString("fjddbh"));
			oldsl=rs1.getDouble("sl");
			oldxdsl=rs1.getDouble("xdsl");

			String xclbz="";
			String clzt="";
			ls_sql="select xclbz,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where ddbh='"+fjddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xclbz=cf.fillNull(rs.getString("xclbz"));
				clzt=cf.fillNull(rs.getString("clzt"));
			}
			rs.close();
			ps.close();
			if (xclbz.equals("2"))//1���Ƕ���ʽ��Ʒ��2������ʽ��Ʒ
			{
				//00��¼��Ԥ������02��Ԥ�����ѽ��գ�03��������֪ͨ��05���Ѳ����� 25��֪ͨ���ߣ�26�����ߣ�07����ͬδ��ɣ�09����ͬ����ɣ�11����ͬ��ȷ�ϣ�13�������ѽ��գ�27����⣻15��ȷ���ͻ�ʱ�䣻17����֪ͨ�ͻ���18���ѳ��⣻19�����ͻ���20�������ͻ���21����֪ͨ�˲�����23�����˲�����30��������᣻98:ȡ��Ԥ������99���˵�
				if (clzt.compareTo("09")>0 && !clzt.equals("25") && !clzt.equals("26"))
				{
					conn.rollback();
					out.println("���󣡡����Ʋ�Ʒ����:"+fjddbh+"�������ѽ��ܣ����ܻ�ԭ���ͺ�:"+getxh);
					return;
				}
			}
			else{
				//00��¼��Ԥ������02��Ԥ�����ѽ��գ�03��������֪ͨ��05���Ѳ����� 25��֪ͨ���ߣ�26�����ߣ�07����ͬδ��ɣ�09����ͬ����ɣ�11����ͬ��ȷ�ϣ�13�������ѽ��գ�27����⣻15��ȷ���ͻ�ʱ�䣻17����֪ͨ�ͻ���18���ѳ��⣻19�����ͻ���20�������ͻ���21����֪ͨ�˲�����23�����˲�����30��������᣻98:ȡ��Ԥ������99���˵�
				if (clzt.equals("19") || clzt.equals("20") || clzt.equals("30"))
				{
					conn.rollback();
					out.println("���󣡡��Ƕ���ʽ��Ʒ����:"+fjddbh+"�����ͻ������ܻ�ԭ���ͺ�:"+getxh);
					return;
				}
			}

			oldsl=-1*oldsl;
			oldxdsl=-1*oldxdsl;
			String lx="3";//1��ԭ��Ŀ��2�����3�����4��������

			sxh++;

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,oldsxh,lx,ywdhslbz) ";
			ls_sql+=" select                 ?  ,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,? ,?   ,ptcpsm,bjjbbm,sxh   ,? ,'Y'";
			ls_sql+=" from bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh+" and ywdhslbz='Y'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setDouble(2,oldsl);
			ps.setDouble(3,oldxdsl);
			ps.setString(4,lx);//1��ԭ��Ŀ��2�����3�����4��������
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

		//����ѡ�������������������������������������

		ls_sql=" update  bj_khzcxmxjh set bjjbbm='"+bjjbbm+"',sjsfycx='1'";//1���޴�����2�����������ƴ�����3�����������ƴ���
		ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjcj=0,sjsfje=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("��ԭ����ɹ���");
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