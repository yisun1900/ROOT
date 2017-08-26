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
	String cw_jrbgf_jsjlh=null;
	String cw_jrbgf_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_jrbgf_sgd=null;
	String cw_jrbgf_sgbz=null;
	String cw_jrbgf_jsrq=null;
	String cw_jrbgf_bcflk=null;
	String cw_jrbgf_lx=null;
	String cw_jrbgf_clzt=null;
	String cw_jrbgf_spr=null;
	String cw_jrbgf_spsj=null;
	String cw_jrbgf_lrr=null;
	String cw_jrbgf_lrsj=null;
	String cw_jrbgf_lrbm=null;
	cw_jrbgf_jsjlh=request.getParameter("cw_jrbgf_jsjlh");
	if (cw_jrbgf_jsjlh!=null)
	{
		cw_jrbgf_jsjlh=cf.GB2Uni(cw_jrbgf_jsjlh);
		if (!(cw_jrbgf_jsjlh.equals("")))	wheresql+=" and  (cw_jrbgf.jsjlh='"+cw_jrbgf_jsjlh+"')";
	}
	cw_jrbgf_khbh=request.getParameter("cw_jrbgf_khbh");
	if (cw_jrbgf_khbh!=null)
	{
		cw_jrbgf_khbh=cf.GB2Uni(cw_jrbgf_khbh);
		if (!(cw_jrbgf_khbh.equals("")))	wheresql+=" and  (cw_jrbgf.khbh='"+cw_jrbgf_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_jrbgf_sgd=request.getParameter("cw_jrbgf_sgd");
	if (cw_jrbgf_sgd!=null)
	{
		cw_jrbgf_sgd=cf.GB2Uni(cw_jrbgf_sgd);
		if (!(cw_jrbgf_sgd.equals("")))	wheresql+=" and  (cw_jrbgf.sgd='"+cw_jrbgf_sgd+"')";
	}
	cw_jrbgf_sgbz=request.getParameter("cw_jrbgf_sgbz");
	if (cw_jrbgf_sgbz!=null)
	{
		cw_jrbgf_sgbz=cf.GB2Uni(cw_jrbgf_sgbz);
		if (!(cw_jrbgf_sgbz.equals("")))	wheresql+=" and  (cw_jrbgf.sgbz='"+cw_jrbgf_sgbz+"')";
	}
	cw_jrbgf_jsrq=request.getParameter("cw_jrbgf_jsrq");
	if (cw_jrbgf_jsrq!=null)
	{
		cw_jrbgf_jsrq=cw_jrbgf_jsrq.trim();
		if (!(cw_jrbgf_jsrq.equals("")))	wheresql+="  and (cw_jrbgf.jsrq>=TO_DATE('"+cw_jrbgf_jsrq+"','YYYY/MM/DD'))";
	}
	cw_jrbgf_jsrq=request.getParameter("cw_jrbgf_jsrq2");
	if (cw_jrbgf_jsrq!=null)
	{
		cw_jrbgf_jsrq=cw_jrbgf_jsrq.trim();
		if (!(cw_jrbgf_jsrq.equals("")))	wheresql+="  and (cw_jrbgf.jsrq<=TO_DATE('"+cw_jrbgf_jsrq+"','YYYY/MM/DD'))";
	}
	cw_jrbgf_bcflk=request.getParameter("cw_jrbgf_bcflk");
	if (cw_jrbgf_bcflk!=null)
	{
		cw_jrbgf_bcflk=cw_jrbgf_bcflk.trim();
		if (!(cw_jrbgf_bcflk.equals("")))	wheresql+=" and  (cw_jrbgf.bcflk="+cw_jrbgf_bcflk+") ";
	}
	cw_jrbgf_lx=request.getParameter("cw_jrbgf_lx");
	if (cw_jrbgf_lx!=null)
	{
		cw_jrbgf_lx=cf.GB2Uni(cw_jrbgf_lx);
		if (!(cw_jrbgf_lx.equals("")))	wheresql+=" and  (cw_jrbgf.lx='"+cw_jrbgf_lx+"')";
	}
	cw_jrbgf_clzt=request.getParameter("cw_jrbgf_clzt");
	if (cw_jrbgf_clzt!=null)
	{
		cw_jrbgf_clzt=cf.GB2Uni(cw_jrbgf_clzt);
		if (!(cw_jrbgf_clzt.equals("")))	wheresql+=" and  (cw_jrbgf.clzt='"+cw_jrbgf_clzt+"')";
	}
	cw_jrbgf_spr=request.getParameter("cw_jrbgf_spr");
	if (cw_jrbgf_spr!=null)
	{
		cw_jrbgf_spr=cf.GB2Uni(cw_jrbgf_spr);
		if (!(cw_jrbgf_spr.equals("")))	wheresql+=" and  (cw_jrbgf.spr='"+cw_jrbgf_spr+"')";
	}
	cw_jrbgf_spsj=request.getParameter("cw_jrbgf_spsj");
	if (cw_jrbgf_spsj!=null)
	{
		cw_jrbgf_spsj=cw_jrbgf_spsj.trim();
		if (!(cw_jrbgf_spsj.equals("")))	wheresql+="  and (cw_jrbgf.spsj>=TO_DATE('"+cw_jrbgf_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrbgf_spsj=request.getParameter("cw_jrbgf_spsj2");
	if (cw_jrbgf_spsj!=null)
	{
		cw_jrbgf_spsj=cw_jrbgf_spsj.trim();
		if (!(cw_jrbgf_spsj.equals("")))	wheresql+="  and (cw_jrbgf.spsj<=TO_DATE('"+cw_jrbgf_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrbgf_lrr=request.getParameter("cw_jrbgf_lrr");
	if (cw_jrbgf_lrr!=null)
	{
		cw_jrbgf_lrr=cf.GB2Uni(cw_jrbgf_lrr);
		if (!(cw_jrbgf_lrr.equals("")))	wheresql+=" and  (cw_jrbgf.lrr='"+cw_jrbgf_lrr+"')";
	}
	cw_jrbgf_lrsj=request.getParameter("cw_jrbgf_lrsj");
	if (cw_jrbgf_lrsj!=null)
	{
		cw_jrbgf_lrsj=cw_jrbgf_lrsj.trim();
		if (!(cw_jrbgf_lrsj.equals("")))	wheresql+="  and (cw_jrbgf.lrsj>=TO_DATE('"+cw_jrbgf_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrbgf_lrsj=request.getParameter("cw_jrbgf_lrsj2");
	if (cw_jrbgf_lrsj!=null)
	{
		cw_jrbgf_lrsj=cw_jrbgf_lrsj.trim();
		if (!(cw_jrbgf_lrsj.equals("")))	wheresql+="  and (cw_jrbgf.lrsj<=TO_DATE('"+cw_jrbgf_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrbgf_lrbm=request.getParameter("cw_jrbgf_lrbm");
	if (cw_jrbgf_lrbm!=null)
	{
		cw_jrbgf_lrbm=cf.GB2Uni(cw_jrbgf_lrbm);
		if (!(cw_jrbgf_lrbm.equals("")))	wheresql+=" and  (cw_jrbgf.lrbm='"+cw_jrbgf_lrbm+"')";
	}
	ls_sql="SELECT cw_jrbgf.jsjlh,gdjsjdmc, DECODE(cw_jrbgf.clzt,'1','结算','2','审批同意','3','审批不同意'),crm_khxx.khxm,bjjbmc,crm_khxx.fwdz,crm_khxx.hth,sgdmc,cw_jrbgf.rgfbfb||'%',TO_CHAR(cw_jrbgf.yfrgf),cw_jrbgf.bcrgf,cw_jrbgf.spr,cw_jrbgf.spsj,cw_jrbgf.spyj,cw_jrbgf.jsrq,cw_jrbgf.khbh,TO_CHAR(cw_jrbgf.ysglk),cw_jrbgf.lrr,cw_jrbgf.lrsj,dwmc,cw_jrbgf.bz ";
	ls_sql+=" FROM crm_khxx,cw_jrbgf,dm_gdjsjd,sq_sgd,sq_dwxx,bdm_bjjbbm  ";
    ls_sql+=" where cw_jrbgf.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_jrbgf.lx=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and cw_jrbgf.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_jrbgf.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_jrbgf.lrsj desc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrsgdjsList.jsp","","","EditCw_jrsgdjs.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_jrbgf_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_jrbgf_sgd","cw_jrbgf_sgbz","cw_jrbgf_jsrq","cw_jrbgf_ysglk","cw_jrbgf_zjsge","cw_jrbgf_cfje","cw_jrbgf_jsglk","cw_jrbgf_rgfbfb","cw_jrbgf_yfrgf","cw_jrbgf_bcrgf","cw_jrbgf_flkbfb","cw_jrbgf_ycflk","cw_jrbgf_bcflk","cw_jrbgf_gsfl","cw_jrbgf_psfl","cw_jrbgf_kzbjbl","cw_jrbgf_kzbj","cw_jrbgf_fk","cw_jrbgf_kqtk","cw_jrbgf_kqtksm","cw_jrbgf_bcfkhj","cw_jrbgf_lx","cw_jrbgf_clzt","cw_jrbgf_spr","cw_jrbgf_spsj","cw_jrbgf_spyj","cw_jrbgf_lrr","cw_jrbgf_lrsj","cw_jrbgf_lrbm","cw_jrbgf_bz","cw_jrbgf_bx","cw_jrbgf_pck"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_jrsgdjs.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
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
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">结算记录号</td>
	<td  width="4%">类型</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">报价级别</td>
	<td  width="9%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="3%">施工队</td>
	<td  width="3%">人工费百分比</td>
	<td  width="4%">已付人工费</td>
	<td  width="4%">本次应付人工费</td>
	<td  width="3%">审批人</td>
	<td  width="4%">审批时间</td>
	<td  width="13%">审批意见</td>
	<td  width="4%">拨付日期</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">预算工料款</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="18%">备注</td>
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