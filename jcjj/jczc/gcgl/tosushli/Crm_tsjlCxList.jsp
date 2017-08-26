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
	String crm_tsjl_tsjlh=null;
	String crm_tsjl_khbh=null;
	String crm_tsjl_slfsbm=null;
	String crm_tsjl_yzcdbm=null;
	String crm_tsjl_yqjjsj=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_hfsj=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_slbm=null;
	String crm_tsjl_clzt=null;
	String crm_tsjl_zrbmclzt=null;
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
	String crm_tspp_tspp=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String gcjdbm=null;
	gcjdbm=request.getParameter("gcjdbm");
	if (gcjdbm!=null)
	{
		gcjdbm=cf.GB2Uni(gcjdbm);
		if (!(gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+gcjdbm+"')";
	}
	String sfxhf=null;
	sfxhf=request.getParameter("sfxhf");
	if (sfxhf!=null)
	{
		sfxhf=cf.GB2Uni(sfxhf);
		if (!(sfxhf.equals("")))	wheresql+=" and  (crm_khxx.sfxhf='"+sfxhf+"')";
	}
	String hflxbm=null;
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (crm_khxx.hflxbm='"+hflxbm+"')";
	}
	String khlxbm=null;
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+khlxbm+"')";
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

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";

	String hfjgbm=null;
	hfjgbm=request.getParameter("hfjgbm");
	if (hfjgbm!=null)
	{
		if (!(hfjgbm.equals("")))	wheresql+=" and  (crm_tsbm.hfjgbm='"+hfjgbm+"')";
	}
	String sftsqk=null;
	sftsqk=request.getParameter("sftsqk");
	if (sftsqk!=null)
	{
		if (!(sftsqk.equals("")))	wheresql+=" and  (crm_tsjl.sftsqk='"+sftsqk+"')";
	}

	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=cf.GB2Uni(crm_tsjl_tsjlh);
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and  (crm_tsjl.tsjlh='"+crm_tsjl_tsjlh+"')";
	}
	crm_tsjl_khbh=request.getParameter("crm_tsjl_khbh");
	if (crm_tsjl_khbh!=null)
	{
		crm_tsjl_khbh=cf.GB2Uni(crm_tsjl_khbh);
		if (!(crm_tsjl_khbh.equals("")))	wheresql+=" and  (crm_tsjl.khbh='"+crm_tsjl_khbh+"')";
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
	crm_tsjl_zrbmclzt=request.getParameter("crm_tsjl_zrbmclzt");
	if (crm_tsjl_zrbmclzt!=null)
	{
		crm_tsjl_zrbmclzt=cf.GB2Uni(crm_tsjl_zrbmclzt);
		if (!(crm_tsjl_zrbmclzt.equals("")))	wheresql+=" and  (crm_tsjl.zrbmclzt='"+crm_tsjl_zrbmclzt+"')";
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
	crm_tspp_tspp=request.getParameter("crm_tspp_tspp");
	if (crm_tspp_tspp!=null)
	{
		crm_tspp_tspp=cf.GB2Uni(crm_tspp_tspp);
		if (!(crm_tspp_tspp.equals("")))	wheresql+=" and  (crm_tspp.tspp='"+crm_tspp_tspp+"')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
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

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
	String px=request.getParameter("px");

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','特殊','N','否') sftsqk,slfsmc,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj, DECODE(crm_tsjl.sfxhf,'Y','需回访','N','不需回访') sfxhf,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') jazt,tsxlmc,tsyymc,b.dwmc zrbm, DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,crm_tsbm.lrr,crm_tsbm.lrsj,hfjgmc,'（'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk clqk,gysmc tspp  ";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,crm_tspp,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_sgd,sq_dwxx b,sq_gysxx c,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+) ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+) and crm_tspp.tspp=c.gysbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by "+px+",crm_tsjl.tsjlh,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tsjlCxList.jsp","SelectCxCrm_tsjl.jsp","","tsslDY.jsp");
	pageObj.setEditStr("受理单");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"hth","khxm","fwdz","sjs","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","slsj","jazt","tsxlmc","tsyymc","zrbm","clzt","lrr","lrsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[22]="align='left'";
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
	spanColHash.put("sftsqk","1");//列参数对象加入Hash表
	spanColHash.put("slfsmc","1");//列参数对象加入Hash表
	spanColHash.put("yzcdmc","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("yqjjsj","1");//列参数对象加入Hash表
	spanColHash.put("sfxhf","1");//列参数对象加入Hash表
	spanColHash.put("slsj","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	spanColHash.put("tsxlmc","1");//列参数对象加入Hash表
	spanColHash.put("tsyymc","1");//列参数对象加入Hash表
	spanColHash.put("zrbm","1");//列参数对象加入Hash表
	spanColHash.put("clzt","1");//列参数对象加入Hash表clqk
	spanColHash.put("lrr","1");//列参数对象加入Hash表clqk
	spanColHash.put("lrsj","1");//列参数对象加入Hash表clqk
	spanColHash.put("hfjgmc","1");//列参数对象加入Hash表clqk
	spanColHash.put("clqk","1");//列参数对象加入Hash表clqk
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检</td>
	<td  width="3%">投诉记录号</td>
	<td  width="2%">是否特殊情况</td>
	<td  width="2%">受理方式</td>
	<td  width="3%">严重程度</td>
	<td  width="15%">投诉报修内容</td>
	<td  width="3%">客户要求解决时间</td>
	<td  width="3%">是否需回访</td>
	<td  width="3%">受理时间</td>
	<td  width="3%">结案状态</td>
	<td  width="3%">投诉报修小类</td>
	<td  width="6%">投诉报修原因</td>
	<td  width="5%">责任部门</td>
	<td  width="4%">处理状态</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">回访结果</td>
	<td  width="15%">处理情况</td>
	<td  width="3%">投诉品牌</td>
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
