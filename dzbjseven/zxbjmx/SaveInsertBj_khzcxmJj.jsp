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
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


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


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
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
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
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
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
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

	int sjjmsl=0;
	int zdsl=0;
	ls_sql="select sjjmsl,bzsl";
	ls_sql+=" FROM tc_csrjkhjjjmj";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and jgwzbm='"+jgwzbm+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		sjjmsl=rs1.getInt("sjjmsl");
		zdsl=rs1.getInt("bzsl");
	}
	rs1.close();
	ps1.close();

	if (sjjmsl>0)
	{
		out.println("已减免不能再选择，减免数量:"+sjjmsl);
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



			double dj=0;
			String lx="1";//1：标配；2：升级
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

				if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1：无折扣；2：打折
				{
					sjsfj=dzsjsfj;
				}

				dj=sjsfj;
				lx="2";//1：标配；2：升级
			}


			sxh++;


			ls_sql="insert into tc_csrjkhzcqd (sxh,khbh,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,dj,lx,sfyx,yxkssj,yxjzsj,bz,bjjbbm,jgwzbm,sl,xdsl,ptcpsm,cplx,fjddbh)";
			ls_sql+=" select                     ?,?   ,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,? ,? ,sfyx,yxkssj,yxjzsj,bz,bjjbbm,?     ,1 ,1   ,''    ,'1' ,''";//1：木门；2：橱柜；3：洁具；4：磁砖；5：铝扣板；6：地板
			ls_sql+=" FROM tc_csrjzck";
			ls_sql+=" where cpbm='"+getcpbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setLong(1,sxh);
			ps1.setString(2,khbh);
			ps1.setDouble(3,dj);
			ps1.setString(4,lx);
			ps1.setString(5,jgwzbm);
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


			double dj=0;
			String lx="1";//1：标配；2：升级
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

				if (sfdz.equals("2") && dzkssj.compareTo(cf.today())<=0 && dzjzsj.compareTo(cf.today())>=0)//1：无折扣；2：打折
				{
					sjsfj=dzsjsfj;
				}

				dj=sjsfj;
				lx="2";//1：标配；2：升级
			}


			sxh++;


			ls_sql="insert into tc_csrjkhzcqd (sxh,khbh,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,dj,lx,sfyx,yxkssj,yxjzsj,bz,bjjbbm,jgwzbm,sl,xdsl,ptcpsm,cplx,fjddbh)";
			ls_sql+=" select                     ?,?   ,cpbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,sgddj,? ,? ,sfyx,yxkssj,yxjzsj,bz,bjjbbm,?     ,1 ,1   ,''    ,'1' ,''";//1：木门；2：橱柜；3：洁具；4：磁砖；5：铝扣板；6：地板
			ls_sql+=" FROM tc_csrjzck";
			ls_sql+=" where cpbm='"+getcpbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setLong(1,sxh);
			ps1.setString(2,khbh);
			ps1.setDouble(3,dj);
			ps1.setString(4,lx);
			ps1.setString(5,jgwzbm);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();
		

	}

	double sjsl=0;//实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		sjsl=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql="update tc_csrjkhjjjmj set sjsl="+sjsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();


	double tcnsl=0;//套餐内实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and lx in('1','2')";//1：标配；2：升级；3：套餐外
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (zdsl>0)
	{
		if (tcnsl>zdsl)
		{
			conn.rollback();
			out.println("错误！不可超量，实际数量["+tcnsl+"]不能超过最大数量["+zdsl+"]");
			return;
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxmJj.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&jgwzbm=<%=jgwzbm%>";
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("！！！存盘失败，请重新选择");
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