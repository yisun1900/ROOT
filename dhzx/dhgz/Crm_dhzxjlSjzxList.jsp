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
	String crm_dhzxjl_zxjlh=null;
	String crm_dhzxjl_khbh=null;
	String crm_dhzxjl_khxm=null;
	String crm_dhzxjl_xb=null;
	String crm_dhzxjl_lxdh=null;
	String crm_dhzxjl_fwdz=null;
	String crm_dhzxjl_hxmj=null;
	String crm_dhzxjl_jfrq=null;
	String crm_dhzxjl_zxlxbm=null;
	String crm_dhzxjl_zxnr=null;
	String crm_dhzxjl_sfxhf=null;
	String crm_dhzxjl_hfrq=null;
	String crm_dhzxjl_zxsj=null;
	String crm_dhzxjl_slr=null;
	String crm_dhzxjl_sjs=null;
	String crm_dhzxjl_sjssj=null;
	String crm_dhzxjl_clfs=null;
	String crm_dhzxjl_zxjg=null;
	crm_dhzxjl_zxjlh=request.getParameter("crm_dhzxjl_zxjlh");
	if (crm_dhzxjl_zxjlh!=null)
	{
		crm_dhzxjl_zxjlh=crm_dhzxjl_zxjlh.trim();
		if (!(crm_dhzxjl_zxjlh.equals("")))	wheresql+=" and (crm_dhzxjl.zxjlh="+crm_dhzxjl_zxjlh+") ";
	}
	crm_dhzxjl_khbh=request.getParameter("crm_dhzxjl_khbh");
	if (crm_dhzxjl_khbh!=null)
	{
		crm_dhzxjl_khbh=cf.GB2Uni(crm_dhzxjl_khbh);
		if (!(crm_dhzxjl_khbh.equals("")))	wheresql+=" and  (crm_dhzxjl.khbh='"+crm_dhzxjl_khbh+"')";
	}
	crm_dhzxjl_khxm=request.getParameter("crm_dhzxjl_khxm");
	if (crm_dhzxjl_khxm!=null)
	{
		crm_dhzxjl_khxm=cf.GB2Uni(crm_dhzxjl_khxm);
		if (!(crm_dhzxjl_khxm.equals("")))	wheresql+=" and  (crm_dhzxjl.khxm like '%"+crm_dhzxjl_khxm+"%')";
	}
	crm_dhzxjl_xb=request.getParameter("crm_dhzxjl_xb");
	if (crm_dhzxjl_xb!=null)
	{
		crm_dhzxjl_xb=cf.GB2Uni(crm_dhzxjl_xb);
		if (!(crm_dhzxjl_xb.equals("")))	wheresql+=" and  (crm_dhzxjl.xb='"+crm_dhzxjl_xb+"')";
	}
	crm_dhzxjl_lxdh=request.getParameter("crm_dhzxjl_lxdh");
	if (crm_dhzxjl_lxdh!=null)
	{
		crm_dhzxjl_lxdh=cf.GB2Uni(crm_dhzxjl_lxdh);
		if (!(crm_dhzxjl_lxdh.equals("")))	wheresql+=" and  (crm_dhzxjl.lxdh='"+crm_dhzxjl_lxdh+"')";
	}
	crm_dhzxjl_fwdz=request.getParameter("crm_dhzxjl_fwdz");
	if (crm_dhzxjl_fwdz!=null)
	{
		crm_dhzxjl_fwdz=cf.GB2Uni(crm_dhzxjl_fwdz);
		if (!(crm_dhzxjl_fwdz.equals("")))	wheresql+=" and  (crm_dhzxjl.fwdz like '%"+crm_dhzxjl_fwdz+"%')";
	}
	crm_dhzxjl_hxmj=request.getParameter("crm_dhzxjl_hxmj");
	if (crm_dhzxjl_hxmj!=null)
	{
		crm_dhzxjl_hxmj=crm_dhzxjl_hxmj.trim();
		if (!(crm_dhzxjl_hxmj.equals("")))	wheresql+=" and (crm_dhzxjl.hxmj="+crm_dhzxjl_hxmj+") ";
	}
	crm_dhzxjl_jfrq=request.getParameter("crm_dhzxjl_jfrq");
	if (crm_dhzxjl_jfrq!=null)
	{
		crm_dhzxjl_jfrq=crm_dhzxjl_jfrq.trim();
		if (!(crm_dhzxjl_jfrq.equals("")))	wheresql+="  and (crm_dhzxjl.jfrq>=TO_DATE('"+crm_dhzxjl_jfrq+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_jfrq=request.getParameter("crm_dhzxjl_jfrq2");
	if (crm_dhzxjl_jfrq!=null)
	{
		crm_dhzxjl_jfrq=crm_dhzxjl_jfrq.trim();
		if (!(crm_dhzxjl_jfrq.equals("")))	wheresql+="  and (crm_dhzxjl.jfrq<=TO_DATE('"+crm_dhzxjl_jfrq+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_zxlxbm=request.getParameter("crm_dhzxjl_zxlxbm");
	if (crm_dhzxjl_zxlxbm!=null)
	{
		crm_dhzxjl_zxlxbm=cf.GB2Uni(crm_dhzxjl_zxlxbm);
		if (!(crm_dhzxjl_zxlxbm.equals("")))	wheresql+=" and  (crm_dhzxjl.zxlxbm='"+crm_dhzxjl_zxlxbm+"')";
	}
	crm_dhzxjl_zxnr=request.getParameter("crm_dhzxjl_zxnr");
	if (crm_dhzxjl_zxnr!=null)
	{
		crm_dhzxjl_zxnr=cf.GB2Uni(crm_dhzxjl_zxnr);
		if (!(crm_dhzxjl_zxnr.equals("")))	wheresql+=" and  (crm_dhzxjl.zxnr='"+crm_dhzxjl_zxnr+"')";
	}
	crm_dhzxjl_sfxhf=request.getParameter("crm_dhzxjl_sfxhf");
	if (crm_dhzxjl_sfxhf!=null)
	{
		crm_dhzxjl_sfxhf=cf.GB2Uni(crm_dhzxjl_sfxhf);
		if (!(crm_dhzxjl_sfxhf.equals("")))	wheresql+=" and  (crm_dhzxjl.sfxhf='"+crm_dhzxjl_sfxhf+"')";
	}
	crm_dhzxjl_hfrq=request.getParameter("crm_dhzxjl_hfrq");
	if (crm_dhzxjl_hfrq!=null)
	{
		crm_dhzxjl_hfrq=crm_dhzxjl_hfrq.trim();
		if (!(crm_dhzxjl_hfrq.equals("")))	wheresql+="  and (crm_dhzxjl.hfrq>=TO_DATE('"+crm_dhzxjl_hfrq+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_hfrq=request.getParameter("crm_dhzxjl_hfrq2");
	if (crm_dhzxjl_hfrq!=null)
	{
		crm_dhzxjl_hfrq=crm_dhzxjl_hfrq.trim();
		if (!(crm_dhzxjl_hfrq.equals("")))	wheresql+="  and (crm_dhzxjl.hfrq<=TO_DATE('"+crm_dhzxjl_hfrq+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_zxsj=request.getParameter("crm_dhzxjl_zxsj");
	if (crm_dhzxjl_zxsj!=null)
	{
		crm_dhzxjl_zxsj=crm_dhzxjl_zxsj.trim();
		if (!(crm_dhzxjl_zxsj.equals("")))	wheresql+="  and (crm_dhzxjl.zxsj>=TO_DATE('"+crm_dhzxjl_zxsj+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_zxsj=request.getParameter("crm_dhzxjl_zxsj2");
	if (crm_dhzxjl_zxsj!=null)
	{
		crm_dhzxjl_zxsj=crm_dhzxjl_zxsj.trim();
		if (!(crm_dhzxjl_zxsj.equals("")))	wheresql+="  and (crm_dhzxjl.zxsj<=TO_DATE('"+crm_dhzxjl_zxsj+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_slr=request.getParameter("crm_dhzxjl_slr");
	if (crm_dhzxjl_slr!=null)
	{
		crm_dhzxjl_slr=cf.GB2Uni(crm_dhzxjl_slr);
		if (!(crm_dhzxjl_slr.equals("")))	wheresql+=" and  (crm_dhzxjl.slr='"+crm_dhzxjl_slr+"')";
	}
	crm_dhzxjl_sjs=request.getParameter("crm_dhzxjl_sjs");
	if (crm_dhzxjl_sjs!=null)
	{
		crm_dhzxjl_sjs=cf.GB2Uni(crm_dhzxjl_sjs);
		if (!(crm_dhzxjl_sjs.equals("")))	wheresql+=" and  (crm_dhzxjl.sjs='"+crm_dhzxjl_sjs+"')";
	}
	crm_dhzxjl_sjssj=request.getParameter("crm_dhzxjl_sjssj");
	if (crm_dhzxjl_sjssj!=null)
	{
		crm_dhzxjl_sjssj=crm_dhzxjl_sjssj.trim();
		if (!(crm_dhzxjl_sjssj.equals("")))	wheresql+="  and (crm_dhzxjl.sjssj>=TO_DATE('"+crm_dhzxjl_sjssj+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_sjssj=request.getParameter("crm_dhzxjl_sjssj2");
	if (crm_dhzxjl_sjssj!=null)
	{
		crm_dhzxjl_sjssj=crm_dhzxjl_sjssj.trim();
		if (!(crm_dhzxjl_sjssj.equals("")))	wheresql+="  and (crm_dhzxjl.sjssj<=TO_DATE('"+crm_dhzxjl_sjssj+"','YYYY/MM/DD'))";
	}
	crm_dhzxjl_clfs=request.getParameter("crm_dhzxjl_clfs");
	if (crm_dhzxjl_clfs!=null)
	{
		crm_dhzxjl_clfs=cf.GB2Uni(crm_dhzxjl_clfs);
		if (!(crm_dhzxjl_clfs.equals("")))	wheresql+=" and  (crm_dhzxjl.clfs='"+crm_dhzxjl_clfs+"')";
	}
	crm_dhzxjl_zxjg=request.getParameter("crm_dhzxjl_zxjg");
	if (crm_dhzxjl_zxjg!=null)
	{
		crm_dhzxjl_zxjg=cf.GB2Uni(crm_dhzxjl_zxjg);
		if (!(crm_dhzxjl_zxjg.equals("")))	wheresql+=" and  (crm_dhzxjl.zxjg='"+crm_dhzxjl_zxjg+"')";
	}
	ls_sql="SELECT crm_dhzxjl.zxjlh as zxjlh,crm_dhzxjl.khxm as crm_dhzxjl_khxm, DECODE(crm_dhzxjl.xb,'1','男','2','女') as crm_dhzxjl_xb,crm_dhzxjl.lxdh as crm_dhzxjl_lxdh,crm_dhzxjl.fwdz as crm_dhzxjl_fwdz,crm_dhzxjl.hxmj as crm_dhzxjl_hxmj,crm_dhzxjl.jfrq as crm_dhzxjl_jfrq,dm_zxlxbm.zxlxmc as dm_zxlxbm_zxlxmc  ";
	ls_sql+=" FROM crm_dhzxjl,dm_zxlxbm  ";
    ls_sql+=" where crm_dhzxjl.zxlxbm=dm_zxlxbm.zxlxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_dhzxjl.zxjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","SjzxCrm_dhzxjl.jsp","");
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zxjlh","crm_dhzxjl_khxm","crm_dhzxjl_xb","crm_dhzxjl_lxdh","crm_dhzxjl_fwdz","crm_dhzxjl_hxmj","crm_dhzxjl_jfrq","dm_zxlxbm_zxlxmc","crm_dhzxjl_sfxhf","crm_dhzxjl_hfrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zxjlh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">记录号</td>
	<td  width="8%">姓名</td>
	<td  width="5%">性别</td>
	<td  width="8%">联系电话</td>
	<td  width="24%">房屋地址</td>
	<td  width="6%">户型面积</td>
	<td  width="11%">交房日期</td>
	<td  width="9%">咨询类型</td>
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