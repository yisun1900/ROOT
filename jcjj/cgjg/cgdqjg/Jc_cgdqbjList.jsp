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
	String jc_cgdqbj_dqbm=null;
	String jc_cgdqbj_dqmc=null;
	String jc_cgdqbj_dqlbbm=null;
	String jc_cgdqbj_xh=null;
	String jc_cgdqbj_gg=null;
	String jc_cgdqbj_jldw=null;
	String jc_cgdqbj_cptz=null;
	String jc_cgdqbj_cd=null;
	String jc_cgdqbj_lsj=null;
	String jc_cgdqbj_yhj=null;
	String jc_cgdqbj_dwbh=null;
	jc_cgdqbj_dqbm=request.getParameter("jc_cgdqbj_dqbm");
	if (jc_cgdqbj_dqbm!=null)
	{
		jc_cgdqbj_dqbm=cf.GB2Uni(jc_cgdqbj_dqbm);
		if (!(jc_cgdqbj_dqbm.equals("")))	wheresql+=" and  (jc_cgdqbj.dqbm='"+jc_cgdqbj_dqbm+"')";
	}
	jc_cgdqbj_dqmc=request.getParameter("jc_cgdqbj_dqmc");
	if (jc_cgdqbj_dqmc!=null)
	{
		jc_cgdqbj_dqmc=cf.GB2Uni(jc_cgdqbj_dqmc);
		if (!(jc_cgdqbj_dqmc.equals("")))	wheresql+=" and  (jc_cgdqbj.dqmc='"+jc_cgdqbj_dqmc+"')";
	}
	jc_cgdqbj_dqlbbm=request.getParameter("jc_cgdqbj_dqlbbm");
	if (jc_cgdqbj_dqlbbm!=null)
	{
		jc_cgdqbj_dqlbbm=cf.GB2Uni(jc_cgdqbj_dqlbbm);
		if (!(jc_cgdqbj_dqlbbm.equals("")))	wheresql+=" and  (jc_cgdqbj.dqlbbm='"+jc_cgdqbj_dqlbbm+"')";
	}
	jc_cgdqbj_xh=request.getParameter("jc_cgdqbj_xh");
	if (jc_cgdqbj_xh!=null)
	{
		jc_cgdqbj_xh=cf.GB2Uni(jc_cgdqbj_xh);
		if (!(jc_cgdqbj_xh.equals("")))	wheresql+=" and  (jc_cgdqbj.xh='"+jc_cgdqbj_xh+"')";
	}
	jc_cgdqbj_gg=request.getParameter("jc_cgdqbj_gg");
	if (jc_cgdqbj_gg!=null)
	{
		jc_cgdqbj_gg=cf.GB2Uni(jc_cgdqbj_gg);
		if (!(jc_cgdqbj_gg.equals("")))	wheresql+=" and  (jc_cgdqbj.gg='"+jc_cgdqbj_gg+"')";
	}
	jc_cgdqbj_jldw=request.getParameter("jc_cgdqbj_jldw");
	if (jc_cgdqbj_jldw!=null)
	{
		jc_cgdqbj_jldw=cf.GB2Uni(jc_cgdqbj_jldw);
		if (!(jc_cgdqbj_jldw.equals("")))	wheresql+=" and  (jc_cgdqbj.jldw='"+jc_cgdqbj_jldw+"')";
	}
	jc_cgdqbj_cptz=request.getParameter("jc_cgdqbj_cptz");
	if (jc_cgdqbj_cptz!=null)
	{
		jc_cgdqbj_cptz=cf.GB2Uni(jc_cgdqbj_cptz);
		if (!(jc_cgdqbj_cptz.equals("")))	wheresql+=" and  (jc_cgdqbj.cptz='"+jc_cgdqbj_cptz+"')";
	}
	jc_cgdqbj_cd=request.getParameter("jc_cgdqbj_cd");
	if (jc_cgdqbj_cd!=null)
	{
		jc_cgdqbj_cd=cf.GB2Uni(jc_cgdqbj_cd);
		if (!(jc_cgdqbj_cd.equals("")))	wheresql+=" and  (jc_cgdqbj.cd='"+jc_cgdqbj_cd+"')";
	}
	jc_cgdqbj_lsj=request.getParameter("jc_cgdqbj_lsj");
	if (jc_cgdqbj_lsj!=null)
	{
		jc_cgdqbj_lsj=jc_cgdqbj_lsj.trim();
		if (!(jc_cgdqbj_lsj.equals("")))	wheresql+=" and  (jc_cgdqbj.lsj="+jc_cgdqbj_lsj+") ";
	}
	jc_cgdqbj_yhj=request.getParameter("jc_cgdqbj_yhj");
	if (jc_cgdqbj_yhj!=null)
	{
		jc_cgdqbj_yhj=jc_cgdqbj_yhj.trim();
		if (!(jc_cgdqbj_yhj.equals("")))	wheresql+=" and  (jc_cgdqbj.yhj="+jc_cgdqbj_yhj+") ";
	}
	jc_cgdqbj_dwbh=request.getParameter("jc_cgdqbj_dwbh");
	if (jc_cgdqbj_dwbh!=null)
	{
		jc_cgdqbj_dwbh=cf.GB2Uni(jc_cgdqbj_dwbh);
		if (!(jc_cgdqbj_dwbh.equals("")))	wheresql+=" and  (jc_cgdqbj.dwbh='"+jc_cgdqbj_dwbh+"')";
	}
	ls_sql="SELECT jc_cgdqbj.dqbm,jc_cgdqbj.dqmc,jdm_dqlbbm.dqlbmc,jc_cgdqbj.xh,jc_cgdqbj.gg,jc_cgdqbj.jldw,jc_cgdqbj.cptz,jc_cgdqbj.cd,jc_cgdqbj.lsj,jc_cgdqbj.yhj,sq_dwxx.dwmc,jc_cgdqbj.zp,jc_cgdqbj.bz  ";
	ls_sql+=" FROM sq_dwxx,jdm_dqlbbm,jc_cgdqbj  ";
    ls_sql+=" where jc_cgdqbj.dwbh=sq_dwxx.dwbh and jc_cgdqbj.dqlbbm=jdm_dqlbbm.dqlbbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdqbj.dqbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgdqbjList.jsp","SelectJc_cgdqbj.jsp","","EditJc_cgdqbj.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","jc_cgdqbj_dqmc","jdm_dqlbbm_dqlbmc","jc_cgdqbj_xh","jc_cgdqbj_gg","jc_cgdqbj_jldw","jc_cgdqbj_cptz","jc_cgdqbj_cd","jc_cgdqbj_lsj","jc_cgdqbj_yhj","sq_dwxx_dwmc","jc_cgdqbj_zp","jc_cgdqbj_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_cgdqbjList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] dqbm = request.getParameterValues("dqbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dqbm,"dqbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_cgdqbj where "+chooseitem;
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">电器编码</td>
	<td  width="6%">电器名称</td>
	<td  width="6%">电器类别</td>
	<td  width="8%">型号</td>
	<td  width="6%">规格</td>
	<td  width="6%">计量单位</td>
	<td  width="16%">产品特征</td>
	<td  width="6%">产地</td>
	<td  width="6%">零售价</td>
	<td  width="6%">优惠价</td>
	<td  width="6%">生产厂家</td>
	<td  width="10%">照片</td>
	<td  width="6%">备注</td>
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