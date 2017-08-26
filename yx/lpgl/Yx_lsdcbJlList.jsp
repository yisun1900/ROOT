<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String yx_lsdcb_xqbh=null;
	String yx_lsdcb_xqmc=null;
	String yx_lsdcb_dqbm=null;
	String yx_lsdcb_cqbm=null;
	String yx_lsdcb_dz=null;
	String yx_lsdcb_tjdm=null;
	String yx_lsdcb_jw=null;
	String yx_lsdcb_yzxfsp=null;
	String yx_lsdcb_xz=null;
	String yx_lsdcb_wyxs=null;
	String yx_lsdcb_xqgm=null;
	String yx_lsdcb_hxzl=null;
	String yx_lsdcb_zlhx=null;
	String yx_lsdcb_zlhxmj=null;
	String yx_lsdcb_ywy=null;
	String yx_lsdcb_dysfwc=null;
	String yx_lsdcb_xqfzr=null;
	String yx_lsdcb_xqfzrdh=null;
	String yx_lsdcb_lxsj=null;
	String yx_lsdcb_xsfs=null;
	String yx_lsdcb_fyssj=null;
	String yx_lsdcb_jfhs=null;
	String yx_lsdcb_sfytg=null;
	String yx_lsdcb_khzlgmqk=null;
	String yx_lsdcb_khmd=null;
	String yx_lsdcb_ykfsgx=null;
	String yx_lsdcb_sfjcxc=null;
	String yx_lsdcb_khzyl=null;
	String yx_lsdcb_yxxcfs=null;
	String yx_lsdcb_kfs=null;
	String yx_lsdcb_kfslxr=null;
	String yx_lsdcb_kfslxrzw=null;
	String yx_lsdcb_kfslxrdh=null;
	String yx_lsdcb_jzs=null;
	String yx_lsdcb_xss=null;
	String yx_lsdcb_sldh=null;
	String yx_lsdcb_ywzxgs=null;
	String yx_lsdcb_zxgssl=null;
	String yx_lsdcb_yzxhs=null;
	String yx_lsdcb_sftizxq=null;
	String yx_lsdcb_yjzxsj=null;
	String yx_lsdcb_ywwygs=null;
	String yx_lsdcb_wygsmc=null;
	String yx_lsdcb_wyfzr=null;
	String yx_lsdcb_wydh=null;
	String yx_lsdcb_wylxr=null;
	String yx_lsdcb_wylxrzw=null;
	String yx_lsdcb_kfjd=null;
	String yx_lsdcb_lrr=null;
	String yx_lsdcb_lrsj=null;
	String yx_lsdcb_fgsbh=null;
	yx_lsdcb_xqbh=request.getParameter("yx_lsdcb_xqbh");
	if (yx_lsdcb_xqbh!=null)
	{
		yx_lsdcb_xqbh=yx_lsdcb_xqbh.trim();
		if (!(yx_lsdcb_xqbh.equals("")))	wheresql+=" and (yx_lsdcb.xqbh="+yx_lsdcb_xqbh+") ";
	}
	yx_lsdcb_xqmc=request.getParameter("yx_lsdcb_xqmc");
	if (yx_lsdcb_xqmc!=null)
	{
		yx_lsdcb_xqmc=cf.GB2Uni(yx_lsdcb_xqmc);
		if (!(yx_lsdcb_xqmc.equals("")))	wheresql+=" and  (yx_lsdcb.xqmc='"+yx_lsdcb_xqmc+"')";
	}
	yx_lsdcb_dqbm=request.getParameter("yx_lsdcb_dqbm");
	if (yx_lsdcb_dqbm!=null)
	{
		yx_lsdcb_dqbm=cf.GB2Uni(yx_lsdcb_dqbm);
		if (!(yx_lsdcb_dqbm.equals("")))	wheresql+=" and  (yx_lsdcb.dqbm='"+yx_lsdcb_dqbm+"')";
	}
	yx_lsdcb_cqbm=request.getParameter("yx_lsdcb_cqbm");
	if (yx_lsdcb_cqbm!=null)
	{
		yx_lsdcb_cqbm=cf.GB2Uni(yx_lsdcb_cqbm);
		if (!(yx_lsdcb_cqbm.equals("")))	wheresql+=" and  (yx_lsdcb.cqbm='"+yx_lsdcb_cqbm+"')";
	}
	yx_lsdcb_dz=request.getParameter("yx_lsdcb_dz");
	if (yx_lsdcb_dz!=null)
	{
		yx_lsdcb_dz=cf.GB2Uni(yx_lsdcb_dz);
		if (!(yx_lsdcb_dz.equals("")))	wheresql+=" and  (yx_lsdcb.dz='"+yx_lsdcb_dz+"')";
	}
	yx_lsdcb_tjdm=request.getParameter("yx_lsdcb_tjdm");
	if (yx_lsdcb_tjdm!=null)
	{
		yx_lsdcb_tjdm=cf.GB2Uni(yx_lsdcb_tjdm);
		if (!(yx_lsdcb_tjdm.equals("")))	wheresql+=" and  (yx_lsdcb.tjdm='"+yx_lsdcb_tjdm+"')";
	}
	yx_lsdcb_jw=request.getParameter("yx_lsdcb_jw");
	if (yx_lsdcb_jw!=null)
	{
		yx_lsdcb_jw=cf.GB2Uni(yx_lsdcb_jw);
		if (!(yx_lsdcb_jw.equals("")))	wheresql+=" and  (yx_lsdcb.jw='"+yx_lsdcb_jw+"')";
	}
	yx_lsdcb_yzxfsp=request.getParameter("yx_lsdcb_yzxfsp");
	if (yx_lsdcb_yzxfsp!=null)
	{
		yx_lsdcb_yzxfsp=cf.GB2Uni(yx_lsdcb_yzxfsp);
		if (!(yx_lsdcb_yzxfsp.equals("")))	wheresql+=" and  (yx_lsdcb.yzxfsp='"+yx_lsdcb_yzxfsp+"')";
	}
	yx_lsdcb_xz=request.getParameter("yx_lsdcb_xz");
	if (yx_lsdcb_xz!=null)
	{
		yx_lsdcb_xz=cf.GB2Uni(yx_lsdcb_xz);
		if (!(yx_lsdcb_xz.equals("")))	wheresql+=" and  (yx_lsdcb.xz='"+yx_lsdcb_xz+"')";
	}
	yx_lsdcb_wyxs=request.getParameter("yx_lsdcb_wyxs");
	if (yx_lsdcb_wyxs!=null)
	{
		yx_lsdcb_wyxs=cf.GB2Uni(yx_lsdcb_wyxs);
		if (!(yx_lsdcb_wyxs.equals("")))	wheresql+=" and  (yx_lsdcb.wyxs='"+yx_lsdcb_wyxs+"')";
	}
	yx_lsdcb_xqgm=request.getParameter("yx_lsdcb_xqgm");
	if (yx_lsdcb_xqgm!=null)
	{
		yx_lsdcb_xqgm=cf.GB2Uni(yx_lsdcb_xqgm);
		if (!(yx_lsdcb_xqgm.equals("")))	wheresql+=" and  (yx_lsdcb.xqgm='"+yx_lsdcb_xqgm+"')";
	}
	yx_lsdcb_hxzl=request.getParameter("yx_lsdcb_hxzl");
	if (yx_lsdcb_hxzl!=null)
	{
		yx_lsdcb_hxzl=cf.GB2Uni(yx_lsdcb_hxzl);
		if (!(yx_lsdcb_hxzl.equals("")))	wheresql+=" and  (yx_lsdcb.hxzl='"+yx_lsdcb_hxzl+"')";
	}
	yx_lsdcb_zlhx=request.getParameter("yx_lsdcb_zlhx");
	if (yx_lsdcb_zlhx!=null)
	{
		yx_lsdcb_zlhx=cf.GB2Uni(yx_lsdcb_zlhx);
		if (!(yx_lsdcb_zlhx.equals("")))	wheresql+=" and  (yx_lsdcb.zlhx='"+yx_lsdcb_zlhx+"')";
	}
	yx_lsdcb_zlhxmj=request.getParameter("yx_lsdcb_zlhxmj");
	if (yx_lsdcb_zlhxmj!=null)
	{
		yx_lsdcb_zlhxmj=yx_lsdcb_zlhxmj.trim();
		if (!(yx_lsdcb_zlhxmj.equals("")))	wheresql+=" and (yx_lsdcb.zlhxmj="+yx_lsdcb_zlhxmj+") ";
	}
	yx_lsdcb_ywy=request.getParameter("yx_lsdcb_ywy");
	if (yx_lsdcb_ywy!=null)
	{
		yx_lsdcb_ywy=cf.GB2Uni(yx_lsdcb_ywy);
		if (!(yx_lsdcb_ywy.equals("")))	wheresql+=" and  (yx_lsdcb.ywy='"+yx_lsdcb_ywy+"')";
	}
	yx_lsdcb_dysfwc=request.getParameter("yx_lsdcb_dysfwc");
	if (yx_lsdcb_dysfwc!=null)
	{
		yx_lsdcb_dysfwc=cf.GB2Uni(yx_lsdcb_dysfwc);
		if (!(yx_lsdcb_dysfwc.equals("")))	wheresql+=" and  (yx_lsdcb.dysfwc='"+yx_lsdcb_dysfwc+"')";
	}
	yx_lsdcb_xqfzr=request.getParameter("yx_lsdcb_xqfzr");
	if (yx_lsdcb_xqfzr!=null)
	{
		yx_lsdcb_xqfzr=cf.GB2Uni(yx_lsdcb_xqfzr);
		if (!(yx_lsdcb_xqfzr.equals("")))	wheresql+=" and  (yx_lsdcb.xqfzr='"+yx_lsdcb_xqfzr+"')";
	}
	yx_lsdcb_xqfzrdh=request.getParameter("yx_lsdcb_xqfzrdh");
	if (yx_lsdcb_xqfzrdh!=null)
	{
		yx_lsdcb_xqfzrdh=cf.GB2Uni(yx_lsdcb_xqfzrdh);
		if (!(yx_lsdcb_xqfzrdh.equals("")))	wheresql+=" and  (yx_lsdcb.xqfzrdh='"+yx_lsdcb_xqfzrdh+"')";
	}
	yx_lsdcb_lxsj=request.getParameter("yx_lsdcb_lxsj");
	if (yx_lsdcb_lxsj!=null)
	{
		yx_lsdcb_lxsj=yx_lsdcb_lxsj.trim();
		if (!(yx_lsdcb_lxsj.equals("")))	wheresql+="  and (yx_lsdcb.lxsj=TO_DATE('"+yx_lsdcb_lxsj+"','YYYY/MM/DD'))";
	}
	yx_lsdcb_xsfs=request.getParameter("yx_lsdcb_xsfs");
	if (yx_lsdcb_xsfs!=null)
	{
		yx_lsdcb_xsfs=cf.GB2Uni(yx_lsdcb_xsfs);
		if (!(yx_lsdcb_xsfs.equals("")))	wheresql+=" and  (yx_lsdcb.xsfs='"+yx_lsdcb_xsfs+"')";
	}
	yx_lsdcb_fyssj=request.getParameter("yx_lsdcb_fyssj");
	if (yx_lsdcb_fyssj!=null)
	{
		yx_lsdcb_fyssj=yx_lsdcb_fyssj.trim();
		if (!(yx_lsdcb_fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj=TO_DATE('"+yx_lsdcb_fyssj+"','YYYY/MM/DD'))";
	}
	yx_lsdcb_jfhs=request.getParameter("yx_lsdcb_jfhs");
	if (yx_lsdcb_jfhs!=null)
	{
		yx_lsdcb_jfhs=yx_lsdcb_jfhs.trim();
		if (!(yx_lsdcb_jfhs.equals("")))	wheresql+=" and (yx_lsdcb.jfhs="+yx_lsdcb_jfhs+") ";
	}
	yx_lsdcb_sfytg=request.getParameter("yx_lsdcb_sfytg");
	if (yx_lsdcb_sfytg!=null)
	{
		yx_lsdcb_sfytg=cf.GB2Uni(yx_lsdcb_sfytg);
		if (!(yx_lsdcb_sfytg.equals("")))	wheresql+=" and  (yx_lsdcb.sfytg='"+yx_lsdcb_sfytg+"')";
	}
	yx_lsdcb_khzlgmqk=request.getParameter("yx_lsdcb_khzlgmqk");
	if (yx_lsdcb_khzlgmqk!=null)
	{
		yx_lsdcb_khzlgmqk=cf.GB2Uni(yx_lsdcb_khzlgmqk);
		if (!(yx_lsdcb_khzlgmqk.equals("")))	wheresql+=" and  (yx_lsdcb.khzlgmqk='"+yx_lsdcb_khzlgmqk+"')";
	}
	yx_lsdcb_khmd=request.getParameter("yx_lsdcb_khmd");
	if (yx_lsdcb_khmd!=null)
	{
		yx_lsdcb_khmd=cf.GB2Uni(yx_lsdcb_khmd);
		if (!(yx_lsdcb_khmd.equals("")))	wheresql+=" and  (yx_lsdcb.khmd='"+yx_lsdcb_khmd+"')";
	}
	yx_lsdcb_ykfsgx=request.getParameter("yx_lsdcb_ykfsgx");
	if (yx_lsdcb_ykfsgx!=null)
	{
		yx_lsdcb_ykfsgx=cf.GB2Uni(yx_lsdcb_ykfsgx);
		if (!(yx_lsdcb_ykfsgx.equals("")))	wheresql+=" and  (yx_lsdcb.ykfsgx='"+yx_lsdcb_ykfsgx+"')";
	}
	yx_lsdcb_sfjcxc=request.getParameter("yx_lsdcb_sfjcxc");
	if (yx_lsdcb_sfjcxc!=null)
	{
		yx_lsdcb_sfjcxc=cf.GB2Uni(yx_lsdcb_sfjcxc);
		if (!(yx_lsdcb_sfjcxc.equals("")))	wheresql+=" and  (yx_lsdcb.sfjcxc='"+yx_lsdcb_sfjcxc+"')";
	}
	yx_lsdcb_khzyl=request.getParameter("yx_lsdcb_khzyl");
	if (yx_lsdcb_khzyl!=null)
	{
		yx_lsdcb_khzyl=yx_lsdcb_khzyl.trim();
		if (!(yx_lsdcb_khzyl.equals("")))	wheresql+=" and  (yx_lsdcb.khzyl="+yx_lsdcb_khzyl+") ";
	}
	yx_lsdcb_yxxcfs=request.getParameter("yx_lsdcb_yxxcfs");
	if (yx_lsdcb_yxxcfs!=null)
	{
		yx_lsdcb_yxxcfs=cf.GB2Uni(yx_lsdcb_yxxcfs);
		if (!(yx_lsdcb_yxxcfs.equals("")))	wheresql+=" and  (yx_lsdcb.yxxcfs='"+yx_lsdcb_yxxcfs+"')";
	}
	yx_lsdcb_kfs=request.getParameter("yx_lsdcb_kfs");
	if (yx_lsdcb_kfs!=null)
	{
		yx_lsdcb_kfs=cf.GB2Uni(yx_lsdcb_kfs);
		if (!(yx_lsdcb_kfs.equals("")))	wheresql+=" and  (yx_lsdcb.kfs='"+yx_lsdcb_kfs+"')";
	}
	yx_lsdcb_kfslxr=request.getParameter("yx_lsdcb_kfslxr");
	if (yx_lsdcb_kfslxr!=null)
	{
		yx_lsdcb_kfslxr=cf.GB2Uni(yx_lsdcb_kfslxr);
		if (!(yx_lsdcb_kfslxr.equals("")))	wheresql+=" and  (yx_lsdcb.kfslxr='"+yx_lsdcb_kfslxr+"')";
	}
	yx_lsdcb_kfslxrzw=request.getParameter("yx_lsdcb_kfslxrzw");
	if (yx_lsdcb_kfslxrzw!=null)
	{
		yx_lsdcb_kfslxrzw=cf.GB2Uni(yx_lsdcb_kfslxrzw);
		if (!(yx_lsdcb_kfslxrzw.equals("")))	wheresql+=" and  (yx_lsdcb.kfslxrzw='"+yx_lsdcb_kfslxrzw+"')";
	}
	yx_lsdcb_kfslxrdh=request.getParameter("yx_lsdcb_kfslxrdh");
	if (yx_lsdcb_kfslxrdh!=null)
	{
		yx_lsdcb_kfslxrdh=cf.GB2Uni(yx_lsdcb_kfslxrdh);
		if (!(yx_lsdcb_kfslxrdh.equals("")))	wheresql+=" and  (yx_lsdcb.kfslxrdh='"+yx_lsdcb_kfslxrdh+"')";
	}
	yx_lsdcb_jzs=request.getParameter("yx_lsdcb_jzs");
	if (yx_lsdcb_jzs!=null)
	{
		yx_lsdcb_jzs=cf.GB2Uni(yx_lsdcb_jzs);
		if (!(yx_lsdcb_jzs.equals("")))	wheresql+=" and  (yx_lsdcb.jzs='"+yx_lsdcb_jzs+"')";
	}
	yx_lsdcb_xss=request.getParameter("yx_lsdcb_xss");
	if (yx_lsdcb_xss!=null)
	{
		yx_lsdcb_xss=cf.GB2Uni(yx_lsdcb_xss);
		if (!(yx_lsdcb_xss.equals("")))	wheresql+=" and  (yx_lsdcb.xss='"+yx_lsdcb_xss+"')";
	}
	yx_lsdcb_sldh=request.getParameter("yx_lsdcb_sldh");
	if (yx_lsdcb_sldh!=null)
	{
		yx_lsdcb_sldh=cf.GB2Uni(yx_lsdcb_sldh);
		if (!(yx_lsdcb_sldh.equals("")))	wheresql+=" and  (yx_lsdcb.sldh='"+yx_lsdcb_sldh+"')";
	}
	yx_lsdcb_ywzxgs=request.getParameter("yx_lsdcb_ywzxgs");
	if (yx_lsdcb_ywzxgs!=null)
	{
		yx_lsdcb_ywzxgs=cf.GB2Uni(yx_lsdcb_ywzxgs);
		if (!(yx_lsdcb_ywzxgs.equals("")))	wheresql+=" and  (yx_lsdcb.ywzxgs='"+yx_lsdcb_ywzxgs+"')";
	}
	yx_lsdcb_zxgssl=request.getParameter("yx_lsdcb_zxgssl");
	if (yx_lsdcb_zxgssl!=null)
	{
		yx_lsdcb_zxgssl=yx_lsdcb_zxgssl.trim();
		if (!(yx_lsdcb_zxgssl.equals("")))	wheresql+=" and (yx_lsdcb.zxgssl="+yx_lsdcb_zxgssl+") ";
	}
	yx_lsdcb_yzxhs=request.getParameter("yx_lsdcb_yzxhs");
	if (yx_lsdcb_yzxhs!=null)
	{
		yx_lsdcb_yzxhs=yx_lsdcb_yzxhs.trim();
		if (!(yx_lsdcb_yzxhs.equals("")))	wheresql+=" and (yx_lsdcb.yzxhs="+yx_lsdcb_yzxhs+") ";
	}
	yx_lsdcb_sftizxq=request.getParameter("yx_lsdcb_sftizxq");
	if (yx_lsdcb_sftizxq!=null)
	{
		yx_lsdcb_sftizxq=cf.GB2Uni(yx_lsdcb_sftizxq);
		if (!(yx_lsdcb_sftizxq.equals("")))	wheresql+=" and  (yx_lsdcb.sftizxq='"+yx_lsdcb_sftizxq+"')";
	}
	yx_lsdcb_yjzxsj=request.getParameter("yx_lsdcb_yjzxsj");
	if (yx_lsdcb_yjzxsj!=null)
	{
		yx_lsdcb_yjzxsj=yx_lsdcb_yjzxsj.trim();
		if (!(yx_lsdcb_yjzxsj.equals("")))	wheresql+="  and (yx_lsdcb.yjzxsj=TO_DATE('"+yx_lsdcb_yjzxsj+"','YYYY/MM/DD'))";
	}
	yx_lsdcb_ywwygs=request.getParameter("yx_lsdcb_ywwygs");
	if (yx_lsdcb_ywwygs!=null)
	{
		yx_lsdcb_ywwygs=cf.GB2Uni(yx_lsdcb_ywwygs);
		if (!(yx_lsdcb_ywwygs.equals("")))	wheresql+=" and  (yx_lsdcb.ywwygs='"+yx_lsdcb_ywwygs+"')";
	}
	yx_lsdcb_wygsmc=request.getParameter("yx_lsdcb_wygsmc");
	if (yx_lsdcb_wygsmc!=null)
	{
		yx_lsdcb_wygsmc=cf.GB2Uni(yx_lsdcb_wygsmc);
		if (!(yx_lsdcb_wygsmc.equals("")))	wheresql+=" and  (yx_lsdcb.wygsmc='"+yx_lsdcb_wygsmc+"')";
	}
	yx_lsdcb_wyfzr=request.getParameter("yx_lsdcb_wyfzr");
	if (yx_lsdcb_wyfzr!=null)
	{
		yx_lsdcb_wyfzr=cf.GB2Uni(yx_lsdcb_wyfzr);
		if (!(yx_lsdcb_wyfzr.equals("")))	wheresql+=" and  (yx_lsdcb.wyfzr='"+yx_lsdcb_wyfzr+"')";
	}
	yx_lsdcb_wydh=request.getParameter("yx_lsdcb_wydh");
	if (yx_lsdcb_wydh!=null)
	{
		yx_lsdcb_wydh=cf.GB2Uni(yx_lsdcb_wydh);
		if (!(yx_lsdcb_wydh.equals("")))	wheresql+=" and  (yx_lsdcb.wydh='"+yx_lsdcb_wydh+"')";
	}
	yx_lsdcb_wylxr=request.getParameter("yx_lsdcb_wylxr");
	if (yx_lsdcb_wylxr!=null)
	{
		yx_lsdcb_wylxr=cf.GB2Uni(yx_lsdcb_wylxr);
		if (!(yx_lsdcb_wylxr.equals("")))	wheresql+=" and  (yx_lsdcb.wylxr='"+yx_lsdcb_wylxr+"')";
	}
	yx_lsdcb_wylxrzw=request.getParameter("yx_lsdcb_wylxrzw");
	if (yx_lsdcb_wylxrzw!=null)
	{
		yx_lsdcb_wylxrzw=cf.GB2Uni(yx_lsdcb_wylxrzw);
		if (!(yx_lsdcb_wylxrzw.equals("")))	wheresql+=" and  (yx_lsdcb.wylxrzw='"+yx_lsdcb_wylxrzw+"')";
	}
	yx_lsdcb_kfjd=request.getParameter("yx_lsdcb_kfjd");
	if (yx_lsdcb_kfjd!=null)
	{
		yx_lsdcb_kfjd=cf.GB2Uni(yx_lsdcb_kfjd);
		if (!(yx_lsdcb_kfjd.equals("")))	wheresql+=" and  (yx_lsdcb.kfjd='"+yx_lsdcb_kfjd+"')";
	}
	yx_lsdcb_lrr=request.getParameter("yx_lsdcb_lrr");
	if (yx_lsdcb_lrr!=null)
	{
		yx_lsdcb_lrr=cf.GB2Uni(yx_lsdcb_lrr);
		if (!(yx_lsdcb_lrr.equals("")))	wheresql+=" and  (yx_lsdcb.lrr='"+yx_lsdcb_lrr+"')";
	}
	yx_lsdcb_lrsj=request.getParameter("yx_lsdcb_lrsj");
	if (yx_lsdcb_lrsj!=null)
	{
		yx_lsdcb_lrsj=yx_lsdcb_lrsj.trim();
		if (!(yx_lsdcb_lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj>=TO_DATE('"+yx_lsdcb_lrsj+"','YYYY/MM/DD'))";
	}
	yx_lsdcb_lrsj=request.getParameter("yx_lsdcb_lrsj2");
	if (yx_lsdcb_lrsj!=null)
	{
		yx_lsdcb_lrsj=yx_lsdcb_lrsj.trim();
		if (!(yx_lsdcb_lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj<=TO_DATE('"+yx_lsdcb_lrsj+"','YYYY/MM/DD'))";
	}
	yx_lsdcb_fgsbh=request.getParameter("yx_lsdcb_fgsbh");
	if (yx_lsdcb_fgsbh!=null)
	{
		yx_lsdcb_fgsbh=cf.GB2Uni(yx_lsdcb_fgsbh);
		if (!(yx_lsdcb_fgsbh.equals("")))	wheresql+=" and  (yx_lsdcb.fgsbh='"+yx_lsdcb_fgsbh+"')";
	}
	ls_sql="SELECT yx_lsdcb.xqbh, DECODE(yx_lsdcb.kfjd,'1','未开发','2','已申请','3','已批准','4','未批准','5','已完成'), DECODE(yx_lsdcb.dysfwc,'N','未完成','Y','完成'),yx_lsdcb.xqmc,yx_lsdcb.dz,b.dwmc tjdm,yx_lsdcb.ywy,yx_lsdcb.jw, DECODE(yx_lsdcb.yzxfsp,'高档','高档','中高档','中高档','中档','中档','低档','低档'), DECODE(yx_lsdcb.xz,'商品房','商品房','经济适用房','经济适用房','集资房','集资房','回迁房','回迁房','商住两用房','商住两用房','别墅','别墅'),yx_lsdcb.wyxs,yx_lsdcb.xqgm,yx_lsdcb.hxzl,yx_lsdcb.zlhx,yx_lsdcb.zlhxmj,yx_lsdcb.xqfzr,yx_lsdcb.xqfzrdh,yx_lsdcb.lxsj,yx_lsdcb.xsfs,yx_lsdcb.fyssj,yx_lsdcb.jfhs, DECODE(yx_lsdcb.sfytg,'Y','有','N','无'), DECODE(yx_lsdcb.khzlgmqk,'公司购买','公司购买','员工购买','员工购买'), DECODE(yx_lsdcb.khmd,'一手','一手','二手','二手','专业名单','专业名单'), DECODE(yx_lsdcb.sfjcxc,'Y','是','N','否'),yx_lsdcb.khzyl,yx_lsdcb.yxxcfs,yx_lsdcb.kfs,yx_lsdcb.kfslxr,yx_lsdcb.kfslxrzw,yx_lsdcb.kfslxrdh,yx_lsdcb.jzs,yx_lsdcb.xss,yx_lsdcb.sldh, DECODE(yx_lsdcb.ywzxgs,'Y','有','N','无'),yx_lsdcb.zxgssl,yx_lsdcb.yzxhs,yx_lsdcb.sftizxq,yx_lsdcb.yjzxsj, DECODE(yx_lsdcb.ywwygs,'Y','有','N','无'),yx_lsdcb.wygsmc,yx_lsdcb.wyfzr,yx_lsdcb.wydh,yx_lsdcb.wylxr,yx_lsdcb.wylxrzw,yx_lsdcb.lrr,yx_lsdcb.lrsj,a.dwmc fgs ";
	ls_sql+=" FROM yx_lsdcb,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where yx_lsdcb.fgsbh=a.dwbh(+) and  yx_lsdcb.tjdm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and yx_lsdcb.dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and yx_lsdcb.dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.dwbh=sq_dwxx.dwbh and ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_lsdcbJlList.jsp","","","EditYx_lsdcb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xqbh","yx_lsdcb_xqmc","yx_lsdcb_dqbm","yx_lsdcb_cqbm","yx_lsdcb_dz","yx_lsdcb_cclx","yx_lsdcb_tjdm","yx_lsdcb_jw","yx_lsdcb_yzxfsp","yx_lsdcb_xz","yx_lsdcb_wyxs","yx_lsdcb_xqgm","yx_lsdcb_hxzl","yx_lsdcb_zlhx","yx_lsdcb_zlhxmj","yx_lsdcb_ywy","yx_lsdcb_dysfwc","yx_lsdcb_xqfzr","yx_lsdcb_xqfzrdh","yx_lsdcb_xqzhpj","yx_lsdcb_lxsj","yx_lsdcb_xsfs","yx_lsdcb_fyssj","yx_lsdcb_jfhs","yx_lsdcb_sfytg","yx_lsdcb_xszk","yx_lsdcb_khzlgmqk","yx_lsdcb_khmd","yx_lsdcb_ykfsgx","yx_lsdcb_sfjcxc","yx_lsdcb_khzyl","yx_lsdcb_yxxcfs","yx_lsdcb_kfjy","yx_lsdcb_kfs","yx_lsdcb_kfslxr","yx_lsdcb_kfslxrzw","yx_lsdcb_kfslxrdh","yx_lsdcb_jzs","yx_lsdcb_xss","yx_lsdcb_sldh","yx_lsdcb_ywzxgs","yx_lsdcb_zxgssl","yx_lsdcb_yzxhs","yx_lsdcb_sftizxq","yx_lsdcb_yjzxsj","yx_lsdcb_ywwygs","yx_lsdcb_wygsmc","yx_lsdcb_wyfzr","yx_lsdcb_wydh","yx_lsdcb_wylxr","yx_lsdcb_wylxrzw","yx_lsdcb_kfjd","yx_lsdcb_lrr","yx_lsdcb_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xqbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yx_lsdcbJlList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xqbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/yx/lpgl/ViewYx_lsdcb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xqbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] cqbm = request.getParameterValues("xqbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cqbm,"xqbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[6];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from yx_lpggxcqk where "+chooseitem;
		sql[1]="delete from yx_lptgqk where "+chooseitem;
		sql[2]="delete from yx_lpjzdsqk where "+chooseitem;
		sql[3]="delete from yx_xqcxhdgl where "+chooseitem;
		sql[4]="delete from yx_xqhdfygl where "+chooseitem;
		sql[5]="delete from yx_lsdcb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">维护楼盘信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(700);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="1%">小区编号</td>
	<td  width="1%">开发进度</td>
	<td  width="1%">调研是否完成</td>
	<td  width="3%">小区名称</td>
	<td  width="4%">地址</td>
	<td  width="2%">推荐店面</td>
	<td  width="1%">业务员</td>
	<td  width="2%">价位</td>
	<td  width="2%">楼盘定位</td>
	<td  width="2%">楼盘性质</td>
	<td  width="2%">物业形式</td>
	<td  width="3%">小区规模</td>
	<td  width="2%">户型种类</td>
	<td  width="2%">主力户型</td>
	<td  width="2%">主力户型面积</td>
	<td  width="2%">小区负责人</td>
	<td  width="2%">小区负责人电话</td>
	<td  width="2%">开盘时间</td>
	<td  width="2%">销售方式</td>
	<td  width="2%">交钥匙时间</td>
	<td  width="2%">交房户数</td>
	<td  width="1%">是否有团购</td>
	<td  width="2%">客户资料购买情况</td>
	<td  width="2%">客户名单</td>
	<td  width="1%">是否进场宣传</td>
	<td  width="1%">客户占有率</td>
	<td  width="3%">允许宣传方式</td>
	<td  width="4%">开发商</td>
	<td  width="2%">开发商联系人</td>
	<td  width="2%">开发商联系人职务</td>
	<td  width="3%">开发商联系人电话</td>
	<td  width="4%">建筑商</td>
	<td  width="4%">销售商</td>
	<td  width="4%">售楼电话</td>
	<td  width="1%">有无装修公司</td>
	<td  width="1%">装修公司数量</td>
	<td  width="1%">已装修户数</td>
	<td  width="1%">是否统一装修期</td>
	<td  width="2%">预计装修时间</td>
	<td  width="1%">有无物业公司</td>
	<td  width="3%">物业公司名称</td>
	<td  width="1%">物业负责人</td>
	<td  width="3%">物业电话</td>
	<td  width="2%">物业联系人</td>
	<td  width="2%">物业联系人职务</td>
	<td  width="1%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">分公司</td>
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