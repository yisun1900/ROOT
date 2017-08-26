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
	String crm_gcfxysjl_ysjlh=null;
	String crm_gcfxysjl_khbh=null;
	String crm_gcfxysjl_gcyszxmbm=null;
	String crm_gcfxysjl_ysxmflbm=null;
	String crm_gcfxysjl_yssj=null;
	String crm_gcfxysjl_ysr=null;
	String crm_gcfxysjl_lrr=null;
	String crm_gcfxysjl_lrsj=null;
	String crm_gcfxysjl_lrbm=null;

	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	
	String sfkhbrqz=null;
	sfkhbrqz=request.getParameter("sfkhbrqz");
	if (sfkhbrqz!=null)
	{
		sfkhbrqz=cf.GB2Uni(sfkhbrqz);
		if (!(sfkhbrqz.equals("")))	wheresql+=" and  (crm_gcfxysjl.sfkhbrqz='"+sfkhbrqz+"')";
	}
	String dqzysq=null;
	dqzysq=request.getParameter("dqzysq");
	if (dqzysq!=null)
	{
		dqzysq=cf.GB2Uni(dqzysq);
		if (!(dqzysq.equals("")))	wheresql+=" and  (crm_gcfxysjl.dqzysq='"+dqzysq+"')";
	}
	
	crm_gcfxysjl_ysjlh=request.getParameter("crm_gcfxysjl_ysjlh");
	if (crm_gcfxysjl_ysjlh!=null)
	{
		crm_gcfxysjl_ysjlh=cf.GB2Uni(crm_gcfxysjl_ysjlh);
		if (!(crm_gcfxysjl_ysjlh.equals("")))	wheresql+=" and  (crm_gcfxysjl.ysjlh='"+crm_gcfxysjl_ysjlh+"')";
	}
	crm_gcfxysjl_khbh=request.getParameter("crm_gcfxysjl_khbh");
	if (crm_gcfxysjl_khbh!=null)
	{
		crm_gcfxysjl_khbh=cf.GB2Uni(crm_gcfxysjl_khbh);
		if (!(crm_gcfxysjl_khbh.equals("")))	wheresql+=" and  (crm_gcfxysjl.khbh='"+crm_gcfxysjl_khbh+"')";
	}
	crm_gcfxysjl_gcyszxmbm=request.getParameter("crm_gcfxysjl_gcyszxmbm");
	if (crm_gcfxysjl_gcyszxmbm!=null)
	{
		crm_gcfxysjl_gcyszxmbm=cf.GB2Uni(crm_gcfxysjl_gcyszxmbm);
		if (!(crm_gcfxysjl_gcyszxmbm.equals("")))	wheresql+=" and  (crm_gcfxysjl.gcyszxmbm='"+crm_gcfxysjl_gcyszxmbm+"')";
	}
	crm_gcfxysjl_ysxmflbm=request.getParameter("crm_gcfxysjl_ysxmflbm");
	if (crm_gcfxysjl_ysxmflbm!=null)
	{
		crm_gcfxysjl_ysxmflbm=cf.GB2Uni(crm_gcfxysjl_ysxmflbm);
		if (!(crm_gcfxysjl_ysxmflbm.equals("")))	wheresql+=" and  (crm_gcfxysjl.ysxmflbm='"+crm_gcfxysjl_ysxmflbm+"')";
	}
	crm_gcfxysjl_yssj=request.getParameter("crm_gcfxysjl_yssj");
	if (crm_gcfxysjl_yssj!=null)
	{
		crm_gcfxysjl_yssj=crm_gcfxysjl_yssj.trim();
		if (!(crm_gcfxysjl_yssj.equals("")))	wheresql+="  and (crm_gcfxysjl.yssj>=TO_DATE('"+crm_gcfxysjl_yssj+"','YYYY/MM/DD'))";
	}
	crm_gcfxysjl_yssj=request.getParameter("crm_gcfxysjl_yssj2");
	if (crm_gcfxysjl_yssj!=null)
	{
		crm_gcfxysjl_yssj=crm_gcfxysjl_yssj.trim();
		if (!(crm_gcfxysjl_yssj.equals("")))	wheresql+="  and (crm_gcfxysjl.yssj<=TO_DATE('"+crm_gcfxysjl_yssj+"','YYYY/MM/DD'))";
	}
	crm_gcfxysjl_ysr=request.getParameter("crm_gcfxysjl_ysr");
	if (crm_gcfxysjl_ysr!=null)
	{
		crm_gcfxysjl_ysr=cf.GB2Uni(crm_gcfxysjl_ysr);
		if (!(crm_gcfxysjl_ysr.equals("")))	wheresql+=" and  (crm_gcfxysjl.ysr='"+crm_gcfxysjl_ysr+"')";
	}
	crm_gcfxysjl_lrr=request.getParameter("crm_gcfxysjl_lrr");
	if (crm_gcfxysjl_lrr!=null)
	{
		crm_gcfxysjl_lrr=cf.GB2Uni(crm_gcfxysjl_lrr);
		if (!(crm_gcfxysjl_lrr.equals("")))	wheresql+=" and  (crm_gcfxysjl.lrr='"+crm_gcfxysjl_lrr+"')";
	}
	crm_gcfxysjl_lrsj=request.getParameter("crm_gcfxysjl_lrsj");
	if (crm_gcfxysjl_lrsj!=null)
	{
		crm_gcfxysjl_lrsj=crm_gcfxysjl_lrsj.trim();
		if (!(crm_gcfxysjl_lrsj.equals("")))	wheresql+="  and (crm_gcfxysjl.lrsj>=TO_DATE('"+crm_gcfxysjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gcfxysjl_lrsj=request.getParameter("crm_gcfxysjl_lrsj2");
	if (crm_gcfxysjl_lrsj!=null)
	{
		crm_gcfxysjl_lrsj=crm_gcfxysjl_lrsj.trim();
		if (!(crm_gcfxysjl_lrsj.equals("")))	wheresql+="  and (crm_gcfxysjl.lrsj<=TO_DATE('"+crm_gcfxysjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gcfxysjl_lrbm=request.getParameter("crm_gcfxysjl_lrbm");
	if (crm_gcfxysjl_lrbm!=null)
	{
		crm_gcfxysjl_lrbm=cf.GB2Uni(crm_gcfxysjl_lrbm);
		if (!(crm_gcfxysjl_lrbm.equals("")))	wheresql+=" and  (crm_gcfxysjl.lrbm='"+crm_gcfxysjl_lrbm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}

	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}

	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");


	ls_sql="SELECT crm_gcfxysjl.ysjlh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,zpsl,gcysxmmc,ysxmflmc,crm_gcfxysjl.yssj,crm_gcfxysjl.ysr,DECODE(crm_gcfxysjl.ysjg,'1','合格','2','不合格'),crm_gcfxysjl.ysdf,DECODE(crm_gcfxysjl.sffszg,'1','是','2','否'),crm_gcfxysjl.yssm,DECODE(crm_gcfxysjl.sfkhbrqz,'Y','是','N','否'), DECODE(crm_gcfxysjl.dqzysq,'Y','有','N','无授权'),crm_gcfxysjl.khbh,sgdmc,crm_khxx.sgbz,crm_khxx.gj,crm_khxx.dd,crm_khxx.zjxm,crm_khxx.sjs,crm_gcfxysjl.lrr,crm_gcfxysjl.lrsj,dwmc,crm_gcfxysjl.bz ";
	ls_sql+=" FROM crm_gcfxysjl,crm_khxx,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_gcfxysjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_gcfxysjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gcfxysjlCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//设置主键
	String[] keyName={"ysjlh"};
	pageObj.setKey(keyName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">分项验收－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">验收记录号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">照片数</td>
	<td  width="8%">验收项目</td>
	<td  width="3%">项目分类</td>
	<td  width="3%">验收时间</td>
	<td  width="2%">验收人</td>
	<td  width="2%">验收结果</td>
	<td  width="2%">验收得分</td>
	<td  width="2%">是否发生整改</td>
	<td  width="17%">验收说明</td>
	<td  width="2%">客户本人签字</td>
	<td  width="2%">代签字有授权</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">施工队</td>
	<td  width="2%">班长</td>
	<td  width="2%">管家</td>
	<td  width="2%">调度</td>
	<td  width="2%">工程担当</td>
	<td  width="2%">设计师</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="13%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
