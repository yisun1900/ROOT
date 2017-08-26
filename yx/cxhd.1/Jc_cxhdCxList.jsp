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
	String jc_cxhd_cxhdbm=null;
	String jc_cxhd_cxhdmc=null;
	String jc_cxhd_fgsbh=null;
	String jc_cxhd_dj=null;
	String jc_cxhd_gcfzk=null;
	String jc_cxhd_gczxzk=null;
	String jc_cxhd_glfzk=null;
	String jc_cxhd_fjmc=null;
	String jc_cxhd_jsbz=null;
	String jc_cxhd_spbz=null;

	String hdlx=null;
	String zklx=null;
	hdlx=request.getParameter("hdlx");
	if (hdlx!=null)
	{
		hdlx=cf.GB2Uni(hdlx);
		if (!(hdlx.equals("")))	wheresql+=" and  (jc_cxhd.hdlx='"+hdlx+"')";
	}
	zklx=request.getParameter("zklx");
	if (zklx!=null)
	{
		zklx=cf.GB2Uni(zklx);
		if (!(zklx.equals("")))	wheresql+=" and  (jc_cxhd.zklx='"+zklx+"')";
	}

	String kgxqthd=null;
	kgxqthd=request.getParameter("kgxqthd");
	if (kgxqthd!=null)
	{
		kgxqthd=cf.GB2Uni(kgxqthd);
		if (!(kgxqthd.equals("")))	wheresql+=" and  (jc_cxhd.kgxqthd='"+kgxqthd+"')";
	}

	jc_cxhd_cxhdbm=request.getParameter("jc_cxhd_cxhdbm");
	if (jc_cxhd_cxhdbm!=null)
	{
		jc_cxhd_cxhdbm=cf.GB2Uni(jc_cxhd_cxhdbm);
		if (!(jc_cxhd_cxhdbm.equals("")))	wheresql+=" and  (jc_cxhd.cxhdbm='"+jc_cxhd_cxhdbm+"')";
	}
	jc_cxhd_cxhdmc=request.getParameter("jc_cxhd_cxhdmc");
	if (jc_cxhd_cxhdmc!=null)
	{
		jc_cxhd_cxhdmc=cf.GB2Uni(jc_cxhd_cxhdmc);
		if (!(jc_cxhd_cxhdmc.equals("")))	wheresql+=" and  (jc_cxhd.cxhdmc like '%"+jc_cxhd_cxhdmc+"%')";
	}
	jc_cxhd_fgsbh=request.getParameter("jc_cxhd_fgsbh");
	if (jc_cxhd_fgsbh!=null)
	{
		jc_cxhd_fgsbh=cf.GB2Uni(jc_cxhd_fgsbh);
		if (!(jc_cxhd_fgsbh.equals("")))	wheresql+=" and  (jc_cxhd.fgsbh='"+jc_cxhd_fgsbh+"')";
	}
	jc_cxhd_dj=request.getParameter("jc_cxhd_dj");
	if (jc_cxhd_dj!=null)
	{
		jc_cxhd_dj=jc_cxhd_dj.trim();
		if (!(jc_cxhd_dj.equals("")))	wheresql+=" and (jc_cxhd.dj="+jc_cxhd_dj+") ";
	}
	jc_cxhd_gcfzk=request.getParameter("jc_cxhd_gcfzk");
	if (jc_cxhd_gcfzk!=null)
	{
		jc_cxhd_gcfzk=jc_cxhd_gcfzk.trim();
		if (!(jc_cxhd_gcfzk.equals("")))	wheresql+=" and  (jc_cxhd.gcfzk="+jc_cxhd_gcfzk+") ";
	}
	jc_cxhd_gczxzk=request.getParameter("jc_cxhd_gczxzk");
	if (jc_cxhd_gczxzk!=null)
	{
		jc_cxhd_gczxzk=jc_cxhd_gczxzk.trim();
		if (!(jc_cxhd_gczxzk.equals("")))	wheresql+=" and  (jc_cxhd.gczxzk="+jc_cxhd_gczxzk+") ";
	}
	jc_cxhd_glfzk=request.getParameter("jc_cxhd_glfzk");
	if (jc_cxhd_glfzk!=null)
	{
		jc_cxhd_glfzk=jc_cxhd_glfzk.trim();
		if (!(jc_cxhd_glfzk.equals("")))	wheresql+=" and  (jc_cxhd.glfzk="+jc_cxhd_glfzk+") ";
	}
	jc_cxhd_fjmc=request.getParameter("jc_cxhd_fjmc");
	if (jc_cxhd_fjmc!=null)
	{
		jc_cxhd_fjmc=cf.GB2Uni(jc_cxhd_fjmc);
		if (!(jc_cxhd_fjmc.equals("")))	wheresql+=" and  (jc_cxhd.fjmc='"+jc_cxhd_fjmc+"')";
	}
	jc_cxhd_jsbz=request.getParameter("jc_cxhd_jsbz");
	if (jc_cxhd_jsbz!=null)
	{
		jc_cxhd_jsbz=cf.GB2Uni(jc_cxhd_jsbz);
		if (!(jc_cxhd_jsbz.equals("")))	wheresql+=" and  (jc_cxhd.jsbz='"+jc_cxhd_jsbz+"')";
	}
	jc_cxhd_spbz=request.getParameter("jc_cxhd_spbz");
	if (jc_cxhd_spbz!=null)
	{
		jc_cxhd_spbz=cf.GB2Uni(jc_cxhd_spbz);
		if (!(jc_cxhd_spbz.equals("")))	wheresql+=" and  (jc_cxhd.spbz='"+jc_cxhd_spbz+"')";
	}
	ls_sql="SELECT jc_cxhd.cxhdbm,jc_cxhd.cxhdmc,DECODE(jc_cxhd.zklx,'1','整单打折','2','单项打折','3','部分费用打折','4','无折扣') zklx, sq_dwxx.dwmc,DECODE(jc_cxhd.jsbz,'N','未结束','Y','结束') jsbz,jc_cxhdsj.kssj,jc_cxhdsj.cxjssj,jc_cxhdsj.qdjssj,jc_cxhd.dj,jc_cxhd.fxgck,jc_cxhd.fxzck,jc_cxhd.zdzk,jc_cxhd.gcfzk,jc_cxhd.glfzk,jc_cxhd.sjzk,jc_cxhd.sjfzk,jc_cxhd.qtsfxmzk,DECODE(jc_cxhd.zjxzklx,'1','同合同','2','独立折扣'),DECODE(jc_cxhd.sfybfxmzk,'Y','有','N','无'),'<A HREF=\"/jcjj/cxhd/file/'||jc_cxhd.fjmc||'\" target=\"_blank\">'||jc_cxhd.fjmc||'</A>' fjmc, DECODE(jc_cxhd.hdlx,'1','无活动','2','公司活动','3','小区活动','4','展会活动','5','市场活动') hdlx, DECODE(jc_cxhd.kgxqthd,'1','不可共享','2','可共享') kgxqthd, DECODE(jc_cxhd.spbz,'N','未审批','Y','审批') spbz,jc_cxhd.bz  ";
	ls_sql+=" FROM jc_cxhd,sq_dwxx,jc_cxhdsj  ";
    ls_sql+=" where jc_cxhd.fgsbh=sq_dwxx.dwbh";
    ls_sql+=" and jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cxhd.fgsbh,jc_cxhd.jsbz,jc_cxhd.cxhdmc,jc_cxhdsj.kssj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cxhdCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cxhdbm","jc_cxhd_cxhdmc","sq_dwxx_dwmc","jc_cxhd_dj","jc_cxhd_gcfzk","jc_cxhd_gczxzk","jc_cxhd_glfzk","jc_cxhd_fjmc","jc_cxhd_hdlx","jc_cxhd_zklx","jc_cxhd_jsbz","jc_cxhd_spbz","jc_cxhd_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cxhdbm"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"cxhdbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_cxhd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cxhdbm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.alignStr[15]="align='left'";
	pageObj.alignStr[16]="align='left'";

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cxhdbm","1");//列参数对象加入Hash表
	spanColHash.put("cxhdmc","1");//列参数对象加入Hash表
	spanColHash.put("zklx","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("jsbz","1");//列参数对象加入Hash表

	spanColHash.put("dj","1");//列参数对象加入Hash表
	spanColHash.put("zdzk","1");//列参数对象加入Hash表
	spanColHash.put("gcfzk","1");//列参数对象加入Hash表
	spanColHash.put("gczxzk","1");//列参数对象加入Hash表
	spanColHash.put("glfzk","1");//列参数对象加入Hash表
	spanColHash.put("fjmc","1");//列参数对象加入Hash表
	spanColHash.put("hdlx","1");//列参数对象加入Hash表
	spanColHash.put("kgxqthd","1");//列参数对象加入Hash表
	spanColHash.put("spbz","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表

	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">促销活动管理－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(290);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">促销活动编码</td>
	<td  width="12%">促销活动名称</td>
	<td  width="3%">折扣类型</td>
	<td  width="5%">分公司</td>
	<td  width="3%">结束标志</td>
	<td  width="3%">开始时间(>=)</td>
	<td  width="3%">促销结束时间(<=)</td>
	<td  width="3%">签单结束时间(<=)</td>
	<td  width="3%">订金</td>
	<td  width="2%">多倍返现工程款</td>
	<td  width="2%">多倍返现主材款</td>
	<td  width="3%">整单折扣</td>
	<td  width="3%">工程费折扣</td>
	<td  width="3%">管理费折扣</td>
	<td  width="3%">税金折扣</td>
	<td  width="3%">设计费折扣</td>
	<td  width="3%">其它收费项目折扣</td>
	<td  width="3%">增减项折扣</td>
	<td  width="3%">是否有部分项目打折</td>
	<td  width="10%">附件名称</td>
	<td  width="3%">活动类型</td>
	<td  width="3%">可共享其它活动</td>
	<td  width="3%">审批标志</td>
	<td  width="19%">备注</td>
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