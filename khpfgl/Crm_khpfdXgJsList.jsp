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
	String crm_khpfd_pfjlh=null;
	String crm_khpfd_tsjlh=null;
	String crm_khpfd_dwbh=null;
	String crm_khpfd_pfjecdf=null;
	String crm_khpfd_shr=null;
	String crm_khpfd_shsj=null;
	String crm_khpfd_cwjsr=null;
	String crm_khpfd_cwjssj=null;
	String crm_khpfd_zffs=null;
	String crm_khpfd_zfr=null;
	String crm_khpfd_zfsj=null;
	String crm_khpfd_pfzt=null;
	String crm_khpfd_lrsj=null;
	String crm_khpfd_lrr=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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


	crm_khpfd_pfjlh=request.getParameter("crm_khpfd_pfjlh");
	if (crm_khpfd_pfjlh!=null)
	{
		crm_khpfd_pfjlh=cf.GB2Uni(crm_khpfd_pfjlh);
		if (!(crm_khpfd_pfjlh.equals("")))	wheresql+=" and  (crm_khpfd.pfjlh='"+crm_khpfd_pfjlh+"')";
	}
	crm_khpfd_tsjlh=request.getParameter("crm_khpfd_tsjlh");
	if (crm_khpfd_tsjlh!=null)
	{
		crm_khpfd_tsjlh=cf.GB2Uni(crm_khpfd_tsjlh);
		if (!(crm_khpfd_tsjlh.equals("")))	wheresql+=" and  (crm_khpfd.tsjlh='"+crm_khpfd_tsjlh+"')";
	}
	crm_khpfd_dwbh=request.getParameter("crm_khpfd_dwbh");
	if (crm_khpfd_dwbh!=null)
	{
		crm_khpfd_dwbh=cf.GB2Uni(crm_khpfd_dwbh);
		if (!(crm_khpfd_dwbh.equals("")))	wheresql+=" and  (crm_khpfd.dwbh='"+crm_khpfd_dwbh+"')";
	}
	crm_khpfd_pfjecdf=request.getParameter("crm_khpfd_pfjecdf");
	if (crm_khpfd_pfjecdf!=null)
	{
		crm_khpfd_pfjecdf=cf.GB2Uni(crm_khpfd_pfjecdf);
		if (!(crm_khpfd_pfjecdf.equals("")))	wheresql+=" and  (crm_khpfd.pfjecdf='"+crm_khpfd_pfjecdf+"')";
	}
	crm_khpfd_shr=request.getParameter("crm_khpfd_shr");
	if (crm_khpfd_shr!=null)
	{
		crm_khpfd_shr=cf.GB2Uni(crm_khpfd_shr);
		if (!(crm_khpfd_shr.equals("")))	wheresql+=" and  (crm_khpfd.shr='"+crm_khpfd_shr+"')";
	}
	crm_khpfd_shsj=request.getParameter("crm_khpfd_shsj");
	if (crm_khpfd_shsj!=null)
	{
		crm_khpfd_shsj=crm_khpfd_shsj.trim();
		if (!(crm_khpfd_shsj.equals("")))	wheresql+="  and (crm_khpfd.shsj>=TO_DATE('"+crm_khpfd_shsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_shsj=request.getParameter("crm_khpfd_shsj2");
	if (crm_khpfd_shsj!=null)
	{
		crm_khpfd_shsj=crm_khpfd_shsj.trim();
		if (!(crm_khpfd_shsj.equals("")))	wheresql+="  and (crm_khpfd.shsj<=TO_DATE('"+crm_khpfd_shsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_cwjsr=request.getParameter("crm_khpfd_cwjsr");
	if (crm_khpfd_cwjsr!=null)
	{
		crm_khpfd_cwjsr=cf.GB2Uni(crm_khpfd_cwjsr);
		if (!(crm_khpfd_cwjsr.equals("")))	wheresql+=" and  (crm_khpfd.cwjsr='"+crm_khpfd_cwjsr+"')";
	}
	crm_khpfd_cwjssj=request.getParameter("crm_khpfd_cwjssj");
	if (crm_khpfd_cwjssj!=null)
	{
		crm_khpfd_cwjssj=crm_khpfd_cwjssj.trim();
		if (!(crm_khpfd_cwjssj.equals("")))	wheresql+="  and (crm_khpfd.cwjssj>=TO_DATE('"+crm_khpfd_cwjssj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_cwjssj=request.getParameter("crm_khpfd_cwjssj2");
	if (crm_khpfd_cwjssj!=null)
	{
		crm_khpfd_cwjssj=crm_khpfd_cwjssj.trim();
		if (!(crm_khpfd_cwjssj.equals("")))	wheresql+="  and (crm_khpfd.cwjssj<=TO_DATE('"+crm_khpfd_cwjssj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_zffs=request.getParameter("crm_khpfd_zffs");
	if (crm_khpfd_zffs!=null)
	{
		crm_khpfd_zffs=cf.GB2Uni(crm_khpfd_zffs);
		if (!(crm_khpfd_zffs.equals("")))	wheresql+=" and  (crm_khpfd.zffs='"+crm_khpfd_zffs+"')";
	}
	crm_khpfd_zfr=request.getParameter("crm_khpfd_zfr");
	if (crm_khpfd_zfr!=null)
	{
		crm_khpfd_zfr=cf.GB2Uni(crm_khpfd_zfr);
		if (!(crm_khpfd_zfr.equals("")))	wheresql+=" and  (crm_khpfd.zfr='"+crm_khpfd_zfr+"')";
	}
	crm_khpfd_zfsj=request.getParameter("crm_khpfd_zfsj");
	if (crm_khpfd_zfsj!=null)
	{
		crm_khpfd_zfsj=crm_khpfd_zfsj.trim();
		if (!(crm_khpfd_zfsj.equals("")))	wheresql+="  and (crm_khpfd.zfsj>=TO_DATE('"+crm_khpfd_zfsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_zfsj=request.getParameter("crm_khpfd_zfsj2");
	if (crm_khpfd_zfsj!=null)
	{
		crm_khpfd_zfsj=crm_khpfd_zfsj.trim();
		if (!(crm_khpfd_zfsj.equals("")))	wheresql+="  and (crm_khpfd.zfsj<=TO_DATE('"+crm_khpfd_zfsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_pfzt=request.getParameter("crm_khpfd_pfzt");
	if (crm_khpfd_pfzt!=null)
	{
		crm_khpfd_pfzt=cf.GB2Uni(crm_khpfd_pfzt);
		if (!(crm_khpfd_pfzt.equals("")))	wheresql+=" and  (crm_khpfd.pfzt='"+crm_khpfd_pfzt+"')";
	}
	crm_khpfd_lrsj=request.getParameter("crm_khpfd_lrsj");
	if (crm_khpfd_lrsj!=null)
	{
		crm_khpfd_lrsj=crm_khpfd_lrsj.trim();
		if (!(crm_khpfd_lrsj.equals("")))	wheresql+="  and (crm_khpfd.lrsj>=TO_DATE('"+crm_khpfd_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_lrsj=request.getParameter("crm_khpfd_lrsj2");
	if (crm_khpfd_lrsj!=null)
	{
		crm_khpfd_lrsj=crm_khpfd_lrsj.trim();
		if (!(crm_khpfd_lrsj.equals("")))	wheresql+="  and (crm_khpfd.lrsj<=TO_DATE('"+crm_khpfd_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khpfd_lrr=request.getParameter("crm_khpfd_lrr");
	if (crm_khpfd_lrr!=null)
	{
		crm_khpfd_lrr=cf.GB2Uni(crm_khpfd_lrr);
		if (!(crm_khpfd_lrr.equals("")))	wheresql+=" and  (crm_khpfd.lrr='"+crm_khpfd_lrr+"')";
	}
	ls_sql="SELECT crm_khpfd.pfjlh,DECODE(crm_khpfd.pfzt,'1','等待审核','2','已审核','3','财务接收','4','赔付完成'),crm_khpfd.tsjlh,crm_khpfd.khbh,crm_khxx.khxm,crm_khxx.fwdz,a.dwmc dwbh,crm_khpfd.pfjecdf,crm_khpfd.pfje,crm_khpfd.pfyy,crm_khpfd.shr,crm_khpfd.shsj,crm_khpfd.shyj,crm_khpfd.cwjsr,crm_khpfd.cwjssj, DECODE(crm_khpfd.zffs,'0','未支付','1','现金','2','转账'),crm_khpfd.zfr,crm_khpfd.zfsj, crm_khpfd.lrr,crm_khpfd.lrsj,b.dwmc lrbm,crm_khpfd.bz  ";
	ls_sql+=" FROM crm_khpfd,crm_khxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_khpfd.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khpfd.dwbh=a.dwbh(+) and crm_khpfd.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_khpfd.pfzt='3'";//1：等待审核；2：已审核；3：财务接收；4：赔付完成
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khpfd.shsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khpfdXgJsList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"pfjlh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除接收"};//按钮的显示名称
	String[] buttonLink={"Crm_khpfdXgJsList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String yhmc=(String)session.getAttribute("yhmc");

	String[] pfjlh = request.getParameterValues("pfjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pfjlh,"pfjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update crm_khpfd set cwjsr=null,cwjssj=null,pfzt='2' where pfzt='3' and "+chooseitem;
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
  <B><font size="3">赔付单－财务接收－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">赔付记录号</td>
	<td  width="3%">赔付单状态</td>
	<td  width="3%">投诉报修记录号</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="3%">相关责任部门</td>
	<td  width="2%">赔付承担方</td>
	<td  width="3%">赔付金额</td>
	<td  width="14%">赔付原因</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="13%">审核意见</td>
	<td  width="2%">财务接收人</td>
	<td  width="3%">财务接收时间</td>
	<td  width="3%">赔付支付方式</td>
	<td  width="3%">赔付支付人</td>
	<td  width="3%">赔付支付时间</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入人部门</td>
	<td  width="33%">备注</td>
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