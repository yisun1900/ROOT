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
	String jc_khzcgmxx_clzt=null;
	String jc_khzcgmxx_lrr=null;
	String jc_khzcgmxx_lrsj=null;
	String jc_khzcgmxx_shr=null;
	String jc_khzcgmxx_shsj=null;

	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	
	jc_khzcgmxx_clzt=request.getParameter("jc_khzcgmxx_clzt");
	if (jc_khzcgmxx_clzt!=null)
	{
		jc_khzcgmxx_clzt=cf.GB2Uni(jc_khzcgmxx_clzt);
		if (!(jc_khzcgmxx_clzt.equals("")))	wheresql+=" and  (jc_khzcgmxx.clzt='"+jc_khzcgmxx_clzt+"')";
	}
	jc_khzcgmxx_lrr=request.getParameter("jc_khzcgmxx_lrr");
	if (jc_khzcgmxx_lrr!=null)
	{
		jc_khzcgmxx_lrr=cf.GB2Uni(jc_khzcgmxx_lrr);
		if (!(jc_khzcgmxx_lrr.equals("")))	wheresql+=" and  (jc_khzcgmxx.lrr='"+jc_khzcgmxx_lrr+"')";
	}
	jc_khzcgmxx_lrsj=request.getParameter("jc_khzcgmxx_lrsj");
	if (jc_khzcgmxx_lrsj!=null)
	{
		jc_khzcgmxx_lrsj=jc_khzcgmxx_lrsj.trim();
		if (!(jc_khzcgmxx_lrsj.equals("")))	wheresql+="  and (jc_khzcgmxx.lrsj>=TO_DATE('"+jc_khzcgmxx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_lrsj=request.getParameter("jc_khzcgmxx_lrsj2");
	if (jc_khzcgmxx_lrsj!=null)
	{
		jc_khzcgmxx_lrsj=jc_khzcgmxx_lrsj.trim();
		if (!(jc_khzcgmxx_lrsj.equals("")))	wheresql+="  and (jc_khzcgmxx.lrsj<=TO_DATE('"+jc_khzcgmxx_lrsj+"','YYYY/MM/DD'))";
	}

	jc_khzcgmxx_shr=request.getParameter("jc_khzcgmxx_shr");
	if (jc_khzcgmxx_shr!=null)
	{
		jc_khzcgmxx_shr=cf.GB2Uni(jc_khzcgmxx_shr);
		if (!(jc_khzcgmxx_shr.equals("")))	wheresql+=" and  (jc_khzcgmxx.shr='"+jc_khzcgmxx_shr+"')";
	}
	jc_khzcgmxx_shsj=request.getParameter("jc_khzcgmxx_shsj");
	if (jc_khzcgmxx_shsj!=null)
	{
		jc_khzcgmxx_shsj=jc_khzcgmxx_shsj.trim();
		if (!(jc_khzcgmxx_shsj.equals("")))	wheresql+="  and (jc_khzcgmxx.shsj>=TO_DATE('"+jc_khzcgmxx_shsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_shsj=request.getParameter("jc_khzcgmxx_shsj2");
	if (jc_khzcgmxx_shsj!=null)
	{
		jc_khzcgmxx_shsj=jc_khzcgmxx_shsj.trim();
		if (!(jc_khzcgmxx_shsj.equals("")))	wheresql+="  and (jc_khzcgmxx.shsj<=TO_DATE('"+jc_khzcgmxx_shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT jc_khzcgmxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,jc_khzcgmxx.zje, DECODE(jc_khzcgmxx.clzt,'N','未审核','Y','审核'),jc_khzcgmxx.lrr,jc_khzcgmxx.lrsj,dwmc,jc_khzcgmxx.shr,jc_khzcgmxx.shsj,jc_khzcgmxx.shyj,jc_khzcgmxx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_khzcgmxx,sq_dwxx  ";
    ls_sql+=" where jc_khzcgmxx.khbh=crm_khxx.khbh(+) and jc_khzcgmxx.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jc_khzcgmxx.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_khzcgmxxXgShList.jsp","","","XgShJc_khzcgmxx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","jc_khzcgmxx_zje","jc_khzcgmxx_clzt","jc_khzcgmxx_lrr","jc_khzcgmxx_lrsj","jc_khzcgmxx_lrbm","jc_khzcgmxx_shr","jc_khzcgmxx_shsj","jc_khzcgmxx_shyj","jc_khzcgmxx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除审核信息"};//按钮的显示名称
	String[] buttonLink={"Jc_khzcgmxxXgShList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_khzcgmxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_khzcgmmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update jc_khzcgmxx set clzt='N',shr=null,shsj=null,shyj=null where "+chooseitem;
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
  <B><font size="3">主材购买信息－审核修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="7%">总金额</td>
	<td  width="5%">处理状态</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="4%">审核人</td>
	<td  width="5%">审核时间</td>
	<td  width="18%">审核意见</td>
	<td  width="14%">备注</td>
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