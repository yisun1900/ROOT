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
	String cw_gdjsjl_khbh=null;
	String cw_gdjsjl_sgd=null;
	String cw_gdjsjl_jzbz=null;
	String cw_gdjsjl_zkl=null;
	String cw_gdjsjl_tdjs=null;
	String cw_gdjsjl_glftd=null;
	String cw_gdjsjl_jsr=null;
	String cw_gdjsjl_jssj=null;
	String cw_gdjsjl_jsdw=null;
	String cw_gdjsjl_jsjd=null;
	String cw_gdjsjl_gdjsjlh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_zjxm=null;
	String cw_gdjsjl_spjl=null;
	String cw_gdjsjl_spr=null;
	String cw_gdjsjl_spsj=null;
	String cw_gdjsjl_cwjsr=null;
	String cw_gdjsjl_cwjssj=null;
	String crm_khxx_qyrq=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	cw_gdjsjl_khbh=request.getParameter("cw_gdjsjl_khbh");
	if (cw_gdjsjl_khbh!=null)
	{
		cw_gdjsjl_khbh=cf.GB2Uni(cw_gdjsjl_khbh);
		if (!(cw_gdjsjl_khbh.equals("")))	wheresql+=" and  (cw_gdjsjl.khbh='"+cw_gdjsjl_khbh+"')";
	}
	cw_gdjsjl_sgd=request.getParameter("cw_gdjsjl_sgd");
	if (cw_gdjsjl_sgd!=null)
	{
		cw_gdjsjl_sgd=cf.GB2Uni(cw_gdjsjl_sgd);
		if (!(cw_gdjsjl_sgd.equals("")))	wheresql+=" and  (cw_gdjsjl.sgd='"+cw_gdjsjl_sgd+"')";
	}
	cw_gdjsjl_jzbz=request.getParameter("cw_gdjsjl_jzbz");
	if (cw_gdjsjl_jzbz!=null)
	{
		cw_gdjsjl_jzbz=cf.GB2Uni(cw_gdjsjl_jzbz);
		if (!(cw_gdjsjl_jzbz.equals("")))	wheresql+=" and  (cw_gdjsjl.jzbz='"+cw_gdjsjl_jzbz+"')";
	}
	cw_gdjsjl_zkl=request.getParameter("cw_gdjsjl_zkl");
	if (cw_gdjsjl_zkl!=null)
	{
		cw_gdjsjl_zkl=cw_gdjsjl_zkl.trim();
		if (!(cw_gdjsjl_zkl.equals("")))	wheresql+=" and  (cw_gdjsjl.zkl="+cw_gdjsjl_zkl+") ";
	}
	cw_gdjsjl_tdjs=request.getParameter("cw_gdjsjl_tdjs");
	if (cw_gdjsjl_tdjs!=null)
	{
		cw_gdjsjl_tdjs=cf.GB2Uni(cw_gdjsjl_tdjs);
		if (!(cw_gdjsjl_tdjs.equals("")))	wheresql+=" and  (cw_gdjsjl.tdjs='"+cw_gdjsjl_tdjs+"')";
	}
	cw_gdjsjl_glftd=request.getParameter("cw_gdjsjl_glftd");
	if (cw_gdjsjl_glftd!=null)
	{
		cw_gdjsjl_glftd=cw_gdjsjl_glftd.trim();
		if (!(cw_gdjsjl_glftd.equals("")))	wheresql+=" and  (cw_gdjsjl.glftd="+cw_gdjsjl_glftd+") ";
	}
	cw_gdjsjl_jsr=request.getParameter("cw_gdjsjl_jsr");
	if (cw_gdjsjl_jsr!=null)
	{
		cw_gdjsjl_jsr=cf.GB2Uni(cw_gdjsjl_jsr);
		if (!(cw_gdjsjl_jsr.equals("")))	wheresql+=" and  (cw_gdjsjl.jsr='"+cw_gdjsjl_jsr+"')";
	}
	cw_gdjsjl_jssj=request.getParameter("cw_gdjsjl_jssj");
	if (cw_gdjsjl_jssj!=null)
	{
		cw_gdjsjl_jssj=cw_gdjsjl_jssj.trim();
		if (!(cw_gdjsjl_jssj.equals("")))	wheresql+="  and (cw_gdjsjl.jssj>=TO_DATE('"+cw_gdjsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_jssj=request.getParameter("cw_gdjsjl_jssj2");
	if (cw_gdjsjl_jssj!=null)
	{
		cw_gdjsjl_jssj=cw_gdjsjl_jssj.trim();
		if (!(cw_gdjsjl_jssj.equals("")))	wheresql+="  and (cw_gdjsjl.jssj<=TO_DATE('"+cw_gdjsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_jsdw=request.getParameter("cw_gdjsjl_jsdw");
	if (cw_gdjsjl_jsdw!=null)
	{
		cw_gdjsjl_jsdw=cf.GB2Uni(cw_gdjsjl_jsdw);
		if (!(cw_gdjsjl_jsdw.equals("")))	wheresql+=" and  (cw_gdjsjl.jsdw='"+cw_gdjsjl_jsdw+"')";
	}
	cw_gdjsjl_jsjd=request.getParameter("cw_gdjsjl_jsjd");
	if (cw_gdjsjl_jsjd!=null)
	{
		cw_gdjsjl_jsjd=cf.GB2Uni(cw_gdjsjl_jsjd);
		if (!(cw_gdjsjl_jsjd.equals("")))	wheresql+=" and  (cw_gdjsjl.jsjd='"+cw_gdjsjl_jsjd+"')";
	}
	cw_gdjsjl_gdjsjlh=request.getParameter("cw_gdjsjl_gdjsjlh");
	if (cw_gdjsjl_gdjsjlh!=null)
	{
		cw_gdjsjl_gdjsjlh=cf.GB2Uni(cw_gdjsjl_gdjsjlh);
		if (!(cw_gdjsjl_gdjsjlh.equals("")))	wheresql+=" and  (cw_gdjsjl.gdjsjlh='"+cw_gdjsjl_gdjsjlh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_gdjsjl_spjl=request.getParameter("cw_gdjsjl_spjl");
	if (cw_gdjsjl_spjl!=null)
	{
		cw_gdjsjl_spjl=cf.GB2Uni(cw_gdjsjl_spjl);
		if (!(cw_gdjsjl_spjl.equals("")))	wheresql+=" and  (cw_gdjsjl.spjl='"+cw_gdjsjl_spjl+"')";
	}
	cw_gdjsjl_spr=request.getParameter("cw_gdjsjl_spr");
	if (cw_gdjsjl_spr!=null)
	{
		cw_gdjsjl_spr=cf.GB2Uni(cw_gdjsjl_spr);
		if (!(cw_gdjsjl_spr.equals("")))	wheresql+=" and  (cw_gdjsjl.spr='"+cw_gdjsjl_spr+"')";
	}
	cw_gdjsjl_spsj=request.getParameter("cw_gdjsjl_spsj");
	if (cw_gdjsjl_spsj!=null)
	{
		cw_gdjsjl_spsj=cw_gdjsjl_spsj.trim();
		if (!(cw_gdjsjl_spsj.equals("")))	wheresql+="  and (cw_gdjsjl.spsj>=TO_DATE('"+cw_gdjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_spsj=request.getParameter("cw_gdjsjl_spsj2");
	if (cw_gdjsjl_spsj!=null)
	{
		cw_gdjsjl_spsj=cw_gdjsjl_spsj.trim();
		if (!(cw_gdjsjl_spsj.equals("")))	wheresql+="  and (cw_gdjsjl.spsj<=TO_DATE('"+cw_gdjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_cwjsr=request.getParameter("cw_gdjsjl_cwjsr");
	if (cw_gdjsjl_cwjsr!=null)
	{
		cw_gdjsjl_cwjsr=cf.GB2Uni(cw_gdjsjl_cwjsr);
		if (!(cw_gdjsjl_cwjsr.equals("")))	wheresql+=" and  (cw_gdjsjl.cwjsr='"+cw_gdjsjl_cwjsr+"')";
	}
	cw_gdjsjl_cwjssj=request.getParameter("cw_gdjsjl_cwjssj");
	if (cw_gdjsjl_cwjssj!=null)
	{
		cw_gdjsjl_cwjssj=cw_gdjsjl_cwjssj.trim();
		if (!(cw_gdjsjl_cwjssj.equals("")))	wheresql+="  and (cw_gdjsjl.cwjssj>=TO_DATE('"+cw_gdjsjl_cwjssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_cwjssj=request.getParameter("cw_gdjsjl_cwjssj2");
	if (cw_gdjsjl_cwjssj!=null)
	{
		cw_gdjsjl_cwjssj=cw_gdjsjl_cwjssj.trim();
		if (!(cw_gdjsjl_cwjssj.equals("")))	wheresql+="  and (cw_gdjsjl.cwjssj<=TO_DATE('"+cw_gdjsjl_cwjssj+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT cw_gdjsjl.gdjsjlh, DECODE(cw_gdjsjl.jsjd,'1','结算部结算','2','结算审批','3','财务结算'), DECODE(cw_gdjsjl.spjl,'3','通过','4','未通过'),crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,crm_khxx.zjxm, DECODE(cw_gdjsjl.jzbz,'1','家装','2','公装'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze,cw_gdjsjl.sjcb,cw_gdjsjl.gckk,cw_gdjsjl.sjsfy,cw_gdjsjl.sgdfy,cw_gdjsjl.zjfy,cw_gdjsjl.gsfy,cw_gdjsjl.qtfy, DECODE(cw_gdjsjl.tdjs,'1','客户结算金额','2','实收款','3','签约额','4','实际成本','9','其它'),cw_gdjsjl.tdjsje,cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.bk,cw_gdjsjl.sj,cw_gdjsjl.clf,cw_gdjsjl.zgclf,cw_gdjsjl.jkje,cw_gdjsjl.fakuan,cw_gdjsjl.kwxf,cw_gdjsjl.ksdf,cw_gdjsjl.kqtk,cw_gdjsjl.gdjskze,cw_gdjsjl.sqgz,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.bz,cw_gdjsjl.spyj,cw_gdjsjl.spr,cw_gdjsjl.spsj,cw_gdjsjl.cwjsr,cw_gdjsjl.cwjssj,cw_gdjsjl.cwjssm,cw_gdjsjl.khbh  ";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_gdjsjlCxList.jsp","SelectCxCw_gdjsjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cw_gdjsjl_khbh","cw_gdjsjl_sgd","cw_gdjsjl_jzbz","cw_gdjsjl_wdzgce","cw_gdjsjl_qye","cw_gdjsjl_zkl","cw_gdjsjl_zjxje","cw_gdjsjl_khjskze","cw_gdjsjl_khsskze","cw_gdjsjl_sjcb","cw_gdjsjl_sj","cw_gdjsjl_tdjs","cw_gdjsjl_glftd","cw_gdjsjl_glf","cw_gdjsjl_wxj","cw_gdjsjl_clf","cw_gdjsjl_zgclf","cw_gdjsjl_jkje","cw_gdjsjl_fakuan","cw_gdjsjl_kwxf","cw_gdjsjl_gckk","cw_gdjsjl_ksdf","cw_gdjsjl_kqtk","cw_gdjsjl_bk","cw_gdjsjl_gdjskze","cw_gdjsjl_jsr","cw_gdjsjl_jssj","cw_gdjsjl_jsdw","cw_gdjsjl_jsjd","cw_gdjsjl_bz","gdjsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_zjxm","cw_gdjsjl_spjl","cw_gdjsjl_spyj","cw_gdjsjl_spr","cw_gdjsjl_spsj","cw_gdjsjl_hbssk","cw_gdjsjl_tdjsje","cw_gdjsjl_cwjsr","cw_gdjsjl_cwjssj","cw_gdjsjl_cwjssm","cw_gdjsjl_sqgz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gdjsjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gdjsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_gdjsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gdjsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">结算记录号</td>
	<td  width="2%">结算进度</td>
	<td  width="1%">审批结论</td>
	<td  width="1%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="4%">房屋地址</td>
	<td  width="1%">施工队</td>
	<td  width="1%">设计师</td>
	<td  width="1%">质检</td>
	<td  width="1%">家装标志</td>
	<td  width="2%">未打折工程额</td>
	<td  width="2%">工程签约额</td>
	<td  width="1%">折扣率</td>
	<td  width="2%">增减项金额</td>
	<td  width="2%">客户结算金额</td>
	<td  width="2%">工程实收款总额</td>
	<td  width="2%">实际成本</td>
	<td  width="2%">工程扣款</td>
	<td  width="2%">设计师承担扣款</td>
	<td  width="2%">施工队承担扣款</td>
	<td  width="1%">质检承担扣款</td>
	<td  width="1%">公司承担扣款</td>
	<td  width="2%">其它方承担扣款</td>
	<td  width="2%">提点基数</td>
	<td  width="2%">提点基数金额</td>
	<td  width="1%">管理费提点</td>
	<td  width="2%">管理费</td>
	<td  width="2%">维修金</td>
	<td  width="2%">补款</td>
	<td  width="2%">税金</td>
	<td  width="2%">物流材料费</td>
	<td  width="2%">自购材料费</td>
	<td  width="2%">借款金额</td>
	<td  width="2%">罚款金额</td>
	<td  width="2%">扣维修费</td>
	<td  width="2%">扣水电费</td>
	<td  width="2%">扣其它款</td>
	<td  width="2%">工队结算款总额</td>
	<td  width="2%">税前工资</td>
	<td  width="1%">结算部结算人</td>
	<td  width="2%">结算部结算时间</td>
	<td  width="2%">结算单位</td>
	<td  width="4%">备注</td>
	<td  width="4%">审批意见</td>
	<td  width="1%">审批人</td>
	<td  width="2%">审批时间</td>
	<td  width="1%">财务结算人</td>
	<td  width="2%">财务结算时间</td>
	<td  width="4%">财务结算说明</td>
	<td  width="1%">客户编号</td>
</tr>
<%
	pageObj.displayDate();
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