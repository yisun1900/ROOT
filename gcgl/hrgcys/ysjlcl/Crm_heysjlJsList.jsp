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
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

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
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
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
	String yscsjlh=null;
	String gcysbbh=null;
	String gcysxmbm=null;
	String gcysxmmc=null;
	String yssj=null;
	String ysr=null;
	String sjysjg=null;
	String clbz=null;
	String zgcljlh=null;
	String jhjjsj=null;
	String jsr=null;
	String jssj=null;
	String cljg=null;
	String jjr=null;
	String jjsj=null;
	String zgysjg=null;
	String zgysr=null;
	String zgyssj=null;
	String sfszhf=null;
	String lrr=null;
	String lrsj=null;
	String fdxbz=null;
	String padlrbz=null;
	ysjlh=request.getParameter("ysjlh");
	if (ysjlh!=null)
	{
		ysjlh=cf.GB2Uni(ysjlh);
		if (!(ysjlh.equals("")))	wheresql+=" and  (crm_heysjl.ysjlh='"+ysjlh+"')";
	}
	yscsjlh=request.getParameter("yscsjlh");
	if (yscsjlh!=null)
	{
		yscsjlh=cf.GB2Uni(yscsjlh);
		if (!(yscsjlh.equals("")))	wheresql+=" and  (crm_heysjl.yscsjlh='"+yscsjlh+"')";
	}

	gcysbbh=request.getParameter("gcysbbh");
	if (gcysbbh!=null)
	{
		gcysbbh=cf.GB2Uni(gcysbbh);
		if (!(gcysbbh.equals("")))	wheresql+=" and  (crm_heysjl.gcysbbh='"+gcysbbh+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (crm_heysjl.gcysxmbm='"+gcysxmbm+"')";
	}
	gcysxmmc=request.getParameter("gcysxmmc");
	if (gcysxmmc!=null)
	{
		gcysxmmc=cf.GB2Uni(gcysxmmc);
		if (!(gcysxmmc.equals("")))	wheresql+=" and  (crm_heysjl.gcysxmmc like '%"+gcysxmmc+"%')";
	}
	yssj=request.getParameter("yssj");
	if (yssj!=null)
	{
		yssj=yssj.trim();
		if (!(yssj.equals("")))	wheresql+="  and (crm_heysjl.yssj>=TO_DATE('"+yssj+"','YYYY/MM/DD'))";
	}
	yssj=request.getParameter("yssj2");
	if (yssj!=null)
	{
		yssj=yssj.trim();
		if (!(yssj.equals("")))	wheresql+="  and (crm_heysjl.yssj<=TO_DATE('"+yssj+"','YYYY/MM/DD'))";
	}
	ysr=request.getParameter("ysr");
	if (ysr!=null)
	{
		ysr=cf.GB2Uni(ysr);
		if (!(ysr.equals("")))	wheresql+=" and  (crm_heysjl.ysr='"+ysr+"')";
	}
	sjysjg=request.getParameter("sjysjg");
	if (sjysjg!=null)
	{
		sjysjg=cf.GB2Uni(sjysjg);
		if (!(sjysjg.equals("")))	wheresql+=" and  (crm_heysjl.sjysjg='"+sjysjg+"')";
	}
	clbz=request.getParameter("clbz");
	if (clbz!=null)
	{
		clbz=cf.GB2Uni(clbz);
		if (!(clbz.equals("")))	wheresql+=" and  (crm_heysjl.clbz='"+clbz+"')";
	}
	zgcljlh=request.getParameter("zgcljlh");
	if (zgcljlh!=null)
	{
		zgcljlh=cf.GB2Uni(zgcljlh);
		if (!(zgcljlh.equals("")))	wheresql+=" and  (crm_heysjl.zgcljlh='"+zgcljlh+"')";
	}
	jhjjsj=request.getParameter("jhjjsj");
	if (jhjjsj!=null)
	{
		jhjjsj=jhjjsj.trim();
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_heysjl.jhjjsj>=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}
	jhjjsj=request.getParameter("jhjjsj2");
	if (jhjjsj!=null)
	{
		jhjjsj=jhjjsj.trim();
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_heysjl.jhjjsj<=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (crm_heysjl.jsr='"+jsr+"')";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (crm_heysjl.jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (crm_heysjl.jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	cljg=request.getParameter("cljg");
	if (cljg!=null)
	{
		cljg=cf.GB2Uni(cljg);
		if (!(cljg.equals("")))	wheresql+=" and  (crm_heysjl.cljg='"+cljg+"')";
	}
	jjr=request.getParameter("jjr");
	if (jjr!=null)
	{
		jjr=cf.GB2Uni(jjr);
		if (!(jjr.equals("")))	wheresql+=" and  (crm_heysjl.jjr='"+jjr+"')";
	}
	jjsj=request.getParameter("jjsj");
	if (jjsj!=null)
	{
		jjsj=jjsj.trim();
		if (!(jjsj.equals("")))	wheresql+="  and (crm_heysjl.jjsj>=TO_DATE('"+jjsj+"','YYYY/MM/DD'))";
	}
	jjsj=request.getParameter("jjsj2");
	if (jjsj!=null)
	{
		jjsj=jjsj.trim();
		if (!(jjsj.equals("")))	wheresql+="  and (crm_heysjl.jjsj<=TO_DATE('"+jjsj+"','YYYY/MM/DD'))";
	}
	zgysjg=request.getParameter("zgysjg");
	if (zgysjg!=null)
	{
		zgysjg=cf.GB2Uni(zgysjg);
		if (!(zgysjg.equals("")))	wheresql+=" and  (crm_heysjl.zgysjg='"+zgysjg+"')";
	}
	zgysr=request.getParameter("zgysr");
	if (zgysr!=null)
	{
		zgysr=cf.GB2Uni(zgysr);
		if (!(zgysr.equals("")))	wheresql+=" and  (crm_heysjl.zgysr='"+zgysr+"')";
	}
	zgyssj=request.getParameter("zgyssj");
	if (zgyssj!=null)
	{
		zgyssj=zgyssj.trim();
		if (!(zgyssj.equals("")))	wheresql+="  and (crm_heysjl.zgyssj>=TO_DATE('"+zgyssj+"','YYYY/MM/DD'))";
	}
	zgyssj=request.getParameter("zgyssj2");
	if (zgyssj!=null)
	{
		zgyssj=zgyssj.trim();
		if (!(zgyssj.equals("")))	wheresql+="  and (crm_heysjl.zgyssj<=TO_DATE('"+zgyssj+"','YYYY/MM/DD'))";
	}
	sfszhf=request.getParameter("sfszhf");
	if (sfszhf!=null)
	{
		sfszhf=cf.GB2Uni(sfszhf);
		if (!(sfszhf.equals("")))	wheresql+=" and  (crm_heysjl.sfszhf='"+sfszhf+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_heysjl.lrr='"+lrr+"')";
	}

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_heysjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_heysjl.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	fdxbz=request.getParameter("fdxbz");
	if (fdxbz!=null)
	{
		fdxbz=cf.GB2Uni(fdxbz);
		if (!(fdxbz.equals("")))	wheresql+=" and  (crm_heysjl.fdxbz='"+fdxbz+"')";
	}
	padlrbz=request.getParameter("padlrbz");
	if (padlrbz!=null)
	{
		padlrbz=cf.GB2Uni(padlrbz);
		if (!(padlrbz.equals("")))	wheresql+=" and  (crm_heysjl.padlrbz='"+padlrbz+"')";
	}

	
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT crm_heysjl.ysjlh, DECODE(crm_heysjl.sjysjg,'0','合格','1','需整改'), DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过'),crm_heysjl.zpsl,crm_heysjl.khkkzpsl,crm_khxx.khxm,crm_khxx.fwdz,crm_heysjl.sjs,sgdmc,crm_heysjl.zjxm,crm_heysjl.gcysxmmc,crm_heysjl.yssj,crm_heysjl.ysr,crm_heysjl.zgcljlh,crm_heysjl.jhjjsj,crm_heysjl.jsr,crm_heysjl.jssj,crm_heysjl.jssm, DECODE(crm_heysjl.cljg,'3','在处理','4','已解决'),crm_heysjl.jjr,crm_heysjl.jjsj,crm_heysjl.jjsm, DECODE(crm_heysjl.zgysjg,'5','合格','6','不合格'),crm_heysjl.zgysr,crm_heysjl.zgyssj,crm_heysjl.zgyssm,crm_heysjl.dwjg,crm_heysjl.dwwz,crm_heysjl.dwjd,crm_heysjl.dwwd,crm_heysjl.dwhb, DECODE(crm_heysjl.padlrbz,'0','电脑','1','客户端')  , DECODE(crm_heysjl.fdxbz,'1','未发送','2','发送'), DECODE(crm_heysjl.xlrmx,'1','不需录入','2','需录入','3','已录入'),crm_heysjl.khbh,crm_heysjl.yscsjlh,dwmc,crm_heysjl.lrr,crm_heysjl.lrsj,crm_heysjl.bz";
	ls_sql+=" FROM crm_heysjl,crm_khxx,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_heysjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_heysjl.clbz in('1','6')";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_heysjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_heysjlJsList.jsp","","","JsCrm_heysjl.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"ysjlh","yscsjlh","khbh","crm_khxx_khxm","crm_khxx_fwdz","sjs","sgd","zjxm","gcysbbh","gcysxmbm","gcysxmmc","yssj","ysr","sjysjg","clbz","zgcljlh","jhjjsj","jsr","jssj","jssm","cljg","jjr","jjsj","jjsm","zgysjg","zgysr","zgyssj","zgyssm","sfszhf","hfszjlh","gcjdbm","zpsl","khkkzpsl","lrbm","lrr","lrsj","fdxbz","xlrmx","bz","dwjg","dwwz","dwjd","dwwd","dwhb","padlrbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ysjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("接收");


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
  <B><font size="3">工程验收记录－整改接收</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(450);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50px">&nbsp;</td>
	<td  width="70px">验收记录号</td>
	<td  width="60px">项目验收结果</td>
	<td  width="2%">整改处理状态</td>
	<td  width="1%">照片数量</td>
	<td  width="1%">客户可看</td>
	<td  width="2%">客户姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="60px">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="60px">监理</td>
	<td  width="3%">验收项目</td>
	<td  width="90px">项目验收时间</td>
	<td  width="60px">项目验收人</td>
	<td  width="2%">整改处理记录号</td>
	<td  width="90px">计划解决时间</td>
	<td  width="60px">整改接收人</td>
	<td  width="2%">整改接收时间</td>
	<td  width="6%">整改接收说明</td>
	<td  width="2%">处理结果</td>
	<td  width="60px">整改处理人</td>
	<td  width="90px">整改处理时间</td>
	<td  width="10%">整改处理情况</td>
	<td  width="2%">整改验收结果</td>
	<td  width="60px">整改验收人</td>
	<td  width="90px">整改验收时间</td>
	<td  width="10%">整改验收情况</td>

	<td  width="2%">定位结果</td>
	<td  width="2%">定位位置</td>
	<td  width="70px">定位精度</td>
	<td  width="70px">定位纬度</td>
	<td  width="70px">定位海拔</td>
	<td  width="70px">客户端录入标志</td>
	<td  width="70px">发短信标志</td>
	<td  width="70px">需录入明细</td>
	<td  width="60px">客户编号</td>
	<td  width="70px">验收次数记录号</td>
	<td  width="3%">签单店面</td>
	<td  width="60px">录入人</td>
	<td  width="90px">录入时间</td>
	<td  width="5%">备注</td>
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