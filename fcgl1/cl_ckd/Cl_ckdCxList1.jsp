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
	String ckph=null;
	String dwbh=null;
	String khbh=null;
	String ckzsl=null;
	String ckzje=null;
	String ckzt=null;
	String lrr=null;
	String lrsj=null;
	String cksj=null;
	String bz=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String fgs=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (cl_ckd.lx='"+lx+"')";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=sgd.trim();
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String psdh=null;
	psdh=request.getParameter("psdh");
	if (psdh!=null)
	{
		if (!(psdh.equals("")))	wheresql+=" and  (cl_ckd.psdh='"+psdh+"')";
	}

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_ckd.dwbh='"+fgs+"')";
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}
	ckph=request.getParameter("ckph");
	if (ckph!=null)
	{
		ckph=cf.GB2Uni(ckph);
		if (!(ckph.equals("")))	wheresql+=" and  (cl_ckd.ckph='"+ckph+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cl_ckd.dwbh='"+dwbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cl_ckd.khbh='"+khbh+"')";
	}
	ckzsl=request.getParameter("ckzsl");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (cl_ckd.ckzsl>="+ckzsl+") ";
	}
	ckzsl=request.getParameter("ckzsl2");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (cl_ckd.ckzsl<="+ckzsl+") ";
	}
	ckzje=request.getParameter("ckzje");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (cl_ckd.ckzje>="+ckzje+") ";
	}
	ckzje=request.getParameter("ckzje2");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (cl_ckd.ckzje<="+ckzje+") ";
	}
	ckzt=request.getParameter("ckzt");
	if (ckzt!=null)
	{
		ckzt=cf.GB2Uni(ckzt);
		if (!(ckzt.equals("")))	wheresql+=" and  (cl_ckd.ckzt='"+ckzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cl_ckd.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_ckd.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cl_ckd.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	cksj=request.getParameter("cksj");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (cl_ckd.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}
	cksj=request.getParameter("cksj2");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (cl_ckd.cksj<=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}

	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (cl_ckd.bz='"+bz+"')";
	}
	ls_sql="SELECT cl_ckd.ckph,DECODE(cl_ckd.lx,'1','出库','2','退货') lx,DECODE(cl_ckd.ckzt,'1','未提交','2','已提交') ckzt,crm_khxx.hth,cl_ckd.lrsj,cl_ckd.cksj,sq_sgd.sgdmc,(select cksl from cl_ckmx where clbm='ZX01' and cl_ckd.ckph=cl_ckmx.ckph) cksl01,(select fgsdj from cl_ckmx where clbm='ZX01' and cl_ckd.ckph=cl_ckmx.ckph) fgsdj01,(select fgsdj*cksl from cl_ckmx where clbm='ZX01' and cl_ckd.ckph=cl_ckmx.ckph) ckje01,(select cksl from cl_ckmx where clbm='ZX02' and cl_ckd.ckph=cl_ckmx.ckph) cksl02,(select fgsdj from cl_ckmx where clbm='ZX02' and cl_ckd.ckph=cl_ckmx.ckph) fgsdj02,(select fgsdj*cksl from cl_ckmx where clbm='ZX02' and cl_ckd.ckph=cl_ckmx.ckph) ckje02,(select cksl from cl_ckmx where clbm='ZX03' and cl_ckd.ckph=cl_ckmx.ckph) cksl03,(select fgsdj from cl_ckmx where clbm='ZX03' and cl_ckd.ckph=cl_ckmx.ckph) fgsdj03,(select fgsdj*cksl from cl_ckmx where clbm='ZX03' and cl_ckd.ckph=cl_ckmx.ckph) ckje03,(select cksl from cl_ckmx where clbm='ZX04' and cl_ckd.ckph=cl_ckmx.ckph) cksl04,(select fgsdj from cl_ckmx where clbm='ZX04' and cl_ckd.ckph=cl_ckmx.ckph) fgsdj04,(select fgsdj*cksl from cl_ckmx where clbm='ZX04' and cl_ckd.ckph=cl_ckmx.ckph) ckje04,(select cksl from cl_ckmx where clbm='ZX05' and cl_ckd.ckph=cl_ckmx.ckph) cksl05,(select fgsdj from cl_ckmx where clbm='ZX05' and cl_ckd.ckph=cl_ckmx.ckph) fgsdj05,(select fgsdj*cksl from cl_ckmx where clbm='ZX05' and cl_ckd.ckph=cl_ckmx.ckph) ckje05";
	ls_sql+=" FROM cl_ckd,sq_dwxx,crm_khxx,sq_sgd ";
    ls_sql+=" where cl_ckd.dwbh=sq_dwxx.dwbh(+) and cl_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and cl_ckd.ckph in (select distinct ckph from cl_ckmx where cldlmc='杂项')";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_ckd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_ckdCxList.jsp","SelectCxCl_ckd1.jsp","","dypsd.jsp");
	
	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ckph","dwbh","khbh","ckzsl","ckzje","ckzt","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ckph"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("打印");
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ckph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="viewckmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"psdh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/fcgl/cl_psd/viewckmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("psdh",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">出库批号</td>
	<td  width="2%">类型</td>
	<td  width="4%">出库状态</td>
	<td  width="4%">合同号</td>
	<td  width="4%">出库时间</td>
	<td  width="4%">实际送货时间</td>
	<td  width="4%">施工队长</td>
	<td  width="4%">长工服数量</td>
	<td  width="4%">长工服单价</td>
	<td  width="4%">长工服金额</td>
	<td  width="4%">短工服数量</td>
	<td  width="4%">短工服单价</td>
	<td  width="4%">短工服金额</td>
	<td  width="4%">灭火箱数量</td>
	<td  width="4%">灭火箱单价</td>
	<td  width="4%">灭火箱金额</td>	
	<td  width="4%">锯台周挡数量</td>
	<td  width="4%">锯台周挡单价</td>
	<td  width="4%">锯台周挡金额</td>
	<td  width="4%">展示柜数量</td>
	<td  width="4%">展示柜单价</td>
	<td  width="4%">展示柜金额</td>
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