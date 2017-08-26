<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	if (zwbm.equals("31"))//监理主管，只能看本小组工地
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
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



	String ysjlh=null;
	ysjlh=request.getParameter("ysjlh");
	if (ysjlh!=null)
	{
		ysjlh=cf.GB2Uni(ysjlh);
		if (!(ysjlh.equals("")))	wheresql+=" and  (crm_heysjl.ysjlh='"+ysjlh+"')";
	}

	String gcysxmbm=null;
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (crm_heysjl.gcysxmbm='"+gcysxmbm+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_heysjl.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_heysjl.zjxm='"+zjxm+"')";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_heysjl.sgd='"+sgd+"')";
	}

	String sgdmc=null;
	sgdmc=request.getParameter("sgdmc");
	if (sgdmc!=null)
	{
		sgdmc=cf.GB2Uni(sgdmc);
		if (!(sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sgdmc+"')";
	}


	String yssj=null;
	yssj=request.getParameter("yssj");
	if (yssj!=null)
	{
		yssj=cf.GB2Uni(yssj);
		if (!(yssj.equals("")))	wheresql+=" and  (crm_heysjl.yssj>=to_date('"+yssj+"','yyyy-mm-dd'))";
	}

	String yssj2=null;
	yssj2=request.getParameter("yssj2");
	if (yssj2!=null)
	{
		yssj2=cf.GB2Uni(yssj2);
		if (!(yssj2.equals("")))	wheresql+=" and  (crm_heysjl.yssj<=to_date('"+yssj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=cf.GB2Uni(lrsj);
		if (!(lrsj.equals("")))	wheresql+=" and  (crm_heysjl.lrsj>=to_date('"+lrsj+"','yyyy-mm-dd'))";
	}

	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		lrsj2=cf.GB2Uni(lrsj2);
		if (!(lrsj2.equals("")))	wheresql+=" and  (crm_heysjl.lrsj<=to_date('"+lrsj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String jssj=null;
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=cf.GB2Uni(jssj);
		if (!(jssj.equals("")))	wheresql+=" and  (crm_heysjl.jssj>=to_date('"+jssj+"','yyyy-mm-dd'))";
	}

	String jssj2=null;
	jssj2=request.getParameter("jssj2");
	if (jssj2!=null)
	{
		jssj2=cf.GB2Uni(jssj2);
		if (!(jssj2.equals("")))	wheresql+=" and  (crm_heysjl.jssj<=to_date('"+jssj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String jjsj=null;
	jjsj=request.getParameter("jjsj");
	if (jjsj!=null)
	{
		jjsj=cf.GB2Uni(jjsj);
		if (!(jjsj.equals("")))	wheresql+=" and  (crm_heysjl.jjsj>=to_date('"+jjsj+"','yyyy-mm-dd'))";
	}

	String jjsj2=null;
	jjsj2=request.getParameter("jjsj2");
	if (jjsj2!=null)
	{
		jjsj2=cf.GB2Uni(jjsj2);
		if (!(jjsj2.equals("")))	wheresql+=" and  (crm_heysjl.jjsj<=to_date('"+jjsj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String zgyssj=null;
	zgyssj=request.getParameter("zgyssj");
	if (zgyssj!=null)
	{
		zgyssj=cf.GB2Uni(zgyssj);
		if (!(zgyssj.equals("")))	wheresql+=" and  (crm_heysjl.zgyssj>=to_date('"+zgyssj+"','yyyy-mm-dd'))";
	}

	String zgyssj2=null;
	zgyssj2=request.getParameter("zgyssj2");
	if (zgyssj2!=null)
	{
		zgyssj2=cf.GB2Uni(zgyssj2);
		if (!(zgyssj2.equals("")))	wheresql+=" and  (crm_heysjl.zgyssj<=to_date('"+zgyssj2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String ysr=null;
	ysr=request.getParameter("ysr");
	if (ysr!=null)
	{
		ysr=cf.GB2Uni(ysr);
		if (!(ysr.equals("")))	wheresql+=" and  (crm_heysjl.ysr like '%"+ysr+"%')";
	}

	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_heysjl.lrr like '%"+lrr+"%')";
	}

	String sjysjg=null;
	sjysjg=request.getParameter("sjysjg");
	if (sjysjg!=null)
	{
		sjysjg=cf.GB2Uni(sjysjg);
		if (!(sjysjg.equals("")))	wheresql+=" and  (crm_heysjl.sjysjg='"+sjysjg+"')";
	}
	String clbz=null;
	clbz=request.getParameter("clbz");
	if (clbz!=null)
	{
		clbz=cf.GB2Uni(clbz);
		if (!(clbz.equals("")))	wheresql+=" and  (crm_heysjl.clbz='"+clbz+"')";
	}
	String clbz1=null;
	clbz1=request.getParameter("clbz1");
	if (clbz1!=null)
	{
		clbz1=cf.GB2Uni(clbz1);
		if (clbz1.equals("Y"))
		{
			wheresql+=" and  (crm_heysjl.clbz='5')";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
		}
		else if (clbz1.equals("N"))
		{
			wheresql+=" and  (crm_heysjl.clbz not in('5','9','0'))";
		}
	}

	String zpsx=null;
	zpsx=request.getParameter("zpsx");
	if (zpsx!=null)
	{
		zpsx=cf.GB2Uni(zpsx);
		if (zpsx.equals("Y"))
		{
			wheresql+=" and  (crm_heysjl.zpsl>0)";
		}
		else if (zpsx.equals("N"))
		{
			wheresql+=" and  (crm_heysjl.zpsl=0)";
		}
	}


	ls_sql="SELECT crm_heysjl.ysjlh,DECODE(crm_heysjl.sjysjg,'0','合格','1','需整改') sjysjg,DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') clbz,zpsl,dm_gcysxm.gcysxmmc,crm_heysjl.jjr,TO_CHAR(crm_heysjl.jjsj,'YYYY-MM-DD'),crm_khxx.khxm,crm_khxx.fwdz,crm_heysjl.sjs,sq_sgd.sgdmc,crm_heysjl.zjxm,crm_heysjl.ysr,TO_CHAR(crm_heysjl.yssj,'YYYY-MM-DD'),crm_heysjl.zgcljlh ,TO_CHAR(jhjjsj,'YYYY-MM-DD'),crm_heysjl.jsr,TO_CHAR(crm_heysjl.jssj,'YYYY-MM-DD'),crm_heysjl.jssm,DECODE(crm_heysjl.cljg,'3','在处理','4','已解决') cljg,crm_heysjl.jjsm,DECODE(crm_heysjl.zgysjg,'5','验收通过','6','验收未通过') zgysjg,crm_heysjl.zgysr,TO_CHAR(crm_heysjl.zgyssj,'YYYY-MM-DD'),crm_heysjl.zgyssm             ,crm_khxx.khbh,crm_heysjl.lrr,crm_heysjl.lrsj,sq_dwxx.dwmc,crm_heysjl.yscsjlh,crm_heysjl.bz  ";
	ls_sql+=" FROM crm_heysjl,sq_dwxx,dm_gcysxm,crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_heysjl.lrbm=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_heysjl.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and crm_heysjl.gcysxmbm=dm_gcysxm.gcysxmbm(+) ";
    ls_sql+=" and crm_heysjl.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_heysjl.clbz in('3','4')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by crm_heysjl.jjsj desc,crm_heysjl.yscsjlh desc,crm_heysjl.ysjlh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_heysjlXgClList.jsp","","","XgClCrm_heysjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"zgcljlh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//	pageObj.setEditStr("处理");

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteClCrm_heysjl.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
*/

	//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/hrgcys/ysjl/ViewCrm_heysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">整改处理－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(460);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">验收记录号</td>
	<td  width="2%">项目验收结果</td>
	<td  width="2%">整改处理状态</td>
	<td  width="1%">照片数量</td>
	<td  width="5%">验收项目</td>
	<td  width="50px">整改处理人</td>
	<td  width="2%">整改处理时间</td>
	
	<td  width="2%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="50px">设计师</td>
	<td  width="50px">施工队</td>
	<td  width="50px">监理</td>

	<td  width="50px">验收人</td>
	<td  width="2%">验收时间</td>
	<td  width="2%">整改处理记录号</td>
	<td  width="2%">计划解决时间</td>
	<td  width="50px">接收人</td>
	<td  width="2%">接收时间</td>
	<td  width="8%">接收说明</td>

	<td  width="2%">处理结果</td>
	<td  width="12%">整改处理情况</td>

	<td  width="2%">整改验收结果</td>
	<td  width="50px">整改验收人</td>
	<td  width="2%">整改验收时间</td>
	<td  width="10%">整改验收说明</td>

	<td  width="50px">客户编号</td>
	<td  width="50px%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="2%">验收次数记录号</td>
	<td  width="10%">备注</td>
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