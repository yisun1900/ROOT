<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
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

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','����','N','��') sftsqk,slfsmc,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj, DECODE(crm_tsjl.sfxhf,'Y','��ط�','N','����ط�') sfxhf,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') jazt,tsxlmc,tsyymc,b.dwmc zrbm, DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,crm_tsbm.lrr,crm_tsbm.lrsj,hfjgmc,'��'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'��'||crm_tsbm.clr||'����'||crm_tsbm.clqk clqk,gysmc tspp  ";
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
//���ж����ʼ��
	pageObj.initPage("Crm_tsjlCxList.jsp","SelectCxCrm_tsjl.jsp","","tsslDY.jsp");
	pageObj.setEditStr("����");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"hth","khxm","fwdz","sjs","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","slsj","jazt","tsxlmc","tsyymc","zrbm","clzt","lrr","lrsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[22]="align='left'";
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("zjxm","1");//�в����������Hash��
	spanColHash.put("tsjlh","1");//�в����������Hash��
	spanColHash.put("sftsqk","1");//�в����������Hash��
	spanColHash.put("slfsmc","1");//�в����������Hash��
	spanColHash.put("yzcdmc","1");//�в����������Hash��
	spanColHash.put("tsnr","1");//�в����������Hash��
	spanColHash.put("yqjjsj","1");//�в����������Hash��
	spanColHash.put("sfxhf","1");//�в����������Hash��
	spanColHash.put("slsj","1");//�в����������Hash��
	spanColHash.put("jazt","1");//�в����������Hash��
	spanColHash.put("tsxlmc","1");//�в����������Hash��
	spanColHash.put("tsyymc","1");//�в����������Hash��
	spanColHash.put("zrbm","1");//�в����������Hash��
	spanColHash.put("clzt","1");//�в����������Hash��clqk
	spanColHash.put("lrr","1");//�в����������Hash��clqk
	spanColHash.put("lrsj","1");//�в����������Hash��clqk
	spanColHash.put("hfjgmc","1");//�в����������Hash��clqk
	spanColHash.put("clqk","1");//�в����������Hash��clqk
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="3%">Ͷ�߼�¼��</td>
	<td  width="2%">�Ƿ��������</td>
	<td  width="2%">����ʽ</td>
	<td  width="3%">���س̶�</td>
	<td  width="15%">Ͷ�߱�������</td>
	<td  width="3%">�ͻ�Ҫ����ʱ��</td>
	<td  width="3%">�Ƿ���ط�</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�᰸״̬</td>
	<td  width="3%">Ͷ�߱���С��</td>
	<td  width="6%">Ͷ�߱���ԭ��</td>
	<td  width="5%">���β���</td>
	<td  width="4%">����״̬</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">�طý��</td>
	<td  width="15%">�������</td>
	<td  width="3%">Ͷ��Ʒ��</td>
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
