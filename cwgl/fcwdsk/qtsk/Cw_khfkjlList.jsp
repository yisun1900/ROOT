<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_khfkjl_khbh=null;
	String cw_khfkjl_fkxh=null;
	String cw_khfkjl_sjbh=null;
	String cw_khfkjl_jsjlh=null;
	String fklxbm=null;
	String cw_khfkjl_fkje=null;
	String cw_khfkjl_jkr=null;
	String cw_khfkjl_skr=null;
	String cw_khfkjl_sksj=null;
	String cw_khfkjl_lrdw=null;
	String cw_khfkjl_lrr=null;
	String cw_khfkjl_lrsj=null;
	String zffs=null;
	String zckx=null;
	String skdd=null;

	String crm_khxx_hth=cf.GB2Uni(request.getParameter("crm_khxx_hth"));

	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String khxm2=cf.GB2Uni(request.getParameter("khxm2"));
	String fwdz=cf.GB2Uni(request.getParameter("fwdz"));
	String fwdz2=cf.GB2Uni(request.getParameter("fwdz2"));
	String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
	String lxfs2=cf.GB2Uni(request.getParameter("lxfs2"));

	String zt=cf.GB2Uni(request.getParameter("zt"));

	if (zt.equals("1"))
	{
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";

		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";

		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}
	else{
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+crm_khxx_hth+"')";

		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";

		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}

	String dsksjbz=null;
	dsksjbz=request.getParameter("dsksjbz");
	if (dsksjbz!=null)
	{
		dsksjbz=cf.GB2Uni(dsksjbz);
		if (!(dsksjbz.equals("")))	wheresql+=" and  (cw_khfkjl.dsksjbz='"+dsksjbz+"')";
	}

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_khfkjl.scbz='"+scbz+"')";

	String czlx=null;
	czlx=request.getParameter("czlx");
	if (!(czlx.equals("")))	wheresql+=" and  (cw_khfkjl.czlx='"+czlx+"')";

	cw_khfkjl_khbh=request.getParameter("cw_khfkjl_khbh");
	if (cw_khfkjl_khbh!=null)
	{
		cw_khfkjl_khbh=cf.GB2Uni(cw_khfkjl_khbh);
		if (!(cw_khfkjl_khbh.equals("")))	wheresql+=" and  (cw_khfkjl.khbh='"+cw_khfkjl_khbh+"')";
	}
	cw_khfkjl_fkxh=request.getParameter("cw_khfkjl_fkxh");
	if (cw_khfkjl_fkxh!=null)
	{
		cw_khfkjl_fkxh=cw_khfkjl_fkxh.trim();
		if (!(cw_khfkjl_fkxh.equals("")))	wheresql+=" and (cw_khfkjl.fkxh='"+cw_khfkjl_fkxh+"') ";
	}
	cw_khfkjl_sjbh=request.getParameter("cw_khfkjl_sjbh");
	if (cw_khfkjl_sjbh!=null)
	{
		cw_khfkjl_sjbh=cf.GB2Uni(cw_khfkjl_sjbh);
		if (!(cw_khfkjl_sjbh.equals("")))	wheresql+=" and  (cw_khfkjl.sjbh='"+cw_khfkjl_sjbh+"')";
	}
	cw_khfkjl_jsjlh=request.getParameter("cw_khfkjl_jsjlh");
	if (cw_khfkjl_jsjlh!=null)
	{
		cw_khfkjl_jsjlh=cf.GB2Uni(cw_khfkjl_jsjlh);
		if (!(cw_khfkjl_jsjlh.equals("")))	wheresql+=" and  (cw_khfkjl.jsjlh='"+cw_khfkjl_jsjlh+"')";
	}
	fklxbm=request.getParameter("fklxbm");
	if (fklxbm!=null)
	{
		fklxbm=cf.GB2Uni(fklxbm);
		if (!(fklxbm.equals("")))	wheresql+=" and  (cw_khfkjl.fklxbm='"+fklxbm+"')";
	}
	cw_khfkjl_fkje=request.getParameter("cw_khfkjl_fkje");
	if (cw_khfkjl_fkje!=null)
	{
		cw_khfkjl_fkje=cw_khfkjl_fkje.trim();
		if (!(cw_khfkjl_fkje.equals("")))	wheresql+=" and  (cw_khfkjl.fkje="+cw_khfkjl_fkje+") ";
	}
	cw_khfkjl_jkr=request.getParameter("cw_khfkjl_jkr");
	if (cw_khfkjl_jkr!=null)
	{
		cw_khfkjl_jkr=cf.GB2Uni(cw_khfkjl_jkr);
		if (!(cw_khfkjl_jkr.equals("")))	wheresql+=" and  (cw_khfkjl.jkr='"+cw_khfkjl_jkr+"')";
	}
	cw_khfkjl_skr=request.getParameter("cw_khfkjl_skr");
	if (cw_khfkjl_skr!=null)
	{
		cw_khfkjl_skr=cf.GB2Uni(cw_khfkjl_skr);
		if (!(cw_khfkjl_skr.equals("")))	wheresql+=" and  (cw_khfkjl.skr='"+cw_khfkjl_skr+"')";
	}
	cw_khfkjl_sksj=request.getParameter("cw_khfkjl_sksj");
	if (cw_khfkjl_sksj!=null)
	{
		cw_khfkjl_sksj=cw_khfkjl_sksj.trim();
		if (!(cw_khfkjl_sksj.equals("")))	wheresql+="  and (cw_khfkjl.sksj>=TO_DATE('"+cw_khfkjl_sksj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_sksj=request.getParameter("cw_khfkjl_sksj2");
	if (cw_khfkjl_sksj!=null)
	{
		cw_khfkjl_sksj=cw_khfkjl_sksj.trim();
		if (!(cw_khfkjl_sksj.equals("")))	wheresql+="  and (cw_khfkjl.sksj<=TO_DATE('"+cw_khfkjl_sksj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_lrdw=request.getParameter("cw_khfkjl_lrdw");
	if (cw_khfkjl_lrdw!=null)
	{
		cw_khfkjl_lrdw=cf.GB2Uni(cw_khfkjl_lrdw);
		if (!(cw_khfkjl_lrdw.equals("")))	wheresql+=" and  (cw_khfkjl.lrdw='"+cw_khfkjl_lrdw+"')";
	}
	cw_khfkjl_lrr=request.getParameter("cw_khfkjl_lrr");
	if (cw_khfkjl_lrr!=null)
	{
		cw_khfkjl_lrr=cf.GB2Uni(cw_khfkjl_lrr);
		if (!(cw_khfkjl_lrr.equals("")))	wheresql+=" and  (cw_khfkjl.lrr='"+cw_khfkjl_lrr+"')";
	}
	cw_khfkjl_lrsj=request.getParameter("cw_khfkjl_lrsj");
	if (cw_khfkjl_lrsj!=null)
	{
		cw_khfkjl_lrsj=cw_khfkjl_lrsj.trim();
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	zffs=request.getParameter("zffs");
	if (zffs!=null)
	{
		zffs=cf.GB2Uni(zffs);
		if (!(zffs.equals("")))	wheresql+=" and  (cw_khfkjl.zffs='"+zffs+"')";
	}
	zckx=request.getParameter("zckx");
	if (zckx!=null)
	{
		zckx=cf.GB2Uni(zckx);
		if (!(zckx.equals("")))	wheresql+=" and  (cw_khfkjl.zckx='"+zckx+"')";
	}
	skdd=request.getParameter("skdd");
	if (skdd!=null)
	{
		skdd=cf.GB2Uni(skdd);
		if (!(skdd.equals("")))	wheresql+=" and  (cw_khfkjl.skdd='"+skdd+"')";
	}


	if (zt.equals("1"))
	{
		ls_sql="SELECT fkxh,DECODE(cw_khfkjl.dsksjbz,'N','未审核','Y','审核通过','M','审核未通过'),crm_khxx.khxm,a.fklxmc fklxbm,cw_khfkjl.fkje,cw_khfkjl.sjbh,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.khbh,DECODE(crm_khxx.zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') khlx,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.sjr,cw_khfkjl.sjsj,dwmc,cw_khfkjl.shyj,cw_khfkjl.bz  ";
		ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm  ";
		ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and a.fkdl not in('1','2')";
		ls_sql+=" and cw_khfkjl.gljlbz='N'";//N：非关联记录；Y：关联记录
		ls_sql+=" and cw_khfkjl.dsksjbz in('N','M')";//N: 未审核；Y: 审核通过；M:审核未通过
		ls_sql+=wheresql;
		ls_sql+=" order by cw_khfkjl.lrsj desc,cw_khfkjl.fkxh";
	}
	else{
		ls_sql=" SELECT cw_khfkjl.fkxh,DECODE(cw_khfkjl.dsksjbz,'N','未审核','Y','审核通过','M','审核未通过'),crm_zxkhxx.khxm,a.fklxmc fklxbm,cw_khfkjl.fkje,cw_khfkjl.sjbh,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,hth,crm_zxkhxx.fwdz,crm_zxkhxx.khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') khlx,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.sjr,cw_khfkjl.sjsj,dwmc,cw_khfkjl.shyj,cw_khfkjl.bz  ";
		ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm  ";
		ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and a.fkdl not in('1','2') ";
		ls_sql+=" and cw_khfkjl.gljlbz='N'";//N：非关联记录；Y：关联记录
		ls_sql+=" and cw_khfkjl.dsksjbz in('N','M')";//N: 未审核；Y: 审核通过；M:审核未通过
		ls_sql+=wheresql;
		ls_sql+=" order by cw_khfkjl.lrsj desc,cw_khfkjl.fkxh";
	}
	
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_khfkjlList.jsp","","","EditCw_khfkjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","fklxbm","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_skdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_khfkjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"fkxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fkxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khlx","1");//列参数对象加入Hash表
	spanColHash.put("fklxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">其它收款－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">收款序号</td>
	<td  width="3%">审核标志</td>
	<td  width="3%">姓名</td>
	<td  width="4%">收款类型</td>
	<td  width="4%">收款金额</td>
	<td  width="4%">收据编号</td>
	<td  width="3%">支付方式</td>
	<td  width="4%">转帐款项</td>
	<td  width="4%">转帐品牌</td>
	<td  width="4%">转帐订单编号</td>
	<td  width="4%">转帐增减项编号</td>
	<td  width="3%">合同号</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户类型</td>
	<td  width="3%">收款人</td>
	<td  width="4%">收款时间</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="5%">收款单位</td>
	<td  width="10%">审核意见</td>
	<td  width="9%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>