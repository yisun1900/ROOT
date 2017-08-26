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
	String jc_cgdd_lrsj=null;
	String jc_jjdd_lrsj=null;
	String xz=null;
	xz=request.getParameter("xz");
	if (xz.equals("C"))
	{
		jc_cgdd_lrsj=request.getParameter("lrsj");
		if (jc_cgdd_lrsj!=null)
		{
			jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
			if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
		}
		jc_cgdd_lrsj=request.getParameter("lrsj2");
		if (jc_cgdd_lrsj!=null)
		{
			jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
			if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
		}

		ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.jhccsj as jhccsj,jc_cgdd.sccsj as sccsj,jc_cgdd.jhfcsj as jhfcsj,jc_cgdd.sfcsj as sfcsj,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,clztmc,DECODE(jc_cgdd.khlx,'2','家装客户','4','非家装客户') as jc_cgdd_khlx,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
		ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_dwxx  ";
		ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh";
		ls_sql+=" and ( jc_cgdd.jhccsj<>jc_cgdd.sccsj or jc_cgdd.jhfcsj<>jc_cgdd.sfcsj) and jc_cgdd.clzt in ('07','11')";
		ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by jc_cgdd.lrsj";
//		out.println(ls_sql);
		pageObj.sql=ls_sql;
		//进行对象初始化
			pageObj.initPage("fkCxList.jsp","SelectFkcx.jsp","","");
		//	pageObj.setPageRow(10);//设置每页显示记录数
		//设置显示列
		String[] disColName={"ddbh","jc_cgdd_cgsjs","jhccsj","sccsj","jhfcsj","sfcsj","clztmc","khxm","fwdz","hth","jc_cgdd_dj","jc_cgdd_khlx","sq_dwxx_dwmc"};
		pageObj.setDisColName(disColName);

	//设置主键
		String[] keyName={"ddbh"};
		pageObj.setKey(keyName);
	//设置列超级连接
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("jc_cgdd_khxm",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	}
	else
	{
		wheresql="";
		jc_jjdd_lrsj=request.getParameter("lrsj");
		if (jc_jjdd_lrsj!=null)
		{
			jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
			if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
		}
		jc_jjdd_lrsj=request.getParameter("lrsj2");
		if (jc_jjdd_lrsj!=null)
		{
			jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
			if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
		}

		ls_sql="SELECT jc_jjdd.ddbh as ddbh,jc_jjdd.jhccsj as jhccsj,jc_jjdd.sccsj as sccsj,jc_jjdd.jhfcsj as jhfcsj,jc_jjdd.sfcsj as sfcsj,jc_jjdd.khbh as khbh,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.jjsjs as jc_jjdd_jjsjs, DECODE(jc_jjdd.kfcbz,'Y','可复测','N','不可复测') as jc_jjdd_kfcbz,clztmc, DECODE(jc_jjdd.khlx,'1','装修客户','2','橱柜客户') as jc_jjdd_khlx,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.hth as hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
		ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_dwxx  ";
		ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh and jc_jjdd.clzt in('00','01')";
		ls_sql+=" and ( jc_jjdd.jhccsj<>jc_jjdd.sccsj or jc_jjdd.jhfcsj<>jc_jjdd.sfcsj)";
		ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
		ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by jc_jjdd.lrsj";
			pageObj.sql=ls_sql;
		//进行对象初始化
			pageObj.initPage("fkCxList.jsp","SelectFkcx.jsp","","");
		//	pageObj.setPageRow(10);//设置每页显示记录数
		//设置显示列
		String[] disColName={"ddbh","clztmc","jhccsj","sccsj","jhfcsj","sfcsj","jc_jjdd_clzt","khxm","fwdz","hth","jc_jjdd_dj","jc_jjdd_kfcbz","jc_jjdd_khlx","sq_dwxx_dwmc"};
	    pageObj.setDisColName(disColName);

	//设置主键
		String[] keyName={"ddbh"};
		pageObj.setKey(keyName);
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
		String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">订单编号</td>
	<td  width="8%">家居设计师</td>
	<td  width="9%">计划初测时间</td>
    <td  width="9%">实际初测时间</td>
	<td  width="9%">计划复测时间</td>
	<td  width="9%">实际复测时间</td>
	<td  width="4%">处理状态</td>
	<td  width="6%">客户姓名</td>
	<td  width="22%">房屋地址</td>
	<td  width="9%">合同号</td>
	<td  width="6%">订金</td>
	<td  width="8%">客户类型</td>
	<td  width="11%">录入部门</td>
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