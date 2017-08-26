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
	String kp_zjcfgl_cfjlh=null;
	String kp_zjcfgl_zjxm=null;
	String kp_zjcfgl_fgsbh=null;
	String kp_zjcfgl_cfr=null;
	String kp_zjcfgl_cfsj=null;
	String kp_zjcfgl_cflxbm=null;
	String kp_zjcfgl_cfyybm=null;
	String kp_zjcfgl_lrr=null;
	String kp_zjcfgl_lrsj=null;
	String kp_zjcfgl_lrdw=null;
	String kp_zjcfgl_cfspbz=null;
	String kp_zjcfgl_spr=null;
	String kp_zjcfgl_spsj=null;
	kp_zjcfgl_cfjlh=request.getParameter("kp_zjcfgl_cfjlh");
	if (kp_zjcfgl_cfjlh!=null)
	{
		kp_zjcfgl_cfjlh=kp_zjcfgl_cfjlh.trim();
		if (!(kp_zjcfgl_cfjlh.equals("")))	wheresql+=" and (kp_zjcfgl.cfjlh="+kp_zjcfgl_cfjlh+") ";
	}
	kp_zjcfgl_zjxm=request.getParameter("kp_zjcfgl_zjxm");
	if (kp_zjcfgl_zjxm!=null)
	{
		kp_zjcfgl_zjxm=cf.GB2Uni(kp_zjcfgl_zjxm);
		if (!(kp_zjcfgl_zjxm.equals("")))	wheresql+=" and  (kp_zjcfgl.zjxm='"+kp_zjcfgl_zjxm+"')";
	}
	kp_zjcfgl_fgsbh=request.getParameter("kp_zjcfgl_fgsbh");
	if (kp_zjcfgl_fgsbh!=null)
	{
		kp_zjcfgl_fgsbh=cf.GB2Uni(kp_zjcfgl_fgsbh);
		if (!(kp_zjcfgl_fgsbh.equals("")))	wheresql+=" and  (kp_zjcfgl.fgsbh='"+kp_zjcfgl_fgsbh+"')";
	}
	kp_zjcfgl_cfr=request.getParameter("kp_zjcfgl_cfr");
	if (kp_zjcfgl_cfr!=null)
	{
		kp_zjcfgl_cfr=cf.GB2Uni(kp_zjcfgl_cfr);
		if (!(kp_zjcfgl_cfr.equals("")))	wheresql+=" and  (kp_zjcfgl.cfr='"+kp_zjcfgl_cfr+"')";
	}
	kp_zjcfgl_cfsj=request.getParameter("kp_zjcfgl_cfsj");
	if (kp_zjcfgl_cfsj!=null)
	{
		kp_zjcfgl_cfsj=kp_zjcfgl_cfsj.trim();
		if (!(kp_zjcfgl_cfsj.equals("")))	wheresql+="  and (kp_zjcfgl.cfsj>=TO_DATE('"+kp_zjcfgl_cfsj+"','YYYY/MM/DD'))";
	}
	kp_zjcfgl_cfsj=request.getParameter("kp_zjcfgl_cfsj2");
	if (kp_zjcfgl_cfsj!=null)
	{
		kp_zjcfgl_cfsj=kp_zjcfgl_cfsj.trim();
		if (!(kp_zjcfgl_cfsj.equals("")))	wheresql+="  and (kp_zjcfgl.cfsj<=TO_DATE('"+kp_zjcfgl_cfsj+"','YYYY/MM/DD'))";
	}
	kp_zjcfgl_cflxbm=request.getParameter("kp_zjcfgl_cflxbm");
	if (kp_zjcfgl_cflxbm!=null)
	{
		kp_zjcfgl_cflxbm=cf.GB2Uni(kp_zjcfgl_cflxbm);
		if (!(kp_zjcfgl_cflxbm.equals("")))	wheresql+=" and  (kp_zjcfgl.cflxbm='"+kp_zjcfgl_cflxbm+"')";
	}
	kp_zjcfgl_cfyybm=request.getParameter("kp_zjcfgl_cfyybm");
	if (kp_zjcfgl_cfyybm!=null)
	{
		kp_zjcfgl_cfyybm=cf.GB2Uni(kp_zjcfgl_cfyybm);
		if (!(kp_zjcfgl_cfyybm.equals("")))	wheresql+=" and  (kp_zjcfgl.cfyybm='"+kp_zjcfgl_cfyybm+"')";
	}
	kp_zjcfgl_lrr=request.getParameter("kp_zjcfgl_lrr");
	if (kp_zjcfgl_lrr!=null)
	{
		kp_zjcfgl_lrr=cf.GB2Uni(kp_zjcfgl_lrr);
		if (!(kp_zjcfgl_lrr.equals("")))	wheresql+=" and  (kp_zjcfgl.lrr='"+kp_zjcfgl_lrr+"')";
	}
	kp_zjcfgl_lrsj=request.getParameter("kp_zjcfgl_lrsj");
	if (kp_zjcfgl_lrsj!=null)
	{
		kp_zjcfgl_lrsj=kp_zjcfgl_lrsj.trim();
		if (!(kp_zjcfgl_lrsj.equals("")))	wheresql+="  and (kp_zjcfgl.lrsj=TO_DATE('"+kp_zjcfgl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_zjcfgl_lrdw=request.getParameter("kp_zjcfgl_lrdw");
	if (kp_zjcfgl_lrdw!=null)
	{
		kp_zjcfgl_lrdw=cf.GB2Uni(kp_zjcfgl_lrdw);
		if (!(kp_zjcfgl_lrdw.equals("")))	wheresql+=" and  (kp_zjcfgl.lrdw='"+kp_zjcfgl_lrdw+"')";
	}
	kp_zjcfgl_cfspbz=request.getParameter("kp_zjcfgl_cfspbz");
	if (kp_zjcfgl_cfspbz!=null)
	{
		kp_zjcfgl_cfspbz=cf.GB2Uni(kp_zjcfgl_cfspbz);
		if (!(kp_zjcfgl_cfspbz.equals("")))	wheresql+=" and  (kp_zjcfgl.cfspbz='"+kp_zjcfgl_cfspbz+"')";
	}
	kp_zjcfgl_spr=request.getParameter("kp_zjcfgl_spr");
	if (kp_zjcfgl_spr!=null)
	{
		kp_zjcfgl_spr=cf.GB2Uni(kp_zjcfgl_spr);
		if (!(kp_zjcfgl_spr.equals("")))	wheresql+=" and  (kp_zjcfgl.spr='"+kp_zjcfgl_spr+"')";
	}
	kp_zjcfgl_spsj=request.getParameter("kp_zjcfgl_spsj");
	if (kp_zjcfgl_spsj!=null)
	{
		kp_zjcfgl_spsj=kp_zjcfgl_spsj.trim();
		if (!(kp_zjcfgl_spsj.equals("")))	wheresql+="  and (kp_zjcfgl.spsj=TO_DATE('"+kp_zjcfgl_spsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT kp_zjcfgl.cfjlh,kp_zjcfgl.zjxm,kp_zjcfgl.fgsbh,kp_zjcfgl.cfr,kp_zjcfgl.cfsj,kp_cflxbm.cflxmc,kp_cfyybm.cfyymc,kp_zjcfgl.fkze,kp_zjcfgl.kf,kp_zjcfgl.lrr,kp_zjcfgl.lrsj,kp_zjcfgl.lrdw, DECODE(kp_zjcfgl.cfspbz,'2','未审批','3','审批通过','4','审批未通过'),kp_zjcfgl.spyj,kp_zjcfgl.spr,kp_zjcfgl.spsj,kp_zjcfgl.bz  ";
	ls_sql+=" FROM kp_cflxbm,kp_cfyybm,kp_zjcfgl  ";
    ls_sql+=" where kp_zjcfgl.cflxbm=kp_cflxbm.cflxbm(+) and kp_zjcfgl.cfyybm=kp_cfyybm.cfyybm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_zjcfglList.jsp","SelectKp_zjcfgl.jsp","","EditKp_zjcfgl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cfjlh","kp_zjcfgl_zjxm","kp_zjcfgl_fgsbh","kp_zjcfgl_cfr","kp_zjcfgl_cfsj","kp_cflxbm_cflxmc","kp_cfyybm_cfyymc","kp_zjcfgl_fkze","kp_zjcfgl_kf","kp_zjcfgl_lrr","kp_zjcfgl_lrsj","kp_zjcfgl_lrdw","kp_zjcfgl_cfspbz","kp_zjcfgl_spyj","kp_zjcfgl_spr","kp_zjcfgl_spsj","kp_zjcfgl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cfjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_zjcfglList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] cfjlh = request.getParameterValues("cfjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cfjlh,"cfjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_zjcfgl where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="5%">处罚记录号</td>
	<td  width="5%">工程担当</td>
	<td  width="5%">所属分公司</td>
	<td  width="5%">处罚人</td>
	<td  width="5%">处罚时间</td>
	<td  width="5%">处罚类型</td>
	<td  width="5%">处罚原因</td>
	<td  width="5%">罚款总额</td>
	<td  width="5%">扣分</td>
	<td  width="5%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="5%">录入单位</td>
	<td  width="5%">审批标志</td>
	<td  width="5%">审批意见</td>
	<td  width="5%">审批人</td>
	<td  width="5%">审批时间</td>
	<td  width="5%">备注</td>
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