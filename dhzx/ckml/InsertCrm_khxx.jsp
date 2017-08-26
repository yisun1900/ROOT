<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");



String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String fwdz="";
String lxfs="";
String sjs="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";


double wdzgce=0;
double qye=0;
double glf=0;
double glfbfb=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double suijin=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm="";


String hth="";
String sfjczjz="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String email=null;
String khjl="";
String xxlysm="";
String xxly="";

String dzbjjc="";//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]；2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程原报价]，不自动计算4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]

String shdzbjjc="";//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]；2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程原报价]，不自动计算4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]

double sjjryjbfb=0;
double sjf=0;
double sssjf=0;


String qtsjs="";
String yxtxdz="";
String hyh=null;
String sgd=null;
String zjxm=null;
String jiedao=null;
String ywyssxz=null;
String sjsbh=null;
String ysy=null;

double zqqyze=0;
double zhqyze=0;
int fkfssl=0;

double hdzsjz=0;
double htjz=0;
double mll=0;
double cbj=0;
double sgcbj=0;
double qtsgcbj=0;
double hscbj=0;
double gcjcbj=0;

double zqsjf=0;
String qtsfsm="";
double zqgczjf=0;
double zhgczjf=0;
double zqqtsf=0;
double zhqtsf=0;

double mle=0;
double yjjzcs=0;
double yjjz=0;
double djjje=0;
double djjbfb=10;

double zkl=10;

double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

double cdzwjmje=0;
double glfjmje=0;
double sjjmje=0;

double oldzhgczjf=0;
double oldguanlif=0;
double oldsuijin=0;
double oldhtjz=0;

double zqhtzcbj=0;
double zhhtzcbj=0;

double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;
double zctcje=0;
double wntcje=0;
double jytcje=0;
double sctcje=0;
double jktcje=0;
double djfxje=0;//订金返现金额
double zjjmje=0;//直接减免金额
double bjryjqtf=0;//不记入业绩其他费

double gcfmle=0;
double qtfmle=0;
try {
	conn=cf.getConnection();


	ls_sql="select ysy,ywyssxz,sjsbh,sjf,email,cxhdbmxq,cxhdbmzh,dzbjjc,sfjczjz,cxhdbm,shbz,louhao,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" ,khjl,xxlysm,yxtxdz,hyh,sgd,zjxm,hth,jiedao";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysy=cf.fillNull(rs.getString("ysy"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		hth=cf.fillNull(rs.getString("hth"));
		hyh=cf.fillNull(rs.getString("hyh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		sssjf=rs.getDouble("sjf");
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查

		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtsjs+=rs.getString("sjs")+"、";
	}
	rs.close();
	ps.close();

	ls_sql="select xxlymc ";
	ls_sql+=" from  crm_khxxly,dm_xxlybm";
	ls_sql+=" where  crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+khbh+"' and crm_khxxly.khlx='2'";
	ls_sql+=" order by crm_khxxly.xxlybm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxly+=rs.getString("xxlymc")+"、";
	}
	rs.close();
	ps.close();

	ls_sql="SELECT gcfqdzk,glfzk,sjzk,sjfzk";
	ls_sql+=" FROM crm_khzk";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dzbjjc,sjjryjbfb,yjjzcs";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查
		sjjryjbfb=rs.getDouble("sjjryjbfb");//设计客户计入业绩收款比例 
		yjjzcs=rs.getDouble("yjjzcs");
	}
	rs.close();
	ps.close();

	if (yjjzcs==0)
	{
		out.println("错误！未设【业绩净值参数】");
//		return;
	}

	if (shbz.equals("Y"))//信息审核标志
	{
		dzbjjc=shdzbjjc;
	}





	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();



	wdzgce=dzbjje.getZqBjje(conn,khbh,"yz");//获取『折前』电子报价金额，直接费＋其它收费
	qye=dzbjje.getZhBjje(conn,khbh,"sxyd");//获取『折后』电子报价金额，直接费＋其它收费

	suijinbfb=dzbjje.getSuijinBfb(conn,khbh,"yz");//税金百分比
	suijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』
	zqsuijin=dzbjje.getZqSuijinJe(conn,khbh,"yz");//获取折前『税金金额』

	glfbfb=dzbjje.getGlfBl(conn,khbh,"yz");//管理费百分比
	zqguanlif=dzbjje.getZqGlfJe(conn,khbh,"yz");//『折前』管理费
	guanlif=dzbjje.getZhGlfJe(conn,khbh,"yz");//获取折后『管理费金额』

	zqgczjf=dzbjje.getZqGczjf(conn,khbh,"yz");//工程直接费－折前
	zhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz");//工程直接费－折后

	zqqtsf=dzbjje.getZqJrQtsf(conn,khbh,"yz");//记入业绩其它费－折前，不包括税金、管理费、设计费
	zhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//记入业绩其它费－折后，不包括税金、管理费、设计费
	qtsfsm=dzbjje.getJrQtsfsm(conn,khbh,"yz");//记入业绩其它费项目，不包括税金、管理费、设计费

	zqwjrqyexm=dzbjje.getZqWjrJe(conn,khbh);//获取折前『不记入业绩其它费』，不包括税金、管理费、设计费
	zhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh);//获取折后『不记入业绩其它费』，不包括税金、管理费、设计费
	wjrqyexmsm=dzbjje.getWjrJeMc(conn,khbh);//获取『其它收费项目名称』，不包括税金、管理费、设计费

	zqsjf=dzbjje.getZqSjf(conn,khbh);//获取折前『设计费』
	sjf=dzbjje.getZhSjf(conn,khbh);//获取折后『设计费』

	zqhtzcbj=dzbjje.getZqZcbj(conn,khbh,"yz");//合同主材报价－折前
	zhhtzcbj=dzbjje.getZhZcbj(conn,khbh,"yz");//合同主材报价－折后

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcbzjg=tc.getBzjg(conn,khbh,"yz");//获取:套餐标准价格
		tcmjzjje=tc.getMjzjje(conn,khbh,"yz");//获取:面积增加金额
		tczcsjcj=tc.getZcsjcj(conn,khbh,"yz");//获取:主材升级差价
		tczccljj=tc.getZccljj(conn,khbh,"yz");//获取:主材超量加价
		tcxsfzc=tc.getXsfzc(conn,khbh,"yz");//获取:需收费主材
		tczcjm=tc.getZcjm(conn,khbh,"yz");//获取:主材减免
		tcdpsj=tc.getDpsj(conn,khbh,"yz");//获取:顶配升级
		tcdpdlsf=tc.getDpdlsf(conn,khbh,"yz");//获取:顶配独立收费
		tcxpx=tc.getXpx(conn,khbh,"yz");//获取:选配项
		tcwsgzj=tc.getSgzj(conn,khbh,"yz");//获取:套餐外施工项造价
		tcwgccljj=tc.getGccljj(conn,khbh,"yz");//获取:工程超量加价
		tcwzjzc=tc.getZjzc(conn,khbh,"yz");//获取:套餐外增加主材
		tcsgze=tc.getSgze(conn,khbh,"yz");//获取:施工总额
		tcqtsf=tc.getTcqtsf(conn,khbh,"yz");//获取:套餐－其它收费
		zctcje=tc.getZctcje(conn,khbh,"yz");//获取:主材套餐金额
		wntcje=tc.getWntcje(conn,khbh,"yz");//获取:温暖套餐金额
		jytcje=tc.getJytcje(conn,khbh,"yz");//获取:静音套餐金额
		sctcje=tc.getSctcje(conn,khbh,"yz");//获取:色彩套餐金额
		jktcje=tc.getJktcje(conn,khbh,"yz");//获取:健康套餐金额
	}

	if (wdzgce!=0)
	{
		zkl=cf.round(qye*10/wdzgce,2);
	}
	else{
		zkl=10;
	}


	djfxje=dzbjje.getDjfxje(conn,khbh,"sxyd");//订金返现金额
	zjjmje=dzbjje.getZjjmje(conn,khbh,"yz");//直接减免金额
	hdzsjz=dzbjje.getZsjz(conn,khbh);//活动赠送净值+特权赠送净值


	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//代金券金额
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//代金券百分比


	htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券

	sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值


	yjjz=dzbjje.getYjjz(conn,khbh,"yz");//获取业绩净值
	yjjz=cf.round(yjjz*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数



	//1：工程类（与其它收费项目相关）；2：工程类（与其它收费项目无关）；3：主材类
	ls_sql="SELECT sum(ROUND(bj_gclmx.sl*bj_bjxmmx.dj,2)-ROUND(bj_gclmx.sl*bj_bjxmmx.sgcbj,2))";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfmle=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje-ROUND(zqsfje*sgcbjbfb/100,2))";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfjrqye='1'";//1：记入；2：不记入
	ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
	ls_sql+=" and sfcysgdjs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtfmle=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje-ROUND(sfje*sgcbjbfb/100,2))";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfjrqye='1'";//1：记入；2：不记入
	ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
	ls_sql+=" and sfcysgdjs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtfmle+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfjrqye='1'";//1：记入；2：不记入
	ls_sql+=" and sfcysgdjs='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtfmle+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	cbj=dzbjje.getCbj(conn,khbh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	gcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）
	//取电子报价数据===============结束
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center"> （客户编号：<%=khbh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>合同号</td>
      <td width="29%"> 
      <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyGo(smhtbh)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>书面合同编号</td>
      <td width="29%"><input type="text" name="smhtbh" value="" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">客户姓名</font>      </td>
      <td width="29%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
      <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>      </td>
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font>性别      </td>
      <td width="29%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        男 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
      女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">联系方式</font></td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="73" maxlength="100" readonly></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000FF">电子邮件</font></td>
      <td width="29%">
      <input type="text" name="email" value="<%=email%>" size="20" maxlength="50">      </td>
      <td width="21%" align="right">业主身份证号码</td>
      <td width="29%"> 
      <input type="text" name="sfzhm" value="" size="20" maxlength="18" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"> 
        <font color="#FF0033">*</font><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"> 
		<input type="hidden" name="cqbm" value="<%=cqbm%>" >
		<input type="hidden" name="jiedao" value="<%=jiedao%>" >
		<input type="hidden" name="xqbm" value="<%=xqbm%>" >
		<input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" readonly>      </td>
    </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">有效通信地址</font></td>
      <td colspan="3"><input name="yxtxdz" type="text" value="<%=yxtxdz%>" size="73" maxlength="100" readonly></td>
    </tr>
   <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">参加公司促销活动</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>
          <input type="hidden" name="cxhdbm" value="<%=cxhdbm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">参加小区促销活动</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>
          <input type="hidden" name="cxhdbmxq" value="<%=cxhdbmxq%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">参加展会促销活动</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>
          <input type="hidden" name="cxhdbmzh" value="<%=cxhdbmzh%>"  >
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">年龄区间</td>
      <td width="29%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
      </select>      </td>
      <td width="21%" align="right">职业</td>
      <td width="29%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">月收入</td>
      <td width="29%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
      </select>      </td>
      <td width="21%" align="right">房价</td>
      <td width="29%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">设计师</font>      </td>
      <td width="29%"> 
      <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>      </td>
      <td width="21%" align="right"> 
        <font color="#0000FF">业务员</font>      </td>
      <td width="29%"> 
      <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
<%
	if (!qtsjs.equals(""))
	{
		%>
		<tr bgcolor="#FFFFFF">
		  <td align="right"><font color="#0000FF">其他设计师</font></td>
		  <td colspan="3"><%=qtsjs%></td>
		</tr>
		<%
	}
%>
	
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">客户经理</font></td>
      <td> 
      <input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" readonly></td>
      <td align="right"><font color="#FF0033">*</font>付款方案</td>
      <td><select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (fkfssl==1)
	{
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm","");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font>房屋面积      </td>
      <td width="29%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
      <input type="hidden" name="pmjj" value="" >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>报价级别</td>
      <td width="29%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
  </TABLE>


<BR>  
<%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]
	{
		%>
		<%@ include file="dzbjjc1.jsp" %>
		<%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]
	{
		%>
		<%@ include file="dzbjjc2.jsp" %>
		<%
	}
	//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	else if (dzbjjc.equals("3") || dzbjjc.equals("6"))//3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免
	{
		%>
		<%@ include file="dzbjjc3.jsp" %>
		<%
	}
	//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%>
		<%@ include file="dzbjjc4.jsp" %>
		<%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%>
		<%@ include file="dzbjjc5.jsp" %>
		<%
	}
	else{
		out.println("『启用电子报价检查』错误！"+dzbjjc);
		return;
	}
%> 


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>是否返券</td>
      <td width="29%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        是 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])" checked>
      否 </td>
      <td width="21%" align="right">返券卡号</td>
      <td width="29%"><input name="fqkh" type="text" id="fqkh" onKeyUp="keyGo(sfyrz[0])" value="" size="20" maxlength="20"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">返券总金额</td>
      <td width="29%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">      </td>
      <td width="21%" align="right">公司承担返卷额</td>
      <td width="29%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>是否已认证</td>
      <td><input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
是
  <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])">
否 </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">认证市场</td>
      <td width="29%"><select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%>
      </select></td>
      <td width="21%" align="right">认证费百分比</td>
      <td width="29%"><input type="text" name="rzfbfb" value="" size="10" maxlength="20"  >
%</td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#FF0033">*</font>家装标志</td>
      <td width="29%"><%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%></td>
      <td width="21%" align="right"><font color="#0000CC">信息来源</font></td>
      <td width="29%"><%=xxly%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">信息来源说明</td>
      <td colspan="3"><input name="xxlysm" type="text" value="<%=xxlysm%>" size="73" maxlength="100"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>户型</td>
      <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(fgflbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
      </select></td>
      <td align="right"><font color="#FF0033">*</font>风格</td>
      <td><select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(ysbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>油色</td>
      <td><select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(czbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%>
      </select></td>
      <td align="right">材质</td>
      <td><select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(gqts)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%>
      </select></td>
    </tr>
</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">开工时间</td>
      <td width="29%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        已确定 
        <input type="radio" name="kgsjqd" value="N">
      未确定</td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工期天数</td>
      <td width="29%">
      <input type="text" name="gqts" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>建议交底日期</td>
      <td width="29%"> 
      <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>签约日期</td>
      <td width="29%"> 
      <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>合同开工日期</td>
      <td width="29%"> 
      <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>合同竣工日期</td>
      <td width="29%"> 
      <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>回单标志</td>
      <td width="29%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%> 
      </select>      </td>
      <td width="21%" align="right">回单人</td>
      <td width="29%"> 
      <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">回单工地队长</td>
      <td><input type="text" name="hdsgd" value="" size="20" maxlength="20"  ></td>
      <td align="right">回单工地班长</td>
      <td><input type="text" name="hdsgbz" value="" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">回单工地</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="73" maxlength="100" onKeyUp="keyGo(bz)" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">水质分析卡发放</td>
      <td width="29%"> 
        <input type="radio" name="sffk" value="Y">
        发卡 
        <input type="radio" name="sffk" value="N" checked>
      未发卡 </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">关系客户</font></td>
      <td width="29%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm where khlxbm='"+khlxbm+"'",khlxbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">登记卡号</td>
      <td width="29%"> 
      <input type="text" name="djkh" value="" size="20" maxlength="20" >      </td>
      <td width="21%" align="right">发卡日期</td>
      <td width="29%"> 
      <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">签约店面</font></td>
      <td width="29%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
      </select>      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="29%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">录入时间</font>      </td>
      <td width="29%"> 
      <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">信息录入人</font>     </td>
      <td width="29%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        备注      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"><!-- <input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="预览报价">
        <input type="button"  value="打印合同附件" onClick="f_ck(insertform)" name="ck2" >-->
        <input type="hidden" name="sfcjq" value="1" >
        <input type="hidden" name="sffby" value="1" >
        <input type="hidden" name="hyklxbm" value="" >
        <input type="hidden" name="hykh" value="" >
        <input type="hidden" name="yxsjs" value="" >
        <input type="hidden" name="yxsjz" value="" >
        <input type="hidden" name="sjsbh" value="<%=sjsbh%>"  >
        <input type="hidden" name="ywyssxz" value="<%=ywyssxz%>"  >
        <input type="hidden" name="ysy" value="<%=ysy%>"  >
      <input type="hidden" name="dzbjjc" value="<%=dzbjjc%>">
      <input type="hidden" name="hyh" value="<%=hyh%>">
      <input type="hidden" name="sgd" value="<%=sgd%>">
      <input type="hidden" name="zjxm" value="<%=zjxm%>">

	  <input type="hidden" name="glf" value="0" >
	  </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	<%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]
	{
		%>
		//工程直接费－折后
		var zhgczjf=FormName.zqgczjf.value/10.0*FormName.gcfqdzk.value-FormName.cdzwjmje.value;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//设计费－折后
		var sjf=FormName.zqsjf.value/10.0*FormName.sjfzk.value;
		sjf=round(sjf,2);
		FormName.sjf.value=sjf;

		//管理费－折前
		var glfjs=FormName.zqgczjf.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;//管理费基数
		var zqguanlif=glfjs*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		//管理费－折后
		var guanlif=FormName.zqguanlif.value*FormName.glfzk.value/10.0-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//折前税金
		var sjjs=glfjs+FormName.zqguanlif.value*1;//税金基数
		var zqsuijin=sjjs*FormName.suijinbfb.value/100.0 ;
		zqsuijin=round(zqsuijin,2);
		FormName.zqsuijin.value=zqsuijin;     

		//折后税金
		var suijin=FormName.zqsuijin.value*FormName.sjzk.value/10.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//折前合同总额=折前工程直接费＋折前管理费＋折前税金＋折前记入业绩其它费＋折前不记业绩其它费＋折前设计费
		var wdzgce=FormName.zqgczjf.value*1.0+FormName.zqguanlif.value*1.0+FormName.zqsuijin.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;
		wdzgce=round(wdzgce,2);
		FormName.wdzgce.value=wdzgce;     

		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=折后合同总额－税金（折后）-赠送净值-赠送代金券－工程费减免额－管理费减免额－税金减免额
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    

		<%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]
	{
		%>
		//工程费签单折扣
		var gcfqdzk=FormName.zhgczjf.value*10.0/FormName.zqgczjf.value;
		gcfqdzk=round(gcfqdzk,2);
		FormName.gcfqdzk.value=gcfqdzk;
		if (FormName.zqgczjf.value==0)
		{
			FormName.gcfqdzk.value=10;
		}

		//设计费折扣
		var sjfzk=FormName.sjf.value*10.0/FormName.zqsjf.value;
		sjfzk=round(sjfzk,2);
		FormName.sjfzk.value=sjfzk;
		if (FormName.zqsjf.value==0)
		{
			FormName.sjfzk.value=10;
		}

		//管理费－折前
		var zqglfjs=FormName.zqgczjf.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;//管理费基数
		var zqguanlif=zqglfjs*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		//管理费－折后
		var zhglfjs=FormName.zhgczjf.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;//管理费基数
		var guanlif=zhglfjs*FormName.glfbfb.value/100.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//管理费折扣
		var glfzk=FormName.guanlif.value*10.0/FormName.zqguanlif.value;
		glfzk=round(glfzk,2);
		FormName.glfzk.value=glfzk;
		if (FormName.zqguanlif.value==0)
		{
			FormName.glfzk.value=10;
		}

		//折前税金
		var zqsjjs=zqglfjs+FormName.zqguanlif.value*1;//税金基数
		var zqsuijin=zqsjjs*FormName.suijinbfb.value/100.0 ;
		zqsuijin=round(zqsuijin,2);
		FormName.zqsuijin.value=zqsuijin;     

		//折后税金
		var zhsjjs=zhglfjs+FormName.guanlif.value*1;//税金基数
		var suijin=zhsjjs*FormName.suijinbfb.value/100.0 ;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//税金折扣
		var sjzk=FormName.suijin.value*10.0/FormName.zqsuijin.value;
		sjzk=round(sjzk,2);
		FormName.sjzk.value=sjzk;
		if (FormName.zqsuijin.value==0)
		{
			FormName.sjzk.value=10;
		}

		//折前合同总额=折前工程直接费＋折前管理费＋折前税金＋折前记入业绩其它费＋折前不记业绩其它费＋折前设计费
		var wdzgce=FormName.zqgczjf.value*1.0+FormName.zqguanlif.value*1.0+FormName.zqsuijin.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;
		wdzgce=round(wdzgce,2);
		FormName.wdzgce.value=wdzgce;     

		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=折后合同总额－税金（折后）-赠送净值-赠送代金券－工程费减免额－管理费减免额－税金减免额
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    

		<%
	}
	else if (dzbjjc.equals("3"))//3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免
	{
	}
	else if (dzbjjc.equals("6"))//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	{
	}
	//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%>
		//工程费减免额
		var zhgczjf=<%=oldzhgczjf%>-FormName.cdzwjmje.value*1.0;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//管理费减免额
		var guanlif=<%=oldguanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		//税金减免额
		var suijin=<%=oldsuijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;


		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=合同净值－工程费减免额－管理费减免额－税金减免额
		var htjz=<%=oldhtjz%>-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%>
		//工程直接费－折后
		var zhgczjf=FormName.zqgczjf.value/10.0*FormName.gcfqdzk.value-FormName.cdzwjmje.value;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//设计费－折后
		var sjf=FormName.zqsjf.value/10.0*FormName.sjfzk.value;
		sjf=round(sjf,2);
		FormName.sjf.value=sjf;

		//管理费－折后
		var guanlif=FormName.zqguanlif.value*FormName.glfzk.value/10.0-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//折后税金
		var suijin=FormName.zqsuijin.value*FormName.sjzk.value/10.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=折后合同总额－税金（折后）-赠送净值-赠送代金券－工程费减免额－管理费减免额－税金减免额
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    



function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
