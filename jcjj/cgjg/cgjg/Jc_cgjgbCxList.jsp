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
	String jc_cgjgb_cgbm=null;
	String jc_cgjgb_cgmc=null;
	String jc_cgjgb_zsmbdj=null;
	String jc_cgjgb_mbbm=null;
	String jc_cgjgb_mbfbbm=null;
	String jc_cgjgb_xtbm=null;
	String jc_cgjgb_lsbm=null;
	String jc_cgjgb_tjbbm=null;
	String jc_cgjgb_ctbm=null;
	String jc_cgjgb_jlbm=null;
	jc_cgjgb_cgbm=request.getParameter("jc_cgjgb_cgbm");
	if (jc_cgjgb_cgbm!=null)
	{
		jc_cgjgb_cgbm=cf.GB2Uni(jc_cgjgb_cgbm);
		if (!(jc_cgjgb_cgbm.equals("")))	wheresql+=" and  (jc_cgjgb.cgbm='"+jc_cgjgb_cgbm+"')";
	}
	jc_cgjgb_cgmc=request.getParameter("jc_cgjgb_cgmc");
	if (jc_cgjgb_cgmc!=null)
	{
		jc_cgjgb_cgmc=cf.GB2Uni(jc_cgjgb_cgmc);
		if (!(jc_cgjgb_cgmc.equals("")))	wheresql+=" and  (jc_cgjgb.cgmc='"+jc_cgjgb_cgmc+"')";
	}
	jc_cgjgb_zsmbdj=request.getParameter("jc_cgjgb_zsmbdj");
	if (jc_cgjgb_zsmbdj!=null)
	{
		jc_cgjgb_zsmbdj=jc_cgjgb_zsmbdj.trim();
		if (!(jc_cgjgb_zsmbdj.equals("")))	wheresql+=" and  (jc_cgjgb.zsmbdj="+jc_cgjgb_zsmbdj+") ";
	}
	jc_cgjgb_mbbm=request.getParameter("jc_cgjgb_mbbm");
	if (jc_cgjgb_mbbm!=null)
	{
		jc_cgjgb_mbbm=cf.GB2Uni(jc_cgjgb_mbbm);
		if (!(jc_cgjgb_mbbm.equals("")))	wheresql+=" and  (jc_cgjgb.mbbm='"+jc_cgjgb_mbbm+"')";
	}
	jc_cgjgb_mbfbbm=request.getParameter("jc_cgjgb_mbfbbm");
	if (jc_cgjgb_mbfbbm!=null)
	{
		jc_cgjgb_mbfbbm=cf.GB2Uni(jc_cgjgb_mbfbbm);
		if (!(jc_cgjgb_mbfbbm.equals("")))	wheresql+=" and  (jc_cgjgb.mbfbbm='"+jc_cgjgb_mbfbbm+"')";
	}
	jc_cgjgb_xtbm=request.getParameter("jc_cgjgb_xtbm");
	if (jc_cgjgb_xtbm!=null)
	{
		jc_cgjgb_xtbm=cf.GB2Uni(jc_cgjgb_xtbm);
		if (!(jc_cgjgb_xtbm.equals("")))	wheresql+=" and  (jc_cgjgb.xtbm='"+jc_cgjgb_xtbm+"')";
	}
	jc_cgjgb_lsbm=request.getParameter("jc_cgjgb_lsbm");
	if (jc_cgjgb_lsbm!=null)
	{
		jc_cgjgb_lsbm=cf.GB2Uni(jc_cgjgb_lsbm);
		if (!(jc_cgjgb_lsbm.equals("")))	wheresql+=" and  (jc_cgjgb.lsbm='"+jc_cgjgb_lsbm+"')";
	}
	jc_cgjgb_tjbbm=request.getParameter("jc_cgjgb_tjbbm");
	if (jc_cgjgb_tjbbm!=null)
	{
		jc_cgjgb_tjbbm=cf.GB2Uni(jc_cgjgb_tjbbm);
		if (!(jc_cgjgb_tjbbm.equals("")))	wheresql+=" and  (jc_cgjgb.tjbbm='"+jc_cgjgb_tjbbm+"')";
	}
	jc_cgjgb_ctbm=request.getParameter("jc_cgjgb_ctbm");
	if (jc_cgjgb_ctbm!=null)
	{
		jc_cgjgb_ctbm=cf.GB2Uni(jc_cgjgb_ctbm);
		if (!(jc_cgjgb_ctbm.equals("")))	wheresql+=" and  (jc_cgjgb.ctbm='"+jc_cgjgb_ctbm+"')";
	}
	jc_cgjgb_jlbm=request.getParameter("jc_cgjgb_jlbm");
	if (jc_cgjgb_jlbm!=null)
	{
		jc_cgjgb_jlbm=cf.GB2Uni(jc_cgjgb_jlbm);
		if (!(jc_cgjgb_jlbm.equals("")))	wheresql+=" and  (jc_cgjgb.jlbm='"+jc_cgjgb_jlbm+"')";
	}
	ls_sql="SELECT cgbm,jc_cgjgb.cgmc,jc_cgjgb.zsmbdj,jdm_mbbm.mbmc,jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_tjbbm.tjbmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,'<IMG SRC=\"/jcjj/cgjg/cgjg/images/'||UPPER(zp)||'\" >' zp,jc_cgjgb.bz  ";
	ls_sql+=" FROM jc_cgjgb,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm  ";
    ls_sql+=" where jc_cgjgb.jlbm=jdm_jlbm.jlbm(+) and jc_cgjgb.ctbm=jdm_ctbm.ctbm(+) and jc_cgjgb.tjbbm=jdm_tjbbm.tjbbm(+)";
    ls_sql+=" and jc_cgjgb.lsbm=jdm_lsbm.lsbm(+) and jc_cgjgb.xtbm=jdm_xtbm.xtbm(+) and jc_cgjgb.mbfbbm=jdm_mbfbbm.mbfbbm(+)";
    ls_sql+=" and jc_cgjgb.mbbm=jdm_mbbm.mbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgjgb.cgbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgjgbCxList.jsp","SelectCxJc_cgjgb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cgbm","jc_cgjgb_cgmc","jc_cgjgb_tmdj","jc_cgjgb_zsmbdj","jdm_mbbm_mbmc","jdm_mbfbbm_mbfbmc","jdm_xtbm_xtmc","jdm_lsbm_lsmc","jdm_tjbbm_tjbmc","jdm_ctbm_ctmc","jdm_jlbm_jlmc","jdm_tmczbm_tmczmc","jc_cgjgb_zp","jc_cgjgb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cgbm"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"cgbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_cgjgb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cgbm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">橱柜编码</td>
	<td  width="10%">橱柜名称</td>
	<td  width="6%">装饰门板单价</td>
	<td  width="8%">门板</td>
	<td  width="8%">门板封边</td>
	<td  width="9%">箱体</td>
	<td  width="10%">拉手</td>
	<td  width="8%">踢脚板</td>
	<td  width="9%">抽屉</td>
	<td  width="6%">铰链</td>
	<td  width="10%">照片</td>
	<td  width="10%">备注</td>
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