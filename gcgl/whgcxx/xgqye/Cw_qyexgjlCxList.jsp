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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}



	String xgjlh=null;
	String lrr=null;
	String lrsj=null;
	xgjlh=request.getParameter("xgjlh");
	if (xgjlh!=null)
	{
		xgjlh=cf.GB2Uni(xgjlh);
		if (!(xgjlh.equals("")))	wheresql+=" and  (cw_qyexgjl.xgjlh='"+xgjlh+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_qyexgjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_qyexgjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_qyexgjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xgjlh,cw_qyexgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,xgqzkl,xgqzjxzkl,xgqcdzwjmje,xgqglfjmje,xgqsjjmje,xgqwdzgce,xgqqye,xgqpmjj,xgqzxjwbm,xgqsuijinbfb,xgqsuijin,xgqglfbfb,xgqzqguanlif,xgqguanlif,xgqzqwjrqyexm,xgqzhwjrqyexm,xgqwjrqyexmsm,xgqsjf,xgqglf,xghzkl,xghzjxzkl,xghcdzwjmje,xghglfjmje,xghsjjmje,xghwdzgce,xghqye,xghpmjj,xghzxjwbm,xghsuijinbfb,xghsuijin,xghglfbfb,xghzqguanlif,xghguanlif,xghzqwjrqyexm,xghzhwjrqyexm,xghwjrqyexmsm,xghsjf,xghglf,cw_qyexgjl.lrr,cw_qyexgjl.lrsj,dwmc,cw_qyexgjl.bz  ";
	ls_sql+=" FROM cw_qyexgjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_qyexgjl.khbh=crm_khxx.khbh and cw_qyexgjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_qyexgjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_qyexgjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xgjlh","khbh","xgqzkl","xgqcdzwjmje","xgqwdzgce","xgqqye","xgqpmjj","xgqzxjwbm","xgqsuijinbfb","xgqsuijin","xgqglfbfb","xgqzqguanlif","xgqguanlif","xgqzqwjrqyexm","xgqzhwjrqyexm","xgqwjrqyexmsm","xgqsjf","xgqglf","xghzkl","xghcdzwjmje","xghwdzgce","xghqye","xghpmjj","xghzxjwbm","xghsuijinbfb","xghsuijin","xghglfbfb","xghzqguanlif","xghguanlif","xghzqwjrqyexm","xghzhwjrqyexm","xghwjrqyexmsm","xghsjf","xghglf","lrr","lrsj","lrbm","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xgjlh"};
	pageObj.setKey(keyName);


	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询－修改签约额记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(500);
%>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%" rowspan="2">修改记录号</td>
  <td  width="2%" rowspan="2">客户编号</td>
  <td  width="2%" rowspan="2">客户姓名</td>
  <td  width="5%" rowspan="2">房屋地址</td>
  <td  width="2%" rowspan="2">合同号</td>
  <td colspan="19"><strong><font color="#0000CC">修改前</font></strong></td>
  <td colspan="19"><font color="#FF0000"><strong>修改后</strong></font></td>
  <td width="2%" rowspan="2">录入人</td>
  <td width="2%" rowspan="2">录入时间</td>
  <td width="3%" rowspan="2">录入部门</td>
  <td width="8%" rowspan="2">备注</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%"><font color="#0000CC">合同折扣</font></td>
	<td  width="1%"><font color="#0000CC">增减项折扣</font></td>
	<td  width="2%"><font color="#0000CC">合同减免额</font></td>
	<td  width="2%"><font color="#0000CC">管理费减免额</font></td>
	<td  width="2%"><font color="#0000CC">税金减免额</font></td>
	<td  width="2%"><font color="#0000CC">工程原报价</font></td>
	<td  width="2%"><font color="#0000CC">签约额</font></td>
	<td  width="2%"><font color="#0000CC">每平米均价</font></td>
	<td  width="2%"><font color="#0000CC">装修价位编码</font></td>
	<td  width="1%"><font color="#0000CC">税金百分比</font></td>
	<td  width="2%"><font color="#0000CC">税金</font></td>
	<td  width="1%"><font color="#0000CC">管理费百分比</font></td>
	<td  width="2%"><font color="#0000CC">折前管理费</font></td>
	<td  width="2%"><font color="#0000CC">折后管理费</font></td>
	<td  width="2%"><font color="#0000CC">折前未记入签约额项目</font></td>
	<td  width="2%"><font color="#0000CC">折后未记入签约额项目</font></td>
	<td  width="4%"><font color="#0000CC">未记入签约额项目说明</font></td>
	<td  width="2%"><font color="#0000CC">设计费</font></td>
	<td  width="2%"><font color="#0000CC">服务费</font></td>

	<td  width="1%"><font color="#CC0000">合同折扣</font></td>
	<td  width="1%"><font color="#CC0000">增减项折扣</font></td>
	<td  width="2%"><font color="#CC0000">合同减免额</font></td>
	<td  width="2%"><font color="#CC0000">管理费减免额</font></td>
	<td  width="2%"><font color="#CC0000">税金减免额</font></td>
	<td  width="2%"><font color="#CC0000">工程原报价</font></td>
	<td  width="2%"><font color="#CC0000">签约额</font></td>
	<td  width="2%"><font color="#CC0000">每平米均价</font></td>
	<td  width="2%"><font color="#CC0000">装修价位编码</font></td>
	<td  width="1%"><font color="#CC0000">税金百分比</font></td>
	<td  width="2%"><font color="#CC0000">税金</font></td>
	<td  width="1%"><font color="#CC0000">管理费百分比</font></td>
	<td  width="2%"><font color="#CC0000">折前管理费</font></td>
	<td  width="2%"><font color="#CC0000">折后管理费</font></td>
	<td  width="2%"><font color="#CC0000">折前未记入签约额项目</font></td>
	<td  width="2%"><font color="#CC0000">折后未记入签约额项目</font></td>
	<td  width="4%"><font color="#CC0000">未记入签约额项目说明</font></td>
	<td  width="2%"><font color="#CC0000">设计费</font></td>
	<td  width="2%"><font color="#CC0000">服务费</font></td>
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