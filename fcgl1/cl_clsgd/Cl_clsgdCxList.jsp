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
	String sgph=null;
	String dwbh=null;
	String sgzsl=null;
	String shzsl=null;
	String sgzt=null;
	String lrr=null;
	String lrsj=null;
	String zbshr=null;
	String zbshsj=null;
	String gysxdr=null;
	String gysxdsj=null;
	String bz=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_clsgd.dwbh='"+fgs+"')";
	sgph=request.getParameter("sgph");
	if (sgph!=null)
	{
		sgph=cf.GB2Uni(sgph);
		if (!(sgph.equals("")))	wheresql+=" and  (sgph='"+sgph+"')";
	}
	sgzsl=request.getParameter("sgzsl");
	if (sgzsl!=null)
	{
		sgzsl=sgzsl.trim();
		if (!(sgzsl.equals("")))	wheresql+=" and  (sgzsl>="+sgzsl+") ";
	}
	sgzsl=request.getParameter("sgzsl2");
	if (sgzsl!=null)
	{
		sgzsl=sgzsl.trim();
		if (!(sgzsl.equals("")))	wheresql+=" and  (sgzsl<="+sgzsl+") ";
	}
	shzsl=request.getParameter("shzsl");
	if (shzsl!=null)
	{
		shzsl=shzsl.trim();
		if (!(shzsl.equals("")))	wheresql+=" and  (shzsl>="+shzsl+") ";
	}
	shzsl=request.getParameter("shzsl2");
	if (shzsl!=null)
	{
		shzsl=shzsl.trim();
		if (!(shzsl.equals("")))	wheresql+=" and  (shzsl<="+shzsl+") ";
	}
	sgzt=request.getParameter("sgzt");
	if (sgzt!=null)
	{
		sgzt=cf.GB2Uni(sgzt);
		if (!(sgzt.equals("")))	wheresql+=" and  (sgzt='"+sgzt+"')";
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
	zbshr=request.getParameter("zbshr");
	if (zbshr!=null)
	{
		zbshr=cf.GB2Uni(zbshr);
		if (!(zbshr.equals("")))	wheresql+=" and  (zbshr='"+zbshr+"')";
	}
	zbshsj=request.getParameter("zbshsj");
	if (zbshsj!=null)
	{
		zbshsj=zbshsj.trim();
		if (!(zbshsj.equals("")))	wheresql+="  and (zbshsj>=TO_DATE('"+zbshsj+"','YYYY/MM/DD'))";
	}
	zbshsj=request.getParameter("zbshsj2");
	if (zbshsj!=null)
	{
		zbshsj=zbshsj.trim();
		if (!(zbshsj.equals("")))	wheresql+="  and (zbshsj<=TO_DATE('"+zbshsj+"','YYYY/MM/DD'))";
	}
	gysxdr=request.getParameter("gysxdr");
	if (gysxdr!=null)
	{
		gysxdr=cf.GB2Uni(gysxdr);
		if (!(gysxdr.equals("")))	wheresql+=" and  (gysxdr='"+gysxdr+"')";
	}
	gysxdsj=request.getParameter("gysxdsj");
	if (gysxdsj!=null)
	{
		gysxdsj=gysxdsj.trim();
		if (!(gysxdsj.equals("")))	wheresql+="  and (gysxdsj>=TO_DATE('"+gysxdsj+"','YYYY/MM/DD'))";
	}
	gysxdsj=request.getParameter("gysxdsj2");
	if (gysxdsj!=null)
	{
		gysxdsj=gysxdsj.trim();
		if (!(gysxdsj.equals("")))	wheresql+="  and (gysxdsj<=TO_DATE('"+gysxdsj+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (bz='"+bz+"')";
	}
	ls_sql="SELECT rownum,cl_clsgd.sgph,dwmc,cl_clsgd.sgzsl,cl_clsgd.shzsl,DECODE(sgzt,'1','未提交','2','已提交','3','一级审核','4','二级审核','5','三级审核','7','已配送','8','供应商下单','9','审核不通过'),DECODE(psfs,'1','配送','2','自提','9','其它'),jhshsj,cl_clsgd.shsj,cl_clsgd.yf,cl_clsgd.pslrr,cl_clsgd.pslrsj,cl_clsgd.lrr,cl_clsgd.lrsj,cl_clsgd.zbshr,cl_clsgd.zbshsj,cl_clsgd.zbshyj,cl_clsgd.ejshr,cl_clsgd.ejshsj,cl_clsgd.ejshyj,cl_clsgd.sjshr,cl_clsgd.sjshsj,cl_clsgd.sjshyj,cl_clsgd.gysxdr,cl_clsgd.gysxdsj,cl_clsgd.bz  ";
	ls_sql+=" FROM cl_clsgd,sq_dwxx  ";
    ls_sql+=" where cl_clsgd.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//	out.print(ls_sql);
//进行对象初始化
	pageObj.initPage("Cl_clsgdCxList.jsp","SelectCxCl_clsgd.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sgph","dwbh","sgzsl","shzsl","sgzt","lrr","lrsj","zbshr","zbshsj","gysxdr","gysxdsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sgph"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sgph",};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="viewsgmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sgph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
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
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="2%">序号</td>
	<td  width="3%">申购批号</td>
	<td  width="4%">申购单位</td>
	<td  width="3%">申购总数量</td>
	<td  width="3%">审核总数量</td>
	<td  width="3%">申购状态</td>
	<td  width="3%">配送方式</td>
	<td  width="3%">计划送货时间</td>
	<td  width="3%">实际送货时间</td>
	<td  width="3%">运费</td>
	<td  width="2%">配送录入人</td>
	<td  width="3%">配送录入时间</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">一级审核人</td>
	<td  width="3%">一级审核时间</td>
	<td  width="10%">一级审核意见</td>
	<td  width="2%">二级审核人</td>
	<td  width="3%">二级审核时间</td>
	<td  width="10%">二级审核意见</td>
	<td  width="2%">三级审核人</td>
	<td  width="3%">三级审核时间</td>
	<td  width="10%">三级审核意见</td>
	<td  width="2%">供应商下单人</td>
	<td  width="3%">供应商下单时间</td>
	<td  width="10%">备注</td>
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