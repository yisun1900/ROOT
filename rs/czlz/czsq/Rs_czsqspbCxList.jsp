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
	String rs_czsqspb_spxh=null;
	String rs_czsqspb_sqxh=null;
	String rs_czsq_fgsbh=null;
	String rs_czsq_ygbh=null;
	String rs_czsq_yhmc=null;
	String rs_czsq_xb=null;
	String rs_czsq_lrsj=null;
	String rs_czsqspb_shjl=null;
	String rs_czsqspb_shr=null;
	String rs_czsqspb_shsj=null;
	String rs_czsqspb_clzt=null;
	String rs_czsqspb_ztbm=null;
	String rs_czsqspb_yclzt=null;
	String rs_czsqspb_yztbm=null;
	rs_czsqspb_spxh=request.getParameter("rs_czsqspb_spxh");
	if (rs_czsqspb_spxh!=null)
	{
		rs_czsqspb_spxh=rs_czsqspb_spxh.trim();
		if (!(rs_czsqspb_spxh.equals("")))	wheresql+=" and (rs_czsqspb.spxh="+rs_czsqspb_spxh+") ";
	}
	rs_czsqspb_sqxh=request.getParameter("rs_czsqspb_sqxh");
	if (rs_czsqspb_sqxh!=null)
	{
		rs_czsqspb_sqxh=cf.GB2Uni(rs_czsqspb_sqxh);
		if (!(rs_czsqspb_sqxh.equals("")))	wheresql+=" and  (rs_czsqspb.sqxh='"+rs_czsqspb_sqxh+"')";
	}
	rs_czsq_fgsbh=request.getParameter("rs_czsq_fgsbh");
	if (rs_czsq_fgsbh!=null)
	{
		rs_czsq_fgsbh=cf.GB2Uni(rs_czsq_fgsbh);
		if (!(rs_czsq_fgsbh.equals("")))	wheresql+=" and  (rs_czsq.fgsbh='"+rs_czsq_fgsbh+"')";
	}
	rs_czsq_ygbh=request.getParameter("rs_czsq_ygbh");
	if (rs_czsq_ygbh!=null)
	{
		rs_czsq_ygbh=rs_czsq_ygbh.trim();
		if (!(rs_czsq_ygbh.equals("")))	wheresql+=" and (rs_czsq.ygbh="+rs_czsq_ygbh+") ";
	}
	rs_czsq_yhmc=request.getParameter("rs_czsq_yhmc");
	if (rs_czsq_yhmc!=null)
	{
		rs_czsq_yhmc=cf.GB2Uni(rs_czsq_yhmc);
		if (!(rs_czsq_yhmc.equals("")))	wheresql+=" and  (rs_czsq.yhmc='"+rs_czsq_yhmc+"')";
	}
	rs_czsq_xb=request.getParameter("rs_czsq_xb");
	if (rs_czsq_xb!=null)
	{
		rs_czsq_xb=cf.GB2Uni(rs_czsq_xb);
		if (!(rs_czsq_xb.equals("")))	wheresql+=" and  (rs_czsq.xb='"+rs_czsq_xb+"')";
	}
	rs_czsq_lrsj=request.getParameter("rs_czsq_lrsj");
	if (rs_czsq_lrsj!=null)
	{
		rs_czsq_lrsj=rs_czsq_lrsj.trim();
		if (!(rs_czsq_lrsj.equals("")))	wheresql+="  and (rs_czsq.lrsj>=TO_DATE('"+rs_czsq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_czsq_lrsj=request.getParameter("rs_czsq_lrsj2");
	if (rs_czsq_lrsj!=null)
	{
		rs_czsq_lrsj=rs_czsq_lrsj.trim();
		if (!(rs_czsq_lrsj.equals("")))	wheresql+="  and (rs_czsq.lrsj<=TO_DATE('"+rs_czsq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_czsqspb_shjl=request.getParameter("rs_czsqspb_shjl");
	if (rs_czsqspb_shjl!=null)
	{
		rs_czsqspb_shjl=cf.GB2Uni(rs_czsqspb_shjl);
		if (!(rs_czsqspb_shjl.equals("")))	wheresql+=" and  (rs_czsqspb.shjl='"+rs_czsqspb_shjl+"')";
	}
	rs_czsqspb_shr=request.getParameter("rs_czsqspb_shr");
	if (rs_czsqspb_shr!=null)
	{
		rs_czsqspb_shr=cf.GB2Uni(rs_czsqspb_shr);
		if (!(rs_czsqspb_shr.equals("")))	wheresql+=" and  (rs_czsqspb.shr='"+rs_czsqspb_shr+"')";
	}
	rs_czsqspb_shsj=request.getParameter("rs_czsqspb_shsj");
	if (rs_czsqspb_shsj!=null)
	{
		rs_czsqspb_shsj=rs_czsqspb_shsj.trim();
		if (!(rs_czsqspb_shsj.equals("")))	wheresql+="  and (rs_czsqspb.shsj>=TO_DATE('"+rs_czsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_czsqspb_shsj=request.getParameter("rs_czsqspb_shsj2");
	if (rs_czsqspb_shsj!=null)
	{
		rs_czsqspb_shsj=rs_czsqspb_shsj.trim();
		if (!(rs_czsqspb_shsj.equals("")))	wheresql+="  and (rs_czsqspb.shsj<=TO_DATE('"+rs_czsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_czsqspb_clzt=request.getParameter("rs_czsqspb_clzt");
	if (rs_czsqspb_clzt!=null)
	{
		rs_czsqspb_clzt=cf.GB2Uni(rs_czsqspb_clzt);
		if (!(rs_czsqspb_clzt.equals("")))	wheresql+=" and  (rs_czsqspb.clzt='"+rs_czsqspb_clzt+"')";
	}
	rs_czsqspb_ztbm=request.getParameter("rs_czsqspb_ztbm");
	if (rs_czsqspb_ztbm!=null)
	{
		rs_czsqspb_ztbm=cf.GB2Uni(rs_czsqspb_ztbm);
		if (!(rs_czsqspb_ztbm.equals("")))	wheresql+=" and  (rs_czsqspb.ztbm='"+rs_czsqspb_ztbm+"')";
	}
	rs_czsqspb_yclzt=request.getParameter("rs_czsqspb_yclzt");
	if (rs_czsqspb_yclzt!=null)
	{
		rs_czsqspb_yclzt=cf.GB2Uni(rs_czsqspb_yclzt);
		if (!(rs_czsqspb_yclzt.equals("")))	wheresql+=" and  (rs_czsqspb.yclzt='"+rs_czsqspb_yclzt+"')";
	}
	rs_czsqspb_yztbm=request.getParameter("rs_czsqspb_yztbm");
	if (rs_czsqspb_yztbm!=null)
	{
		rs_czsqspb_yztbm=cf.GB2Uni(rs_czsqspb_yztbm);
		if (!(rs_czsqspb_yztbm.equals("")))	wheresql+=" and  (rs_czsqspb.yztbm='"+rs_czsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_czsqspb.spxh,rs_czsqspb.sqxh,a.dwmc fgsbh,rs_czsq.ygbh,rs_czsq.yhmc,rs_czsq.xzzwbm,rs_czsq.lrsj,e.shjlmc shjl,rs_czsqspb.shyj,rs_czsqspb.shr,rs_czsqspb.shsj, DECODE(rs_czsqspb.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已离职'),g.ztmc ztbm,rs_czsqspb.yspxh, DECODE(rs_czsqspb.yclzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已离职'),h.ztmc yztbm,f.shjlmc yshjl,rs_czsqspb.yshyj,rs_czsqspb.yshr,rs_czsqspb.yshsj  ";
	ls_sql+=" FROM rs_czsqspb,rs_czsq,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_czsqspb.sqxh=rs_czsq.sqxh";
    ls_sql+=" and rs_czsq.fgsbh=a.dwbh(+) and rs_czsq.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_czsqspb.shjl=e.shjl(+) and rs_czsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_czsqspb.ztbm=g.ztbm(+) and rs_czsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_czsqspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_czsqspbCxList.jsp","SelectCxRs_czsqspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_czsqspb_sqxh","rs_czsq_fgsbh","rs_czsq_ygbh","rs_czsq_yhmc","rs_czsq_xb","rs_czsq_xdwbh","rs_czsq_xxzzwbm","rs_czsq_lrsj","rs_czsqspb_shjl","rs_czsqspb_shyj","rs_czsqspb_shr","rs_czsqspb_shsj","rs_czsqspb_clzt","rs_czsqspb_ztbm","rs_czsqspb_yspxh","rs_czsqspb_yclzt","rs_czsqspb_yztbm","rs_czsqspb_yshjl","rs_czsqspb_yshyj","rs_czsqspb_yshr","rs_czsqspb_yshsj"};
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
  <B><font size="3">辞职申请--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">辞职辞职申请序号</td>
	<td  width="5%">申报公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="4%">行政职务</td>
	<td  width="3%">申请录入时间</td>
	<td  width="3%">审核结论</td>
	<td  width="16%">审核意见</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核后处理状态</td>
	<td  width="6%">审核后审批状态</td>
	<td  width="3%">上次审批序号</td>
	<td  width="3%">上次处理状态</td>
	<td  width="6%">上次审批状态</td>
	<td  width="3%">上次审核结论</td>
	<td  width="15%">上次审核意见</td>
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