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
	String cw_kqtkjl_kkjlh=null;
	String cw_kqtkjl_sgd=null;
	String cw_kqtkjl_lrr=null;
	String cw_kqtkjl_lrsj=null;
	String cw_kqtkjl_lrbm=null;
	String cw_kqtkjl_jsbz=null;
	String cw_kqtkjl_jsjlh=null;

	String fgs=null;
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String sjs=null;
	String hth=null;
	String zjxm=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cw_kqtkjl.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}



	String qtkkbm=null;
	qtkkbm=request.getParameter("qtkkbm");
	if (qtkkbm!=null)
	{
		if (!(qtkkbm.equals("")))	wheresql+=" and  (cw_kqtkjl.qtkkbm='"+qtkkbm+"')";
	}
	
	cw_kqtkjl_kkjlh=request.getParameter("cw_kqtkjl_kkjlh");
	if (cw_kqtkjl_kkjlh!=null)
	{
		cw_kqtkjl_kkjlh=cf.GB2Uni(cw_kqtkjl_kkjlh);
		if (!(cw_kqtkjl_kkjlh.equals("")))	wheresql+=" and  (cw_kqtkjl.kkjlh='"+cw_kqtkjl_kkjlh+"')";
	}
	cw_kqtkjl_sgd=request.getParameter("cw_kqtkjl_sgd");
	if (cw_kqtkjl_sgd!=null)
	{
		cw_kqtkjl_sgd=cf.GB2Uni(cw_kqtkjl_sgd);
		if (!(cw_kqtkjl_sgd.equals("")))	wheresql+=" and  (cw_kqtkjl.sgd='"+cw_kqtkjl_sgd+"')";
	}
	cw_kqtkjl_lrr=request.getParameter("cw_kqtkjl_lrr");
	if (cw_kqtkjl_lrr!=null)
	{
		cw_kqtkjl_lrr=cf.GB2Uni(cw_kqtkjl_lrr);
		if (!(cw_kqtkjl_lrr.equals("")))	wheresql+=" and  (cw_kqtkjl.lrr='"+cw_kqtkjl_lrr+"')";
	}
	cw_kqtkjl_lrsj=request.getParameter("cw_kqtkjl_lrsj");
	if (cw_kqtkjl_lrsj!=null)
	{
		cw_kqtkjl_lrsj=cw_kqtkjl_lrsj.trim();
		if (!(cw_kqtkjl_lrsj.equals("")))	wheresql+="  and (cw_kqtkjl.lrsj>=TO_DATE('"+cw_kqtkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_kqtkjl_lrsj=request.getParameter("cw_kqtkjl_lrsj2");
	if (cw_kqtkjl_lrsj!=null)
	{
		cw_kqtkjl_lrsj=cw_kqtkjl_lrsj.trim();
		if (!(cw_kqtkjl_lrsj.equals("")))	wheresql+="  and (cw_kqtkjl.lrsj<=TO_DATE('"+cw_kqtkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_kqtkjl_lrbm=request.getParameter("cw_kqtkjl_lrbm");
	if (cw_kqtkjl_lrbm!=null)
	{
		cw_kqtkjl_lrbm=cf.GB2Uni(cw_kqtkjl_lrbm);
		if (!(cw_kqtkjl_lrbm.equals("")))	wheresql+=" and  (cw_kqtkjl.lrbm='"+cw_kqtkjl_lrbm+"')";
	}
	cw_kqtkjl_jsbz=request.getParameter("cw_kqtkjl_jsbz");
	if (cw_kqtkjl_jsbz!=null)
	{
		cw_kqtkjl_jsbz=cf.GB2Uni(cw_kqtkjl_jsbz);
		if (!(cw_kqtkjl_jsbz.equals("")))	wheresql+=" and  (cw_kqtkjl.jsbz='"+cw_kqtkjl_jsbz+"')";
	}
	cw_kqtkjl_jsjlh=request.getParameter("cw_kqtkjl_jsjlh");
	if (cw_kqtkjl_jsjlh!=null)
	{
		cw_kqtkjl_jsjlh=cf.GB2Uni(cw_kqtkjl_jsjlh);
		if (!(cw_kqtkjl_jsjlh.equals("")))	wheresql+=" and  (cw_kqtkjl.jsjlh='"+cw_kqtkjl_jsjlh+"')";
	}
	ls_sql="SELECT cw_kqtkjl.kkjlh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,sq_sgd.sgdmc,qtkkmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj,sq_dwxx.dwmc, DECODE(cw_kqtkjl.jsbz,'N','未结算','Y','已结算'),cw_kqtkjl.jsjlh,cw_kqtkjl.bz,cw_kqtkjl.khbh  ";
	ls_sql+=" FROM cw_kqtkjl,sq_dwxx,sq_sgd,dm_qtkkbm,crm_khxx  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd and cw_kqtkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_kqtkjl.qtkkbm=dm_qtkkbm.qtkkbm(+) and cw_kqtkjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_kqtkjl.kkjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_kqtkjlList.jsp","SelectCw_kqtkjl.jsp","","EditCw_kqtkjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kkjlh","sq_sgd_sgdmc","cw_kqtkjl_kkje","cw_kqtkjl_lrr","cw_kqtkjl_lrsj","sq_dwxx_dwmc","cw_kqtkjl_jsbz","cw_kqtkjl_jsjlh","cw_kqtkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kkjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_kqtkjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
	String[] kkjlh = request.getParameterValues("kkjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kkjlh,"kkjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_kqtkjl where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">扣款记录号</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">合同号</td>
	<td  width="13%">房屋地址</td>
	<td  width="4%">施工队</td>
	<td  width="9%">扣款项目</td>
	<td  width="7%">扣款金额</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="9%">录入部门</td>
	<td  width="4%">结算标志</td>
	<td  width="6%">结算记录号</td>
	<td  width="18%">备注</td>
	<td  width="4%">客户编号</td>
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