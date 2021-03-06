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
	String crm_khsmjl_jlh=null;
	String crm_khsmjl_khbh=null;
	String crm_zxkhxx_sjs=null;
	String crm_khsmjl_smsj=null;
	String crm_khsmjl_smmd=null;
	String jdr=null;
	String jdrbh=null;
	String crm_khsmjl_jdrbm=null;
	String crm_khsmjl_jdjglrr=null;
	String crm_khsmjl_jdjglrsj=null;
	String crm_khsmjl_qksfss=null;
	String crm_khsmjl_shr=null;
	String crm_khsmjl_shsj=null;
	String crm_khsmjl_zt=null;
	String crm_khsmjl_lrr=null;
	String crm_khsmjl_lrsj=null;
	String crm_khsmjl_ssfgs=null;

	String sfhf=null;
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (crm_khsmjl.sfhf='"+sfhf+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}

	//来访次数20100810
	String lfcs=null;
	lfcs=request.getParameter("lfcs");
	if (lfcs!=null)
	{
		lfcs=cf.GB2Uni(lfcs);
		if (!(lfcs.equals("")))	wheresql+=" and  (crm_khsmjl.lfcs='"+lfcs+"')";
	}
	
	
	crm_khsmjl_jlh=request.getParameter("crm_khsmjl_jlh");
	if (crm_khsmjl_jlh!=null)
	{
		crm_khsmjl_jlh=cf.GB2Uni(crm_khsmjl_jlh);
		if (!(crm_khsmjl_jlh.equals("")))	wheresql+=" and  (crm_khsmjl.jlh='"+crm_khsmjl_jlh+"')";
	}
	crm_khsmjl_khbh=request.getParameter("crm_khsmjl_khbh");
	if (crm_khsmjl_khbh!=null)
	{
		crm_khsmjl_khbh=cf.GB2Uni(crm_khsmjl_khbh);
		if (!(crm_khsmjl_khbh.equals("")))	wheresql+=" and  (crm_khsmjl.khbh='"+crm_khsmjl_khbh+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	crm_khsmjl_smsj=request.getParameter("crm_khsmjl_smsj");
	if (crm_khsmjl_smsj!=null)
	{
		crm_khsmjl_smsj=crm_khsmjl_smsj.trim();
		if (!(crm_khsmjl_smsj.equals("")))	wheresql+="  and (crm_khsmjl.smsj>=TO_DATE('"+crm_khsmjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_smsj=request.getParameter("crm_khsmjl_smsj2");
	if (crm_khsmjl_smsj!=null)
	{
		crm_khsmjl_smsj=crm_khsmjl_smsj.trim();
		if (!(crm_khsmjl_smsj.equals("")))	wheresql+="  and (crm_khsmjl.smsj<=TO_DATE('"+crm_khsmjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_smmd=request.getParameter("crm_khsmjl_smmd");
	if (crm_khsmjl_smmd!=null)
	{
		crm_khsmjl_smmd=cf.GB2Uni(crm_khsmjl_smmd);
		if (!(crm_khsmjl_smmd.equals("")))	wheresql+=" and  (crm_khsmjl.smmd='"+crm_khsmjl_smmd+"')";
	}
	jdr=request.getParameter("jdr");
	if (jdr!=null)
	{
		jdr=cf.GB2Uni(jdr);
		if (!(jdr.equals("")))	wheresql+=" and  (crm_khsmjl.jdr like '%"+jdr+"%')";
	}
	jdrbh=request.getParameter("jdrbh");
	if (jdrbh!=null)
	{
		jdrbh=jdrbh.trim();
		if (!(jdrbh.equals("")))	wheresql+=" and (crm_khsmjl.jdrbh="+jdrbh+") ";
	}
	crm_khsmjl_jdrbm=request.getParameter("crm_khsmjl_jdrbm");
	if (crm_khsmjl_jdrbm!=null)
	{
		crm_khsmjl_jdrbm=cf.GB2Uni(crm_khsmjl_jdrbm);
		if (!(crm_khsmjl_jdrbm.equals("")))	wheresql+=" and  (crm_khsmjl.jdrbm='"+crm_khsmjl_jdrbm+"')";
	}
	crm_khsmjl_jdjglrr=request.getParameter("crm_khsmjl_jdjglrr");
	if (crm_khsmjl_jdjglrr!=null)
	{
		crm_khsmjl_jdjglrr=cf.GB2Uni(crm_khsmjl_jdjglrr);
		if (!(crm_khsmjl_jdjglrr.equals("")))	wheresql+=" and  (crm_khsmjl.jdjglrr='"+crm_khsmjl_jdjglrr+"')";
	}
	crm_khsmjl_jdjglrsj=request.getParameter("crm_khsmjl_jdjglrsj");
	if (crm_khsmjl_jdjglrsj!=null)
	{
		crm_khsmjl_jdjglrsj=crm_khsmjl_jdjglrsj.trim();
		if (!(crm_khsmjl_jdjglrsj.equals("")))	wheresql+="  and (crm_khsmjl.jdjglrsj>=TO_DATE('"+crm_khsmjl_jdjglrsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_jdjglrsj=request.getParameter("crm_khsmjl_jdjglrsj2");
	if (crm_khsmjl_jdjglrsj!=null)
	{
		crm_khsmjl_jdjglrsj=crm_khsmjl_jdjglrsj.trim();
		if (!(crm_khsmjl_jdjglrsj.equals("")))	wheresql+="  and (crm_khsmjl.jdjglrsj<=TO_DATE('"+crm_khsmjl_jdjglrsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_qksfss=request.getParameter("crm_khsmjl_qksfss");
	if (crm_khsmjl_qksfss!=null)
	{
		crm_khsmjl_qksfss=cf.GB2Uni(crm_khsmjl_qksfss);
		if (!(crm_khsmjl_qksfss.equals("")))	wheresql+=" and  (crm_khsmjl.qksfss='"+crm_khsmjl_qksfss+"')";
	}
	crm_khsmjl_shr=request.getParameter("crm_khsmjl_shr");
	if (crm_khsmjl_shr!=null)
	{
		crm_khsmjl_shr=cf.GB2Uni(crm_khsmjl_shr);
		if (!(crm_khsmjl_shr.equals("")))	wheresql+=" and  (crm_khsmjl.shr='"+crm_khsmjl_shr+"')";
	}
	crm_khsmjl_shsj=request.getParameter("crm_khsmjl_shsj");
	if (crm_khsmjl_shsj!=null)
	{
		crm_khsmjl_shsj=crm_khsmjl_shsj.trim();
		if (!(crm_khsmjl_shsj.equals("")))	wheresql+="  and (crm_khsmjl.shsj>=TO_DATE('"+crm_khsmjl_shsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_shsj=request.getParameter("crm_khsmjl_shsj2");
	if (crm_khsmjl_shsj!=null)
	{
		crm_khsmjl_shsj=crm_khsmjl_shsj.trim();
		if (!(crm_khsmjl_shsj.equals("")))	wheresql+="  and (crm_khsmjl.shsj<=TO_DATE('"+crm_khsmjl_shsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_zt=request.getParameter("crm_khsmjl_zt");
	if (crm_khsmjl_zt!=null)
	{
		crm_khsmjl_zt=cf.GB2Uni(crm_khsmjl_zt);
		if (!(crm_khsmjl_zt.equals("")))	wheresql+=" and  (crm_khsmjl.zt='"+crm_khsmjl_zt+"')";
	}
	crm_khsmjl_lrr=request.getParameter("crm_khsmjl_lrr");
	if (crm_khsmjl_lrr!=null)
	{
		crm_khsmjl_lrr=cf.GB2Uni(crm_khsmjl_lrr);
		if (!(crm_khsmjl_lrr.equals("")))	wheresql+=" and  (crm_khsmjl.lrr='"+crm_khsmjl_lrr+"')";
	}
	crm_khsmjl_lrsj=request.getParameter("crm_khsmjl_lrsj");
	if (crm_khsmjl_lrsj!=null)
	{
		crm_khsmjl_lrsj=crm_khsmjl_lrsj.trim();
		if (!(crm_khsmjl_lrsj.equals("")))	wheresql+="  and (crm_khsmjl.lrsj>=TO_DATE('"+crm_khsmjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khsmjl_lrsj=request.getParameter("crm_khsmjl_lrsj2");
	if (crm_khsmjl_lrsj!=null)
	{
		crm_khsmjl_lrsj=crm_khsmjl_lrsj.trim();
		if (!(crm_khsmjl_lrsj.equals("")))	wheresql+="  and (crm_khsmjl.lrsj<=TO_DATE('"+crm_khsmjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	crm_khsmjl_ssfgs=request.getParameter("crm_khsmjl_ssfgs");
	if (crm_khsmjl_ssfgs!=null)
	{
		crm_khsmjl_ssfgs=cf.GB2Uni(crm_khsmjl_ssfgs);
		if (!(crm_khsmjl_ssfgs.equals("")))	wheresql+=" and  (crm_khsmjl.ssfgs='"+crm_khsmjl_ssfgs+"')";
	}
	ls_sql="SELECT crm_khsmjl.jlh,DECODE(crm_khsmjl.zt,'1','未录结果','2','已录结果','3','已审核'),crm_khsmjl.khbh,crm_zxkhxx.khxm,crm_khsmjl.lfcs,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,TO_CHAR(crm_khsmjl.smsj,'YYYY-MM-DD'),crm_khsmjl.smmd,crm_khsmjl.jdr,a.dwmc jdrbm,crm_khsmjl.sjjdqk,DECODE(crm_khsmjl.sfhf,'Y','回访','N','未回访'),crm_khsmjl.hfr,crm_khsmjl.hfsj,crm_khsmjl.hfsm,crm_khsmjl.lrr,crm_khsmjl.lrsj,b.dwmc ssfgs,crm_khsmjl.bz  ";
	ls_sql+=" FROM crm_zxkhxx,crm_khsmjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_khsmjl.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_khsmjl.jdrbm=a.dwbh(+) and crm_khsmjl.ssfgs=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khsmjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khsmjl.jdrbm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khsmjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khsmjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setDateType("long");
/*
//设置显示列
	String[] disColName={"jlh","crm_khsmjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","crm_khsmjl_smsj","crm_khsmjl_smmd","jdr","jdrbh","crm_khsmjl_jdrbm","crm_khsmjl_sjjdqk","crm_khsmjl_jdjglrr","crm_khsmjl_jdjglrsj","crm_khsmjl_qksfss","crm_khsmjl_shr","crm_khsmjl_shsj","crm_khsmjl_shsm","crm_khsmjl_zt","crm_khsmjl_lrr","crm_khsmjl_lrsj","crm_khsmjl_lrbm","crm_khsmjl_ssfgs","crm_khsmjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_khsmjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jlh",coluParm);//列参数对象加入Hash表
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户上门记录－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">记录号</td>
	<td  width="3%">状态</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="2%">上门次数</td>
	<td  width="9%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="4%">上门时间</td>
	<td  width="5%">上门目的</td>
	<td  width="3%">接待人</td>
	<td  width="4%">接待人部门</td>
	<td  width="16%">实际接待情况</td>
	<td  width="3%">是否回访</td>
	<td  width="3%">回访人</td>
	<td  width="3%">回访时间</td>
	<td  width="10%">回访说明</td>
	<td  width="3%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="6%">所属分公司</td>
	<td  width="7%">备注</td>
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