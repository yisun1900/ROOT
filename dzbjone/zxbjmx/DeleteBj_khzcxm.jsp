<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	String khbjjbbm=null;
	String ssfgs=null;
	ls_sql="SELECT zxzt,bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		khbjjbbm=rs.getString("bjjb");
		ssfgs=rs.getString("ssfgs");
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

	String tccplbbm="";
	String zclx="";
	String ppmc="";
	String tcsjflbm="";
	String bjjbbm="";
	ls_sql="select tccplbbm,zclx,ppmc,tcsjflbm,bjjbbm";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		zclx=cf.fillNull(rs.getString("zclx"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	String sfxzsl="";
	double bzsl=0;
	ls_sql="select sfxzsl,bzsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql=" delete from  bj_khzcxm";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��Ϊɾ������Щ��Ҫ�շ����ĸ�Ϊ���շѣ���������������������ʼ
	String getsxh="";
	double tcndj=0;
	double tccldj=0;
	double getsl=0;
	ls_sql="select sxh,sl,tcndj,tccldj";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsxh=rs.getString("sxh");
		getsl=rs.getDouble("sl");
		tcndj=rs.getDouble("tcndj");
		tccldj=rs.getDouble("tccldj");

		//��ȡ��С�಻�շ���������
		double sjsl=0;//ʵ������
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where sxh!='"+getsxh+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (sfxzsl.equals("1"))//1:������Ӽ�;2:���ɳ���;3:����������
		{
			if ((sjsl+getsl)<=bzsl)//��С�಻�շ��������շ�����<��׼���������շ�תΪ�ײ��ڲ��շ�
			{
				ls_sql="update bj_khzcxm set zclx='1',dj=tcndj";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//ȫ��תΪ�ײ���
			{
				ls_sql="update bj_khzcxm set zclx='2',dj=tccldj";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl<bzsl)//���շ�����<��׼������(bzsl-sjsl)����תΪ�ײ��ڲ��շ�
			{
				ls_sql="update bj_khzcxm set zclx='2',dj=tccldj,sl="+(sjsl+getsl-bzsl);
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				long newsxh=0;
				ls_sql="select NVL(max(sxh),0)";
				ls_sql+=" from  bj_khzcxm";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					newsxh=rs1.getLong(1);
				}
				rs1.close();
				ps1.close();

				ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj   ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,ptcpsm,bjjbbm) ";
				ls_sql+=" select                ?+1,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,?   ,?,ptcpsm,bjjbbm";
				ls_sql+=" from bj_khzcxm";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"1");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
				ps1.setDouble(3,bzsl-sjsl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();
	//��Ϊɾ������Щ��Ҫ�շ����ĸ�Ϊ���շѣ�����������������������

	//�ͻ�����С�ƻ��ܣ���������������������������ʼ
	double sjsfsl=0;//�����շ�����
	double ppsjsfsl=0;//Ʒ�������շ�����
	if (!khbjjbbm.equals(bjjbbm))//����
	{
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ls_sql+=" and ppmc not in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_tcppsjcjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ls_sql+=" and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ls_sql+=" and ppmc='"+ppmc+"'";
		ls_sql+=" and ppmc in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_tcppsjcjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ls_sql+=" and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

	}

	//�ͻ�Ʒ��������۱�bj_khppsjcjb��
	ls_sql=" delete from bj_khppsjcjb "; 
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (ppsjsfsl>0)
	{
		//�ͻ�Ʒ��������۱�bj_khppsjcjb��
		ls_sql=" insert into bj_khppsjcjb (khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm) "; 
		ls_sql+=" select                   ?   ,?     ,?       ,ppmc,jldw,?     ,sjcj,?*sjcj,tcsjflbm,bjjbbm  ,bjjbbm1 ";
		ls_sql+=" from bj_tcppsjcjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"' and ppmc='"+ppmc+"'";
		ls_sql+=" and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,jgwzbm);
		ps.setString(3,tccplbbm);
		ps.setDouble(4,ppsjsfsl);
		ps.setDouble(5,ppsjsfsl);
		ps.executeUpdate();
		ps.close();
	}

	double sjsl=0;//ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sjjshsl=0;//ʵ�ʼ��������
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//�ͻ�����С�ƻ��ܣ�����������������������������

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.location="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
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