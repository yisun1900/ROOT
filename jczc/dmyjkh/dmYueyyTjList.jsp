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
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+dwbh+"')";
	}

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,ssdqmc,dqmc,(select dwmc from sq_dwxx b where b.dwbh=sq_dwxx.ssfgs) ssfgs,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,dwflmc,sq_dwxx.bianma,sq_dwxx.cwdm,sq_dwxx.hthqz,ssfwmc,dwjbmc,dmxsmc,bzrs,dwdh,dwcz,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.bz";
	ls_sql+=" FROM sq_dwxx,dm_dqbm,sq_ssdqbm,dm_dwflbm,dm_ssfw,dm_dwjb,dm_dmxs  ";
    ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm(+) and sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) and sq_dwxx.dwflbm=dm_dwflbm.dwflbm(+)";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
    ls_sql+=" and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.dwlx,dwbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("dmYueyyTjList.jsp","EnterDmYueyyTj.jsp","","InsertCw_dmkhjl.jsp?nian="+nian+"&yue="+yue);
	pageObj.setPageRow(300);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dwbh","sq_dwxx_dwmc","sq_dwxx_dwjc","sq_dwxx_ssdw","sq_dwxx_dwlx","sq_dwxx_dwfzr","sq_dwxx_dwdh","dm_fgflbm_fgflmc","dm_ysbm_ysmc","dm_cqbm_cqmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditBolt("");
	pageObj.setEditStr("统计");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_dmkhcz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dwmc",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">店面月运营统计</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">单位编号</td>
	<td  width="6%">单位名称</td>
	<td  width="3%">所属大区</td>
	<td  width="3%">所属地区</td>
	<td  width="4%">所属分公司</td>
	<td  width="4%">上级单位</td>
	<td  width="3%">单位分类</td>
	<td  width="2%">编码</td>
	<td  width="2%">财务代码</td>
	<td  width="3%">合同号前缀</td>
	<td  width="6%">所属方位</td>
	<td  width="3%">单位级别</td>
	<td  width="3%">店面形式</td>
	<td  width="3%">标准人数</td>
	<td  width="13%">电话</td>
	<td  width="7%">传真</td>
	<td  width="3%">开店时间</td>
	<td  width="3%">关店时间</td>
	<td  width="13%">备注</td>
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