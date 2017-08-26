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
	String cw_gdjsjl_fkbz=null;
	String cw_gdjsjl_gdjsjlh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_zjxm=null;
	String fgs=null;


	String jslx=null;
	jslx=request.getParameter("jslx");
	if (jslx!=null)
	{
		if (!(jslx.equals("")))	wheresql+=" and  (cw_gdjsjl.jslx='"+jslx+"')";
	}

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
	cw_gdjsjl_fkbz=request.getParameter("cw_gdjsjl_fkbz");
	if (cw_gdjsjl_fkbz!=null)
	{
		cw_gdjsjl_fkbz=cf.GB2Uni(cw_gdjsjl_fkbz);
		if (!(cw_gdjsjl_fkbz.equals("")))	wheresql+=" and  (cw_gdjsjl.fkbz='"+cw_gdjsjl_fkbz+"')";
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
	ls_sql="SELECT cw_gdjsjl.gdjsjlh,DECODE(cw_gdjsjl.jsjd,'1','结算部结算','2','结算审批','3','财务结算'),DECODE(cw_gdjsjl.jslx,'1','完工结算','2','中期结算'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.hth,crm_khxx.zjxm ,sgdmc, DECODE(cw_gdjsjl.jzbz,'1','家装','2','公装'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khsskze,cw_gdjsjl.sj,cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.clf,cw_gdjsjl.bzclfbl||'%',cw_gdjsjl.kqtk,cw_gdjsjl.gdjskze,cw_gdjsjl.sqgz,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.khbh,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+)";
    ls_sql+=" and (cw_gdjsjl.jsjd='1' or (cw_gdjsjl.jsjd='2' and cw_gdjsjl.spjl='4'))";//1：结算；2：结算审批；3：财务结算//3：通过；4：未通过
    ls_sql+=wheresql;
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_gdjsjlWgList.jsp","SelectWgCw_gdjsjl.jsp","","EditWgCw_gdjsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cw_gdjsjl_khbh","cw_gdjsjl_sgd","cw_gdjsjl_jzbz","cw_gdjsjl_wdzgce","cw_gdjsjl_qye","cw_gdjsjl_zkl","cw_gdjsjl_zjxje","cw_gdjsjl_khjskze","cw_gdjsjl_khsskze","cw_gdjsjl_sjcb","cw_gdjsjl_sj","cw_gdjsjl_tdjs","cw_gdjsjl_glftd","cw_gdjsjl_glf","cw_gdjsjl_wxj","cw_gdjsjl_clf","cw_gdjsjl_zgclf","cw_gdjsjl_jkje","cw_gdjsjl_fakuan","cw_gdjsjl_kwxf","cw_gdjsjl_gckk","cw_gdjsjl_ksdf","cw_gdjsjl_kqtk","cw_gdjsjl_bk","cw_gdjsjl_gdjskze","cw_gdjsjl_jsr","cw_gdjsjl_jssj","cw_gdjsjl_jsdw","cw_gdjsjl_jsjd","cw_gdjsjl_fkbz","cw_gdjsjl_bz","gdjsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gdjsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"删除结算信息"};//按钮的显示名称
	String[] buttonLink={"DeleteWgCw_gdjsjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
  <B><font size="3">修改完工结算</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">结算记录号</td>
	<td  width="3%">结算进度</td>
	<td  width="3%">结算类型</td>
	<td  width="2%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="3%">合同号</td>
	<td  width="2%">质检</td>
	<td  width="2%">施工队</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">工程原报价</td>
	<td  width="4%">工程签约额</td>
	<td  width="2%">折扣率</td>
	<td  width="3%">增减项金额</td>
	<td  width="3%">家装实收款</td>
	<td  width="3%">税金</td>
	<td  width="2%">管理费提点</td>
	<td  width="3%">管理费</td>
	<td  width="3%">扣质保金</td>
	<td  width="3%">材料费</td>
	<td  width="3%">材料费比率</td>
	<td  width="3%">扣其它款</td>
	<td  width="3%">应付工费</td>
	<td  width="3%">应拨工费</td>
	<td  width="2%">结算人</td>
	<td  width="3%">结算时间</td>
	<td  width="5%">结算单位</td>
	<td  width="3%">客户编号</td>
	<td  width="11%">备注</td>
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