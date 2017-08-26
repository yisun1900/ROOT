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
	String gcysbbh=null;
	String gcysxmbm=null;
	String gcysxmmc=null;
	String ysxmflbm=null;
	String dygcjdbm=null;
	String sfsgjdb=null;
	String jdbm=null;
	String sfhf=null;
	String hflxbm=null;
	String ljskbfb=null;
	String yszxsl=null;
	String byxsl=null;
	String fbyxzxsl=null;
	gcysbbh=request.getParameter("gcysbbh");
	if (gcysbbh!=null)
	{
		gcysbbh=cf.GB2Uni(gcysbbh);
		if (!(gcysbbh.equals("")))	wheresql+=" and  (dm_heysxm.gcysbbh='"+gcysbbh+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (dm_heysxm.gcysxmbm='"+gcysxmbm+"')";
	}
	gcysxmmc=request.getParameter("gcysxmmc");
	if (gcysxmmc!=null)
	{
		gcysxmmc=cf.GB2Uni(gcysxmmc);
		if (!(gcysxmmc.equals("")))	wheresql+=" and  (dm_heysxm.gcysxmmc='"+gcysxmmc+"')";
	}
	ysxmflbm=request.getParameter("ysxmflbm");
	if (ysxmflbm!=null)
	{
		ysxmflbm=cf.GB2Uni(ysxmflbm);
		if (!(ysxmflbm.equals("")))	wheresql+=" and  (dm_heysxm.ysxmflbm='"+ysxmflbm+"')";
	}
	dygcjdbm=request.getParameter("dygcjdbm");
	if (dygcjdbm!=null)
	{
		dygcjdbm=cf.GB2Uni(dygcjdbm);
		if (!(dygcjdbm.equals("")))	wheresql+=" and  (dm_heysxm.dygcjdbm='"+dygcjdbm+"')";
	}
	sfsgjdb=request.getParameter("sfsgjdb");
	if (sfsgjdb!=null)
	{
		sfsgjdb=cf.GB2Uni(sfsgjdb);
		if (!(sfsgjdb.equals("")))	wheresql+=" and  (dm_heysxm.sfsgjdb='"+sfsgjdb+"')";
	}
	jdbm=request.getParameter("jdbm");
	if (jdbm!=null)
	{
		jdbm=cf.GB2Uni(jdbm);
		if (!(jdbm.equals("")))	wheresql+=" and  (dm_heysxm.jdbm='"+jdbm+"')";
	}
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (dm_heysxm.sfhf='"+sfhf+"')";
	}
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (dm_heysxm.hflxbm='"+hflxbm+"')";
	}
	ljskbfb=request.getParameter("ljskbfb");
	if (ljskbfb!=null)
	{
		ljskbfb=ljskbfb.trim();
		if (!(ljskbfb.equals("")))	wheresql+=" and  (dm_heysxm.ljskbfb="+ljskbfb+") ";
	}
	yszxsl=request.getParameter("yszxsl");
	if (yszxsl!=null)
	{
		yszxsl=yszxsl.trim();
		if (!(yszxsl.equals("")))	wheresql+=" and (dm_heysxm.yszxsl="+yszxsl+") ";
	}
	byxsl=request.getParameter("byxsl");
	if (byxsl!=null)
	{
		byxsl=byxsl.trim();
		if (!(byxsl.equals("")))	wheresql+=" and (byxsl="+byxsl+") ";
	}
	fbyxzxsl=request.getParameter("fbyxzxsl");
	if (fbyxzxsl!=null)
	{
		fbyxzxsl=fbyxzxsl.trim();
		if (!(fbyxzxsl.equals("")))	wheresql+=" and (dm_heysxm.fbyxzxsl="+fbyxzxsl+") ";
	}

	ls_sql="SELECT dm_heysxm.gcysbbh,dm_hegcysbb.gcysbbmc,dm_heysxm.yssx,dm_heysxm.gcysxmbm,gcysxmmc,ysxmflmc,ysgcjdmc, DECODE(sfsgjdb,'Y','是','N','否'),rwmc, DECODE(sfhf,'Y','设置','N','否'),hflxmc,ljskbfb,yszxsl,byxsl,fbyxzxsl,DECODE(xmlx,'1','验收项','2','状态项'),ysbzsm,dm_heysxm.bz  ";
	ls_sql+=" FROM dm_heysxm,dm_hegcysbb,dm_ysxmflbm,dm_gcjdbm,dm_hflxbm,gdm_rwbm ";
	ls_sql+=" where dm_heysxm.gcysbbh=dm_hegcysbb.gcysbbh(+) ";
    ls_sql+=" and dm_heysxm.ysxmflbm=dm_ysxmflbm.ysxmflbm(+) and dm_heysxm.dygcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and dm_heysxm.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=" and dm_heysxm.jdbm=gdm_rwbm.rwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_heysxm.gcysbbh desc,dm_heysxm.yssx";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_heysxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gcysbbh","gcysxmbm","gcysxmmc","ysxmflbm","dygcjdbm","sfsgjdb","jdbm","sfhf","hflxbm","ljskbfb","yszxsl","byxsl","fbyxzxsl","ysbzsm","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gcysbbh","gcysxmbm"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">验收版本号</td>
	<td  width="7%">验收版本号</td>
	<td  width="3%">验收顺序</td>
	<td  width="3%">验收项目编码</td>
	<td  width="9%">验收项目名称</td>
	<td  width="4%">验收项目分类</td>
	<td  width="4%">对应工程进度</td>
	<td  width="3%">是否关联施工进度表</td>
	<td  width="5%">施工进度进度节点</td>
	<td  width="3%">是否回访</td>
	<td  width="5%">回访类型</td>
	<td  width="3%">累计家装收款百分比</td>
	<td  width="3%">验收子项数量</td>
	<td  width="3%">必验项数量</td>
	<td  width="3%">非必验项最小数量</td>
	<td  width="3%">项目类型</td>
	<td  width="25%">验收标准说明</td>
	<td  width="235%">备注</td>
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