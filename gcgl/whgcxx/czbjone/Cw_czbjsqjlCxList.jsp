<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_czbjsqjl_khbh=null;
	String cw_czbjsqjl_sqsj=null;
	String cw_czbjsqjl_khxm=null;
	String cw_czbjsqjl_fgsbh=null;
	String cw_czbjsqjl_sqr=null;
	String cw_czbjsqjl_wcbz=null;
	String cw_czbjsqjl_wcsj=null;
	String cw_czbjsqjl_wcr=null;
	String cw_czbjsqjl_yjjzsj=null;
	String crm_khxx_hth=null;
	String cw_czbjsqjl_sfxyjjz=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String dwbh=null;
	cw_czbjsqjl_khbh=request.getParameter("cw_czbjsqjl_khbh");
	if (cw_czbjsqjl_khbh!=null)
	{
		cw_czbjsqjl_khbh=cf.GB2Uni(cw_czbjsqjl_khbh);
		if (!(cw_czbjsqjl_khbh.equals("")))	wheresql+=" and  (cw_czbjsqjl.khbh='"+cw_czbjsqjl_khbh+"')";
	}
	cw_czbjsqjl_sqsj=request.getParameter("cw_czbjsqjl_sqsj");
	if (cw_czbjsqjl_sqsj!=null)
	{
		cw_czbjsqjl_sqsj=cw_czbjsqjl_sqsj.trim();
		if (!(cw_czbjsqjl_sqsj.equals("")))	wheresql+="  and (cw_czbjsqjl.sqsj>=TO_DATE('"+cw_czbjsqjl_sqsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_sqsj=request.getParameter("cw_czbjsqjl_sqsj2");
	if (cw_czbjsqjl_sqsj!=null)
	{
		cw_czbjsqjl_sqsj=cw_czbjsqjl_sqsj.trim();
		if (!(cw_czbjsqjl_sqsj.equals("")))	wheresql+="  and (cw_czbjsqjl.sqsj<=TO_DATE('"+cw_czbjsqjl_sqsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_khxm=request.getParameter("cw_czbjsqjl_khxm");
	if (cw_czbjsqjl_khxm!=null)
	{
		cw_czbjsqjl_khxm=cf.GB2Uni(cw_czbjsqjl_khxm);
		if (!(cw_czbjsqjl_khxm.equals("")))	wheresql+=" and  (cw_czbjsqjl.khxm='"+cw_czbjsqjl_khxm+"')";
	}
	cw_czbjsqjl_fgsbh=request.getParameter("cw_czbjsqjl_fgsbh");
	if (cw_czbjsqjl_fgsbh!=null)
	{
		cw_czbjsqjl_fgsbh=cf.GB2Uni(cw_czbjsqjl_fgsbh);
		if (!(cw_czbjsqjl_fgsbh.equals("")))	wheresql+=" and  (cw_czbjsqjl.fgsbh='"+cw_czbjsqjl_fgsbh+"')";
	}
	cw_czbjsqjl_sqr=request.getParameter("cw_czbjsqjl_sqr");
	if (cw_czbjsqjl_sqr!=null)
	{
		cw_czbjsqjl_sqr=cf.GB2Uni(cw_czbjsqjl_sqr);
		if (!(cw_czbjsqjl_sqr.equals("")))	wheresql+=" and  (cw_czbjsqjl.sqr='"+cw_czbjsqjl_sqr+"')";
	}
	cw_czbjsqjl_wcbz=request.getParameter("cw_czbjsqjl_wcbz");
	if (cw_czbjsqjl_wcbz!=null)
	{
		cw_czbjsqjl_wcbz=cf.GB2Uni(cw_czbjsqjl_wcbz);
		if (!(cw_czbjsqjl_wcbz.equals("")))	wheresql+=" and  (cw_czbjsqjl.wcbz='"+cw_czbjsqjl_wcbz+"')";
	}
	cw_czbjsqjl_wcsj=request.getParameter("cw_czbjsqjl_wcsj");
	if (cw_czbjsqjl_wcsj!=null)
	{
		cw_czbjsqjl_wcsj=cw_czbjsqjl_wcsj.trim();
		if (!(cw_czbjsqjl_wcsj.equals("")))	wheresql+="  and (cw_czbjsqjl.wcsj>=TO_DATE('"+cw_czbjsqjl_wcsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_wcsj=request.getParameter("cw_czbjsqjl_wcsj2");
	if (cw_czbjsqjl_wcsj!=null)
	{
		cw_czbjsqjl_wcsj=cw_czbjsqjl_wcsj.trim();
		if (!(cw_czbjsqjl_wcsj.equals("")))	wheresql+="  and (cw_czbjsqjl.wcsj<=TO_DATE('"+cw_czbjsqjl_wcsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_wcr=request.getParameter("cw_czbjsqjl_wcr");
	if (cw_czbjsqjl_wcr!=null)
	{
		cw_czbjsqjl_wcr=cf.GB2Uni(cw_czbjsqjl_wcr);
		if (!(cw_czbjsqjl_wcr.equals("")))	wheresql+=" and  (cw_czbjsqjl.wcr='"+cw_czbjsqjl_wcr+"')";
	}
	cw_czbjsqjl_yjjzsj=request.getParameter("cw_czbjsqjl_yjjzsj");
	if (cw_czbjsqjl_yjjzsj!=null)
	{
		cw_czbjsqjl_yjjzsj=cw_czbjsqjl_yjjzsj.trim();
		if (!(cw_czbjsqjl_yjjzsj.equals("")))	wheresql+="  and (cw_czbjsqjl.yjjzsj>=TO_DATE('"+cw_czbjsqjl_yjjzsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_yjjzsj=request.getParameter("cw_czbjsqjl_yjjzsj2");
	if (cw_czbjsqjl_yjjzsj!=null)
	{
		cw_czbjsqjl_yjjzsj=cw_czbjsqjl_yjjzsj.trim();
		if (!(cw_czbjsqjl_yjjzsj.equals("")))	wheresql+="  and (cw_czbjsqjl.yjjzsj<=TO_DATE('"+cw_czbjsqjl_yjjzsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_czbjsqjl_sfxyjjz=request.getParameter("cw_czbjsqjl_sfxyjjz");
	if (cw_czbjsqjl_sfxyjjz!=null)
	{
		cw_czbjsqjl_sfxyjjz=cf.GB2Uni(cw_czbjsqjl_sfxyjjz);
		if (!(cw_czbjsqjl_sfxyjjz.equals("")))	wheresql+=" and  (cw_czbjsqjl.sfxyjjz='"+cw_czbjsqjl_sfxyjjz+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
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
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT DECODE(cw_czbjsqjl.wcbz,'1','未完成','2','完成','3','业绩结转'),DECODE(cw_czbjsqjl.sfxyjjz,'Y','需要','N','不需要'),cw_czbjsqjl.yjjzsj,cw_czbjsqjl.khbh,crm_khxx.hth,cw_czbjsqjl.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.qyrq,dwmc,cw_czbjsqjl.sqsj,cw_czbjsqjl.sqr,cw_czbjsqjl.wcsj,cw_czbjsqjl.wcr,cw_czbjsqjl.gxqwdzgce,cw_czbjsqjl.gxqzkl,cw_czbjsqjl.gxqqye,cw_czbjsqjl.gxqcdzwjmje,cw_czbjsqjl.gxqglfbfb||'%',cw_czbjsqjl.gxqzqguanlif,cw_czbjsqjl.gxqguanlif,cw_czbjsqjl.gxqglfjmje,cw_czbjsqjl.gxqsuijinbfb||'%',cw_czbjsqjl.gxqsuijin,cw_czbjsqjl.gxqsjjmje,cw_czbjsqjl.gxqsjf,cw_czbjsqjl.gxqzqwjrqyexm,cw_czbjsqjl.gxqzhwjrqyexm,cw_czbjsqjl.gxqwjrqyexmsm    ,cw_czbjsqjl.gxhwdzgce,cw_czbjsqjl.gxhzkl,cw_czbjsqjl.gxhqye,cw_czbjsqjl.gxhcdzwjmje,cw_czbjsqjl.gxhglfbfb||'%',cw_czbjsqjl.gxhzqguanlif,cw_czbjsqjl.gxhguanlif,cw_czbjsqjl.gxhglfjmje,cw_czbjsqjl.gxhsuijinbfb||'%',cw_czbjsqjl.gxhsuijin,cw_czbjsqjl.gxhsjjmje,cw_czbjsqjl.gxhsjf,cw_czbjsqjl.gxhzqwjrqyexm,cw_czbjsqjl.gxhzhwjrqyexm,cw_czbjsqjl.gxhwjrqyexmsm,cw_czbjsqjl.bz";
	ls_sql+=" FROM crm_khxx,cw_czbjsqjl,sq_dwxx  ";
    ls_sql+=" where cw_czbjsqjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by cw_czbjsqjl.sqsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_czbjsqjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","sqsj","cw_czbjsqjl_khxm","cw_czbjsqjl_fgsbh","cw_czbjsqjl_sqr","cw_czbjsqjl_wcbz","cw_czbjsqjl_wcsj","cw_czbjsqjl_wcr","cw_czbjsqjl_yjjzsj","cw_czbjsqjl_gxqwdzgce","cw_czbjsqjl_gxqzkl","cw_czbjsqjl_gxqqye","cw_czbjsqjl_gxqsuijin","cw_czbjsqjl_gxqsuijinbfb","cw_czbjsqjl_gxqsjf","cw_czbjsqjl_gxqglf","cw_czbjsqjl_gxqguanlif","cw_czbjsqjl_gxhwdzgce","cw_czbjsqjl_gxhzkl","cw_czbjsqjl_gxhqye","cw_czbjsqjl_gxhsuijin","cw_czbjsqjl_gxhsuijinbfb","cw_czbjsqjl_gxhsjf","cw_czbjsqjl_gxhglf","cw_czbjsqjl_gxhguanlif","cw_czbjsqjl_bz","crm_khxx_hth","cw_czbjsqjl_sfxyjjz","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_qyrq","dwbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh","sqsj"};
	pageObj.setKey(keyName);

//设置列超级连接
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
  <B><font size="3">重做报价－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(580);
%>
   
   <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="1%">完成标志</td>
    <td rowspan="2" width="1%">需业绩结转</td>
    <td rowspan="2" width="2%">业绩结转时间</td>
    <td rowspan="2" width="1%">客户编号</td>
    <td rowspan="2" width="2%">合同号</td>
    <td rowspan="2" width="2%">客户姓名</td>
    <td rowspan="2" width="4%">房屋地址</td>
    <td rowspan="2" width="1%">设计师</td>
    <td rowspan="2" width="2%">签约日期</td>
    <td rowspan="2" width="3%">签约店面</td>
    <td rowspan="2" width="2%">授权时间</td>
    <td rowspan="2" width="1%">授权人</td>
    <td rowspan="2" width="2%">完成时间</td>
    <td rowspan="2" width="1%">完成人</td>
    <td colspan="15" bgcolor="#CCCC99">更新前</td>
    <td colspan="15" bgcolor="#CCCCFF">更新后</td>
    <td rowspan="2" width="19%">备注</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="2%" bgcolor="#CCCC99">工程原报价</td>
    <td  width="2%" bgcolor="#CCCC99">合同折扣</td>
    <td  width="2%" bgcolor="#CCCC99">签约额</td>
    <td  width="2%" bgcolor="#CCCC99">合同减免额</td>
    <td  width="1%" bgcolor="#CCCC99">管理费百分比</td>
    <td  width="2%" bgcolor="#CCCC99">折前管理费</td>
    <td  width="2%" bgcolor="#CCCC99">折后管理费</td>
    <td  width="2%" bgcolor="#CCCC99">管理费减免额</td>
    <td  width="1%" bgcolor="#CCCC99">税金百分比</td>
    <td  width="2%" bgcolor="#CCCC99">税金</td>
    <td  width="2%" bgcolor="#CCCC99">税金减免额</td>
    <td  width="2%" bgcolor="#CCCC99">设计费</td>
    <td  width="2%" bgcolor="#CCCC99">折前未记入签约额部分</td>
    <td  width="2%" bgcolor="#CCCC99">折后未记入签约额部分</td>
    <td  width="5%" bgcolor="#CCCC99">未记入签约额项目</td>

    <td  width="2%" bgcolor="#CCCCFF">工程原报价</td>
    <td  width="2%" bgcolor="#CCCCFF">合同折扣</td>
    <td  width="2%" bgcolor="#CCCCFF">签约额</td>
    <td  width="2%" bgcolor="#CCCCFF">合同减免额</td>
    <td  width="1%" bgcolor="#CCCCFF">管理费百分比</td>
    <td  width="2%" bgcolor="#CCCCFF">折前管理费</td>
    <td  width="2%" bgcolor="#CCCCFF">折后管理费</td>
    <td  width="2%" bgcolor="#CCCCFF">管理费减免额</td>
    <td  width="1%" bgcolor="#CCCCFF">税金百分比</td>
    <td  width="2%" bgcolor="#CCCCFF">税金</td>
    <td  width="2%" bgcolor="#CCCCFF">税金减免额</td>
    <td  width="2%" bgcolor="#CCCCFF">设计费</td>
    <td  width="2%" bgcolor="#CCCCFF">折前未记入签约额部分</td>
    <td  width="2%" bgcolor="#CCCCFF">折后未记入签约额部分</td>
    <td  width="5%" bgcolor="#CCCCFF">未记入签约额项目</td>
  </tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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