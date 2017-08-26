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
	String rs_jbsqspb_spxh=null;
	String rs_jbsqspb_sqxh=null;
	String rs_jbsqd_fgsbh=null;
	String rs_jbsqd_ygbh=null;
	String rs_jbsqd_yhmc=null;
	String rs_jbsqd_xb=null;
	String rs_jbsqd_lrsj=null;
	String rs_jbsqspb_shjl=null;
	String rs_jbsqspb_shr=null;
	String rs_jbsqspb_shsj=null;
	String rs_jbsqspb_clzt=null;
	String rs_jbsqspb_ztbm=null;
	String rs_jbsqspb_yclzt=null;
	String rs_jbsqspb_yztbm=null;
	rs_jbsqspb_spxh=request.getParameter("rs_jbsqspb_spxh");
	if (rs_jbsqspb_spxh!=null)
	{
		rs_jbsqspb_spxh=rs_jbsqspb_spxh.trim();
		if (!(rs_jbsqspb_spxh.equals("")))	wheresql+=" and (rs_jbsqspb.spxh="+rs_jbsqspb_spxh+") ";
	}
	rs_jbsqspb_sqxh=request.getParameter("rs_jbsqspb_sqxh");
	if (rs_jbsqspb_sqxh!=null)
	{
		rs_jbsqspb_sqxh=cf.GB2Uni(rs_jbsqspb_sqxh);
		if (!(rs_jbsqspb_sqxh.equals("")))	wheresql+=" and  (rs_jbsqspb.sqxh='"+rs_jbsqspb_sqxh+"')";
	}
	rs_jbsqd_fgsbh=request.getParameter("rs_jbsqd_fgsbh");
	if (rs_jbsqd_fgsbh!=null)
	{
		rs_jbsqd_fgsbh=cf.GB2Uni(rs_jbsqd_fgsbh);
		if (!(rs_jbsqd_fgsbh.equals("")))	wheresql+=" and  (rs_jbsqd.fgsbh='"+rs_jbsqd_fgsbh+"')";
	}
	rs_jbsqd_ygbh=request.getParameter("rs_jbsqd_ygbh");
	if (rs_jbsqd_ygbh!=null)
	{
		rs_jbsqd_ygbh=rs_jbsqd_ygbh.trim();
		if (!(rs_jbsqd_ygbh.equals("")))	wheresql+=" and (rs_jbsqd.ygbh="+rs_jbsqd_ygbh+") ";
	}
	rs_jbsqd_yhmc=request.getParameter("rs_jbsqd_yhmc");
	if (rs_jbsqd_yhmc!=null)
	{
		rs_jbsqd_yhmc=cf.GB2Uni(rs_jbsqd_yhmc);
		if (!(rs_jbsqd_yhmc.equals("")))	wheresql+=" and  (rs_jbsqd.yhmc='"+rs_jbsqd_yhmc+"')";
	}
	rs_jbsqd_xb=request.getParameter("rs_jbsqd_xb");
	if (rs_jbsqd_xb!=null)
	{
		rs_jbsqd_xb=cf.GB2Uni(rs_jbsqd_xb);
		if (!(rs_jbsqd_xb.equals("")))	wheresql+=" and  (rs_jbsqd.xb='"+rs_jbsqd_xb+"')";
	}
	rs_jbsqd_lrsj=request.getParameter("rs_jbsqd_lrsj");
	if (rs_jbsqd_lrsj!=null)
	{
		rs_jbsqd_lrsj=rs_jbsqd_lrsj.trim();
		if (!(rs_jbsqd_lrsj.equals("")))	wheresql+="  and (rs_jbsqd.lrsj>=TO_DATE('"+rs_jbsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqd_lrsj=request.getParameter("rs_jbsqd_lrsj2");
	if (rs_jbsqd_lrsj!=null)
	{
		rs_jbsqd_lrsj=rs_jbsqd_lrsj.trim();
		if (!(rs_jbsqd_lrsj.equals("")))	wheresql+="  and (rs_jbsqd.lrsj<=TO_DATE('"+rs_jbsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqspb_shjl=request.getParameter("rs_jbsqspb_shjl");
	if (rs_jbsqspb_shjl!=null)
	{
		rs_jbsqspb_shjl=cf.GB2Uni(rs_jbsqspb_shjl);
		if (!(rs_jbsqspb_shjl.equals("")))	wheresql+=" and  (rs_jbsqspb.shjl='"+rs_jbsqspb_shjl+"')";
	}
	rs_jbsqspb_shr=request.getParameter("rs_jbsqspb_shr");
	if (rs_jbsqspb_shr!=null)
	{
		rs_jbsqspb_shr=cf.GB2Uni(rs_jbsqspb_shr);
		if (!(rs_jbsqspb_shr.equals("")))	wheresql+=" and  (rs_jbsqspb.shr='"+rs_jbsqspb_shr+"')";
	}
	rs_jbsqspb_shsj=request.getParameter("rs_jbsqspb_shsj");
	if (rs_jbsqspb_shsj!=null)
	{
		rs_jbsqspb_shsj=rs_jbsqspb_shsj.trim();
		if (!(rs_jbsqspb_shsj.equals("")))	wheresql+="  and (rs_jbsqspb.shsj>=TO_DATE('"+rs_jbsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqspb_shsj=request.getParameter("rs_jbsqspb_shsj2");
	if (rs_jbsqspb_shsj!=null)
	{
		rs_jbsqspb_shsj=rs_jbsqspb_shsj.trim();
		if (!(rs_jbsqspb_shsj.equals("")))	wheresql+="  and (rs_jbsqspb.shsj<=TO_DATE('"+rs_jbsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqspb_clzt=request.getParameter("rs_jbsqspb_clzt");
	if (rs_jbsqspb_clzt!=null)
	{
		rs_jbsqspb_clzt=cf.GB2Uni(rs_jbsqspb_clzt);
		if (!(rs_jbsqspb_clzt.equals("")))	wheresql+=" and  (rs_jbsqspb.clzt='"+rs_jbsqspb_clzt+"')";
	}
	rs_jbsqspb_ztbm=request.getParameter("rs_jbsqspb_ztbm");
	if (rs_jbsqspb_ztbm!=null)
	{
		rs_jbsqspb_ztbm=cf.GB2Uni(rs_jbsqspb_ztbm);
		if (!(rs_jbsqspb_ztbm.equals("")))	wheresql+=" and  (rs_jbsqspb.ztbm='"+rs_jbsqspb_ztbm+"')";
	}
	rs_jbsqspb_yclzt=request.getParameter("rs_jbsqspb_yclzt");
	if (rs_jbsqspb_yclzt!=null)
	{
		rs_jbsqspb_yclzt=cf.GB2Uni(rs_jbsqspb_yclzt);
		if (!(rs_jbsqspb_yclzt.equals("")))	wheresql+=" and  (rs_jbsqspb.yclzt='"+rs_jbsqspb_yclzt+"')";
	}
	rs_jbsqspb_yztbm=request.getParameter("rs_jbsqspb_yztbm");
	if (rs_jbsqspb_yztbm!=null)
	{
		rs_jbsqspb_yztbm=cf.GB2Uni(rs_jbsqspb_yztbm);
		if (!(rs_jbsqspb_yztbm.equals("")))	wheresql+=" and  (rs_jbsqspb.yztbm='"+rs_jbsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_jbsqspb.spxh,rs_jbsqspb.sqxh,a.dwmc fgsbh,rs_jbsqd.ygbh,rs_jbsqd.yhmc, DECODE(rs_jbsqd.xb,'M','男','W','女'),rs_jbsqd.lrsj,e.shjlmc shjl,rs_jbsqspb.shyj,rs_jbsqspb.shr,rs_jbsqspb.shsj, DECODE(rs_jbsqspb.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),g.ztmc ztbm,rs_jbsqspb.yspxh, DECODE(rs_jbsqspb.yclzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),h.ztmc yztbm,f.shjlmc yshjl,rs_jbsqspb.yshyj,rs_jbsqspb.yshr,rs_jbsqspb.yshsj  ";
	ls_sql+=" FROM rs_jbsqspb,rs_jbsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_jbsqspb.sqxh=rs_jbsqd.sqxh";
    ls_sql+=" and rs_jbsqd.fgsbh=a.dwbh(+) and rs_jbsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_jbsqspb.shjl=e.shjl(+) and rs_jbsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_jbsqspb.ztbm=g.ztbm(+) and rs_jbsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_jbsqspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_jbsqspbCxList.jsp","SelectCxRs_jbsqspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_jbsqspb_sqxh","rs_jbsqd_fgsbh","rs_jbsqd_ygbh","rs_jbsqd_yhmc","rs_jbsqd_xb","rs_jbsqd_xdwbh","rs_jbsqd_xxzzwbm","rs_jbsqd_lrsj","rs_jbsqspb_shjl","rs_jbsqspb_shyj","rs_jbsqspb_shr","rs_jbsqspb_shsj","rs_jbsqspb_clzt","rs_jbsqspb_ztbm","rs_jbsqspb_yspxh","rs_jbsqspb_yclzt","rs_jbsqspb_yztbm","rs_jbsqspb_yshjl","rs_jbsqspb_yshyj","rs_jbsqspb_yshr","rs_jbsqspb_yshsj"};
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
  <B><font size="3">加班申请--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">加班申请序号</td>
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