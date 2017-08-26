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

	String rwsfwc=null;
	rwsfwc=request.getParameter("rwsfwc");
	if (rwsfwc!=null)
	{
		rwsfwc=cf.GB2Uni(rwsfwc);
		if (!(rwsfwc.equals("")))	wheresql+=" and  (crm_khsgjhb.rwsfwc='"+rwsfwc+"')";
	}

	String sfyq=null;
	sfyq=request.getParameter("sfyq");
	if (sfyq!=null)
	{
		sfyq=cf.GB2Uni(sfyq);
		if (sfyq.equals("Y"))
		{
			wheresql+=" and ( (crm_khsgjhb.rwsfwc='N' and crm_khsgjhb.zxjhjssj<SYSDATE) OR (crm_khsgjhb.rwsfwc='Y' and crm_khsgjhb.zxjhjssj<crm_khsgjhb.sjjssj)  )";
		}
		else if (sfyq.equals("N"))
		{
			wheresql+=" and ( (crm_khsgjhb.rwsfwc='N' and crm_khsgjhb.zxjhjssj>=TRUNC(SYSDATE)) OR (crm_khsgjhb.rwsfwc='Y' and crm_khsgjhb.zxjhjssj>=crm_khsgjhb.sjjssj)  )";
		}
	}

	String zxjhkssj=null;
	zxjhkssj=request.getParameter("zxjhkssj");
	if (zxjhkssj!=null)
	{
		zxjhkssj=cf.GB2Uni(zxjhkssj);
		if (!(zxjhkssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhkssj>=TO_DATE('"+zxjhkssj+"','YYYY-MM-DD'))";
	}
	zxjhkssj=request.getParameter("zxjhkssj2");
	if (zxjhkssj!=null)
	{
		zxjhkssj=cf.GB2Uni(zxjhkssj);
		if (!(zxjhkssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhkssj<=TO_DATE('"+zxjhkssj+"','YYYY-MM-DD'))";
	}

	String zxjhjssj=null;
	zxjhjssj=request.getParameter("zxjhjssj");
	if (zxjhjssj!=null)
	{
		zxjhjssj=cf.GB2Uni(zxjhjssj);
		if (!(zxjhjssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhjssj>=TO_DATE('"+zxjhjssj+"','YYYY-MM-DD'))";
	}
	zxjhjssj=request.getParameter("zxjhjssj2");
	if (zxjhjssj!=null)
	{
		zxjhjssj=cf.GB2Uni(zxjhjssj);
		if (!(zxjhjssj.equals("")))	wheresql+=" and  (crm_khsgjhb.zxjhjssj<=TO_DATE('"+zxjhjssj+"','YYYY-MM-DD'))";
	}

	ls_sql="SELECT khxm,fwdz,sgdmc,zjxm,sjs,crm_khsgjhb.rwxh,crm_khsgjhb.rwmc,DECODE(crm_khsgjhb.rwsfwc,'Y','完成','N','否'),crm_khsgjhb.zxjhkssj,crm_khsgjhb.zxjhjssj,crm_khsgjhb.sjkssj,crm_khsgjhb.sjjssj,crm_khxx.khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,crm_khsgjhb ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khxx.khbh=crm_khsgjhb.khbh";
	ls_sql+=" and crm_khxx.zt='2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	 ls_sql+=" order by crm_khxx.khbh desc,crm_khsgjhb.rwxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化

	pageObj.initPage("Crm_khsgjhbCxList.jsp","","/khxx/ViewCrm_khsgjhb.jsp","");
	pageObj.setPageRow(80);//设置每页显示记录数

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询进度明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="5%">施工队</td>
	<td  width="5%">质检员</td>
	<td  width="5%">设计师</td>
	<td  width="4%">任务序号</td>
	<td  width="20%">任务名称</td>
	<td  width="5%">任务是否完成</td>
	<td  width="6%">计划开始时间</td>
	<td  width="6%">计划结束时间</td>
	<td  width="6%">实际开始时间</td>
	<td  width="6%">实际结束时间</td>
	<td  width="6%">客户编号</td>
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