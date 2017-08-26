<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String[] zjxyybm=null;
String zjxyysm=null;
double zjje=0;
double kglf=0;
double kqtk=0;
double jzjje=0;
java.sql.Date lrsj=null;
java.sql.Date fssj=null;
String lrdw=request.getParameter("lrdw");
String zjxxh=request.getParameter("zjxxh");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String zjxfsjd=request.getParameter("zjxfsjd");
khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxyybm=request.getParameterValues("zjxyybm");
zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kglf");
try{
	if (!(ls.equals("")))  kglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kglf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqtk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣其它款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzjje");
try{
	if (!(ls.equals("")))  jzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减项发生额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}
String zjxwcbz=request.getParameter("zjxwcbz");
double gckk=0;
String gckkspbz="";
if (gckk>0)
{
	gckkspbz="N";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String oldzjxwcbz=null;
	String oldzjxxh=null;
	double wdzgce=0;
	double zjxje=0;
	ls_sql="select zjxwcbz,zjxxh,wdzgce,zjxje";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldzjxwcbz=rs.getString("zjxwcbz");//增减项完成标志
		oldzjxxh=cf.fillNull(rs.getString("zjxxh"));
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();
	if (oldzjxwcbz.equals("2"))//1：未完成；2：已完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	double yqgcze=wdzgce+zjxje;//增减前报价总额

	conn.setAutoCommit(false);

	ls_sql="insert into crm_zjxdj ( zjxxh,khbh,zjxfsjd,zjxyysm,zjje,lrsj,lrr,lrdw,fssj,kglf,kqtk,jzjje,gckk,zjxwcbz,yqgcze ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setString(3,zjxfsjd);
	ps.setString(4,zjxyysm);
	ps.setDouble(5,zjje);
	ps.setDate(6,lrsj);
	ps.setString(7,lrr);
	ps.setString(8,lrdw);
	ps.setDate(9,fssj);
	ps.setDouble(10,kglf);
	ps.setDouble(11,kqtk);
	ps.setDouble(12,jzjje);
	ps.setDouble(13,gckk);
	ps.setString(14,zjxwcbz);
	ps.setDouble(15,yqgcze);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<zjxyybm.length ;i++ )
	{
		ls_sql="insert into crm_zjxyydj ( zjxxh,khbh,zjxyybm) ";
		ls_sql+=" values ( ?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,zjxyybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	double allzjxje=0;
	double allkglf=0;
	double allkqtk=0;
	double alljzjje=0;

	ls_sql="select sum(zjje),sum(kglf),sum(kqtk),sum(jzjje)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		allkglf=rs.getDouble(2);
		allkqtk=rs.getDouble(3);
		alljzjje=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zjxxh=?,zjxsj=?,gckk=?,zjxwcbz=?,gckkspbz=? ";
	ls_sql+=" ,zjxje=?,kglf=?,kqtk=?,zhzjxje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setDate(2,fssj);
	ps.setDouble(3,gckk);
	ps.setString(4,zjxwcbz);
	ps.setString(5,gckkspbz);
	ps.setDouble(6,allzjxje);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);
	ps.setDouble(9,alljzjje);
	ps.executeUpdate();
	ps.close();

	if (zjxwcbz.equals("2"))//1：未完成；2：已完成
	{
		ls_sql="update crm_khxx set khjsje=qye+NVL(zhzjxje,0)+NVL(kglf,0)+NVL(kqtk,0)-NVL(gckk,0)";//客户已完成金额
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	//保存增减前后的对比明细
	if (oldzjxxh.equals(""))//目前无增减项
	{
		//保存以前报价表+++++++++++++++++++++++
		ls_sql="insert into bj_bjxmmxq(zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx";
		ls_sql+=" from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxq (zjxxh,khbh,jgwzbm,xuhao) ";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,xuhao";
		ls_sql+=" from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxq (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz";
		ls_sql+=" from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxq(zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz)";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_dwgclzcylq (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcyl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxq (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//保存新报价表++++++++++++++++++++++++

		ls_sql="insert into bj_bjxmmxh(zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx";
		ls_sql+=" from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,xuhao) ";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,xuhao";
		ls_sql+=" from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxh (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz";
		ls_sql+=" from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxh(zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz)";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_dwgclzcylh (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcyl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxh (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		//保存报价表
		ls_sql="insert into bj_bjxmmxq(zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx";
		ls_sql+=" from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxq (zjxxh,khbh,jgwzbm,xuhao) ";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,xuhao";
		ls_sql+=" from bj_fjxxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxq (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz";
		ls_sql+=" from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxq(zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz)";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz";
		ls_sql+=" from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_dwgclzcylq (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcylh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxq (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//保存新报价表
		ls_sql="insert into bj_bjxmmxh(zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx";
		ls_sql+=" from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,xuhao) ";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,xuhao";
		ls_sql+=" from bj_fjxxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxh (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz";
		ls_sql+=" from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxh(zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz)";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,sfbfb,sfje,bz";
		ls_sql+=" from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_dwgclzcylh (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcylh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxh (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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