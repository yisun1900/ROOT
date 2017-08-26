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
	String crm_tsjl_tsjlh=null;
	String crm_tsjl_slfsbm=null;
	String crm_tsjl_yzcdbm=null;
	String crm_tsjl_yqjjsj=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_hfsj=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_lrsj=null;
	String crm_tsjl_lrr=null;
	String crm_tsjl_slbm=null;
	String crm_tsjl_clzt=null;
	String crm_tsjl_jasj=null;
	String crm_tsjl_lx=null;
	String crm_tsbm_tsxlbm=null;
	String crm_tsbm_tslxbm=null;
	String crm_tsbm_tsyybm=null;
	String crm_tsbm_dwbh=null;
	String crm_tsbm_clzt=null;
	String crm_tsbm_sfjslx=null;
	String crm_tsbm_zzjgbm=null;
	String crm_tsbm_jsxbm=null;


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




	
	String sffpsgd=null;
	sffpsgd=request.getParameter("sffpsgd");
	if (sffpsgd!=null)
	{
		if (sffpsgd.equals("N")){
			wheresql+=" and  (crm_tsjl.wxsgd is null)";
		}
		else if (sffpsgd.equals("Y")){
			wheresql+=" and  (crm_tsjl.wxsgd is not null)";
		}
	}
	String wxsgd=null;
	wxsgd=request.getParameter("wxsgd");
	if (wxsgd!=null)
	{
		if (!(wxsgd.equals("")))	wheresql+=" and  (crm_tsjl.wxsgd='"+wxsgd+"')";
	}

	String hfjgbm=null;
	hfjgbm=request.getParameter("hfjgbm");
	if (hfjgbm!=null)
	{
		if (!(hfjgbm.equals("")))	wheresql+=" and  (crm_tsbm.hfjgbm='"+hfjgbm+"')";
	}

	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=cf.GB2Uni(crm_tsjl_tsjlh);
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and  (crm_tsjl.tsjlh='"+crm_tsjl_tsjlh+"')";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	crm_tsjl_yzcdbm=request.getParameter("crm_tsjl_yzcdbm");
	if (crm_tsjl_yzcdbm!=null)
	{
		crm_tsjl_yzcdbm=cf.GB2Uni(crm_tsjl_yzcdbm);
		if (!(crm_tsjl_yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+crm_tsjl_yzcdbm+"')";
	}
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj");
	if (crm_tsjl_yqjjsj!=null)
	{
		crm_tsjl_yqjjsj=crm_tsjl_yqjjsj.trim();
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj>=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj2");
	if (crm_tsjl_yqjjsj!=null)
	{
		crm_tsjl_yqjjsj=crm_tsjl_yqjjsj.trim();
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj<=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_sfxhf=request.getParameter("crm_tsjl_sfxhf");
	if (crm_tsjl_sfxhf!=null)
	{
		crm_tsjl_sfxhf=cf.GB2Uni(crm_tsjl_sfxhf);
		if (!(crm_tsjl_sfxhf.equals("")))	wheresql+=" and  (crm_tsjl.sfxhf='"+crm_tsjl_sfxhf+"')";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	wheresql+="  and (crm_tsjl.hfsj>=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj2");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	wheresql+="  and (crm_tsjl.hfsj<=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj2");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+crm_tsjl_slsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	crm_tsjl_slr=request.getParameter("crm_tsjl_slr");
	if (crm_tsjl_slr!=null)
	{
		crm_tsjl_slr=cf.GB2Uni(crm_tsjl_slr);
		if (!(crm_tsjl_slr.equals("")))	wheresql+=" and  (crm_tsjl.slr='"+crm_tsjl_slr+"')";
	}
	crm_tsjl_lrsj=request.getParameter("crm_tsjl_lrsj");
	if (crm_tsjl_lrsj!=null)
	{
		crm_tsjl_lrsj=crm_tsjl_lrsj.trim();
		if (!(crm_tsjl_lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+crm_tsjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_lrsj=request.getParameter("crm_tsjl_lrsj2");
	if (crm_tsjl_lrsj!=null)
	{
		crm_tsjl_lrsj=crm_tsjl_lrsj.trim();
		if (!(crm_tsjl_lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+crm_tsjl_lrsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	crm_tsjl_lrr=request.getParameter("crm_tsjl_lrr");
	if (crm_tsjl_lrr!=null)
	{
		crm_tsjl_lrr=cf.GB2Uni(crm_tsjl_lrr);
		if (!(crm_tsjl_lrr.equals("")))	wheresql+=" and  (crm_tsjl.lrr='"+crm_tsjl_lrr+"')";
	}
	crm_tsjl_slbm=request.getParameter("crm_tsjl_slbm");
	if (crm_tsjl_slbm!=null)
	{
		crm_tsjl_slbm=cf.GB2Uni(crm_tsjl_slbm);
		if (!(crm_tsjl_slbm.equals("")))	wheresql+=" and  (crm_tsjl.slbm='"+crm_tsjl_slbm+"')";
	}
	crm_tsjl_clzt=request.getParameter("crm_tsjl_clzt");
	if (crm_tsjl_clzt!=null)
	{
		crm_tsjl_clzt=cf.GB2Uni(crm_tsjl_clzt);
		if (!(crm_tsjl_clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+crm_tsjl_clzt+"')";
	}
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj");
	if (crm_tsjl_jasj!=null)
	{
		crm_tsjl_jasj=crm_tsjl_jasj.trim();
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj>=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_jasj=request.getParameter("crm_tsjl_jasj2");
	if (crm_tsjl_jasj!=null)
	{
		crm_tsjl_jasj=crm_tsjl_jasj.trim();
		if (!(crm_tsjl_jasj.equals("")))	wheresql+="  and (crm_tsjl.jasj<=TO_DATE('"+crm_tsjl_jasj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_lx=request.getParameter("crm_tsjl_lx");
	if (crm_tsjl_lx!=null)
	{
		crm_tsjl_lx=cf.GB2Uni(crm_tsjl_lx);
		if (!(crm_tsjl_lx.equals("")))	wheresql+=" and  (crm_tsjl.lx='"+crm_tsjl_lx+"')";
	}
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
	crm_tsbm_tsyybm=request.getParameter("crm_tsbm_tsyybm");
	if (crm_tsbm_tsyybm!=null)
	{
		crm_tsbm_tsyybm=cf.GB2Uni(crm_tsbm_tsyybm);
		if (!(crm_tsbm_tsyybm.equals("")))	wheresql+=" and  (crm_tsbm.tsyybm='"+crm_tsbm_tsyybm+"')";
	}
	crm_tsbm_dwbh=request.getParameter("crm_tsbm_dwbh");
	if (crm_tsbm_dwbh!=null)
	{
		crm_tsbm_dwbh=cf.GB2Uni(crm_tsbm_dwbh);
		if (!(crm_tsbm_dwbh.equals("")))	wheresql+=" and  (crm_tsbm.dwbh='"+crm_tsbm_dwbh+"')";
	}
	crm_tsbm_clzt=request.getParameter("crm_tsbm_clzt");
	if (crm_tsbm_clzt!=null)
	{
		crm_tsbm_clzt=cf.GB2Uni(crm_tsbm_clzt);
		if (!(crm_tsbm_clzt.equals("")))	wheresql+=" and  (crm_tsbm.clzt='"+crm_tsbm_clzt+"')";
	}
	crm_tsbm_sfjslx=request.getParameter("crm_tsbm_sfjslx");
	if (crm_tsbm_sfjslx!=null)
	{
		crm_tsbm_sfjslx=cf.GB2Uni(crm_tsbm_sfjslx);
		if (!(crm_tsbm_sfjslx.equals("")))	wheresql+=" and  (crm_tsbm.sfjslx='"+crm_tsbm_sfjslx+"')";
	}
	crm_tsbm_zzjgbm=request.getParameter("crm_tsbm_zzjgbm");
	if (crm_tsbm_zzjgbm!=null)
	{
		crm_tsbm_zzjgbm=cf.GB2Uni(crm_tsbm_zzjgbm);
		if (!(crm_tsbm_zzjgbm.equals("")))	wheresql+=" and  (crm_tsbm.zzjgbm='"+crm_tsbm_zzjgbm+"')";
	}
	crm_tsbm_jsxbm=request.getParameter("crm_tsbm_jsxbm");
	if (crm_tsbm_jsxbm!=null)
	{
		crm_tsbm_jsxbm=cf.GB2Uni(crm_tsbm_jsxbm);
		if (!(crm_tsbm_jsxbm.equals("")))	wheresql+=" and  (crm_tsbm.jsxbm='"+crm_tsbm_jsxbm+"')";
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


	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
	String px=request.getParameter("px");

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.lx,'1','投诉','2','报修') lx,slfsmc,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj, DECODE(crm_tsjl.sfxhf,'Y','需回访','N','不需回访') sfxhf,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') jazt,tsxlmc,tsyymc,b.dwmc zrbm, DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') clzt,hfjgmc,NVL2(crm_tsbm.clqk,'（'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk,'') clqk,crm_tsbm.tspp";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_sgd,sq_dwxx b,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)  ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by "+px+",crm_tsjl.tsjlh,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsjlCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
//设置显示列
	String[] disColName={"hth","khxm","fwdz","sjs","sgd","zjxm","tsjlh","lx","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","slsj","jazt","tsxlmc","tsyymc","zrbm","clzt","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[9]="align='left'";
	pageObj.alignStr[21]="align='left'";
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	spanColHash.put("lx","1");//列参数对象加入Hash表
	spanColHash.put("slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("yzcdmc","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("yqjjsj","1");//列参数对象加入Hash表
	spanColHash.put("sfxhf","1");//列参数对象加入Hash表
	spanColHash.put("slsj","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	spanColHash.put("tsxlmc","1");//列参数对象加入Hash表
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
  <B><font size="3">查询投诉报修记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检</td>
	<td  width="3%">投诉记录号</td>
	<td  width="2%">类型</td>
	<td  width="2%">投诉来源</td>
	<td  width="3%">严重程度</td>
	<td  width="14%">投诉报修内容</td>
	<td  width="3%">客户要求解决时间</td>
	<td  width="3%">是否需回访</td>
	<td  width="3%">客服受理时间</td>
	<td  width="3%">结案状态</td>
	<td  width="3%">投诉报修小类</td>
	<td  width="6%">投诉报修原因</td>
	<td  width="5%">责任部门</td>
	<td  width="3%">责任部门处理状态</td>
	<td  width="3%">回访结果</td>
	<td  width="14%">处理情况</td>
	<td  width="6%">投诉供应商</td>
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
