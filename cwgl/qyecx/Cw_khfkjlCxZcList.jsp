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

	String sfcd=null;
	sfcd=request.getParameter("sfcd");
	if (sfcd!=null)
	{
		sfcd=cf.GB2Uni(sfcd);
		if (sfcd.equals("Y"))
		{
			wheresql+=" and  (b.cxbz='Y')";
		}
		else{
			wheresql+=" and  (b.cxbz='N')";
		}
	}

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

	if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";



	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (cw_khfkjl.ddbh='"+ddbh+"')";
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
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_khfkjl.dwbh='"+dwbh+"')";
	}

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
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,b.dwmc dm,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,crm_khxx.ywy,crm_khxx.khjl,crm_khxx.clgw,cw_khfkjl.fkkhxm,cw_khfkjl.fkfwdz,DECODE(zt,'2','家装','3','退单','4','非家装','5','设计') zt,cw_khfkjl.ddbh,cw_khfkjl.gysbh,TO_CHAR(jc_zcdd.zcpclf) zcpclf,TO_CHAR(ROUND(jc_zcdd.zcpclf*jc_zcdd.tcjrbl/100,2)) tcjrje,TO_CHAR(jc_zcdd.tjpclf) tjpclf,TO_CHAR(ROUND(jc_zcdd.tjpclf*jc_zcdd.tjptcjrbl/100,2)) tjptcjrje,TO_CHAR(jc_zcdd.qtf) qtf,TO_CHAR(jc_zcdd.ycf) ycf,jc_zcdd.bz zcbz,cw_khfkjl.fkxh,cw_khfkjl.fkje,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,DECODE(skdd,'1','不需审核','2','需审核'),DECODE(dsksjbz,'N','未审核','Y',' 审核通过','M','审核未通过'),cw_khfkjl.sjbh,cw_khfkjl.skr,cw_khfkjl.sksj,a.dwmc,cw_khfkjl.sjr,cw_khfkjl.sjsj,cw_khfkjl.bz ";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx a,sq_dwxx b,cw_fklxbm b,cw_zffsbm,sq_sgd,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.skdw=a.dwbh(+)";
	ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+)";
	ls_sql+=" and crm_khxx.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;

    ls_sql+=" order by cw_khfkjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_khfkjlCxZcList.jsp","","","");
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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("dm","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("ywy","1");//列参数对象加入Hash表
	spanColHash.put("khjl","1");//列参数对象加入Hash表
	spanColHash.put("clgw","1");//列参数对象加入Hash表
	spanColHash.put("fkkhxm","1");//列参数对象加入Hash表
	spanColHash.put("fkfwdz","1");//列参数对象加入Hash表
	spanColHash.put("zt","1");//列参数对象加入Hash表
	spanColHash.put("ddbh","1");//列参数对象加入Hash表
	spanColHash.put("gysbh","1");//列参数对象加入Hash表
	spanColHash.put("zcpclf","1");//列参数对象加入Hash表
	spanColHash.put("tcjrje","1");//列参数对象加入Hash表
	spanColHash.put("tjpclf","1");//列参数对象加入Hash表
	spanColHash.put("tjptcjrje","1");//列参数对象加入Hash表
	spanColHash.put("qtf","1");//列参数对象加入Hash表
	spanColHash.put("ycf","1");//列参数对象加入Hash表
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
  <B><font size="3">查询主材收款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(420);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="3%">店面</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">客户经理</td>
	<td  width="2%">业务员</td>
	<td  width="2%">店面业务</td>
	<td  width="2%">材料员</td>
	<td  width="2%">付款客户姓名</td>
	<td  width="5%">付款房屋地址</td>
	<td  width="2%">客户类型</td>
	<td  width="2%">订单编号</td>
	<td  width="3%">收款品牌</td>
	<td  width="3%">正常品材料费</td>
	<td  width="3%">正常品提成记入金额</td>
	<td  width="3%">特价品材料费</td>
	<td  width="3%">特价品提成记入金额</td>
	<td  width="3%">安装加工费</td>
	<td  width="3%">远程费</td>
	<td  width="7%">主材订单备注</td>
	<td  width="2%">收款序号</td>
	<td  width="3%">实收款金额</td>
	<td  width="2%">支付方式</td>
	<td  width="3%">转帐款项</td>
	<td  width="3%">转帐品牌</td>

	<td  width="2%">是否需审核</td>
	<td  width="2%">审核标志</td>
	<td  width="2%">收据编号</td>
	<td  width="2%">收款人</td>
	<td  width="3%">收款时间</td>
	<td  width="3%">收款单位</td>
	<td  width="2%">审核人</td>
	<td  width="2%">审核时间</td>
	<td  width="7%">备注</td>
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