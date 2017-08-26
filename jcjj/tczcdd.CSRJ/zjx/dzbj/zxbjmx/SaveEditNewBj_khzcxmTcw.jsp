<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
double srdj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  srdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʵ���]����ת����������:"+e);
	return;
}

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String oldcpbm=cf.GB2Uni(request.getParameter("oldcpbm"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String oldsxh=cf.GB2Uni(request.getParameter("sxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String khbh="";
	String sfwc="";
	ls_sql="select khbh,sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	String sfxzsl="";
	double bzsl=0;
	String tcsjflbm="";
	double ghzj=0;//�����ۼ�
	double khzdsl=0;//�ɻ��������
	ls_sql="select sfxzsl,bzsl,tcsjflbm,ghzj,khzdsl";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		ghzj=rs.getDouble("ghzj");
		khzdsl=rs.getDouble("khzdsl");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	//�Ƿ�Ҫ����ͬƷ��
	int sfyqxtpp=0;
	ls_sql="select count(*)";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y'";//Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyqxtpp=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String getcpbm="";
	String zclx="";
	String sfkgdj=null;
	String lx=null;
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select cpbm,zclx,sfkgdj,lx,ppmc,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		lx=cf.fillNull(rs.getString("lx"));//1��ԭ��Ŀ��2�����3�����4��������
		ppmc=cf.fillNull(rs.getString("ppmc"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();

	double xdsl=0;
	if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("2"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("3"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,0);
	}
	else if (sfxclxs.equals("4"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,2);
	}

	conn.setAutoCommit(false);


	if (sfkgdj.equals("Y") && lx.equals("4"))//�Ƿ�ɸĵ���  Y���ǣ�N����
	{
		double sjdj=0;//ʵ�ʵ���
		sjdj=srdj;

		ls_sql=" update bj_khzcxmh set sl=?,xdsl=?,ptcpsm=?,dj=?";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,xdsl);
		ps.setString(3,ptcpsm);
		ps.setDouble(4,sjdj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql=" update bj_khzcxmh set sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,xdsl);
		ps.setString(3,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}


	

	//�������޸ģ�������ⷢ����������Ϊ����ڣ������ڸ�Ϊ����⣫��������������������ʼ
	String getsxh="";
	double tcndj=0;
	double tccldj=0;
	double getsl=0;

	ls_sql="select sxh,sl,tcndj,tccldj,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsxh=rs.getString("sxh");
		getsl=rs.getDouble("sl");
		tcndj=rs.getDouble("tcndj");
		tccldj=rs.getDouble("tccldj");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");

		//�ͻ�����С�ƻ��ܣ���������������������������ʼ
		double sjsl=0;//ʵ������
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where sxh!='"+getsxh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
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
			if ((sjsl+getsl)<=bzsl)//תΪ�ײ���
			{
				ls_sql="update bj_khzcxmh set zclx='3',dj=tcndj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//ȫ��תΪ�ײ���
			{
				ls_sql="update bj_khzcxmh set zclx='4',dj=tccldj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl<bzsl)//(bzsl-sjsl)����תΪ�ײ���
			{
				double getxdsl=0;
				if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((sjsl+getsl-bzsl)<0)
					{
						getxdsl=java.lang.Math.floor((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.ceil((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("2"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((sjsl+getsl-bzsl)<0)
					{
						getxdsl=java.lang.Math.ceil((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.floor((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("3"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((sjsl+getsl-bzsl)*xdb*(100+sh)/100,0);
				}
				else if (sfxclxs.equals("4"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((sjsl+getsl-bzsl)*xdb*(100+sh)/100,2);
				}

				ls_sql="update bj_khzcxmh set zclx='4',dj=tccldj,sl="+(sjsl+getsl-bzsl)+",xdsl="+getxdsl;
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				long newsxh=0;
				ls_sql="select NVL(max(sxh),0)";
				ls_sql+=" from  bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					newsxh=rs1.getLong(1);
				}
				rs1.close();
				ps1.close();

				newsxh++;

				if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((bzsl-sjsl)<0)
					{
						getxdsl=java.lang.Math.floor((bzsl-sjsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.ceil((bzsl-sjsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((bzsl-sjsl)<0)
					{
						getxdsl=java.lang.Math.ceil((bzsl-sjsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.floor((bzsl-sjsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((bzsl-sjsl)*xdb*(100+sh)/100,0);
				}
				else if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((bzsl-sjsl)*xdb*(100+sh)/100,2);
				}

				ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj   ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,ywdhslbz) ";
				ls_sql+=" select                ?+1 ,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,ptcpsm,bjjbbm,'Y'";
				ls_sql+=" from bj_khzcxm";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"3");//1���ײ����������ڣ�2���ײ����������⣻3�������������������ڣ�4�������������������⡢��������շѡ�ѡ������
				ps1.setDouble(3,bzsl-sjsl);
				ps1.setDouble(4,getxdsl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();

	//�������޸ģ�������ⷢ����������Ϊ����ڣ������ڸ�Ϊ����⣽����������������������


	//��飺Ҫ����ͬƷ�ƣ�������������������������ʼ
	if (sfyqxtpp>0)//��������:Ҫ����ͬƷ��
	{
		int ppsl=0;
		ls_sql="select count(distinct ppmc)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ppsl>1)
		{
			conn.rollback();
			out.println("����[��������]��Ҫ��ͬһƷ�ƣ�ʵ��ѡ��["+ppsl+"]��Ʒ��");
			return;
		}
	}
	//��飺Ҫ����ͬƷ�ƣ���������������������������


	//�ͻ�����С�ƻ��ܣ���������������������������ʼ
	double sjsl=0;//ʵ������
	double sjjshsl=0;//ʵ�ʼ��������
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		if (sjsl>bzsl)
		{
			conn.rollback();
			out.println("���󣡲��ɳ�����ʵ������["+sjsl+"]���ܳ�����׼����["+bzsl+"]");
			return;
		}
	}

	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxjh set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//�ͻ�����С�ƻ��ܣ�����������������������������

	
	//��飺С���������ƣ���������������������������ʼ
	double tcslxz=0;//�ײ���������
	String clxlmc="";
	String getsfxzsl="";//�Ƿ���������  1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
	ls_sql="select tcslxz,clxlmc,sfxzsl";
	ls_sql+=" FROM bj_khclxlxz";
	ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcslxz=rs.getDouble("tcslxz");
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		getsfxzsl=cf.fillNull(rs.getString("sfxzsl"));
	}
	rs.close();
	ps.close();

	double xlsjsl=0;
	double xlsjjshsl=0;
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xlsjsl=rs.getDouble(1);
		xlsjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (getsfxzsl.equals("2"))//1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
	{
		if (xlsjsl>tcslxz)
		{
			out.println("<P>���"+clxlmc+"����Ʒѡ�����£�");
			String getjgwzbm=null;
			String getcpmc=null;
			String getxh=null;
			getsl=0;
			ls_sql="select jgwzbm,cpmc,xh,sl";
			ls_sql+=" FROM bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
			ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				getjgwzbm=rs.getString("jgwzbm");
				getcpmc=rs.getString("cpmc");
				getxh=rs.getString("xh");
				getsl=rs.getDouble("sl");

				out.println("<BR>λ��:"+getjgwzbm+"����Ʒ����:"+getcpmc+"���ͺ�:"+getxh+"������:"+getsl);
			}
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<P>�������"+clxlmc+"��������������������["+xlsjsl+"]���ܳ�����������["+tcslxz+"]");
			return;
		}
	}
	//��飺С���������ƣ�����������������������������
	
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