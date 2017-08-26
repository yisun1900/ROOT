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
	String rs_bdsh_spxh=null;
	String rs_bdsh_bdxh=null;
	String rs_ygbdsqb_fgsbh=null;
	String rs_ygbdsqb_ygbh=null;
	String rs_ygbdsqb_yhmc=null;
	String rs_ygbdsqb_xb=null;
	String rs_ygbdsqb_lrsj=null;
	String rs_bdsh_shjl=null;
	String rs_bdsh_shr=null;
	String rs_bdsh_shsj=null;
	String rs_bdsh_clzt=null;
	String rs_bdsh_ztbm=null;
	String rs_bdsh_yclzt=null;
	String rs_bdsh_yztbm=null;
	rs_bdsh_spxh=request.getParameter("rs_bdsh_spxh");
	if (rs_bdsh_spxh!=null)
	{
		rs_bdsh_spxh=rs_bdsh_spxh.trim();
		if (!(rs_bdsh_spxh.equals("")))	wheresql+=" and (rs_bdsh.spxh="+rs_bdsh_spxh+") ";
	}
	rs_bdsh_bdxh=request.getParameter("rs_bdsh_bdxh");
	if (rs_bdsh_bdxh!=null)
	{
		rs_bdsh_bdxh=cf.GB2Uni(rs_bdsh_bdxh);
		if (!(rs_bdsh_bdxh.equals("")))	wheresql+=" and  (rs_bdsh.bdxh='"+rs_bdsh_bdxh+"')";
	}
	rs_ygbdsqb_fgsbh=request.getParameter("rs_ygbdsqb_fgsbh");
	if (rs_ygbdsqb_fgsbh!=null)
	{
		rs_ygbdsqb_fgsbh=cf.GB2Uni(rs_ygbdsqb_fgsbh);
		if (!(rs_ygbdsqb_fgsbh.equals("")))	wheresql+=" and  (rs_ygbdsqb.fgsbh='"+rs_ygbdsqb_fgsbh+"')";
	}
	rs_ygbdsqb_ygbh=request.getParameter("rs_ygbdsqb_ygbh");
	if (rs_ygbdsqb_ygbh!=null)
	{
		rs_ygbdsqb_ygbh=rs_ygbdsqb_ygbh.trim();
		if (!(rs_ygbdsqb_ygbh.equals("")))	wheresql+=" and (rs_ygbdsqb.ygbh="+rs_ygbdsqb_ygbh+") ";
	}
	rs_ygbdsqb_yhmc=request.getParameter("rs_ygbdsqb_yhmc");
	if (rs_ygbdsqb_yhmc!=null)
	{
		rs_ygbdsqb_yhmc=cf.GB2Uni(rs_ygbdsqb_yhmc);
		if (!(rs_ygbdsqb_yhmc.equals("")))	wheresql+=" and  (rs_ygbdsqb.yhmc='"+rs_ygbdsqb_yhmc+"')";
	}
	rs_ygbdsqb_xb=request.getParameter("rs_ygbdsqb_xb");
	if (rs_ygbdsqb_xb!=null)
	{
		rs_ygbdsqb_xb=cf.GB2Uni(rs_ygbdsqb_xb);
		if (!(rs_ygbdsqb_xb.equals("")))	wheresql+=" and  (rs_ygbdsqb.xb='"+rs_ygbdsqb_xb+"')";
	}
	rs_ygbdsqb_lrsj=request.getParameter("rs_ygbdsqb_lrsj");
	if (rs_ygbdsqb_lrsj!=null)
	{
		rs_ygbdsqb_lrsj=rs_ygbdsqb_lrsj.trim();
		if (!(rs_ygbdsqb_lrsj.equals("")))	wheresql+="  and (rs_ygbdsqb.lrsj>=TO_DATE('"+rs_ygbdsqb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ygbdsqb_lrsj=request.getParameter("rs_ygbdsqb_lrsj2");
	if (rs_ygbdsqb_lrsj!=null)
	{
		rs_ygbdsqb_lrsj=rs_ygbdsqb_lrsj.trim();
		if (!(rs_ygbdsqb_lrsj.equals("")))	wheresql+="  and (rs_ygbdsqb.lrsj<=TO_DATE('"+rs_ygbdsqb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_bdsh_shjl=request.getParameter("rs_bdsh_shjl");
	if (rs_bdsh_shjl!=null)
	{
		rs_bdsh_shjl=cf.GB2Uni(rs_bdsh_shjl);
		if (!(rs_bdsh_shjl.equals("")))	wheresql+=" and  (rs_bdsh.shjl='"+rs_bdsh_shjl+"')";
	}
	rs_bdsh_shr=request.getParameter("rs_bdsh_shr");
	if (rs_bdsh_shr!=null)
	{
		rs_bdsh_shr=cf.GB2Uni(rs_bdsh_shr);
		if (!(rs_bdsh_shr.equals("")))	wheresql+=" and  (rs_bdsh.shr='"+rs_bdsh_shr+"')";
	}
	rs_bdsh_shsj=request.getParameter("rs_bdsh_shsj");
	if (rs_bdsh_shsj!=null)
	{
		rs_bdsh_shsj=rs_bdsh_shsj.trim();
		if (!(rs_bdsh_shsj.equals("")))	wheresql+="  and (rs_bdsh.shsj>=TO_DATE('"+rs_bdsh_shsj+"','YYYY/MM/DD'))";
	}
	rs_bdsh_shsj=request.getParameter("rs_bdsh_shsj2");
	if (rs_bdsh_shsj!=null)
	{
		rs_bdsh_shsj=rs_bdsh_shsj.trim();
		if (!(rs_bdsh_shsj.equals("")))	wheresql+="  and (rs_bdsh.shsj<=TO_DATE('"+rs_bdsh_shsj+"','YYYY/MM/DD'))";
	}
	rs_bdsh_clzt=request.getParameter("rs_bdsh_clzt");
	if (rs_bdsh_clzt!=null)
	{
		rs_bdsh_clzt=cf.GB2Uni(rs_bdsh_clzt);
		if (!(rs_bdsh_clzt.equals("")))	wheresql+=" and  (rs_bdsh.clzt='"+rs_bdsh_clzt+"')";
	}
	rs_bdsh_ztbm=request.getParameter("rs_bdsh_ztbm");
	if (rs_bdsh_ztbm!=null)
	{
		rs_bdsh_ztbm=cf.GB2Uni(rs_bdsh_ztbm);
		if (!(rs_bdsh_ztbm.equals("")))	wheresql+=" and  (rs_bdsh.ztbm='"+rs_bdsh_ztbm+"')";
	}
	rs_bdsh_yclzt=request.getParameter("rs_bdsh_yclzt");
	if (rs_bdsh_yclzt!=null)
	{
		rs_bdsh_yclzt=cf.GB2Uni(rs_bdsh_yclzt);
		if (!(rs_bdsh_yclzt.equals("")))	wheresql+=" and  (rs_bdsh.yclzt='"+rs_bdsh_yclzt+"')";
	}
	rs_bdsh_yztbm=request.getParameter("rs_bdsh_yztbm");
	if (rs_bdsh_yztbm!=null)
	{
		rs_bdsh_yztbm=cf.GB2Uni(rs_bdsh_yztbm);
		if (!(rs_bdsh_yztbm.equals("")))	wheresql+=" and  (rs_bdsh.yztbm='"+rs_bdsh_yztbm+"')";
	}
	ls_sql="SELECT rs_bdsh.spxh,rs_bdsh.bdxh,DECODE(rs_ygbdsqb.bdxz,'01','转正','02','调薪','03','升职','04','降职','05','调职','06','调动','07','升级','08','降级','99','其他'),a.dwmc fgsbh,rs_ygbdsqb.ygbh,sq_yhxx.yhmc,sq_yhxx.xzzwbm,rs_ygbdsqb.lrsj,e.shjlmc shjl,rs_bdsh.shyj,rs_bdsh.shr,rs_bdsh.shsj, DECODE(rs_bdsh.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消'),g.ztmc ztbm,rs_bdsh.yspxh, DECODE(rs_bdsh.yclzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消'),h.ztmc yztbm,f.shjlmc yshjl,rs_bdsh.yshyj,rs_bdsh.yshr,rs_bdsh.yshsj  ";
	ls_sql+=" FROM rs_bdsh,rs_ygbdsqb,sq_yhxx,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_bdsh.bdxh=rs_ygbdsqb.bdxh";
    ls_sql+=" and rs_ygbdsqb.fgsbh=a.dwbh(+) and rs_ygbdsqb.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_bdsh.shjl=e.shjl(+) and rs_bdsh.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_bdsh.ztbm=g.ztbm(+) and rs_bdsh.yztbm=h.ztbm(+) ";
    ls_sql+=" and rs_ygbdsqb.ygbh=sq_yhxx.ygbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_bdsh.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_bdshCxList.jsp","SelectCxRs_bdsh.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_bdsh_bdxh","rs_ygbdsqb_fgsbh","rs_ygbdsqb_ygbh","rs_ygbdsqb_yhmc","rs_ygbdsqb_xb","rs_ygbdsqb_xdwbh","rs_ygbdsqb_xxzzwbm","rs_ygbdsqb_lrsj","rs_bdsh_shjl","rs_bdsh_shyj","rs_bdsh_shr","rs_bdsh_shsj","rs_bdsh_clzt","rs_bdsh_ztbm","rs_bdsh_yspxh","rs_bdsh_yclzt","rs_bdsh_yztbm","rs_bdsh_yshjl","rs_bdsh_yshyj","rs_bdsh_yshr","rs_bdsh_yshsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ygbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"bdxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/ygydsp/ViewRs_ygbdsqb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("bdxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">人事变动--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="4%">人事变动序号</td>
	<td  width="3%">变动性质</td>
	<td  width="4%">申报公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="4%">行政职务</td>
	<td  width="4%">录入时间</td>
	<td  width="3%">审核结论</td>
	<td  width="17%">审核意见</td>
	<td  width="2%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="3%">审核后处理状态</td>
	<td  width="6%">审核后审批状态</td>
	<td  width="3%">上次审批序号</td>
	<td  width="3%">上次处理状态</td>
	<td  width="6%">上次审批状态</td>
	<td  width="3%">上次审核结论</td>
	<td  width="17%">上次审核意见</td>
	<td  width="2%">上次审核人</td>
	<td  width="4%">上次审核时间</td>
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