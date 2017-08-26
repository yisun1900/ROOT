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
double gcjcbj=0;

double zqsjf=0;
String qtsfsm="";
double zqgczjf=0;
double zhgczjf=0;
double zqqtsf=0;
double zhqtsf=0;

double zqclf=0;
double zhclf=0;
double zqrgf=0;
double zhrgf=0;
double mle=0;
double yjjzcs=0;
double yjjz=0;
double djjje=0;

double zkl=10;

double gcfqdzk=10;
double gcfzjxzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

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

	ls_sql="SELECT gcfqdzk,gcfzjxzk,glfzk,sjzk,sjfzk";
	ls_sql+=" FROM crm_khzk";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		gcfzjxzk=rs.getDouble("gcfzjxzk");
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
		return;
	}

	if (shbz.equals("Y"))//信息审核标志
	{
		dzbjjc=shdzbjjc;
	}

//	dzbjjc="5";



	//签单前检查＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	qddj.Qddj qddj=new qddj.Qddj();
	String ret="";

	//[客户姓名]检查
	ret=qddj.checkKhxm(khxm,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
	//[房屋地址]检查
	ret=qddj.checkFwdz(conn,fwdz,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//对[促销活动]做检查
	ret=qddj.checkCxhd(conn,ssfgs,cxhdbm,cxhdbmxq,cxhdbmzh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//检查[是否允许签单登记]
	ret=qddj.checkYxQddj(conn,khbh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
	//签单前检查＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//取合同号
	if (hth.equals(""))
	{
		hth=qddj.getHth(conn,zxdm,"yz");
	}


	//取电子报价数据＋＋＋＋＋＋＋＋＋开始

	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	wdzgce=dzbj.getBjje(conn,khbh,"yz");//获取『折前』电子报价金额，直接费＋其它收费
	qye=dzbj.getZhBjje(conn,khbh,"sxyd");//获取『折后』电子报价金额，直接费＋其它收费

	suijinbfb=dzbj.getSuijinBfb(conn,khbh,"yz");//税金百分比
	suijin=dzbj.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』
	zqsuijin=dzbj.getZqSuijinJe(conn,khbh,"yz");//获取折前『税金金额』

	glfbfb=dzbj.getGlfBl(conn,khbh,"yz");//管理费百分比
	zqguanlif=dzbj.getZqGlfJe(conn,khbh,"yz");//『折前』管理费
	guanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//获取折后『管理费金额』

	zqgczjf=dzbj.getZqGczjf(conn,khbh,"yz");//工程直接费－折前
	zhgczjf=dzbj.getZhGczjf(conn,khbh,"yz");//工程直接费－折后

	zqqtsf=dzbj.getZqJrQtsf(conn,khbh,"yz");//记入业绩其它费－折前
	zhqtsf=dzbj.getZhJrQtsf(conn,khbh,"yz");//记入业绩其它费－折后
	qtsfsm=dzbj.getJrQtsfsm(conn,khbh,"yz");//记入业绩其它费项目

	zqwjrqyexm=dzbj.getZqWjrJe(conn,khbh,"yz");//获取折前『不记入业绩其它费』，不包括税金、管理费、设计费
	zhwjrqyexm=dzbj.getZhWjrJe(conn,khbh,"yz");//获取折后『不记入业绩其它费』，不包括税金、管理费、设计费
	wjrqyexmsm=dzbj.getWjrJeMc(conn,khbh,"yz");//获取『其它收费项目名称』，不包括税金、管理费、设计费

	zqsjf=dzbj.getZqSjf(conn,khbh,"yz");//获取折前『设计费』
	sjf=dzbj.getZhSjf(conn,khbh,"yz");//获取折后『设计费』


	if (wdzgce!=0)
	{
		zkl=cf.round(qye*10/wdzgce,2);
	}
	else{
		zkl=10;
	}



	zqclf=dzbj.getZqClf(conn,khbh,"yz");//材料费－折前
	zhclf=dzbj.getZhClf(conn,khbh,"yz");//材料费－折后
	zqrgf=dzbj.getZqRgf(conn,khbh,"yz");//人工费－折前
	zhrgf=dzbj.getZhRgf(conn,khbh,"yz");//人工费－折后


	hdzsjz=dzbj.getZsjz(conn,khbh);//赠送净值
	djjje=dzbj.getDjj(conn,khbh);//代金券金额


	htjz=dzbj.getHtjz(conn,khbh,"yz");//合同净值＝折后合同总额（含增减项）－赠送净值－赠送代金券－税金（折后）

	sgcbj=dzbj.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值

	yjjz=cf.round(mle*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

	cbj=dzbj.getCbj(conn,khbh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	gcjcbj=dzbj.getGcjcbj(conn,khbh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）


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
          
  <div align="center"> 请录入客户信息（<font color="#FF0033">*</font>为必填字段）（客户编号：<%=khbh%>）</div>
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
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折前</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折后</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">综合折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>赠送净值</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>赠送代金券</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>合同净值</td>
       <td><input name="htjz" type="text" value="<%=htjz%>" size="20" maxlength="16" readonly ></td>
       <td align="right"><font color="#FF0033">*</font>施工成本价</td>
       <td><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="16" readonly ></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>毛利额</td>
      <td><input name="mle" type="text" value="<%=mle%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>毛利率</td>
      <td><input name="mll" type="text" value="<%=mll%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>业绩净值</td>
      <td><input name="yjjz" type="text" value="<%=yjjz%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>业绩净值参数</td>
      <td><input name="yjjzcs" type="text" value="<%=yjjzcs%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
   
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>成本价</td>
      <td><input name="cbj" type="text" value="<%=cbj%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>工程基础报价</td>
      <td><input name="gcjcbj" type="text" value="<%=gcjcbj%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="29%"><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工程费签单折扣</td>
      <td width="29%"><input type="text" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="29%"><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工程费减免额</td>
      <td width="29%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="29%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费折扣</td>
      <td width="29%"><input name="glfzk" type="text" onChange="calValue(insertform)" value="<%=glfzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td><input name="guanlif" type="text" value="<%=guanlif%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td width="29%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="29%"><input name="suijinbfb" type="text" onChange="calValue(insertform)" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">折前税金</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金折扣</td>
      <td><input name="sjzk" type="text" onChange="calValue(insertform)" value="<%=sjzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">折后税金</font></td>
      <td><input name="suijin" type="text" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折前</td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折后</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">记入业绩其它费项目</td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">不记业绩其它费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>设计费－折前</td>
       <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
       <td align="right"><font color="#FF0033">*</font>设计费折扣</td>
       <td><input name="sjfzk" type="text" onChange="calValue(insertform)" value="<%=sjfzk%>" size="8" maxlength="8" >
         <b><font color="#0000FF">（>0且<=10）</font></b></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" readonly></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
   <%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折前</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折后</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">综合折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>赠送净值</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>赠送代金券</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>合同净值</td>
       <td><input name="htjz" type="text" value="<%=htjz%>" size="20" maxlength="16" readonly ></td>
       <td align="right"><font color="#FF0033">*</font>施工成本价</td>
       <td><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="16" readonly ></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>毛利额</td>
      <td><input name="mle" type="text" value="<%=mle%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>毛利率</td>
      <td><input name="mll" type="text" value="<%=mll%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>业绩净值</td>
      <td><input name="yjjz" type="text" value="<%=yjjz%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>业绩净值参数</td>
      <td><input name="yjjzcs" type="text" value="<%=yjjzcs%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
   
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>成本价</td>
      <td><input name="cbj" type="text" value="<%=cbj%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>工程基础报价</td>
      <td><input name="gcjcbj" type="text" value="<%=gcjcbj%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="29%"><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程费签单折扣</font></td>
      <td width="29%"><input type="text" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>" readonly >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="29%"><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td width="21%" align="right">&nbsp;</td>
      <td width="29%"><input type="hidden" name="cdzwjmje" value="0" size="20" maxlength="16" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="29%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费折扣</font></td>
      <td width="29%"><input name="glfzk" type="text" value="<%=glfzk%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td><input name="guanlif" type="text" value="<%=guanlif%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td><input name="glfjmje" type="hidden" value="0" size="20" maxlength="16" >
        <input name="glfbfb" type="text" onChange="calValue(insertform)" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">折前税金</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金折扣</font></td>
      <td><input name="sjzk" type="text" value="<%=sjzk%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">折后税金</font></td>
      <td><input name="suijin" type="text" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td><input name="sjjmje" type="hidden" value="0" size="20" maxlength="16" >
        <input name="suijinbfb" type="text" onChange="calValue(insertform)" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折前</td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折后</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">记入业绩其它费项目</td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">不记业绩其它费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>设计费－折前</td>
       <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
       <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费折扣</font></td>
       <td><input name="sjfzk" type="text" value="<%=sjfzk%>" size="8" maxlength="8" readonly>
         <b><font color="#0000FF">（>0且<=10）</font></b></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>设计费－折后</td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <%
	}
	//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	else if (dzbjjc.equals("3") || dzbjjc.equals("6"))//3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font>合同总额－折前</td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16"  >      </td>
      <td align="right"><font color="#FF0033">*</font>合同总额－折后</td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>综合折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" >
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>赠送净值</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>赠送代金券</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>合同净值</td>
       <td><input name="htjz" type="text" value="<%=htjz%>" size="20" maxlength="16"  ></td>
       <td align="right"><font color="#FF0033">*</font>施工成本价</td>
       <td><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="16"  ></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>毛利额</td>
      <td><input name="mle" type="text" value="<%=mle%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>毛利率</td>
      <td><input name="mll" type="text" value="<%=mll%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>业绩净值</td>
      <td><input name="yjjz" type="text" value="<%=yjjz%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>业绩净值参数</td>
      <td><input name="yjjzcs" type="text" value="<%=yjjzcs%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
   
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>成本价</td>
      <td><input name="cbj" type="text" value="<%=cbj%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>工程基础报价</td>
      <td><input name="gcjcbj" type="text" value="<%=gcjcbj%>" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="29%"><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16"  ></td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工程费签单折扣</td>
      <td width="29%"><input type="text" name="gcfqdzk" size="8" maxlength="8" value="<%=gcfqdzk%>"  >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="29%"><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" ></td>
      <td width="21%" align="right">&nbsp;</td>
      <td width="29%"><input type="hidden" name="cdzwjmje" value="0" size="20" maxlength="16" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费－折前</td>
      <td width="29%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16"  >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费折扣</td>
      <td width="29%"><input name="glfzk" type="text" value="<%=glfzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费－折后</td>
      <td><input name="guanlif" type="text" value="<%=guanlif%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>管理费百分比</td>
      <td><input name="glfjmje" type="hidden" value="0" size="20" maxlength="16" >
        <input name="glfbfb" type="text" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>折前税金</td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>税金折扣</td>
      <td><input name="sjzk" type="text" value="<%=sjzk%>" size="8" maxlength="8" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>折后税金</td>
      <td><input name="suijin" type="text" value="<%=suijin%>" size="20" maxlength="16"  ></td>
      <td align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td><input name="sjjmje" type="hidden" value="0" size="20" maxlength="16" >
        <input name="suijinbfb" type="text" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折前</td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16"></td>
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折后</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">记入业绩其它费项目</td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">不记业绩其它费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>设计费－折前</td>
       <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" ></td>
       <td align="right"><font color="#FF0033">*</font>设计费折扣</td>
       <td><input name="sjfzk" type="text" value="<%=sjfzk%>" size="8" maxlength="8" >
         <b><font color="#0000FF">（>0且<=10）</font></b></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>设计费－折后</td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" ></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <%
	}
	//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折前</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折后</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">赠送净值</font></td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">赠送代金券</font></td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16" readonly ></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>合同净值</td>
       <td><input name="htjz" type="text" value="<%=htjz%>" size="20" maxlength="16" readonly ></td>
       <td align="right"><font color="#FF0033">*</font>施工成本价</td>
       <td><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="16" readonly ></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>毛利额</td>
      <td><input name="mle" type="text" value="<%=mle%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>毛利率</td>
      <td><input name="mll" type="text" value="<%=mll%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>业绩净值</td>
      <td><input name="yjjz" type="text" value="<%=yjjz%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>业绩净值参数</td>
      <td><input name="yjjzcs" type="text" value="<%=yjjzcs%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
   
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>成本价</td>
      <td><input name="cbj" type="text" value="<%=cbj%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>工程基础报价</td>
      <td><input name="gcjcbj" type="text" value="<%=gcjcbj%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>工程费减免额</td>
      <td><input name="cdzwjmje" type="text" id="cdzwjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">综合折扣</font></td>
      <td><input name="zkl" type="text" id="zkl" value="<%=zkl%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td><input name="zhgczjf" type="text" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
      <td><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="29%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="29%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="29%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td width="29%"><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金－折前</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金－折后</font></td>
      <td><input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">记入业绩其它费－折前</font></td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">记入业绩其它费－折后</font></td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">记入业绩其它费项目</font></td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">不记业绩其它费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">不记业绩其它费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">不记业绩其它费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折前</font></td>
      <td>
	  <input name="zqsjf" type="text" value="<%=zqsjf%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
      <td><input name="sjf" type="text" value="<%=sjf%>" size="20" maxlength="16" readonly></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折前</font></td>
      <td><input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同总额－折后</font></td>
      <td><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">综合折扣</font></td>
      <td><input name="zkl" type="text" id="zkl" value="<%=zkl%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>赠送净值</td>
      <td><input name="hdzsjz" type="text" value="<%=hdzsjz%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
      <td align="right"><font color="#FF0033">*</font>赠送代金券</td>
      <td><input name="djjje" type="text" value="<%=djjje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#FF0033">*</font>合同净值</td>
       <td><input name="htjz" type="text" value="<%=htjz%>" size="20" maxlength="16" readonly ></td>
       <td align="right"><font color="#FF0033">*</font>施工成本价</td>
       <td><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="16" readonly ></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>毛利额</td>
      <td><input name="mle" type="text" value="<%=mle%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>毛利率</td>
      <td><input name="mll" type="text" value="<%=mll%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>业绩净值</td>
      <td><input name="yjjz" type="text" value="<%=yjjz%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>业绩净值参数</td>
      <td><input name="yjjzcs" type="text" value="<%=yjjzcs%>" size="8" maxlength="8" readonly>
        <b><font color="#0000FF">（>0且<=100）</font></b></td>
    </tr>
   
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>成本价</td>
      <td><input name="cbj" type="text" value="<%=cbj%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>工程基础报价</td>
      <td><input name="gcjcbj" type="text" value="<%=gcjcbj%>" size="20" maxlength="16" readonly ></td>
    </tr>
    

    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td><input name="zqgczjf" type="text" value="<%=zqgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>工程费签单折扣</td>
      <td><input name="gcfqdzk" type="text" value="<%=gcfqdzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td><input name="zhgczjf" type="text" id="zhgczjf" value="<%=zhgczjf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>工程费减免额</td>
      <td><input name="cdzwjmje" type="text" id="cdzwjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16"></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="29%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>管理费折扣</td>
      <td width="29%"><input name="glfzk" type="text" value="<%=glfzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td><input name="guanlif" type="text" id="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text" id="glfjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
      <td width="29%"><input name="glfbfb" type="text" id="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="29%"><input name="suijinbfb" type="text" id="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金－折前</font></td>
      <td><input type="text" name="zqsuijin" value="<%=zqsuijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金折扣</td>
      <td><input name="sjzk" type="text" id="sjzk" value="<%=sjzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">税金－折后</font></td>
      <td><input name="suijin" type="text" id="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text" id="sjjmje"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">记入业绩其它费－折前</font></td>
      <td><input name="zqqtsf" type="text" value="<%=zqqtsf%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>记入业绩其它费－折后</td>
      <td><input name="zhqtsf" type="text" value="<%=zhqtsf%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">记入业绩其它费项目</font></td>
      <td colspan="3"><input name="qtsfsm" type="text" value="<%=qtsfsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">不记业绩其它费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font>不记业绩其它费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">不记业绩其它费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="73" maxlength="100" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折前</font></td>
      <td><input name="zqsjf" type="text" id="zqsjf" value="<%=zqsjf%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0033">*</font>设计费折扣</td>
      <td><input name="sjfzk" type="text" value="<%=sjfzk%>" size="8" maxlength="8" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
      <td><input name="sjf" type="text" id="sjf" value="<%=sjf%>" size="20" maxlength="16" readonly></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <%
	}
	else{
		out.println("『启用电子报价检查』错误！"+dzbjjc);
		return;
	}
%> 
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>是否返券</td>
      <td width="29%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        是 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])">
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
      <td width="21%" align="right"><font color="#FF0033">*</font>是否已认证</td>
      <td width="29%"> 
        <input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
        是 
        <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])">
      否 </td>
      <td width="21%" align="right">认证市场</td>
      <td width="29%"> 
        <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
        </select>      </td>
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
        <input type="radio" name="sffk" value="N">
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
      <td colspan="4" align="center"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
        <input type="button"  value="录入付款计划" onClick="f_lrfkjh(insertform)" name="lrfkjh" disabled>
		  <input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="预览报价">
        <input type="button"  value="打印合同附件" onClick="f_ck(insertform)" name="ck2" >
 		<input name="button" type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_khzsxx.jsp?khbh=<%=khbh%>')" value="赠送信息">       
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

      <input type="hidden" name="zqclf" value="<%=zqclf%>">
      <input type="hidden" name="zhclf" value="<%=zhclf%>">
      <input type="hidden" name="zqrgf" value="<%=zqrgf%>">
      <input type="hidden" name="zhrgf" value="<%=zhrgf%>">
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
		var yjjz=FormName.mle.value*100/<%=yjjzcs%>;
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
		var yjjz=FormName.mle.value*100/<%=yjjzcs%>;
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
		var zhgczjf=<%=zhgczjf%>-FormName.cdzwjmje.value*1.0;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//管理费减免额
		var guanlif=<%=guanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		//税金减免额
		var suijin=<%=suijin%>-FormName.sjjmje.value*1.0;
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
		
		//合同净值=合同净值－工程费减免额－管理费减免额－税金减免额
		var htjz=<%=htjz%>-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
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
		var yjjz=FormName.mle.value*100/<%=yjjzcs%>;
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
		var yjjz=FormName.mle.value*100/<%=yjjzcs%>;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    


function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);


	if(	javaTrim(FormName.fkfabm)=="") {
		alert("请输入[付款方案]！");
		FormName.fkfabm.focus();
		return false;
	}

	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("请输入[书面合同编号]！");
		FormName.smhtbh.focus();
		return false;
	}
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("请选择[报价级别]！");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("请输入[报价级别]！");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区/街道]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("请输入[楼号/门牌号]！");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("请输入[身份证号码]！");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "身份证号码"))) {
			return false;
		}

		if(	!radioChecked(FormName.sffk)) {
			alert("请选择[水质分析卡是否发放]！");
			FormName.sffk[0].focus();
			return false;
		}
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("请输入[登记卡号]！");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("请输入[发卡日期]！");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
				return false;
			}
		}
		else{
			FormName.djkh.value="";
			FormName.fkrq.value="";
		}
		<%
	}
%>
	
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("请输入[风格分类]！");
		FormName.fgflbm.focus();
		return false;
	}


	if(	javaTrim(FormName.ysbm)=="") {
		alert("请输入[油色]！");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "面积"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[面积]不能为0！");
		FormName.fwmj.select();
		return false;
	}

<%
/*
if (!dzbjjc.equals("4"))//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
{
	%>
	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}

	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhyy)!="") {
			alert("您选择了无优惠,请删除[优惠内容]！");
			FormName.yhyy.select();
			return false;
		}
	}
	<%
}
*/
%>

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[工程原报价]不能为0！");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[工程原报价]不能小于[工程签约额]！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)<=0)
	{
		alert("[工程签约额]不能小<=0！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[综合折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "综合折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[综合折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("请输入[工程费减免额]！");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "工程费减免额"))) {
		return false;
	}
	if (  parseFloat(FormName.cdzwjmje.value)<-100 || parseFloat(FormName.cdzwjmje.value)>100)
	{
		alert("错误！[工程费减免额]应该在-100和100之间！");
		FormName.cdzwjmje.select();
		return false;
	}
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("请输入[管理费减免额]！");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "管理费减免额"))) {
		return false;
	}
	if ( parseFloat(FormName.glfjmje.value)<-100 || parseFloat(FormName.glfjmje.value)>100)
	{
		alert("错误！[管理费减免额]应该在-100和100之间！");
		FormName.glfjmje.select();
		return false;
	}
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("请输入[税金减免额]！");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "税金减免额"))) {
		return false;
	}
	if (  parseFloat(FormName.sjjmje.value)<-100 || parseFloat(FormName.sjjmje.value)>100)
	{
		alert("错误！[税金减免额]应该在-100和100之间！");
		FormName.sjjmje.select();
		return false;
	}



	
	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("请输入[税金百分比]！");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "税金百分比"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("错误！[税金百分比]应该在0和100之间！");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqsuijin)=="") {
		alert("请输入[折前税金]！");
		FormName.zqsuijin.select();
		return false;
	}
	if(!(isFloat(FormName.zqsuijin, "折前税金"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if (parseFloat(FormName.suijin.value)<0)
	{
		alert("[税金]不能<0！");
		FormName.suijin.select();
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[服务费]！");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "服务费"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("请输入[管理费百分比]！");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "管理费百分比"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("错误！[管理费百分比]应该在0和100之间！");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请输入[折前管理费]！");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("请输入[折后管理费]！");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "折后管理费"))) {
		return false;
	}
	if (parseFloat(FormName.guanlif.value)<0)
	{
		alert("[折后管理费]不能<0！");
		FormName.guanlif.select();
		return false;
	}


	if(!(isFloat(FormName.djjje, "赠送代金券"))) {
		return false;
	}
	if(	javaTrim(FormName.hdzsjz)=="") {
		alert("请输入[赠送净值]！");
		FormName.hdzsjz.select();
		return false;
	}
	if(!(isFloat(FormName.hdzsjz, "赠送净值"))) {
		return false;
	}
	if(	javaTrim(FormName.djjje)=="") {
		alert("请输入[赠送代金券]！");
		FormName.djjje.select();
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工成本价]！");
		FormName.sgcbj.select();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjcbj)=="") {
		alert("请输入[工程基础报价]！");
		FormName.gcjcbj.select();
		return false;
	}
	if(!(isFloat(FormName.gcjcbj, "工程基础报价"))) {
		return false;
	}
	if(	javaTrim(FormName.htjz)=="") {
		alert("请输入[合同净值]！");
		FormName.htjz.select();
		return false;
	}
	if(!(isFloat(FormName.htjz, "合同净值"))) {
		return false;
	}
	if (parseFloat(FormName.htjz.value)<0)
	{
		alert("[合同净值]不能<0！");
		FormName.htjz.select();
		return false;
	}
	if(	javaTrim(FormName.mll)=="") {
		alert("请输入[毛利率]！");
		FormName.mll.select();
		return false;
	}
	if(!(isFloat(FormName.mll, "毛利率"))) {
		return false;
	}
	if (parseFloat(FormName.mll.value)>100)
	{
		alert("[毛利率]不能>100！");
		FormName.mll.select();
		return false;
	}

	if(	javaTrim(FormName.zqgczjf)=="") {
		alert("请输入[工程直接费－折前]！");
		FormName.zqgczjf.select();
		return false;
	}
	if(!(isFloat(FormName.zqgczjf, "工程直接费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhgczjf)=="") {
		alert("请输入[工程直接费－折后]！");
		FormName.zhgczjf.select();
		return false;
	}
	if(!(isFloat(FormName.zhgczjf, "工程直接费－折后"))) {
		return false;
	}


	if(	javaTrim(FormName.zqqtsf)=="") {
		alert("请输入[记入业绩其它费－折前]！");
		FormName.zqqtsf.select();
		return false;
	}
	if(!(isFloat(FormName.zqqtsf, "记入业绩其它费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhqtsf)=="") {
		alert("请输入[记入业绩其它费－折后]！");
		FormName.zhqtsf.select();
		return false;
	}
	if(!(isFloat(FormName.zhqtsf, "记入业绩其它费－折后"))) {
		return false;
	}

	if (FormName.zqqtsf.value!=0)
	{
		if(	javaTrim(FormName.qtsfsm)=="") {
			alert("请输入[记入业绩其它费项目]！");
			FormName.qtsfsm.select();
			return false;
		}
	}

	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("请输入[不记业绩其它费－折前]！");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "不记业绩其它费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("请输入[不记业绩其它费－折后]！");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "不记业绩其它费－折后"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("请输入[记业绩其它费项目]！");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("请输入[每平米均价]！");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "每平米均价"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("请选择[是否返券]！");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("请输入[返卷总金额]！");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "返卷总金额"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("请输入[公司承担返卷额]！");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "公司承担返卷额"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[返卷总金额]不能小于[公司承担返卷额]！");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("请选择[是否已认证]！");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("请输入[认证市场]！");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[签约日期]不能大于[今天]！");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("请输入[建议交底日期]！");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("请输入[合同开工日期]！");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "合同开工日期"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("请输入[合同竣工日期]！");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "合同竣工日期"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[建议交底日期]应大于[签约日期]！");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[合同开工日期]应大于[建议交底日期]！");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[合同竣工日期]应大于[合同开工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[建议交底日期]！");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同开工日期]！");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同竣工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";
		FormName.hdsgd.value="";
		FormName.hdsgbz.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
		FormName.hdsgd.disabled=true;
		FormName.hdsgbz.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("请输入[回单工地队长]！");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("请输入[回单工地班长]！");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[签约店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "会员有效时间始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "会员有效时间止"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}

	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("错误！公司规定『设计费』必须先财务交款，才能签单！交款比例为『<%=sjjryjbfb%>』%，目前财务实收『<%=sssjf%>』未达标");
		FormName.sjf.select();
		return false;
	}

	if(	javaTrim(FormName.gqts)=="") {
		alert("请选择[工期天数]！");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "工期天数"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_khxx.jsp";
	FormName.submit();
	FormName.lrfkjh.disabled=false;

	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}
function f_lrfkjh(FormName)//参数FormName:Form的名称
{

	FormName.action="/cwgl/fkjh/InsertCw_jzfkjh.jsp";
	FormName.submit();
	FormName.ckfkjh.disabled=false;
	return true;
}


//-->
</SCRIPT>
