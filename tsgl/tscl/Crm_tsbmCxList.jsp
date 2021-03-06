<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+clzt+"')";
	}

	String sfja=null;
	sfja=request.getParameter("sfja");
	if (sfja!=null)
	{
		sfja=cf.GB2Uni(sfja);
		if (sfja.equals("Y"))
		{
			wheresql+=" and  (crm_tsjl.clzt in('3'))";
		}
		else if (sfja.equals("N"))
		{
			wheresql+=" and  (crm_tsjl.clzt in('1','4','5','6','7','2'))";
		}
	}


	String zrbmclzt=null;
	zrbmclzt=request.getParameter("zrbmclzt");
	if (zrbmclzt!=null)
	{
		zrbmclzt=cf.GB2Uni(zrbmclzt);
		if (!(zrbmclzt.equals("")))	wheresql+=" and  (crm_tsbm.clzt='"+zrbmclzt+"')";
	}


	String sfjj=null;
	sfjj=request.getParameter("sfjj");
	if (sfjj!=null)
	{
		sfjj=cf.GB2Uni(sfjj);
		if (sfjj.equals("Y"))
		{
			wheresql+=" and  (crm_tsbm.clzt in('3','5'))";
		}
		else if (sfjj.equals("N"))
		{
			wheresql+=" and  (crm_tsbm.clzt in('1','2','4','6','7','8','9','A','B','C'))";
		}
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
	String sgbz=null;
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+sgbz+"')";
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


	String crm_tsbm_tsxlbm=null;
	String crm_tsbm_tslxbm=null;
	crm_tsbm_tslxbm=request.getParameter("crm_tsbm_tslxbm");
	if (crm_tsbm_tslxbm!=null)
	{
		crm_tsbm_tslxbm=cf.GB2Uni(crm_tsbm_tslxbm);
		if (!(crm_tsbm_tslxbm.equals("")))	wheresql+=" and  (crm_tsbm.tslxbm='"+crm_tsbm_tslxbm+"')";
	}
	crm_tsbm_tsxlbm=request.getParameter("crm_tsbm_tsxlbm");
	if (crm_tsbm_tsxlbm!=null)
	{
		crm_tsbm_tsxlbm=cf.GB2Uni(crm_tsbm_tsxlbm);
		if (!(crm_tsbm_tsxlbm.equals("")))	wheresql+=" and  (crm_tsbm.tsxlbm='"+crm_tsbm_tsxlbm+"')";
	}


	String crm_tsbm_tspp=null;
	crm_tsbm_tspp=request.getParameter("crm_tsbm_tspp");
	if (crm_tsbm_tspp!=null)
	{
		crm_tsbm_tspp=cf.GB2Uni(crm_tsbm_tspp);
		if (!(crm_tsbm_tspp.equals("")))	wheresql+=" and  (crm_tsbm.tspp='"+crm_tsbm_tspp+"')";
	}

	String crm_tsbm_tspp2=null;
	crm_tsbm_tspp2=request.getParameter("crm_tsbm_tspp2");
	if (crm_tsbm_tspp2!=null)
	{
		crm_tsbm_tspp2=cf.GB2Uni(crm_tsbm_tspp2);
		if (!(crm_tsbm_tspp2.equals("")))	wheresql+=" and  (crm_tsbm.tspp like '%"+crm_tsbm_tspp2+"%')";
	}


	String fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!fgs.equals(""))
		{
			wheresql+=" and  (crm_tsbm.ssfgs='"+fgs+"')";
		}
	}

	String dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!dwbh.equals(""))
		{
			wheresql+=" and  (crm_tsbm.dwbh='"+dwbh+"')";
		}
	}

	
	String slsj=null;
	String slsj2=null;
	slsj=request.getParameter("slsj");
	if (slsj!=null)
	{
		if (!(slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+slsj+"','YYYY/MM/DD'))";
	}
	slsj2=request.getParameter("slsj2");
	if (slsj2!=null)
	{
		if (!(slsj2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+slsj2+"','YYYY/MM/DD'))";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String jssj=null;
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=cf.GB2Uni(jssj);
		if (!(jssj.equals("")))	wheresql+="  and (crm_tsbm.jssj>=TO_DATE('"+jssj+"','YYYY-MM-DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=cf.GB2Uni(jssj);
		if (!(jssj.equals("")))	wheresql+="  and (crm_tsbm.jssj<=TO_DATE('"+jssj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String jhcxcsj=null;
	jhcxcsj=request.getParameter("jhcxcsj");
	if (jhcxcsj!=null)
	{
		jhcxcsj=cf.GB2Uni(jhcxcsj);
		if (!(jhcxcsj.equals("")))	wheresql+="  and (crm_tsbm.jhcxcsj>=TO_DATE('"+jhcxcsj+"','YYYY-MM-DD'))";
	}
	jhcxcsj=request.getParameter("jhcxcsj2");
	if (jhcxcsj!=null)
	{
		jhcxcsj=cf.GB2Uni(jhcxcsj);
		if (!(jhcxcsj.equals("")))	wheresql+="  and (crm_tsbm.jhcxcsj<=TO_DATE('"+jhcxcsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String sjcxcsj=null;
	sjcxcsj=request.getParameter("sjcxcsj");
	if (sjcxcsj!=null)
	{
		sjcxcsj=cf.GB2Uni(sjcxcsj);
		if (!(sjcxcsj.equals("")))	wheresql+="  and (crm_tsbm.sjcxcsj>=TO_DATE('"+sjcxcsj+"','YYYY-MM-DD'))";
	}
	jhcxcsj=request.getParameter("jhcxcsj2");
	if (jhcxcsj!=null)
	{
		jhcxcsj=cf.GB2Uni(jhcxcsj);
		if (!(jhcxcsj.equals("")))	wheresql+="  and (crm_tsbm.jhcxcsj<=TO_DATE('"+jhcxcsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}


	String sjcfasj=null;
	sjcfasj=request.getParameter("sjcfasj");
	if (sjcfasj!=null)
	{
		sjcfasj=cf.GB2Uni(sjcfasj);
		if (!(sjcfasj.equals("")))	wheresql+="  and (crm_tsbm.sjcfasj>=TO_DATE('"+sjcfasj+"','YYYY/MM/DD'))";
	}
	sjcfasj=request.getParameter("sjcfasj2");
	if (sjcfasj!=null)
	{
		sjcfasj=cf.GB2Uni(sjcfasj);
		if (!(sjcfasj.equals("")))	wheresql+="  and (crm_tsbm.sjcfasj<=TO_DATE('"+sjcfasj+"','YYYY/MM/DD'))";
	}

	String jhjjsj=null;
	jhjjsj=request.getParameter("jhjjsj");
	if (jhjjsj!=null)
	{
		jhjjsj=cf.GB2Uni(jhjjsj);
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_tsbm.jhjjsj>=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}
	jhjjsj=request.getParameter("jhjjsj2");
	if (jhjjsj!=null)
	{
		jhjjsj=cf.GB2Uni(jhjjsj);
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_tsbm.jhjjsj<=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}

	String clsj=null;
	clsj=request.getParameter("clsj");
	if (clsj!=null)
	{
		clsj=cf.GB2Uni(clsj);
		if (!(clsj.equals("")))	wheresql+="  and (crm_tsbm.clsj>=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}
	clsj=request.getParameter("clsj2");
	if (clsj!=null)
	{
		clsj=cf.GB2Uni(clsj);
		if (!(clsj.equals("")))	wheresql+="  and (crm_tsbm.clsj<=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}

	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");
	if (tsjlh!=null)
	{
		tsjlh=cf.GB2Uni(tsjlh);
		if (!(tsjlh.equals("")))	wheresql+="  and (crm_tsbm.tsjlh='"+tsjlh+"')";
	}
	
	
	ls_sql="SELECT  crm_tsjl.tsjlh,crm_tsbm.zrr,crm_tsjl.khbh,tsxlmc,dm_slfsbm.slfsmc,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,crm_tsjl.slsj,crm_tsbm.dwbh,sq_dwxx.dwmc zrbm,crm_tsbm.tzsj,crm_tsbm.tsyybm,crm_tsbm.tspp";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt,crm_khxx.sjs";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as jazt,sgdmc";

	ls_sql+=" ,crm_tsbm.jssj,crm_tsbm.jsr,crm_tsbm.jssm";
	ls_sql+=" ,crm_tsbm.jhcxcsj,crm_tsbm.kcjlh,crm_tsbm.sjcxcr,crm_tsbm.sjcxcsj,crm_tsbm.cxcsm";
	ls_sql+=" ,crm_tsbm.jhcfasj,crm_tsbm.cfajlh,crm_tsbm.sjcfar,crm_tsbm.sjcfasj,crm_tsbm.jjfa";
	ls_sql+=" ,crm_tsbm.jhjjsj,DECODE(crm_tsbm.sfpfkh,'1','否','2','赔付') sfpfkh,crm_tsbm.khpfze,DECODE(crm_tsbm.sfnbcf,'1','否','2','处罚') sfnbcf,crm_tsbm.nbcfze";
	ls_sql+=" ,crm_tsbm.shbm,crm_tsbm.shr,crm_tsbm.shsj,crm_tsbm.shsm";
	ls_sql+=" ,crm_tsbm.cljlh,crm_tsbm.sjjjsj,crm_tsbm.clr,crm_tsbm.clsj,crm_tsbm.clqk";
	ls_sql+=" ,dm_tshfjgbm.hfjgmc,crm_tsbm.qrjjsj,dm_zzjgbm.zzjgmc,dm_jsxbm.jsxmc";



	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,crm_tsbm,sq_dwxx,sq_sgd,dm_tshfjgbm,dm_zzjgbm,dm_jsxbm ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_tshfjgbm.hfjgbm(+) ";
    ls_sql+=" and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+) ";
    ls_sql+=" and crm_tsbm.jsxbm=dm_jsxbm.jsxbm(+) ";
	ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修

	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbm.jssj desc,crm_tsbm.cljlh,crm_tsbm.tsyybm" ;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsbmCxList.jsp","","","");
//	pageObj.setPageRow(2);//设置每页显示记录数

//设置显示列
	String[] disColName={"tsjlh","zrbm","zrr","tsxlmc","clzt","khxm","fwdz","jssj","jsr","jssm","jhcxcsj","kcjlh","sjcxcsj","sjcxcr","cxcsm","jhcfasj","cfajlh","sjcfasj","sjcfar","jjfa","jhjjsj","sfpfkh","khpfze","sfnbcf","nbcfze","shbm","shr","shsj","shsm","cljlh","sjjjsj","clsj","clr","clqk","hfjgmc","qrjjsj","zzjgmc","jsxmc","sjs","sgdmc","slfsmc","slsj","jazt","tspp"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"tsjlh","tsyybm"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("处理"); 




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
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
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
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>查询投诉</B> 
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(630);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">投诉序号</td>
	<td  width="2%">责任部门</td>
	<td  width="1%">负责人</td>
	<td  width="3%">投诉原因</td>
	<td  width="2%">处理状态</td>
	<td  width="1%">姓名</td>
	<td  width="5%">房屋地址</td>

	<td  width="80px">接收时间</td>
	<td  width="1%">接收人</td>
	<td  width="6%">接收说明</td>

	<td  width="80px">计划出现场时间</td>
	<td  width="80px">出现场记录号</td>
	<td  width="80px">实际出现场时间</td>
	<td  width="1%">实际出现场人</td>
	<td  width="7%">出现场说明</td>

	<td  width="80px">计划出方案时间</td>
	<td  width="80px">出方案记录号</td>
	<td  width="80px">实际出方案时间</td>
	<td  width="1%">实际出方案人</td>
	<td  width="9%">解决方案</td>

	<td  width="80px">计划解决时间</td>
	<td  width="1%">是否赔付客户</td>
	<td  width="1%">客户赔付总额</td>
	<td  width="1%">是否内部处罚</td>
	<td  width="1%">内部处罚总额</td>

	<td  width="2%">方案审核部门</td>
	<td  width="1%">方案审核人</td>
	<td  width="80px">方案审核时间</td>
	<td  width="6%">方案审核说明</td>

	<td  width="80px">处理记录号</td>
	<td  width="80px">责任部门解决时间</td>
	<td  width="80px">最新处理时间</td>
	<td  width="1%">最新处理人</td>
	<td  width="10%">最新处理情况</td>

	<td  width="2%">客服回访结果</td>
	<td  width="80px">回访确认解决时间</td>
	<td  width="2%">结案客户是否满意</td>
	<td  width="2%">解决问题及时性</td>



	<td  width="1%">设计师</td>
	<td  width="1%">施工队</td>
	<td  width="1%">投诉来源</td>
	<td  width="80px">受理时间</td>
	<td  width="2%">结案状态</td>
	<td  width="3%">涉及厂商</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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
