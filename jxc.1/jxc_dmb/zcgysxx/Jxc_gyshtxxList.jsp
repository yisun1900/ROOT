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
	String jxc_gyshtxx_htbh=null;
	String jxc_gyshtxx_dqbm=null;
	String jxc_gyshtxx_gysmc=null;
	String jxc_gyshtxx_gysdz=null;
	String jxc_gyshtxx_gysfzr=null;
	String jxc_gyshtxx_gysdh=null;
	String jxc_gyshtxx_gyscz=null;
	String jxc_gyshtxx_kssj=null;
	String jxc_gyshtxx_jssj=null;
	String jxc_gyshtxx_lrbz=null;
	jxc_gyshtxx_htbh=request.getParameter("jxc_gyshtxx_htbh");
	if (jxc_gyshtxx_htbh!=null)
	{
		jxc_gyshtxx_htbh=cf.GB2Uni(jxc_gyshtxx_htbh);
		if (!(jxc_gyshtxx_htbh.equals("")))	wheresql+=" and  (jxc_gyshtxx.htbh='"+jxc_gyshtxx_htbh+"')";
	}
	jxc_gyshtxx_dqbm=request.getParameter("jxc_gyshtxx_dqbm");
	if (jxc_gyshtxx_dqbm!=null)
	{
		jxc_gyshtxx_dqbm=cf.GB2Uni(jxc_gyshtxx_dqbm);
		if (!(jxc_gyshtxx_dqbm.equals("")))	wheresql+=" and  (jxc_gyshtxx.dqbm='"+jxc_gyshtxx_dqbm+"')";
	}
	jxc_gyshtxx_gysmc=request.getParameter("jxc_gyshtxx_gysmc");
	if (jxc_gyshtxx_gysmc!=null)
	{
		jxc_gyshtxx_gysmc=cf.GB2Uni(jxc_gyshtxx_gysmc);
		if (!(jxc_gyshtxx_gysmc.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysmc like '%"+jxc_gyshtxx_gysmc+"%')";
	}
	jxc_gyshtxx_gysdz=request.getParameter("jxc_gyshtxx_gysdz");
	if (jxc_gyshtxx_gysdz!=null)
	{
		jxc_gyshtxx_gysdz=cf.GB2Uni(jxc_gyshtxx_gysdz);
		if (!(jxc_gyshtxx_gysdz.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysdz='"+jxc_gyshtxx_gysdz+"')";
	}
	jxc_gyshtxx_gysfzr=request.getParameter("jxc_gyshtxx_gysfzr");
	if (jxc_gyshtxx_gysfzr!=null)
	{
		jxc_gyshtxx_gysfzr=cf.GB2Uni(jxc_gyshtxx_gysfzr);
		if (!(jxc_gyshtxx_gysfzr.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysfzr='"+jxc_gyshtxx_gysfzr+"')";
	}
	jxc_gyshtxx_gysdh=request.getParameter("jxc_gyshtxx_gysdh");
	if (jxc_gyshtxx_gysdh!=null)
	{
		jxc_gyshtxx_gysdh=cf.GB2Uni(jxc_gyshtxx_gysdh);
		if (!(jxc_gyshtxx_gysdh.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysdh='"+jxc_gyshtxx_gysdh+"')";
	}
	jxc_gyshtxx_gyscz=request.getParameter("jxc_gyshtxx_gyscz");
	if (jxc_gyshtxx_gyscz!=null)
	{
		jxc_gyshtxx_gyscz=cf.GB2Uni(jxc_gyshtxx_gyscz);
		if (!(jxc_gyshtxx_gyscz.equals("")))	wheresql+=" and  (jxc_gyshtxx.gyscz='"+jxc_gyshtxx_gyscz+"')";
	}
	jxc_gyshtxx_kssj=request.getParameter("jxc_gyshtxx_kssj");
	if (jxc_gyshtxx_kssj!=null)
	{
		jxc_gyshtxx_kssj=jxc_gyshtxx_kssj.trim();
		if (!(jxc_gyshtxx_kssj.equals("")))	wheresql+="  and (jxc_gyshtxx.kssj>=TO_DATE('"+jxc_gyshtxx_kssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_kssj=request.getParameter("jxc_gyshtxx_kssj2");
	if (jxc_gyshtxx_kssj!=null)
	{
		jxc_gyshtxx_kssj=jxc_gyshtxx_kssj.trim();
		if (!(jxc_gyshtxx_kssj.equals("")))	wheresql+="  and (jxc_gyshtxx.kssj<=TO_DATE('"+jxc_gyshtxx_kssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_jssj=request.getParameter("jxc_gyshtxx_jssj");
	if (jxc_gyshtxx_jssj!=null)
	{
		jxc_gyshtxx_jssj=jxc_gyshtxx_jssj.trim();
		if (!(jxc_gyshtxx_jssj.equals("")))	wheresql+="  and (jxc_gyshtxx.jssj>=TO_DATE('"+jxc_gyshtxx_jssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_jssj=request.getParameter("jxc_gyshtxx_jssj2");
	if (jxc_gyshtxx_jssj!=null)
	{
		jxc_gyshtxx_jssj=jxc_gyshtxx_jssj.trim();
		if (!(jxc_gyshtxx_jssj.equals("")))	wheresql+="  and (jxc_gyshtxx.jssj<=TO_DATE('"+jxc_gyshtxx_jssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_lrbz=request.getParameter("jxc_gyshtxx_lrbz");
	if (jxc_gyshtxx_lrbz!=null)
	{
		jxc_gyshtxx_lrbz=cf.GB2Uni(jxc_gyshtxx_lrbz);
		if (!(jxc_gyshtxx_lrbz.equals("")))	wheresql+=" and  (jxc_gyshtxx.lrbz='"+jxc_gyshtxx_lrbz+"')";
	}
	ls_sql="SELECT jxc_gyshtxx.htbh,dm_dqbm.dqmc,jxc_gyshtxx.gysmc,jxc_gyshtxx.gysdz,jxc_gyshtxx.gysfzr,jxc_gyshtxx.gysdh,jxc_gyshtxx.gyscz,jxc_gyshtxx.kssj,jxc_gyshtxx.jssj, DECODE(jxc_gyshtxx.lrbz,'Y','录入','N','未录入'),jxc_gyshtxx.bz  ";
	ls_sql+=" FROM dm_dqbm,jxc_gyshtxx  ";
    ls_sql+=" where jxc_gyshtxx.dqbm=dm_dqbm.dqbm(+)";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_gyshtxx.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and jxc_gyshtxx.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_gyshtxx.dqbm,jxc_gyshtxx.gysmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_gyshtxxList.jsp","","","EditJxc_gyshtxx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"htbh","dm_dqbm_dqmc","jxc_gyshtxx_gysmc","jxc_gyshtxx_gysdz","jxc_gyshtxx_gysfzr","jxc_gyshtxx_gysdh","jxc_gyshtxx_gyscz","jxc_gyshtxx_kssj","jxc_gyshtxx_jssj","jxc_gyshtxx_lrbz","jxc_gyshtxx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"htbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_gyshtxxList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] htbh = request.getParameterValues("htbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(htbh,"htbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_gyshtxx where "+chooseitem;
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
  <B><font size="3">供应商合同－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">合同编号</td>
	<td  width="5%">地区名称</td>
	<td  width="14%">供应商名称</td>
	<td  width="14%">供应商地址</td>
	<td  width="5%">供应商负责人</td>
	<td  width="12%">供应商电话</td>
	<td  width="8%">供应商传真</td>
	<td  width="6%">合同开始时间</td>
	<td  width="6%">合同结束时间</td>
	<td  width="5%">录入标志</td>
	<td  width="48%">备注</td>
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