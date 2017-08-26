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
.STYLE3 {font-family: "仿宋_GB2312"}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 工资（员工序号：<%=ygbh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1">姓名</td>
    <td><%=yhmc%></td>
    <td align="right" class="STYLE1">身份证号</td>
    <td><%=sfzh%></td>
    <td align="right" class="STYLE1">工号</td>
    <td><%=bianhao%></td>
    <td align="right" class="STYLE1">行政职务</td>
    <td><%=xzzwbm%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1"> 手机</td>
    <td><%=dh%> </td>
    <td align="right" class="STYLE1">办公电话</td>
    <td><%=bgdh%> </td>
    <td align="right" class="STYLE1">email</td>
    <td><%=email%></td>
    <td align="right" class="STYLE1">技术职称</td>
    <td><%
  if(zcmc=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc,true);}
%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1"><span class="STYLE3">所属公司</span></td>
    <td><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);%></td>
    <td align="right" class="STYLE1">所属部门</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%></td>
    <td align="right" class="STYLE1">部门小组</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
    <td align="right" class="STYLE1">主要资质证书</td>
    <td><%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs,true);
%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE3">员工状态</td>
    <td><%
	cf.selectToken(out,"M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退",sfzszg,true);
%></td>
    <td align="right" class="STYLE1">入职日期</td>
    <td><%=rzsj%></td>
    <td align="right" class="STYLE1">工作年限</td>
    <td><%=gznx%></td>
    <td align="right" class="STYLE1">出生日期</td>
    <td><%=csrq%></td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="9%" align="right" class="STYLE3">备注</td>
    <td colspan="7"><%=bz%></td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#0000CC">工资</font></b></td>
  </tr>
  <tr > 
    <td width="9%" align="right" class="STYLE1"> 工资类别 </td>
    <td width="13%"><%
	cf.selectToken(out,"1+固定工资&2+浮动工资",gzlb,true);
%> </td>
    <td width="9%" align="right" class="STYLE1">基本工资</td>
    <td width="18%"><%=jbgz%></td>
    <td width="9%" align="right" class="STYLE1">岗位工资</td>
    <td width="13%"><%=gwgz%></td>
    <td width="11%" align="right" class="STYLE1">工龄工资</td>
    <td width="18%"><%=glgz%></td>
  </tr>
  <tr > 
    <td width="9%" align="right" class="STYLE1">交通补贴</td>
    <td width="13%"><%=jtbt%></td>
    <td width="9%" align="right" class="STYLE1">电话补贴</td>
    <td width="18%"><%=dhbt%></td>
    <td width="9%" align="right" class="STYLE1">餐饮补贴</td>
    <td width="13%"><%=cb%></td>
    <td width="11%" align="right" class="STYLE1">其它补贴</td>
    <td width="18%"><%=buzhu%></td>
  </tr>
  <tr > 
    <td width="9%" align="right" class="STYLE1">绩效工资基数</td>
    <td width="13%"><%=khgz%></td>
    <td width="9%" align="right" class="STYLE1">&nbsp;</td>
    <td width="18%">&nbsp;</td>
    <td width="9%" align="right" class="STYLE1">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="11%" align="right" class="STYLE1">&nbsp;</td>
    <td width="18%">&nbsp;</td>
  </tr>
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
