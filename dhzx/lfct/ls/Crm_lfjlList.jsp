<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String crm_zxkhxx_khxm=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	String crm_zxkhxx_khxm2=null;
	crm_zxkhxx_khxm2=request.getParameter("crm_zxkhxx_khxm2");
	if (crm_zxkhxx_khxm2!=null)
	{
		crm_zxkhxx_khxm2=cf.GB2Uni(crm_zxkhxx_khxm2);
		if (!(crm_zxkhxx_khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm2+"%')";
	}
	
	String crm_zxkhxx_fwdz=null;
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	String crm_zxkhxx_fwdz2=null;
	crm_zxkhxx_fwdz2=request.getParameter("crm_zxkhxx_fwdz2");
	if (crm_zxkhxx_fwdz2!=null)
	{
		crm_zxkhxx_fwdz2=cf.GB2Uni(crm_zxkhxx_fwdz2);
		if (!(crm_zxkhxx_fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz2+"%')";
	}
	String crm_zxkhxx_lxfs=null;
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	String crm_zxkhxx_lxfs2=null;
	crm_zxkhxx_lxfs2=request.getParameter("crm_zxkhxx_lxfs2");
	if (crm_zxkhxx_lxfs2!=null)
	{
		crm_zxkhxx_lxfs2=cf.GB2Uni(crm_zxkhxx_lxfs2);
		if (!(crm_zxkhxx_lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+crm_zxkhxx_lxfs2+"%')";
	}

	String crm_zxkhxx_khbh=null;
	
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}


	String crm_zxkhxx_lrr=null;
	crm_zxkhxx_lrr=request.getParameter("crm_zxkhxx_lrr");
	if (crm_zxkhxx_lrr!=null)
	{
		crm_zxkhxx_lrr=cf.GB2Uni(crm_zxkhxx_lrr);
		if (!(crm_zxkhxx_lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+crm_zxkhxx_lrr+"')";
	}
	String crm_zxkhxx_lrsj=null;
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj2");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_lfjl.lfjlh, DECODE(crm_lfjl.zt,'1','录入计划','2','计划确认','3','计划取消','4','上门量房'),crm_lfjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,lflxmc,crm_lfjl.smmb,crm_lfjl.jhsmsj,crm_lfjl.jhsmry, DECODE(crm_lfjl.xfxqr,'Y','需确认','N','不需确认'), DECODE(crm_lfjl.qrjg,'Y','同意','N','不同意'),crm_lfjl.qrr,crm_lfjl.qrsj,crm_lfjl.qrsm,crm_lfjl.sjlfsj,crm_lfjl.sjlfr, DECODE(crm_lfjl.lfjg,'Y','完成','N','未完成'),crm_lfjl.lfjgsm,crm_lfjl.sczp,crm_lfjl.cfwsjcs,crm_lfjl.lrr,crm_lfjl.lrsj,dwmc,crm_lfjl.bz  ";
	ls_sql+=" FROM crm_zxkhxx,crm_lfjl,dm_lflxbm,sq_dwxx  ";
    ls_sql+=" where crm_lfjl.khbh=crm_zxkhxx.khbh(+) and crm_lfjl.lflxbm=dm_lflxbm.lflxbm(+) and crm_lfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and (crm_lfjl.zt='1' OR (crm_lfjl.zt='2' and crm_lfjl.xfxqr='N'))";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by crm_lfjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_lfjlList.jsp","","","EditCrm_lfjl.jsp");

/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_fwlxbm","crm_zxkhxx_sfxhf","crm_zxkhxx_hfrq","crm_zxkhxx_hflxbm","crm_zxkhxx_hdbz","crm_zxkhxx_zxzt","crm_zxkhxx_khlxbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lfjlh"};
	pageObj.setKey(keyName);


	//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_lfjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"lfjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_lfjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("lfjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] lfjlh = request.getParameterValues("lfjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lfjlh,"lfjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_lfjl where "+chooseitem;
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
  <font size="4"><b>量房计划－修改</b></font>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">量房记录号</td>
	<td  width="2%">状态</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="4%">量房类型</td>
	<td  width="9%">上门目标</td>
	<td  width="3%">计划上门时间</td>
	<td  width="5%">计划上门人员</td>
	<td  width="2%">是否需相关人员确认</td>
	<td  width="2%">相关人员确认结果</td>
	<td  width="2%">相关人员确认人</td>
	<td  width="3%">相关人员确认时间</td>
	<td  width="9%">相关人员确认说明</td>
	<td  width="3%">实际量房时间</td>
	<td  width="5%">实际量房人</td>
	<td  width="2%">量房结果</td>
	<td  width="9%">量房结果说明</td>
	<td  width="2%">上传照片</td>
	<td  width="9%">厨房卫生间参数</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="9%">备注</td>
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