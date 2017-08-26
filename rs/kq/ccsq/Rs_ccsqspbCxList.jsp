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
	String rs_ccsqspb_spxh=null;
	String rs_ccsqspb_sqxh=null;
	String rs_ccsqd_fgsbh=null;
	String rs_ccsqd_ygbh=null;
	String rs_ccsqd_yhmc=null;
	String rs_ccsqd_xb=null;
	String rs_ccsqd_lrsj=null;
	String rs_ccsqspb_shjl=null;
	String rs_ccsqspb_shr=null;
	String rs_ccsqspb_shsj=null;
	String rs_ccsqspb_clzt=null;
	String rs_ccsqspb_ztbm=null;
	String rs_ccsqspb_yclzt=null;
	String rs_ccsqspb_yztbm=null;
	rs_ccsqspb_spxh=request.getParameter("rs_ccsqspb_spxh");
	if (rs_ccsqspb_spxh!=null)
	{
		rs_ccsqspb_spxh=rs_ccsqspb_spxh.trim();
		if (!(rs_ccsqspb_spxh.equals("")))	wheresql+=" and (rs_ccsqspb.spxh="+rs_ccsqspb_spxh+") ";
	}
	rs_ccsqspb_sqxh=request.getParameter("rs_ccsqspb_sqxh");
	if (rs_ccsqspb_sqxh!=null)
	{
		rs_ccsqspb_sqxh=cf.GB2Uni(rs_ccsqspb_sqxh);
		if (!(rs_ccsqspb_sqxh.equals("")))	wheresql+=" and  (rs_ccsqspb.sqxh='"+rs_ccsqspb_sqxh+"')";
	}
	rs_ccsqd_fgsbh=request.getParameter("rs_ccsqd_fgsbh");
	if (rs_ccsqd_fgsbh!=null)
	{
		rs_ccsqd_fgsbh=cf.GB2Uni(rs_ccsqd_fgsbh);
		if (!(rs_ccsqd_fgsbh.equals("")))	wheresql+=" and  (rs_ccsqd.fgsbh='"+rs_ccsqd_fgsbh+"')";
	}
	rs_ccsqd_ygbh=request.getParameter("rs_ccsqd_ygbh");
	if (rs_ccsqd_ygbh!=null)
	{
		rs_ccsqd_ygbh=rs_ccsqd_ygbh.trim();
		if (!(rs_ccsqd_ygbh.equals("")))	wheresql+=" and (rs_ccsqd.ygbh="+rs_ccsqd_ygbh+") ";
	}
	rs_ccsqd_yhmc=request.getParameter("rs_ccsqd_yhmc");
	if (rs_ccsqd_yhmc!=null)
	{
		rs_ccsqd_yhmc=cf.GB2Uni(rs_ccsqd_yhmc);
		if (!(rs_ccsqd_yhmc.equals("")))	wheresql+=" and  (rs_ccsqd.yhmc='"+rs_ccsqd_yhmc+"')";
	}
	rs_ccsqd_xb=request.getParameter("rs_ccsqd_xb");
	if (rs_ccsqd_xb!=null)
	{
		rs_ccsqd_xb=cf.GB2Uni(rs_ccsqd_xb);
		if (!(rs_ccsqd_xb.equals("")))	wheresql+=" and  (rs_ccsqd.xb='"+rs_ccsqd_xb+"')";
	}
	rs_ccsqd_lrsj=request.getParameter("rs_ccsqd_lrsj");
	if (rs_ccsqd_lrsj!=null)
	{
		rs_ccsqd_lrsj=rs_ccsqd_lrsj.trim();
		if (!(rs_ccsqd_lrsj.equals("")))	wheresql+="  and (rs_ccsqd.lrsj>=TO_DATE('"+rs_ccsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqd_lrsj=request.getParameter("rs_ccsqd_lrsj2");
	if (rs_ccsqd_lrsj!=null)
	{
		rs_ccsqd_lrsj=rs_ccsqd_lrsj.trim();
		if (!(rs_ccsqd_lrsj.equals("")))	wheresql+="  and (rs_ccsqd.lrsj<=TO_DATE('"+rs_ccsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqspb_shjl=request.getParameter("rs_ccsqspb_shjl");
	if (rs_ccsqspb_shjl!=null)
	{
		rs_ccsqspb_shjl=cf.GB2Uni(rs_ccsqspb_shjl);
		if (!(rs_ccsqspb_shjl.equals("")))	wheresql+=" and  (rs_ccsqspb.shjl='"+rs_ccsqspb_shjl+"')";
	}
	rs_ccsqspb_shr=request.getParameter("rs_ccsqspb_shr");
	if (rs_ccsqspb_shr!=null)
	{
		rs_ccsqspb_shr=cf.GB2Uni(rs_ccsqspb_shr);
		if (!(rs_ccsqspb_shr.equals("")))	wheresql+=" and  (rs_ccsqspb.shr='"+rs_ccsqspb_shr+"')";
	}
	rs_ccsqspb_shsj=request.getParameter("rs_ccsqspb_shsj");
	if (rs_ccsqspb_shsj!=null)
	{
		rs_ccsqspb_shsj=rs_ccsqspb_shsj.trim();
		if (!(rs_ccsqspb_shsj.equals("")))	wheresql+="  and (rs_ccsqspb.shsj>=TO_DATE('"+rs_ccsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqspb_shsj=request.getParameter("rs_ccsqspb_shsj2");
	if (rs_ccsqspb_shsj!=null)
	{
		rs_ccsqspb_shsj=rs_ccsqspb_shsj.trim();
		if (!(rs_ccsqspb_shsj.equals("")))	wheresql+="  and (rs_ccsqspb.shsj<=TO_DATE('"+rs_ccsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqspb_clzt=request.getParameter("rs_ccsqspb_clzt");
	if (rs_ccsqspb_clzt!=null)
	{
		rs_ccsqspb_clzt=cf.GB2Uni(rs_ccsqspb_clzt);
		if (!(rs_ccsqspb_clzt.equals("")))	wheresql+=" and  (rs_ccsqspb.clzt='"+rs_ccsqspb_clzt+"')";
	}
	rs_ccsqspb_ztbm=request.getParameter("rs_ccsqspb_ztbm");
	if (rs_ccsqspb_ztbm!=null)
	{
		rs_ccsqspb_ztbm=cf.GB2Uni(rs_ccsqspb_ztbm);
		if (!(rs_ccsqspb_ztbm.equals("")))	wheresql+=" and  (rs_ccsqspb.ztbm='"+rs_ccsqspb_ztbm+"')";
	}
	rs_ccsqspb_yclzt=request.getParameter("rs_ccsqspb_yclzt");
	if (rs_ccsqspb_yclzt!=null)
	{
		rs_ccsqspb_yclzt=cf.GB2Uni(rs_ccsqspb_yclzt);
		if (!(rs_ccsqspb_yclzt.equals("")))	wheresql+=" and  (rs_ccsqspb.yclzt='"+rs_ccsqspb_yclzt+"')";
	}
	rs_ccsqspb_yztbm=request.getParameter("rs_ccsqspb_yztbm");
	if (rs_ccsqspb_yztbm!=null)
	{
		rs_ccsqspb_yztbm=cf.GB2Uni(rs_ccsqspb_yztbm);
		if (!(rs_ccsqspb_yztbm.equals("")))	wheresql+=" and  (rs_ccsqspb.yztbm='"+rs_ccsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_ccsqspb.spxh,rs_ccsqspb.sqxh,a.dwmc fgsbh,rs_ccsqd.ygbh,rs_ccsqd.yhmc, DECODE(rs_ccsqd.xb,'M','男','W','女'),rs_ccsqd.lrsj,e.shjlmc shjl,rs_ccsqspb.shyj,rs_ccsqspb.shr,rs_ccsqspb.shsj, DECODE(rs_ccsqspb.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),g.ztmc ztbm,rs_ccsqspb.yspxh, DECODE(rs_ccsqspb.yclzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),h.ztmc yztbm,f.shjlmc yshjl,rs_ccsqspb.yshyj,rs_ccsqspb.yshr,rs_ccsqspb.yshsj  ";
	ls_sql+=" FROM rs_ccsqspb,rs_ccsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_ccsqspb.sqxh=rs_ccsqd.sqxh";
    ls_sql+=" and rs_ccsqd.fgsbh=a.dwbh(+) and rs_ccsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_ccsqspb.shjl=e.shjl(+) and rs_ccsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_ccsqspb.ztbm=g.ztbm(+) and rs_ccsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ccsqspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ccsqspbCxList.jsp","SelectCxRs_ccsqspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_ccsqspb_sqxh","rs_ccsqd_fgsbh","rs_ccsqd_ygbh","rs_ccsqd_yhmc","rs_ccsqd_xb","rs_ccsqd_xdwbh","rs_ccsqd_xxzzwbm","rs_ccsqd_lrsj","rs_ccsqspb_shjl","rs_ccsqspb_shyj","rs_ccsqspb_shr","rs_ccsqspb_shsj","rs_ccsqspb_clzt","rs_ccsqspb_ztbm","rs_ccsqspb_yspxh","rs_ccsqspb_yclzt","rs_ccsqspb_yztbm","rs_ccsqspb_yshjl","rs_ccsqspb_yshyj","rs_ccsqspb_yshr","rs_ccsqspb_yshsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">出差申请--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">出差申请序号</td>
	<td  width="5%">申报公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="3%">申请录入时间</td>
	<td  width="3%">审核结论</td>
	<td  width="17%">审核意见</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核后处理状态</td>
	<td  width="6%">审核后审批状态</td>
	<td  width="3%">上次审批序号</td>
	<td  width="3%">上次处理状态</td>
	<td  width="6%">上次审批状态</td>
	<td  width="3%">上次审核结论</td>
	<td  width="16%">上次审核意见</td>
	<td  width="2%">上次审核人</td>
	<td  width="3%">上次审核时间</td>
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