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
	String crm_gcyszxmjl_ysjlh=null;
	String crm_gcyszxmjl_khbh=null;
	String crm_gcyszxmjl_gcyszxmbm=null;
	String crm_gcyszxmjl_gcjdbm=null;
	String crm_gcyszxmjl_yssj=null;
	String crm_gcyszxmjl_ysr=null;
	String crm_gcyszxmjl_lrr=null;
	String crm_gcyszxmjl_lrsj=null;
	String crm_gcyszxmjl_lrdw=null;
	String crm_gcyszxmjl_bz=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	
	crm_gcyszxmjl_ysjlh=request.getParameter("crm_gcyszxmjl_ysjlh");
	if (crm_gcyszxmjl_ysjlh!=null)
	{
		crm_gcyszxmjl_ysjlh=cf.GB2Uni(crm_gcyszxmjl_ysjlh);
		if (!(crm_gcyszxmjl_ysjlh.equals("")))	wheresql+=" and  (crm_gcyszxmjl.ysjlh='"+crm_gcyszxmjl_ysjlh+"')";
	}
	crm_gcyszxmjl_khbh=request.getParameter("crm_gcyszxmjl_khbh");
	if (crm_gcyszxmjl_khbh!=null)
	{
		crm_gcyszxmjl_khbh=cf.GB2Uni(crm_gcyszxmjl_khbh);
		if (!(crm_gcyszxmjl_khbh.equals("")))	wheresql+=" and  (crm_gcyszxmjl.khbh='"+crm_gcyszxmjl_khbh+"')";
	}
	crm_gcyszxmjl_gcyszxmbm=request.getParameter("crm_gcyszxmjl_gcyszxmbm");
	if (crm_gcyszxmjl_gcyszxmbm!=null)
	{
		crm_gcyszxmjl_gcyszxmbm=cf.GB2Uni(crm_gcyszxmjl_gcyszxmbm);
		if (!(crm_gcyszxmjl_gcyszxmbm.equals("")))	wheresql+=" and  (crm_gcyszxmjl.gcyszxmbm='"+crm_gcyszxmjl_gcyszxmbm+"')";
	}
	crm_gcyszxmjl_gcjdbm=request.getParameter("crm_gcyszxmjl_gcjdbm");
	if (crm_gcyszxmjl_gcjdbm!=null)
	{
		crm_gcyszxmjl_gcjdbm=cf.GB2Uni(crm_gcyszxmjl_gcjdbm);
		if (!(crm_gcyszxmjl_gcjdbm.equals("")))	wheresql+=" and  (crm_gcyszxmjl.gcjdbm='"+crm_gcyszxmjl_gcjdbm+"')";
	}
	crm_gcyszxmjl_yssj=request.getParameter("crm_gcyszxmjl_yssj");
	if (crm_gcyszxmjl_yssj!=null)
	{
		crm_gcyszxmjl_yssj=crm_gcyszxmjl_yssj.trim();
		if (!(crm_gcyszxmjl_yssj.equals("")))	wheresql+="  and (crm_gcyszxmjl.yssj>=TO_DATE('"+crm_gcyszxmjl_yssj+"','YYYY/MM/DD'))";
	}
	crm_gcyszxmjl_yssj=request.getParameter("crm_gcyszxmjl_yssj2");
	if (crm_gcyszxmjl_yssj!=null)
	{
		crm_gcyszxmjl_yssj=crm_gcyszxmjl_yssj.trim();
		if (!(crm_gcyszxmjl_yssj.equals("")))	wheresql+="  and (crm_gcyszxmjl.yssj<=TO_DATE('"+crm_gcyszxmjl_yssj+"','YYYY/MM/DD'))";
	}
	crm_gcyszxmjl_ysr=request.getParameter("crm_gcyszxmjl_ysr");
	if (crm_gcyszxmjl_ysr!=null)
	{
		crm_gcyszxmjl_ysr=cf.GB2Uni(crm_gcyszxmjl_ysr);
		if (!(crm_gcyszxmjl_ysr.equals("")))	wheresql+=" and  (crm_gcyszxmjl.ysr='"+crm_gcyszxmjl_ysr+"')";
	}
	crm_gcyszxmjl_lrr=request.getParameter("crm_gcyszxmjl_lrr");
	if (crm_gcyszxmjl_lrr!=null)
	{
		crm_gcyszxmjl_lrr=cf.GB2Uni(crm_gcyszxmjl_lrr);
		if (!(crm_gcyszxmjl_lrr.equals("")))	wheresql+=" and  (crm_gcyszxmjl.lrr='"+crm_gcyszxmjl_lrr+"')";
	}
	crm_gcyszxmjl_lrsj=request.getParameter("crm_gcyszxmjl_lrsj");
	if (crm_gcyszxmjl_lrsj!=null)
	{
		crm_gcyszxmjl_lrsj=crm_gcyszxmjl_lrsj.trim();
		if (!(crm_gcyszxmjl_lrsj.equals("")))	wheresql+="  and (crm_gcyszxmjl.lrsj>=TO_DATE('"+crm_gcyszxmjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gcyszxmjl_lrsj=request.getParameter("crm_gcyszxmjl_lrsj2");
	if (crm_gcyszxmjl_lrsj!=null)
	{
		crm_gcyszxmjl_lrsj=crm_gcyszxmjl_lrsj.trim();
		if (!(crm_gcyszxmjl_lrsj.equals("")))	wheresql+="  and (crm_gcyszxmjl.lrsj<=TO_DATE('"+crm_gcyszxmjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gcyszxmjl_lrdw=request.getParameter("crm_gcyszxmjl_lrdw");
	if (crm_gcyszxmjl_lrdw!=null)
	{
		crm_gcyszxmjl_lrdw=cf.GB2Uni(crm_gcyszxmjl_lrdw);
		if (!(crm_gcyszxmjl_lrdw.equals("")))	wheresql+=" and  (crm_gcyszxmjl.lrdw='"+crm_gcyszxmjl_lrdw+"')";
	}
	crm_gcyszxmjl_bz=request.getParameter("crm_gcyszxmjl_bz");
	if (crm_gcyszxmjl_bz!=null)
	{
		crm_gcyszxmjl_bz=cf.GB2Uni(crm_gcyszxmjl_bz);
		if (!(crm_gcyszxmjl_bz.equals("")))	wheresql+=" and  (crm_gcyszxmjl.bz='"+crm_gcyszxmjl_bz+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	ls_sql="SELECT crm_gcyszxmjl.ysjlh,(select count(*) from crm_gcyszp where crm_gcyszxmjl.ysjlh=crm_gcyszp.ysjlh),dm_gcyszxmbm.gcyszxmmc,DECODE(crm_gcyszxmjl.gcjdbm,'2','材料进场','3','隐蔽工程验收','4','中期验收','5','完工验收'),crm_gcyszxmjl.yssj,crm_gcyszxmjl.ysr,crm_gcyszxmjl.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.zjxm,crm_khxx.sjs,crm_gcyszxmjl.lrr,crm_gcyszxmjl.lrsj,dwmc,crm_gcyszxmjl.bz ";
	ls_sql+=" FROM crm_gcyszxmjl,crm_khxx,dm_gcyszxmbm,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_gcyszxmjl.gcyszxmbm=dm_gcyszxmbm.gcyszxmbm and crm_gcyszxmjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_gcyszxmjl.lrdw=sq_dwxx.dwbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.gcjdbm not in('4','5')";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_gcyszxmjl.ysjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gcyszxmjlList.jsp","SelectCrm_gcyszxmjl.jsp","","EditCrm_gcyszxmjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ysjlh","crm_gcyszxmjl_khbh","dm_gcyszxmbm_gcyszxmmc","crm_gcyszxmjl_gcjdbm","crm_gcyszxmjl_yssj","crm_gcyszxmjl_ysr","crm_gcyszxmjl_lrr","crm_gcyszxmjl_lrsj","crm_gcyszxmjl_lrdw","crm_gcyszxmjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ysjlh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_gcyszxmjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/ViewCrm_gcyszxmjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] ysjlh = request.getParameterValues("ysjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ysjlh,"ysjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from crm_gcyszp where "+chooseitem;
		sql[1]="delete from crm_gcyszxmjl where "+chooseitem;
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
  <B><font size="3">材料进场维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">验收记录号</td>
	<td  width="3%">照片数</td>
	<td  width="6%">验收子项目</td>
	<td  width="4%">验收分类</td>
	<td  width="5%">验收时间</td>
	<td  width="3%">验收人</td>
	<td  width="3%">客户编号</td>
	<td  width="5%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="3%">施工队</td>
	<td  width="3%">工程担当</td>
	<td  width="4%">设计师</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入单位</td>
	<td  width="17%">备注</td>
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