<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

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
	String sjr=null;
	String cw_khfkjl_skr=null;
	String cw_khfkjl_sksj=null;
	String cw_khfkjl_lrdw=null;
	String cw_khfkjl_lrr=null;
	String cw_khfkjl_lrsj=null;
	String zffs=null;
	String zckx=null;
	String skdd=null;
	String dsksjbz=null;
	String skdw=null;

	String fkkhxm=null;
	fkkhxm=request.getParameter("fkkhxm");
	if (fkkhxm!=null)
	{
		fkkhxm=cf.GB2Uni(fkkhxm);
		if (!(fkkhxm.equals("")))	wheresql+=" and  (cw_khfkjl.fkkhxm like '%"+fkkhxm+"%')";
	}

	String fkfwdz=null;
	fkfwdz=request.getParameter("fkfwdz");
	if (fkfwdz!=null)
	{
		fkfwdz=cf.GB2Uni(fkfwdz);
		if (!(fkfwdz.equals("")))	wheresql+=" and  (cw_khfkjl.fkfwdz like '%"+fkfwdz+"%')";
	}
	
	String crm_khxx_hth=cf.GB2Uni(request.getParameter("crm_khxx_hth"));
	String crm_khxx_khxm=cf.GB2Uni(request.getParameter("crm_khxx_khxm"));
	String crm_khxx_fwdz=cf.GB2Uni(request.getParameter("crm_khxx_fwdz"));

	String crm_zxkhxx_zxzt=null;
	crm_zxkhxx_zxzt=request.getParameter("crm_zxkhxx_zxzt");
	if (crm_zxkhxx_zxzt!=null)
	{
		crm_zxkhxx_zxzt=cf.GB2Uni(crm_zxkhxx_zxzt);
		if (!(crm_zxkhxx_zxzt.equals("")))	wheresql+=" and  (crm_zxkhxx.zxzt='"+crm_zxkhxx_zxzt+"')";
	}
	String yzxxbz=null;
	yzxxbz=request.getParameter("yzxxbz");
	if (yzxxbz!=null)
	{
		if (!(yzxxbz.equals("")))	wheresql+=" and  (crm_zxkhxx.yzxxbz='"+yzxxbz+"')";
	}

	String sjsj=null;
	sjsj=request.getParameter("sjsj");
	if (sjsj!=null)
	{
		sjsj=sjsj.trim();
		if (!(sjsj.equals("")))	wheresql+="  and (cw_khfkjl.sjsj>=TO_DATE('"+sjsj+"','YYYY/MM/DD'))";
	}
	sjsj=request.getParameter("sjsj2");
	if (sjsj!=null)
	{
		sjsj=sjsj.trim();
		if (!(sjsj.equals("")))	wheresql+="  and (cw_khfkjl.sjsj<=TO_DATE('"+sjsj+"','YYYY/MM/DD'))";
	}

	if (!(crm_khxx_hth.equals("")))
	{
		wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	else{
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_khxx_khxm+"')";
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}



	String gysbh=null;
	gysbh=request.getParameter("gysbh");
	if (gysbh!=null)
	{
		gysbh=cf.GB2Uni(gysbh);
		if (!(gysbh.equals("")))	wheresql+=" and  (cw_khfkjl.gysbh='"+gysbh+"')";
	}


	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_khfkjl.scbz='"+scbz+"')";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_khfkjl.fgsbh='"+fgs+"')";
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (cw_khfkjl.dwbh='"+dwbh+"')";

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
	sjr=request.getParameter("sjr");
	if (sjr!=null)
	{
		sjr=cf.GB2Uni(sjr);
		if (!(sjr.equals("")))	wheresql+=" and  (cw_khfkjl.sjr='"+sjr+"')";
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
	skdw=request.getParameter("skdw");
	if (skdw!=null)
	{
		skdw=cf.GB2Uni(skdw);
		if (!(skdw.equals("")))	wheresql+=" and  (cw_khfkjl.skdw='"+skdw+"')";
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
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj>=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_lrsj=request.getParameter("cw_khfkjl_lrsj2");
	if (cw_khfkjl_lrsj!=null)
	{
		cw_khfkjl_lrsj=cw_khfkjl_lrsj.trim();
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj<=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
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
	dsksjbz=request.getParameter("dsksjbz");
	if (dsksjbz!=null)
	{
		dsksjbz=cf.GB2Uni(dsksjbz);
		if (!(dsksjbz.equals("")))	wheresql+=" and  (cw_khfkjl.dsksjbz='"+dsksjbz+"')";
	}

	String pxzd=request.getParameter("pxzd");
	String myxssl=request.getParameter("myxssl");
 

	if (!(crm_khxx_hth.equals("")))
	{
		ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cw_khfkjl.fkkhxm,cw_khfkjl.fkfwdz,DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') zt,a.fklxmc fklxbm,cw_khfkjl.fkxh,fkcsmc,cw_khfkjl.gysbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,NVL2(cw_khfkjl.yfkbl,cw_khfkjl.yfkbl||'%',''),cw_khfkjl.yfkje,DECODE(skdd,'1','不需审核','2','需审核'),DECODE(dsksjbz,'N','未审核','Y',' 审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','未删除','Y','删除'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','非关联','Y','关联'),cw_khfkjl.glxh,cw_khfkjl.shyj,cw_khfkjl.bz  ";
		ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
		ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=wheresql;
	}
	else{
		ls_sql=" SELECT crm_zxkhxx.hth,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,cw_khfkjl.fkkhxm,cw_khfkjl.fkfwdz,DECODE(zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zt,a.fklxmc fklxbm,cw_khfkjl.fkxh,fkcsmc,cw_khfkjl.gysbh,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,NVL2(cw_khfkjl.yfkbl,cw_khfkjl.yfkbl||'%',''),cw_khfkjl.yfkje,DECODE(skdd,'1','不需审核','2','需审核'),DECODE(dsksjbz,'N','未审核','Y',' 审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,DECODE(scbz,'N','未删除','Y','删除'),scr,scsj,DECODE(cw_khfkjl.gljlbz,'N','非关联','Y','关联'),cw_khfkjl.glxh,cw_khfkjl.shyj,cw_khfkjl.bz  ";
		ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
		ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh(+) and cw_khfkjl.fklxbm=a.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=wheresql;
	}
    ls_sql+=" order by "+pxzd+",fklxbm,fkxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_khfkjlSksjList.jsp","","","EditCw_khfkjl.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","cw_khfkjl_fklx","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_lrdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
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
	String[] coluKey1={"fkxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/qyecx/ViewKhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">修改收款时间</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="2%">付款客户姓名</td>
	<td  width="7%">付款房屋地址</td>
	<td  width="2%">客户类型</td>
	<td  width="3%">收款类型</td>
	<td  width="3%">收款序号</td>
	<td  width="2%">收款期数</td>
	<td  width="4%">收款品牌</td>
	<td  width="4%">实收款金额</td>
	<td  width="2%">支付方式</td>
	<td  width="3%">转帐款项</td>
	<td  width="3%">转帐品牌</td>
	<td  width="2%">应收款率</td>
	<td  width="4%">应收款金额</td>
	<td  width="3%">是否需审核</td>
	<td  width="3%">审核标志</td>
	<td  width="5%">收据编号</td>
	<td  width="2%">收款人</td>
	<td  width="3%">收款时间</td>
	<td  width="4%">收款单位</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="2%">删除标志</td>
	<td  width="2%">删除人</td>
	<td  width="3%">删除时间</td>
	<td  width="2%">关联记录标志</td>
	<td  width="2%">关联序号</td>
	<td  width="4%">审核意见</td>
	<td  width="11%">备注</td>
</tr>
<%
	pageObj.printDateSum();
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