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
	String bz=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String fgs=null;

	String psfs=null;
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		if (!(psfs.equals("")))	wheresql+=" and  (psfs='"+psfs+"')";
	}
	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jhshsj<=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}

	ckzt=request.getParameter("ckzt");
	if (ckzt!=null)
	{
		ckzt=cf.GB2Uni(ckzt);
		if (!(ckzt.equals("")))
		{	
			wheresql+=" and  (cl_ckd.ckzt='"+ckzt+"')";
		}
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
		if (!(ckph.equals("")))	wheresql+=" and  (ckph='"+ckph+"')";
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
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	ckzsl=request.getParameter("ckzsl");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (ckzsl>="+ckzsl+") ";
	}
	ckzsl=request.getParameter("ckzsl2");
	if (ckzsl!=null)
	{
		ckzsl=ckzsl.trim();
		if (!(ckzsl.equals("")))	wheresql+=" and  (ckzsl<="+ckzsl+") ";
	}
	ckzje=request.getParameter("ckzje");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (ckzje>="+ckzje+") ";
	}
	ckzje=request.getParameter("ckzje2");
	if (ckzje!=null)
	{
		ckzje=ckzje.trim();
		if (!(ckzje.equals("")))	wheresql+=" and  (ckzje<="+ckzje+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	ls_sql="SELECT cl_ckd.ckph,dwmc,cl_ckd.khbh,crm_khxx.khxm,cl_ckd.ckzsl,cl_ckd.ckzje,cl_ckd.fkje,DECODE(cl_ckd.ckzt,'1','未提交','2','已提交','3','已配送') ckzt,cl_ckd.ckr,cl_ckd.cksj,DECODE(cl_ckd.psfs,'1','配送','2','自提','9','其它'),cl_ckd.jhshsj,cl_ckd.shsj,cl_ckd.yf,cl_ckd.pslrr,cl_ckd.pslrsj,cl_ckd.lrr,cl_ckd.lrsj,cl_ckd.bz ";
	ls_sql+=" FROM cl_ckd,sq_dwxx,crm_khxx ";
    ls_sql+=" where cl_ckd.dwbh=sq_dwxx.dwbh(+) and cl_ckd.khbh=crm_khxx.khbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_ckd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_ckdXgPsList.jsp","SelectXgPsCl_ckd.jsp","","XgPsCl_ckd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ckph","dwbh","khbh","ckzsl","ckzje","ckzt","lrr","lrsj","shqrr","shqrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ckph"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除配送信息"};//按钮的显示名称
	String[] buttonLink={"Cl_ckdXgPsList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ckph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="viewckmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] ckph = request.getParameterValues("ckph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ckph,"ckph"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update cl_ckd set ckzt='2',shsj=null,yf=null,pslrr=null,pslrsj=null  where ckzt='3' and "+chooseitem;
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
  <B><font size="3">修改配送</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">出库批号</td>
	<td  width="7%">出库单位</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="6%">出库总数量</td>
	<td  width="7%">出库总金额</td>
	<td  width="5%">返款金额</td>
	<td  width="3%">出库状态</td>
	<td  width="3%">出库人</td>
	<td  width="5%">出库时间</td>
	<td  width="3%">配送方式</td>
	<td  width="5%">计划送货时间</td>
	<td  width="5%">实际送货时间</td>
	<td  width="5%">运费</td>
	<td  width="3%">配送录入人</td>
	<td  width="5%">配送录入时间</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
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