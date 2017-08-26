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
	String dqbm=null;

	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_kcb.dqbm='"+dqbm+"')";
	}
	String lydh=null;

	lydh=request.getParameter("lydh");
	if (lydh!=null)
	{
		lydh=cf.GB2Uni(lydh);
		if (!(lydh.equals("")))	wheresql+=" and  (jxc_rkd.lydh='"+lydh+"')";
	}

	ls_sql="SELECT lydh,dqmc,ckmc,hjmc,hwmc,jxc_kcb.clbm clbm,jxc_kcb.clmc clmc,DECODE(zljb,'1','<font color=green>正常品</font>','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>'),jxc_kcb.xh xh,jxc_kcb.nbbm nbbm,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_kcb.zp||'\" width=\"100px\" height=\"100px\">' zp,SUM(jxc_kcb.kcsl),jldwbm ";
	ls_sql+=" FROM jxc_kcb,dm_dqbm,jxc_ckmc,jxc_hjmc,jxc_hwmc,jxc_rkd  ";
    ls_sql+=" where jxc_kcb.rkph=jxc_rkd.rkph and jxc_kcb.dqbm=dm_dqbm.dqbm and jxc_kcb.ckbh=jxc_ckmc.ckbh and jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.hwbh=jxc_hwmc.hwbh and jxc_kcb.cllb='1' ";
    ls_sql+=wheresql;
	ls_sql+=" group by lydh,dqmc,ckmc,hjmc,hwmc,jxc_kcb.clbm,jxc_kcb.clmc,DECODE(zljb,'1','<font color=green>正常品</font>','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>'),jxc_kcb.xh,jxc_kcb.nbbm,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_kcb.zp||'\" width=\"100px\" height=\"100px\">',jldwbm";
//	ls_sql+=ordersql;
	ls_sql+=" order by dqmc,ckmc,hjmc,hwmc,jxc_kcb.clmc ";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_kcbLy.jsp","lyphzz.jsp","","");
//	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lsh","jxc_kcb_clmc","jxc_kcb_cllb","jxc_kcb_cldlbm","jxc_kcb_clxlbm","jxc_kcb_scsmc","jxc_kcb_ppmc","jxc_kcb_cllbbm","jxc_kcb_xh","jxc_kcb_gg","jxc_kcb_clysbm","jxc_kcb_jldwbm","jxc_kcb_hwbh","jxc_kcb_pjts","jxc_kcb_sfyh","jxc_kcb_cpjb","jxc_kcb_fgsx","jxc_kcb_cpsm","jxc_kcb_cd","jxc_kcb_zp","jxc_kcb_cgzq","jxc_kcb_bz","jxc_kcb_clbm","jxc_kcb_hjbh","jxc_kcb_ckbh","jxc_kcb_dqbm","jxc_kcb_rkj","jxc_kcb_kcsl","jxc_kcb_kcje"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lydh","1");//列参数对象加入Hash表
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("ckmc","1");//列参数对象加入Hash表
	spanColHash.put("hjmc","1");//列参数对象加入Hash表
	spanColHash.put("hwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">来源单号</td>
	<td  width="3%">所在地区</td>
	<td  width="5%">所在仓库</td>
	<td  width="5%">所在货架</td>
	<td  width="5%">所在货位</td>
	<td  width="2%">材料编码</td>
	<td  width="5%">材料名称</td>
	<td  width="5%">质量级别</td>
	<td  width="3%">型号</td>
	<td  width="3%">内部编码</td>
	<td  width="1%">照片</td>
	<td  width="2%">库存</td>
	<td  width="2%">单位</td>
	
</tr>
<%
	pageObj.displayDateSum();
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