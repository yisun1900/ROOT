<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String zjxxh=null;
	String hth=null;
	String khbh=null;
	String khxm=null;
	String dh=null;
	String sgd=null;
	String sgbz=null;
	String zjxyybm=null;
	String zjxyysm=null;
	String zjje=null;
	String lrr=null;
	String lrsj=null;
	String fssj=null;
	String fwdz=null;
	String zjxfsjd=null;

	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}


	String sgd2=null;
	sgd2=request.getParameter("sgd2");
	if (sgd2!=null)
	{
		sgd2=cf.GB2Uni(sgd2);
		if (!(sgd2.equals("")))	wheresql+=" and  (sq_sgd.sgdmc like '%"+sgd2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String gckkspbz=null;
	gckkspbz=request.getParameter("gckkspbz");
	if (gckkspbz!=null)
	{
		gckkspbz=gckkspbz.trim();
		if (!(gckkspbz.equals("")))	wheresql+=" and (crm_khxx.gckkspbz='"+gckkspbz+"') ";
	}

	String zjxwcbz=null;
	zjxwcbz=request.getParameter("zjxwcbz");
	if (zjxwcbz!=null)
	{
		zjxwcbz=zjxwcbz.trim();
		if (!(zjxwcbz.equals("")))	wheresql+=" and (crm_zjxdj.zjxwcbz="+zjxwcbz+") ";
	}

	String lrdw=null;
	lrdw=request.getParameter("lrdw");
	if (lrdw!=null)
	{
		if (!(lrdw.equals("")))	wheresql+=" and  (crm_zjxdj.lrdw='"+lrdw+"')";
	}


	zjxxh=request.getParameter("zjxxh");
	if (zjxxh!=null)
	{
		zjxxh=zjxxh.trim();
		if (!(zjxxh.equals("")))	wheresql+=" and (crm_zjxdj.zjxxh="+zjxxh+") ";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	dh=request.getParameter("dh");
	if (dh!=null)
	{
		dh=cf.GB2Uni(dh);
		if (!(dh.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+dh+"%')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+sgbz+"')";
	}
	zjxyybm=request.getParameter("zjxyybm");
	if (zjxyybm!=null)
	{
		zjxyybm=cf.GB2Uni(zjxyybm);
		if (!(zjxyybm.equals("")))	wheresql+=" and  (crm_zjxyydj.zjxyybm='"+zjxyybm+"')";
	}
	zjxfsjd=request.getParameter("zjxfsjd");
	if (zjxfsjd!=null)
	{
		if (!(zjxfsjd.equals("")))	wheresql+=" and  (crm_zjxdj.zjxfsjd='"+zjxfsjd+"')";
	}
	zjxyysm=request.getParameter("zjxyysm");
	if (zjxyysm!=null)
	{
		zjxyysm=cf.GB2Uni(zjxyysm);
		if (!(zjxyysm.equals("")))	wheresql+=" and  (crm_zjxdj.zjxyysm like '%"+zjxyysm+"%')";
	}
	zjje=request.getParameter("zjje");
	if (zjje!=null)
	{
		zjje=zjje.trim();
		if (!(zjje.equals("")))	wheresql+=" and  (crm_zjxdj.zjje="+zjje+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zjxdj.lrr='"+lrr+"')";
	}
	fssj=request.getParameter("fssj");
	if (fssj!=null)
	{
		if (!(fssj.equals("")))	wheresql+="  and (crm_zjxdj.fssj>=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	fssj=request.getParameter("fssj2");
	if (fssj!=null)
	{
		if (!(fssj.equals("")))	wheresql+="  and (crm_zjxdj.fssj<=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zjxdj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}

	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT  crm_khxx.khxm,crm_khxx.fwdz,sgdmc,sjs ,crm_zjxdj.zjxxh,DECODE(crm_zjxdj.zjxwcbz,'1','未完成','2','已完成') zjxwcbz,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.kglf,crm_zjxdj.kqtk,crm_zjxdj.gckk,DECODE(crm_khxx.gckkspbz,'N','未审批','Y','已审批') gckkspbz,zjxfsjdmc,fssj,crm_zjxdj.lrr,hth";
	ls_sql+=" FROM crm_zjxdj,crm_khxx,sq_sgd,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";

	if (zwbm.equals("04"))//04:家装设计师
	{
		ls_sql+=" and (crm_khxx.sjs='"+yhmc+"')";
	}
	if (zwbm.equals("05"))//05:工程担当
	{
		ls_sql+=" and (crm_khxx.zjxm='"+yhmc+"')";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by crm_zjxdj.lrsj desc,crm_zjxdj.zjxxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zjxdjTjList.jsp","SelectCxCrm_zjxdj.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"zjxxh","crm_zjxdj_fylxbm","crm_zjxdj_khbh","crm_zjxdj_khxm","crm_zjxdj_dh","crm_zjxdj_sgd","dm_zjxyybm_zjxyymc","crm_zjxdj_zjje","crm_zjxdj_fwdz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="4%">施工队</td>
	<td  width="5%">设计师</td>
	<td  width="6%">增减项序号</td>
	<td  width="4%">完成标志</td>
	<td  width="7%">折前增减项发生额</td>
	<td  width="7%">折后增减项发生额</td>
	<td  width="7%">扣管理费</td>
	<td  width="6%">扣其它款</td>
	<td  width="5%">工程扣款</td>
	<td  width="5%">工程扣款审批</td>
	<td  width="5%">发生阶段</td>
	<td  width="6%">增减项发生时间</td>
	<td  width="5%">录入人</td>
	<td  width="6%">合同号</td>
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