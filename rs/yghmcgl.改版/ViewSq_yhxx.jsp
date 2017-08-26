<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String bianhao=null;
String yhmc=null;
String xb=null;
String csrq=null;
String sfzszg=null;
String mz=null;
String sg=null;
String tz=null;
String xx=null;
String hf=null;
String zzmm=null;
String sjsjb=null;
String zcmc=null;
String zyzzzs=null;
String xlbm=null;
String zy=null;
String cjgzsj=null;
String xuewei=null;
String byyx=null;
String zz=null;
String yzbm=null;
String dh=null;
String bgdh=null;
String jtdh=null;
String email=null;
String sfzh=null;
String sfzdz=null;
String gznx=null;
String jjlxr=null;
String jjlxrdz=null;
String lxrdh=null;
String zwmc=null;
String xzzwbm=null;
String sfytj=null;
String tjrq=null;
String sfqs=null;
String dhsfgb=null;
String zwpj=null;
String sftlgx=null;
String ssfgs=null;
String dwbh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sfydbs=null;
String qgzdw=null;
String wgzsj=null;
String syjzrq=null;
String gzlb=null;
String jbgz=null;
String glgz=null;
String gwgz=null;
String jtbt=null;
String cb=null;
String dhbt=null;
String kqhm=null;
String sfcjbx=null;
String hjszd=null;
String dacfd=null;
String dazrsj=null;
String dazcsj=null;
String dazchc=null;
String dabgfjs=null;
String kfgssq=null;
String rzcs=null;
String rzsj=null;
String gqpxkssj=null;
String gqpxjssj=null;
String kdlxtbz=null;
String yhjs=null;
String ckjgbz=null;
String zdyhbz=null;
String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String shbxh=null;
String jbxdd=null;
String sbblsj=null;
String sbzrjs=null;
String sbzcjs=null;
String bxtjsj=null;
String bxzcsj=null;
String yjsxe=null;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
String gsjgjj=null;
String grjgjj=null;
String rzxh=null;
String zzxh=null;
String zzrq=null;
String zzpzbm=null;
String lzxh=null;
String lzrq=null;
String lzyy=null;
String buzhu=null;
String khgz=null;

String ldhtbh=null;
String ldhtlx=null;
String ldhtqx=null;
String htksrq=null;
String htdqrq=null;
String sjsbh=null;

String sqdwmc="&nbsp;";

String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,sjsbh,ygbh,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx,hf,zzmm,sjsjb,zcmc,zyzzzs,xlbm,zy,cjgzsj,xuewei,byyx,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr,jjlxrdz,lxrdh,zwmc,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,sftlgx,ssfgs,dwbh,lrr,lrsj,bz,sfydbs,qgzdw,wgzsj,syjzrq,gzlb,jbgz,glgz,gwgz,jtbt,cb,dhbt,kqhm,sfcjbx,hjszd,dacfd,dazrsj,dazcsj,dazchc,dabgfjs,kfgssq,rzcs,rzsj,gqpxkssj,gqpxjssj,yhjs,kdlxtbz,ckjgbz,zdyhbz,ylbx,jylbx,sybx,gsby,syx,shbxh,jbxdd,sbblsj,sbzrjs,sbzcjs,bxtjsj,bxzcsj,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq,rzxh,zzxh,zzrq,zzpzbm,lzxh,lzrq,lzyy,khgz,buzhu ";
	ls_sql+=" from  sq_yhxx,dm_zwbm";
	ls_sql+=" where sq_yhxx.zwbm=dm_zwbm.zwbm(+) and ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		ygbh=cf.fillHtml(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xb=cf.fillHtml(rs.getString("xb"));
		csrq=cf.fillHtml(rs.getDate("csrq"));
		sfzszg=cf.fillHtml(rs.getString("sfzszg"));
		mz=cf.fillHtml(rs.getString("mz"));
		sg=cf.fillHtml(rs.getString("sg"));
		tz=cf.fillHtml(rs.getString("tz"));
		xx=cf.fillHtml(rs.getString("xx"));
		hf=cf.fillHtml(rs.getString("hf"));
		zzmm=cf.fillHtml(rs.getString("zzmm"));
		sjsjb=cf.fillHtml(rs.getString("sjsjb"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zyzzzs=cf.fillHtml(rs.getString("zyzzzs"));
		xlbm=cf.fillHtml(rs.getString("xlbm"));
		zy=cf.fillHtml(rs.getString("zy"));
		cjgzsj=cf.fillHtml(rs.getDate("cjgzsj"));
		xuewei=cf.fillHtml(rs.getString("xuewei"));
		byyx=cf.fillHtml(rs.getString("byyx"));
		zz=cf.fillHtml(rs.getString("zz"));
		yzbm=cf.fillHtml(rs.getString("yzbm"));
		dh=cf.fillHtml(rs.getString("dh"));
		bgdh=cf.fillHtml(rs.getString("bgdh"));
		jtdh=cf.fillHtml(rs.getString("jtdh"));
		email=cf.fillHtml(rs.getString("email"));
		sfzh=cf.fillHtml(rs.getString("sfzh"));
		sfzdz=cf.fillHtml(rs.getString("sfzdz"));
		gznx=cf.fillHtml(rs.getString("gznx"));
		jjlxr=cf.fillHtml(rs.getString("jjlxr"));
		jjlxrdz=cf.fillHtml(rs.getString("jjlxrdz"));
		lxrdh=cf.fillHtml(rs.getString("lxrdh"));
		zwmc=cf.fillHtml(rs.getString("zwmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		sfytj=cf.fillHtml(rs.getString("sfytj"));
		tjrq=cf.fillHtml(rs.getDate("tjrq"));
		sfqs=cf.fillHtml(rs.getString("sfqs"));
		dhsfgb=cf.fillHtml(rs.getString("dhsfgb"));
		zwpj=cf.fillHtml(rs.getString("zwpj"));
		sftlgx=cf.fillHtml(rs.getString("sftlgx"));
		ssfgs=cf.fillHtml(rs.getString("ssfgs"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfydbs=cf.fillHtml(rs.getString("sfydbs"));
		qgzdw=cf.fillHtml(rs.getString("qgzdw"));
		wgzsj=cf.fillHtml(rs.getString("wgzsj"));
		syjzrq=cf.fillHtml(rs.getDate("syjzrq"));
		gzlb=cf.fillHtml(rs.getString("gzlb"));
		jbgz=cf.fillHtml(rs.getString("jbgz"));
		glgz=cf.fillHtml(rs.getString("glgz"));
		gwgz=cf.fillHtml(rs.getString("gwgz"));
		jtbt=cf.fillHtml(rs.getString("jtbt"));
		cb=cf.fillHtml(rs.getString("cb"));
		dhbt=cf.fillHtml(rs.getString("dhbt"));
		kqhm=cf.fillHtml(rs.getString("kqhm"));
		sfcjbx=cf.fillHtml(rs.getString("sfcjbx"));
		hjszd=cf.fillHtml(rs.getString("hjszd"));
		dacfd=cf.fillHtml(rs.getString("dacfd"));
		dazrsj=cf.fillHtml(rs.getDate("dazrsj"));
		dazcsj=cf.fillHtml(rs.getDate("dazcsj"));
		dazchc=cf.fillHtml(rs.getString("dazchc"));
		dabgfjs=cf.fillHtml(rs.getString("dabgfjs"));
		kfgssq=cf.fillHtml(rs.getString("kfgssq"));
		rzcs=cf.fillHtml(rs.getString("rzcs"));
		rzsj=cf.fillHtml(rs.getDate("rzsj"));
		gqpxkssj=cf.fillHtml(rs.getDate("gqpxkssj"));
		gqpxjssj=cf.fillHtml(rs.getDate("gqpxjssj"));
		yhjs=cf.fillHtml(rs.getString("yhjs"));
		kdlxtbz=cf.fillHtml(rs.getString("kdlxtbz"));
		ckjgbz=cf.fillHtml(rs.getString("ckjgbz"));
		zdyhbz=cf.fillHtml(rs.getString("zdyhbz"));

		ylbx=cf.fillHtml(rs.getString("ylbx"));
		jylbx=cf.fillHtml(rs.getString("jylbx"));
		sybx=cf.fillHtml(rs.getString("sybx"));
		gsby=cf.fillHtml(rs.getString("gsby"));
		syx=cf.fillHtml(rs.getString("syx"));
		shbxh=cf.fillHtml(rs.getString("shbxh"));
		jbxdd=cf.fillHtml(rs.getString("jbxdd"));
		sbblsj=cf.fillHtml(rs.getDate("sbblsj"));
		sbzrjs=cf.fillHtml(rs.getString("sbzrjs"));
		sbzcjs=cf.fillHtml(rs.getString("sbzcjs"));
		bxtjsj=cf.fillHtml(rs.getDate("bxtjsj"));
		bxzcsj=cf.fillHtml(rs.getDate("bxzcsj"));
		yjsxe=cf.fillHtml(rs.getString("yjsxe"));
		gsjbfe=rs.getDouble("gsjbfe");
		grjbfe=rs.getDouble("grjbfe");
		sfjgjj=cf.fillHtml(rs.getString("sfjgjj"));
		gsjgjj=cf.fillHtml(rs.getString("gsjgjj"));
		grjgjj=cf.fillHtml(rs.getString("grjgjj"));
		ldhtbh=cf.fillHtml(rs.getString("ldhtbh"));
		ldhtlx=cf.fillHtml(rs.getString("ldhtlx"));
		ldhtqx=cf.fillHtml(rs.getString("ldhtqx"));
		htksrq=cf.fillHtml(rs.getDate("htksrq"));
		htdqrq=cf.fillHtml(rs.getDate("htdqrq"));
		rzxh=cf.fillHtml(rs.getString("rzxh"));
		zzxh=cf.fillHtml(rs.getString("zzxh"));
		zzrq=cf.fillHtml(rs.getDate("zzrq"));
		zzpzbm=cf.fillHtml(rs.getString("zzpzbm"));
		lzxh=cf.fillHtml(rs.getString("lzxh"));
		lzrq=cf.fillHtml(rs.getDate("lzrq"));
		lzyy=cf.fillHtml(rs.getString("lzyy"));
		buzhu=cf.fillHtml(rs.getString("buzhu"));
		khgz=cf.fillHtml(rs.getString("khgz"));
	
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_sqfgs,sq_dwxx";
		ls_sql+=" where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sqdwmc+=rs.getString("dwmc")+"、";
		}
		rs.close();
		ps.close();
	}
	if (kfgssq.equals("3") || kfgssq.equals("4") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_sqbm,sq_dwxx";
		ls_sql+=" where sq_sqbm.dwbh=sq_dwxx.dwbh and sq_sqbm.ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sqdwmc+=rs.getString("dwmc")+"、";
		}
		rs.close();
		ps.close();
	}

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000;
	font-family: "仿宋_GB2312";
}
.STYLE2 {color: #000000; font-family: "仿宋_GB2312"; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 员工登记表（员工序号：<%=ygbh%>）
  <input type="button" value="劳动合同" onclick="window.open('ViewLdht.jsp?ygbh=<%=ygbh%>')">
  <input type="button" value="工资" onclick="window.open('ViewGz.jsp?ygbh=<%=ygbh%>')">
  <input type="button" value="社保" onclick="window.open('ViewSb.jsp?ygbh=<%=ygbh%>')">
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 姓名 </td>
    <td width="15%"><%=yhmc%> </td>
    <td width="10%" align="right" class="STYLE1"> 性别 </td>
    <td width="20%"><%
	cf.selectToken(out,"M+男&W+女",xb,true);
%> </td>
    <td width="10%" align="right" class="STYLE1"> 出生日期 </td>
    <td width="15%"><%=csrq%> </td>
    <td colspan="2" rowspan="4"><img name="zhaopian" src="/rs/yghmcgl/images/<%=bianhao%>.JPG" height="91"></td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 民族 </td>
    <td width="15%"><%=mz%> </td>
    <td width="10%" align="right" class="STYLE1"> 身高 </td>
    <td width="20%"><%=sg%> <span class="STYLE1">(cm)</span></td>
    <td width="10%" align="right" class="STYLE1"><strong> 员工状态 </strong></td>
    <td width="15%"><%
	cf.selectToken(out,"M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退",sfzszg,true);
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 体重 </td>
    <td width="15%"><%=tz%><span class="STYLE1">(KG)</span> </td>
    <td width="10%" align="right" class="STYLE1"> 血型 </td>
    <td width="20%"><%
  if(xx=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.selectToken(out,"1+A型&2+B型&3+AB型&4+O型",xx,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> 婚否 </td>
    <td width="15%"><%
  if(hf=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"Y+是&N+否",hf,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 政治面貌 </td>
    <td width="15%"><%
  if(zzmm=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"0+群众&1+中共党员&2+共青团员&3+民主党派",zzmm,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1">技术职称</td>
    <td width="20%"><%
  if(zcmc=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> 主要资质证书 </td>
    <td width="15%"><%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs,true);
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 文化程度 </td>
    <td width="15%"><%
  if(xlbm=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm",xlbm,false);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> 所学专业 </td>
    <td width="20%"><%=zy%> </td>
    <td width="10%" align="right" class="STYLE1"> 毕业时间 </td>
    <td width="15%"><%=cjgzsj%> </td>
    <td width="10%" align="right" class="STYLE1"> 学位 </td>
    <td width="15%"><%
  if(xuewei=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"0+无&1+学士学位&2+硕士学位&3+博士学位",xuewei,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 毕业院校 </td>
    <td colspan="3"><%=byyx%> </td>
    <td width="10%" align="right" class="STYLE1"> 工作年限 </td>
    <td width="15%"><%=gznx%> </td>
    <td width="10%" align="right" class="STYLE1"> 是否脱离关系 </td>
    <td width="15%"><%
	cf.radioToken(out, "Y+是&N+否",sftlgx,true);
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 详细住址 </td>
    <td colspan="3"><%=zz%> </td>
    <td width="10%" align="right" class="STYLE1"> 邮政编码 </td>
    <td width="15%"><%=yzbm%> </td>
    <td width="10%" align="right" class="STYLE1"> email </td>
    <td width="15%"><%=email%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 手机</td>
    <td width="15%"><%=dh%> </td>
    <td width="10%" align="right" class="STYLE1">办公电话</td>
    <td width="20%"><%=bgdh%> </td>
    <td width="10%" align="right" class="STYLE1">家庭电话</td>
    <td width="15%"><%=jtdh%> </td>
    <td width="10%" align="right" class="STYLE1"> 电话是否公布 </td>
    <td width="15%"><%
  if(dhsfgb=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.radioToken(out, "1+本公司&2+不限制&9+不公布",dhsfgb,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE2"> 身份证号 </td>
    <td width="15%"><%=sfzh%> </td>
    <td width="10%" align="right" class="STYLE1"> 身份证地址 </td>
    <td colspan="3"><%=sfzdz%></td>
    <td width="10%" align="right" class="STYLE1">工号</td>
    <td width="15%"><%=bianhao%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1">紧急联系人 </td>
    <td width="15%"><%=jjlxr%> </td>
    <td width="10%" align="right" class="STYLE1"> 联系人住址 </td>
    <td colspan="3"><%=jjlxrdz%> </td>
    <td width="10%" align="right" class="STYLE1"> 联系人电话 </td>
    <td width="15%"><%=lxrdh%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 是否裙带关系 </td>
    <td width="15%"><%
  if(sfqs=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.radioToken(out, "Y+是&N+否",sfqs,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> 设计师职称 </td>
    <td width="20%"><%
  if(sjsjb=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> 是否已体检 </td>
    <td width="15%"><%
  if(sfytj=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.radioToken(out, "Y+是&N+否",sfytj,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> 体检日期 </td>
    <td width="15%"><%=tjrq%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 业务专长<br>
      自我评价 </td>
    <td colspan="7"><%=zwpj%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%"> 
      <div align="right" class="STYLE1">用户角色</div>    </td>
    <td width="15%"><%
  if(yhjs=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"A0+总部&A1+总部各部门&F0+分公司&F1+分公司各部门&F2+店面&F3+部门小组&G0+供应商&J0+加盟商",yhjs,true);}
%> </td>
    <td width="10%"> 
      <div align="right" class="STYLE1">可登陆标志</div>    </td>
    <td width="20%"><%
	cf.radioToken(out, "Y+可登陆&N+不可登陆",kdlxtbz,true);
%> </td>
    <td width="10%"> 
      <div align="right" class="STYLE1">查看价格明细</div>    </td>
    <td width="15%"><%
  if(ckjgbz=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.radioToken(out, "Y+可看&N+不可看",ckjgbz,true);}
%> </td>
    <td width="10%"> 
      <div align="right" class="STYLE1">重点用户标志</div>    </td>
    <td width="15%"><%
  if(zdyhbz=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.radioToken(out, "Y+是&N+否",zdyhbz,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> 录入人 </td>
    <td width="15%"><%=lrr%> </td>
    <td width="10%" align="right" class="STYLE1"> 录入时间 </td>
    <td width="20%"><%=lrsj%> </td>
    <td width="10%" align="right" class="STYLE1"> 备注 </td>
    <td width="15%" colspan="3"><%=bz%> </td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#000099">客户资料授权范围</font></b></td>
  </tr>
  <tr > 
    <td colspan="2" align="center"> <b><%
	cf.selectToken(out,"0+不授权&1+授权单个分公司&2+授权多个分公司&3+授权单个店面&4+授权某一分公司多个店面&5+授权多个分公司多个店面",kfgssq,true);
%> </b></td>
    <td colspan="6"><%=sqdwmc%></td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#000099">入职</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE2">所属公司</td>
    <td width="15%"><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);%></td>
    <td width="10%" align="right" class="STYLE2">所属部门</td>
    <td width="20%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%></td>
    <td width="10%" align="right" class="STYLE1">部门小组</td>
    <td width="15%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%> </td>
    <td width="10%" align="right" class="STYLE2">行政职务</td>
    <td width="15%"><%=xzzwbm%></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1">入职序号</td>
    <td width="15%"><%=rzxh%></td>
    <td width="10%" align="right" class="STYLE1">是否有担保书</td>
    <td width="20%"><%
	cf.radioToken(out, "Y+是&N+否",sfydbs,true);
%></td>
    <td width="10%" align="right" class="STYLE1">岗前培训 到</td>
    <td width="15%"><%=gqpxkssj%></td>
    <td width="10%" align="right" class="STYLE1">岗前培训 到</td>
    <td width="15%"><%=gqpxjssj%></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> 入职日期 </td>
    <td width="15%"><%=rzsj%> </td>
    <td width="10%" align="right" class="STYLE1"> 入职次数 </td>
    <td width="20%"><%=rzcs%> </td>
    <td width="10%" align="right" class="STYLE1">试用截至日期 </td>
    <td width="15%"><%=syjzrq%> </td>
    <td width="10%" align="right" class="STYLE1"> 前工作单位 </td>
    <td width="15%"><%=qgzdw%> </td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> 未工作时间 </td>
    <td width="15%"><%=wgzsj%> <span class="STYLE1">(年)</span></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
    <td align="right"><strong>工种</strong></td>
    <td width="15%"><%=zwmc%></td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#0000CC">转正</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> 转正序号 </td>
    <td width="15%"><%=zzxh%> </td>
    <td width="10%" align="right" class="STYLE1"> 转正日期 </td>
    <td width="20%"><%=zzrq%> </td>
    <td width="10%" align="right" class="STYLE1"> 转正批准部门 </td>
    <td width="15%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zzpzbm+"'",zzpzbm,true);%>    </td>
    <td width="10%" align="right" class="STYLE1">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#0000CC">离职</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1">离职序号 </td>
    <td width="15%"><%=lzxh%></td>
    <td width="10%" align="right" class="STYLE1">离职日期 </td>
    <td width="20%"><%=lzrq%> </td>
    <td width="10%" align="right" class="STYLE1">离职原因</td>
    <td colspan="3"> <%=lzyy%> </td>
  </tr>
  <tr > 
    <td colspan="8" class="STYLE1" align="center"><b><font color="#0000CC">档案办理情况</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> 户籍所在地 </td>
    <td colspan="3"><%=hjszd%> </td>
    <td width="10%" align="right" class="STYLE1"> 档案存放地 </td>
    <td colspan="3"><%=dacfd%> </td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> 档案转入时间 </td>
    <td width="15%"><%=dazrsj%> </td>
    <td width="10%" align="right" class="STYLE1"> 档案转出时间 </td>
    <td width="20%"><%=dazcsj%> </td>
    <td width="10%" align="right" class="STYLE1"> 档案转出何处 </td>
    <td width="15%"><%=dazchc%> </td>
    <td width="10%" align="right" class="STYLE1"> 保管费结算 </td>
    <td width="15%"><%
	cf.radioToken(out, "N+未结算&Y+结算",dabgfjs,true);
%> </td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
<%
	String kssj=null;
	String jzsj=null;
	String jyjg=null;
	String jysm=null;
	int count=0;

	ls_sql="select count(*) count";
	ls_sql+=" from  rs_jyjl";
	ls_sql+=" where (1=1) and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt("count");
	}
	rs.close();
	ps.close();
%>
<tr >
<td width="10%" rowspan="<%=count+1%>" align="center">教育经历</td>
<td width="15%" align="center" >开始时间</td>
<td width="10%" align="center" >截至时间</td>
<td width="25%" align="center" >教育机构</td>
<td width="40%" align="center" >教育说明</td>
</tr>
<%
	ls_sql="select kssj,jzsj,jyjg,jysm";
	ls_sql+=" from  rs_jyjl";
	ls_sql+=" where ygbh="+whereygbh;
	ls_sql+=" order by kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		kssj=cf.fillHtml(rs.getDate("kssj"));
		jzsj=cf.fillHtml(rs.getDate("jzsj"));
		jyjg=cf.fillHtml(rs.getString("jyjg"));
		jysm=cf.fillHtml(rs.getString("jysm"));
%>
	<tr >
	<td align="center"><%=kssj%></td>
	<td align="center"><%=jzsj%></td>
	<td align="center"><%=jyjg%></td>
	<td align="center"><%=jysm%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();

%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
<%
	String sjd=null;
	String gzdwbm=null;
	String drzw=null;
	String dwdh=null;
	String zmr=null;


	ls_sql="select count(*) count";
	ls_sql+=" from  rs_gzjl";
	ls_sql+=" where (1=1) and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt("count");
	}
	rs.close();
	ps.close();
%>
<tr >
<td width="10%" rowspan="<%=count+1%>" align="center">工作经历</td>
<td width="15%" align="center" >时间段</td>
<td width="25%" align="center" >工作单位何部门</td>
<td width="10%" align="center" >担任职务</td>
<td width="20%" align="center" >单位电话</td>
<td width="20%" align="center" >证明人</td>
</tr>
<%
	ls_sql="select sjd,gzdwbm,drzw,dwdh,zmr";
	ls_sql+=" from  rs_gzjl";
	ls_sql+=" where ygbh="+whereygbh;
	ls_sql+=" order by sjd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sjd=cf.fillHtml(rs.getString("sjd"));
		gzdwbm=cf.fillHtml(rs.getString("gzdwbm"));
		drzw=cf.fillHtml(rs.getString("drzw"));
		dwdh=cf.fillHtml(rs.getString("dwdh"));
		zmr=cf.fillHtml(rs.getString("zmr"));
%>
	<tr >
	<td align="center"><%=sjd%></td>
	<td align="center"><%=gzdwbm%></td>
	<td align="center"><%=drzw%></td>
	<td align="center"><%=dwdh%></td>
	<td align="center"><%=zmr%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();
%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
<%
	String xm=null;
	String gx=null;
	String csnf=null;
	String gzdw=null;
	String zw=null;
	String lxdh=null;


	ls_sql="select count(*) count";
	ls_sql+=" from  rs_jtzl";
	ls_sql+=" where (1=1) and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt("count");
	}
	rs.close();
	ps.close();
%>
<tr >
<td width="10%" rowspan="<%=count+1%>" align="center">家庭资料</td>
<td width="15%" align="center" >亲属姓名</td>
<td width="15%" align="center" >与本人关系</td>
<td width="10%" align="center" >出生年份</td>
<td width="25%" align="center" >工作单位</td>
<td width="10%" align="center" >职务</td>
<td width="15%" align="center" >联系电话</td>
</tr>
<%
	ls_sql="select xm,gx,csnf,gzdw,zw,lxdh";
	ls_sql+=" from  rs_jtzl";
	ls_sql+=" where ygbh="+whereygbh;
	ls_sql+=" order by gx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xm=cf.fillHtml(rs.getString("xm"));
		gx=cf.fillHtml(rs.getString("gx"));
		csnf=cf.fillHtml(rs.getString("csnf"));
		gzdw=cf.fillHtml(rs.getString("gzdw"));
		zw=cf.fillHtml(rs.getString("zw"));
		lxdh=cf.fillHtml(rs.getString("lxdh"));
%>
	<tr >
	<td align="center"><%=xm%></td>
	<td align="center"><%=gx%></td>
	<td align="center"><%=csnf%></td>
	<td align="center"><%=gzdw%></td>
	<td align="center"><%=zw%></td>
	<td align="center"><%=lxdh%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();
%>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
