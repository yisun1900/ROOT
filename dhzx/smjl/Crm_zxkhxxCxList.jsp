<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String qsjhtbz=null;
	qsjhtbz=request.getParameter("qsjhtbz");
	if (qsjhtbz!=null)
	{
		qsjhtbz=cf.GB2Uni(qsjhtbz);
		if (!(qsjhtbz.equals("")))	wheresql+=" and  (crm_zxkhxx.qsjhtbz='"+qsjhtbz+"')";
	}
	String qsjhtsj=null;
	qsjhtsj=request.getParameter("qsjhtsj");
	if (qsjhtsj!=null)
	{
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj>=TO_DATE('"+qsjhtsj+"','YYYY-MM-DD'))";
	}
	qsjhtsj=request.getParameter("qsjhtsj2");
	if (qsjhtsj!=null)
	{
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj<=TO_DATE('"+qsjhtsj+"','YYYY-MM-DD'))";
	}
	String sfqd=null;
	sfqd=request.getParameter("sfqd");
	if (sfqd!=null)
	{
		
		if (sfqd.equals("1"))
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('0','1','5') )";
		}
		else if (sfqd.equals("2"))//签单
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('3') )";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		}
		else if (sfqd.equals("3"))//失败
		{
			wheresql+=" and  (crm_zxkhxx.zxzt in('2','4') )";
		}
	}



	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}

	String khbh=null;
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}


	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}


	String sfxhf=null;
	String hfrq=null;

	sfxhf=request.getParameter("sfxhf");
	if (sfxhf!=null)
	{
		sfxhf=cf.GB2Uni(sfxhf);
		if (!(sfxhf.equals("")))	wheresql+=" and  (crm_zxkhxx.sfxhf='"+sfxhf+"')";
	}
	hfrq=request.getParameter("hfrq");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq>=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	hfrq=request.getParameter("hfrq2");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq<=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String xqlx=null;
	xqlx=request.getParameter("xqlx");
	if (xqlx!=null)
	{
		xqlx=cf.GB2Uni(xqlx);
		if (!(xqlx.equals("")))	wheresql+=" and  (crm_zxkhxx.xqlx='"+xqlx+"')";
	}
	String khzyxz=null;
	khzyxz=request.getParameter("khzyxz");
	if (khzyxz!=null)
	{
		khzyxz=cf.GB2Uni(khzyxz);
		if (!(khzyxz.equals("")))	wheresql+=" and  (crm_zxkhxx.khzyxz='"+khzyxz+"')";
	}


	String lfdjbz=null;
	lfdjbz=request.getParameter("lfdjbz");
	if (lfdjbz!=null)
	{
		if (!(lfdjbz.equals("")))	wheresql+=" and  (crm_zxkhxx.lfdjbz='"+lfdjbz+"')";
	}
	String jlfdjsj=null;
	jlfdjsj=request.getParameter("jlfdjsj");
	if (jlfdjsj!=null)
	{
		if (!(jlfdjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jlfdjsj>=TO_DATE('"+jlfdjsj+"','YYYY-MM-DD'))";
	}
	jlfdjsj=request.getParameter("jlfdjsj2");
	if (jlfdjsj!=null)
	{
		if (!(jlfdjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jlfdjsj<=TO_DATE('"+jlfdjsj+"','YYYY-MM-DD'))";
	}
	String hddjbz=null;
	hddjbz=request.getParameter("hddjbz");
	if (hddjbz!=null)
	{
		if (!(hddjbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hddjbz='"+hddjbz+"')";
	}
	String jhddjsj=null;
	jhddjsj=request.getParameter("jhddjsj");
	if (jhddjsj!=null)
	{
		if (!(jhddjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhddjsj>=TO_DATE('"+jhddjsj+"','YYYY-MM-DD'))";
	}
	jhddjsj=request.getParameter("jhddjsj2");
	if (jhddjsj!=null)
	{
		if (!(jhddjsj.equals("")))	wheresql+="  and (crm_zxkhxx.jhddjsj<=TO_DATE('"+jhddjsj+"','YYYY-MM-DD'))";
	}
	String sjfbz=null;
	sjfbz=request.getParameter("sjfbz");
	if (sjfbz!=null)
	{
		if (!(sjfbz.equals("")))	wheresql+=" and  (crm_zxkhxx.sjfbz='"+sjfbz+"')";
	}
	String jsjfsj=null;
	jsjfsj=request.getParameter("jsjfsj");
	if (jsjfsj!=null)
	{
		if (!(jsjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jsjfsj>=TO_DATE('"+jsjfsj+"','YYYY-MM-DD'))";
	}
	jsjfsj=request.getParameter("jsjfsj2");
	if (jsjfsj!=null)
	{
		if (!(jsjfsj.equals("")))	wheresql+="  and (crm_zxkhxx.jsjfsj<=TO_DATE('"+jsjfsj+"','YYYY-MM-DD'))";
	}
	
	String ctbz=null;
	ctbz=request.getParameter("ctbz");
	if (ctbz!=null)
	{
		ctbz=cf.GB2Uni(ctbz);
		if (!(ctbz.equals("")))	wheresql+=" and  (crm_zxkhxx.ctbz='"+ctbz+"')";
	}
	String ctsj=null;
	ctsj=request.getParameter("ctsj");
	if (ctsj!=null)
	{
		ctsj=ctsj.trim();
		if (!(ctsj.equals("")))	wheresql+="  and (crm_zxkhxx.ctsj>=TO_DATE('"+ctsj+"','YYYY-MM-DD'))";
	}
	ctsj=request.getParameter("ctsj2");
	if (ctsj!=null)
	{
		ctsj=ctsj.trim();
		if (!(ctsj.equals("")))	wheresql+="  and (crm_zxkhxx.ctsj<=TO_DATE('"+ctsj+"','YYYY-MM-DD'))";
	}

	String lfbz=null;
	lfbz=request.getParameter("lfbz");
	if (lfbz!=null)
	{
		lfbz=cf.GB2Uni(lfbz);
		if (!(lfbz.equals("")))	wheresql+=" and  (crm_zxkhxx.lfbz='"+lfbz+"')";
	}
	String lfsj=null;
	lfsj=request.getParameter("lfsj");
	if (lfsj!=null)
	{
		lfsj=lfsj.trim();
		if (!(lfsj.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj>=TO_DATE('"+lfsj+"','YYYY-MM-DD'))";
	}
	lfsj=request.getParameter("lfsj2");
	if (lfsj!=null)
	{
		lfsj=lfsj.trim();
		if (!(lfsj.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj<=TO_DATE('"+lfsj+"','YYYY-MM-DD'))";
	}
	String zjsmsj=null;
	zjsmsj=request.getParameter("zjsmsj");
	if (zjsmsj!=null)
	{
		zjsmsj=zjsmsj.trim();
		if (!(zjsmsj.equals("")))	wheresql+="  and (crm_zxkhxx.zjsmsj>=TO_DATE('"+zjsmsj+"','YYYY-MM-DD'))";
	}
	zjsmsj=request.getParameter("zjsmsj2");
	if (zjsmsj!=null)
	{
		zjsmsj=zjsmsj.trim();
		if (!(zjsmsj.equals("")))	wheresql+="  and (crm_zxkhxx.zjsmsj<=TO_DATE('"+zjsmsj+"','YYYY-MM-DD'))";
	}
	String xclfsj=null;
	xclfsj=request.getParameter("xclfsj");
	if (xclfsj!=null)
	{
		xclfsj=xclfsj.trim();
		if (!(xclfsj.equals("")))	wheresql+="  and (crm_zxkhxx.xclfsj>=TO_DATE('"+xclfsj+"','YYYY-MM-DD'))";
	}
	xclfsj=request.getParameter("xclfsj2");
	if (xclfsj!=null)
	{
		xclfsj=xclfsj.trim();
		if (!(xclfsj.equals("")))	wheresql+="  and (crm_zxkhxx.xclfsj<=TO_DATE('"+xclfsj+"','YYYY-MM-DD'))";
	}

	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxkhxx.fwdz,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as zxzt,crm_zxkhxx.hfrq,crm_zxkhxx.zxhfsj,khjl,sjs,ywy,xqlx,khzyxz,sbyymc,sbsj,lrsj,dwmc,crm_zxkhxx.khbh ";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx,dm_sbyybm ";
    ls_sql+=" where  crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
    ls_sql+=" and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and zxzt in('1','2','5')";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxCxList.jsp","","","InsertCrm_khsmjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","fwlxbm","sfxhf","hfrq","hflxbm","hdbz","zxzt","khlxbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("录入");
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">客户上门记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="7%">咨询状态</td>
	<td  width="6%">设置回访日期</td>
	<td  width="6%">上次回访日期</td>
	<td  width="4%">客户经理</td>
	<td  width="4%">设计师</td>
	<td  width="4%">业务员</td>
	<td  width="5%">小区类型</td>
	<td  width="5%">客户资源性质</td>
	<td  width="7%">失败原因</td>
	<td  width="6%">失败时间</td>
	<td  width="6%">录入时间</td>
	<td  width="8%">咨询店面</td>
	<td  width="5%">客户编号</td>
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