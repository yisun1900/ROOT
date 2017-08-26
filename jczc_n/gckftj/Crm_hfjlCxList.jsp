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
	String crm_hfjl_hfjlh=null;
	String crm_hfjl_hflxbm=null;
	String crm_hfjl_khbh=null;
	String crm_hfjl_sjfa=null;
	String crm_hfjl_hqfw=null;
	String crm_hfjl_jdqk=null;
	String crm_hfjl_zjyfw=null;
	String crm_hfjl_zjydw=null;
	String crm_hfjl_zjyjz=null;
	String crm_hfjl_fwsz=null;
	String crm_hfjl_sgzl=null;
	String crm_hfjl_grsz=null;
	String crm_hfjl_sfjxhf=null;
	String crm_hfjl_xchfrq=null;
	String crm_hfjl_xchflxbm=null;
	String crm_hfjl_clfs=null;
	String crm_hfjl_dwbh=null;
	String crm_hfjl_hfsj=null;
	String crm_hfjl_hfr=null;
	String crm_khxx_sjs=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sgd=null;
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (crm_khxx.xmzy='"+xmzy+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	String jglxbm=null;
	jglxbm=request.getParameter("jglxbm");
	if (jglxbm!=null)
	{
		jglxbm=cf.GB2Uni(jglxbm);
		if (!(jglxbm.equals("")))	wheresql+=" and  (crm_hfjl.jglxbm='"+jglxbm+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";

	String hfbm=null;
	hfbm=request.getParameter("hfbm");
	if (hfbm!=null)
	{
		if (!(hfbm.equals("")))	wheresql+=" and  (crm_hfjl.hfbm='"+hfbm+"')";
	}

	String jcjjsjs=null;
	jcjjsjs=request.getParameter("jcjjsjs");
	if (jcjjsjs!=null)
	{
		if (!(jcjjsjs.equals("")))	wheresql+=" and  (crm_hfjl.jcjjsjs='"+jcjjsjs+"')";
	}
	String jsjjgw=null;
	jsjjgw=request.getParameter("jsjjgw");
	if (jsjjgw!=null)
	{
		if (!(jsjjgw.equals("")))	wheresql+=" and  (crm_hfjl.jsjjgw='"+jsjjgw+"')";
	}
	String jcxmzy=null;
	jcxmzy=request.getParameter("jcxmzy");
	if (jcxmzy!=null)
	{
		if (!(jcxmzy.equals("")))	wheresql+=" and  (crm_hfjl.jcxmzy='"+jcxmzy+"')";
	}
	String jcshaz=null;
	jcshaz=request.getParameter("jcshaz");
	if (jcshaz!=null)
	{
		if (!(jcshaz.equals("")))	wheresql+=" and  (crm_hfjl.jcshaz='"+jcshaz+"')";
	}
	String jccpzl=null;
	jccpzl=request.getParameter("jccpzl");
	if (jccpzl!=null)
	{
		if (!(jccpzl.equals("")))	wheresql+=" and  (crm_hfjl.jccpzl='"+jccpzl+"')";
	}

	String sjshfnr=null;
	sjshfnr=request.getParameter("sjshfnr");
	if (sjshfnr!=null)
	{
		sjshfnr=cf.GB2Uni(sjshfnr);
		if (!(sjshfnr.equals("")))	wheresql+=" and  (crm_hfjl.sjshfnr like '%"+sjshfnr+"%')";
	}
	String zjyhfnr=null;
	zjyhfnr=request.getParameter("zjyhfnr");
	if (zjyhfnr!=null)
	{
		zjyhfnr=cf.GB2Uni(zjyhfnr);
		if (!(zjyhfnr.equals("")))	wheresql+=" and  (crm_hfjl.zjyhfnr like '%"+zjyhfnr+"%')";
	}
	String sgdhfnr=null;
	sgdhfnr=request.getParameter("sgdhfnr");
	if (sgdhfnr!=null)
	{
		sgdhfnr=cf.GB2Uni(sgdhfnr);
		if (!(sgdhfnr.equals("")))	wheresql+=" and  (crm_hfjl.sgdhfnr like '%"+sgdhfnr+"%')";
	}
	String jchfnr=null;
	jchfnr=request.getParameter("jchfnr");
	if (jchfnr!=null)
	{
		jchfnr=cf.GB2Uni(jchfnr);
		if (!(jchfnr.equals("")))	wheresql+=" and  (crm_hfjl.jchfnr like '%"+jchfnr+"%')";
	}

	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		if (!(clzt.equals("")))	wheresql+=" and  (crm_gchffkbm.clzt='"+clzt+"')";
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
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}

	crm_hfjl_hfjlh=request.getParameter("crm_hfjl_hfjlh");
	if (crm_hfjl_hfjlh!=null)
	{
		crm_hfjl_hfjlh=crm_hfjl_hfjlh.trim();
		if (!(crm_hfjl_hfjlh.equals("")))	wheresql+=" and (crm_hfjl.hfjlh="+crm_hfjl_hfjlh+") ";
	}
	crm_hfjl_hflxbm=request.getParameter("crm_hfjl_hflxbm");
	if (crm_hfjl_hflxbm!=null)
	{
		crm_hfjl_hflxbm=cf.GB2Uni(crm_hfjl_hflxbm);
		if (!(crm_hfjl_hflxbm.equals("")))	wheresql+=" and  (crm_hfjl.hflxbm='"+crm_hfjl_hflxbm+"')";
	}
	crm_hfjl_khbh=request.getParameter("crm_hfjl_khbh");
	if (crm_hfjl_khbh!=null)
	{
		crm_hfjl_khbh=cf.GB2Uni(crm_hfjl_khbh);
		if (!(crm_hfjl_khbh.equals("")))	wheresql+=" and  (crm_hfjl.khbh='"+crm_hfjl_khbh+"')";
	}
	crm_hfjl_sjfa=request.getParameter("crm_hfjl_sjfa");
	if (crm_hfjl_sjfa!=null)
	{
		crm_hfjl_sjfa=cf.GB2Uni(crm_hfjl_sjfa);
		if (!(crm_hfjl_sjfa.equals("")))	wheresql+=" and  (crm_hfjl.sjfa='"+crm_hfjl_sjfa+"')";
	}
	crm_hfjl_hqfw=request.getParameter("crm_hfjl_hqfw");
	if (crm_hfjl_hqfw!=null)
	{
		crm_hfjl_hqfw=cf.GB2Uni(crm_hfjl_hqfw);
		if (!(crm_hfjl_hqfw.equals("")))	wheresql+=" and  (crm_hfjl.hqfw='"+crm_hfjl_hqfw+"')";
	}
	crm_hfjl_jdqk=request.getParameter("crm_hfjl_jdqk");
	if (crm_hfjl_jdqk!=null)
	{
		crm_hfjl_jdqk=cf.GB2Uni(crm_hfjl_jdqk);
		if (!(crm_hfjl_jdqk.equals("")))	wheresql+=" and  (crm_hfjl.jdqk='"+crm_hfjl_jdqk+"')";
	}
	crm_hfjl_zjyfw=request.getParameter("crm_hfjl_zjyfw");
	if (crm_hfjl_zjyfw!=null)
	{
		crm_hfjl_zjyfw=cf.GB2Uni(crm_hfjl_zjyfw);
		if (!(crm_hfjl_zjyfw.equals("")))	wheresql+=" and  (crm_hfjl.zjyfw='"+crm_hfjl_zjyfw+"')";
	}
	crm_hfjl_zjydw=request.getParameter("crm_hfjl_zjydw");
	if (crm_hfjl_zjydw!=null)
	{
		crm_hfjl_zjydw=cf.GB2Uni(crm_hfjl_zjydw);
		if (!(crm_hfjl_zjydw.equals("")))	wheresql+=" and  (crm_hfjl.zjydw='"+crm_hfjl_zjydw+"')";
	}
	crm_hfjl_zjyjz=request.getParameter("crm_hfjl_zjyjz");
	if (crm_hfjl_zjyjz!=null)
	{
		crm_hfjl_zjyjz=cf.GB2Uni(crm_hfjl_zjyjz);
		if (!(crm_hfjl_zjyjz.equals("")))	wheresql+=" and  (crm_hfjl.zjyjz='"+crm_hfjl_zjyjz+"')";
	}
	crm_hfjl_fwsz=request.getParameter("crm_hfjl_fwsz");
	if (crm_hfjl_fwsz!=null)
	{
		crm_hfjl_fwsz=cf.GB2Uni(crm_hfjl_fwsz);
		if (!(crm_hfjl_fwsz.equals("")))	wheresql+=" and  (crm_hfjl.fwsz='"+crm_hfjl_fwsz+"')";
	}
	crm_hfjl_sgzl=request.getParameter("crm_hfjl_sgzl");
	if (crm_hfjl_sgzl!=null)
	{
		crm_hfjl_sgzl=cf.GB2Uni(crm_hfjl_sgzl);
		if (!(crm_hfjl_sgzl.equals("")))	wheresql+=" and  (crm_hfjl.sgzl='"+crm_hfjl_sgzl+"')";
	}
	crm_hfjl_grsz=request.getParameter("crm_hfjl_grsz");
	if (crm_hfjl_grsz!=null)
	{
		crm_hfjl_grsz=cf.GB2Uni(crm_hfjl_grsz);
		if (!(crm_hfjl_grsz.equals("")))	wheresql+=" and  (crm_hfjl.grsz='"+crm_hfjl_grsz+"')";
	}
	crm_hfjl_sfjxhf=request.getParameter("crm_hfjl_sfjxhf");
	if (crm_hfjl_sfjxhf!=null)
	{
		crm_hfjl_sfjxhf=cf.GB2Uni(crm_hfjl_sfjxhf);
		if (!(crm_hfjl_sfjxhf.equals("")))	wheresql+=" and  (crm_hfjl.sfjxhf='"+crm_hfjl_sfjxhf+"')";
	}
	crm_hfjl_xchfrq=request.getParameter("crm_hfjl_xchfrq");
	if (crm_hfjl_xchfrq!=null)
	{
		crm_hfjl_xchfrq=crm_hfjl_xchfrq.trim();
		if (!(crm_hfjl_xchfrq.equals("")))	wheresql+="  and (crm_hfjl.xchfrq>=TO_DATE('"+crm_hfjl_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_hfjl_xchfrq=request.getParameter("crm_hfjl_xchfrq2");
	if (crm_hfjl_xchfrq!=null)
	{
		crm_hfjl_xchfrq=crm_hfjl_xchfrq.trim();
		if (!(crm_hfjl_xchfrq.equals("")))	wheresql+="  and (crm_hfjl.xchfrq<=TO_DATE('"+crm_hfjl_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_hfjl_xchflxbm=request.getParameter("crm_hfjl_xchflxbm");
	if (crm_hfjl_xchflxbm!=null)
	{
		crm_hfjl_xchflxbm=cf.GB2Uni(crm_hfjl_xchflxbm);
		if (!(crm_hfjl_xchflxbm.equals("")))	wheresql+=" and  (crm_hfjl.xchflxbm='"+crm_hfjl_xchflxbm+"')";
	}
	crm_hfjl_clfs=request.getParameter("crm_hfjl_clfs");
	if (crm_hfjl_clfs!=null)
	{
		crm_hfjl_clfs=cf.GB2Uni(crm_hfjl_clfs);
		if (!(crm_hfjl_clfs.equals("")))	wheresql+=" and  (crm_hfjl.clfs='"+crm_hfjl_clfs+"')";
	}
	crm_hfjl_dwbh=request.getParameter("crm_hfjl_dwbh");
	if (crm_hfjl_dwbh!=null)
	{
		if (!(crm_hfjl_dwbh.equals("")))	wheresql+=" and  (crm_gchffkbm.dwbh='"+crm_hfjl_dwbh+"')";
	}
	crm_hfjl_hfsj=request.getParameter("crm_hfjl_hfsj");
	if (crm_hfjl_hfsj!=null)
	{
		crm_hfjl_hfsj=crm_hfjl_hfsj.trim();
		if (!(crm_hfjl_hfsj.equals("")))	wheresql+="  and (crm_hfjl.hfsj>=TO_DATE('"+crm_hfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_hfjl_hfsj=request.getParameter("crm_hfjl_hfsj2");
	if (crm_hfjl_hfsj!=null)
	{
		crm_hfjl_hfsj=crm_hfjl_hfsj.trim();
		if (!(crm_hfjl_hfsj.equals("")))	wheresql+="  and (crm_hfjl.hfsj<=TO_DATE('"+crm_hfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_hfjl_hfr=request.getParameter("crm_hfjl_hfr");
	if (crm_hfjl_hfr!=null)
	{
		crm_hfjl_hfr=cf.GB2Uni(crm_hfjl_hfr);
		if (!(crm_hfjl_hfr.equals("")))	wheresql+=" and  (crm_hfjl.hfr='"+crm_hfjl_hfr+"')";
	}
	ls_sql="SELECT distinct crm_hfjl.hfjlh as hfjlh,khxm,sjs,sgdmc,zjxm,hflxmc,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[设]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[质]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[队]：'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>[集成]：'||jchfnr) as hfnr,hfsj,DECODE(clfs,'0','不需处理','1','反馈相关部门'),hfr,a.dwmc hfbm  ";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,crm_khxx,crm_gchffkbm,sq_dwxx a,sq_sgd,dm_jglxbm  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+)";
	ls_sql+=" and crm_hfjl.hfbm=a.dwbh";
	ls_sql+=" and crm_hfjl.hflxbm=dm_hflxbm.hflxbm(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_hfjl.hfsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_hfjlCxList.jsp","SelectCxCrm_hfjl.jsp","","");
    pageObj.setPageRow(50);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfjlh","dm_hflxbm_hflxmc","crm_hfjl_khbh","sq_dwxx_dwmc","crm_hfjl_hfsj","crm_hfjl_hfr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[7]="align='left'";
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
	String[] coluKey1={"hfjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_hfjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hfjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">回访记录号</td>
	<td  width="5%">客户姓名</td>
	<td  width="5%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="5%">巡检</td>
	<td  width="6%">回访类型</td>
	<td  width="6%">回访结果</td>
	<td  width="28%">回访内容</td>
	<td  width="7%">回访时间</td>
	<td  width="6%">处理方式</td>
	<td  width="5%">回访人</td>
	<td  width="10%">回访部门</td>
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
