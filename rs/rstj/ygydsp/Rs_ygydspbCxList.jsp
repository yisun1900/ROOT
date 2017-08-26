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
	String bdxh=null;
	String ygbh=null;
	String bdsxrq=null;
	String bdxz=null;
	String bdyy=null;
	String fgsbh=null;
	String tcf=null;
	String dwbh=null;
	String dwbh2=null;
	String zwbm=null;
	String zwbm2=null;
	String ztbm=null;
	String lrsj=null;
	String lrr=null;

	
	String yhmc=null;
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	String bianhao=null;
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (rs_ygbdsqb.clzt='"+clzt+"')";
	}
	
	bdxh=request.getParameter("bdxh");
	if (bdxh!=null)
	{
		bdxh=cf.GB2Uni(bdxh);
		if (!(bdxh.equals("")))	wheresql+=" and  (rs_ygbdsqb.bdxh='"+bdxh+"')";
	}

	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (rs_ygbdsqb.ygbh="+ygbh+") ";
	}
	bdsxrq=request.getParameter("bdsxrq");
	if (bdsxrq!=null)
	{
		bdsxrq=bdsxrq.trim();
		if (!(bdsxrq.equals("")))	wheresql+="  and (rs_ygbdsqb.bdsxrq>=TO_DATE('"+bdsxrq+"','YYYY/MM/DD'))";
	}
	bdsxrq=request.getParameter("bdsxrq2");
	if (bdsxrq!=null)
	{
		bdsxrq=bdsxrq.trim();
		if (!(bdsxrq.equals("")))	wheresql+="  and (rs_ygbdsqb.bdsxrq<=TO_DATE('"+bdsxrq+"','YYYY/MM/DD'))";
	}
	bdxz=request.getParameter("bdxz");
	if (bdxz!=null)
	{
		bdxz=cf.GB2Uni(bdxz);
		if (!(bdxz.equals("")))	wheresql+=" and  (rs_ygbdsqb.bdxz='"+bdxz+"')";
	}
	bdyy=request.getParameter("bdyy");
	if (bdyy!=null)
	{
		bdyy=cf.GB2Uni(bdyy);
		if (!(bdyy.equals("")))	wheresql+=" and  (rs_ygbdsqb.bdyy='"+bdyy+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (rs_ygbdsqb.fgsbh='"+fgsbh+"')";
	}
	tcf=request.getParameter("tcf");
	if (tcf!=null)
	{
		tcf=cf.GB2Uni(tcf);
		if (!(tcf.equals("")))	wheresql+=" and  (rs_ygbdsqb.tcf='"+tcf+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_ygbdsqb.dwbh='"+dwbh+"')";
	}
	dwbh2=request.getParameter("dwbh2");
	if (dwbh2!=null)
	{
		dwbh2=cf.GB2Uni(dwbh2);
		if (!(dwbh2.equals("")))	wheresql+=" and  (rs_ygbdsqb.dwbh2='"+dwbh2+"')";
	}
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		zwbm=cf.GB2Uni(zwbm);
		if (!(zwbm.equals("")))	wheresql+=" and  (rs_ygbdsqb.zwbm='"+zwbm+"')";
	}
	zwbm2=request.getParameter("zwbm2");
	if (zwbm2!=null)
	{
		zwbm2=cf.GB2Uni(zwbm2);
		if (!(zwbm2.equals("")))	wheresql+=" and  (rs_ygbdsqb.zwbm2='"+zwbm2+"')";
	}
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_ygbdsqb.ztbm='"+ztbm+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_ygbdsqb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_ygbdsqb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	ls_sql="SELECT rs_ygbdsqb.bdxh,DECODE(rs_ygbdsqb.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消'),rs_ztbm.ztmc,rs_ygbdsqb.ygbh,sq_yhxx.yhmc,sq_yhxx.bianhao,bdsxrq,DECODE(bdxz,'01','转正','02','调薪','03','升职','04','降职','05','调职','06','调动','07','升级','08','降级','99','其他'),a.dwmc fgsbh,tcf,bdyy,b.dwmc dwbh,c.dwmc dwbh2,rs_ygbdsqb.zwbm,zwbm2,rs_ygbdsqb.lrsj,rs_ygbdsqb.lrr,rs_ygbdsqb.bz";
	ls_sql+=" FROM rs_ygbdsqb,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,sq_yhxx  ";
    ls_sql+=" where  rs_ygbdsqb.fgsbh=a.dwbh and rs_ygbdsqb.dwbh=b.dwbh and rs_ygbdsqb.dwbh2=c.dwbh";
    ls_sql+=" and rs_ygbdsqb.ztbm=rs_ztbm.ztbm(+)";
    ls_sql+=" and rs_ygbdsqb.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by rs_ygbdsqb.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ygydspbCxList.jsp","SelectCxRs_ygydspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"bdxh","ygbh","bdsxrq","bdxz","bdyy","fgsbh","tcf","dwbh","dwbh2","zwbm","zwbm2","ztbm","lrsj","lrr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bdxh"};
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
  <B><font size="3">员工变动情况查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">变动序号</td>
	<td  width="4%">处理状态</td>
	<td  width="5%">审批状态</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">名称</td>
	<td  width="3%">工号</td>
	<td  width="4%">变动生效时间</td>
	<td  width="3%">变动性质</td>
	<td  width="5%">申报公司</td>
	<td  width="6%">提出方</td>
	<td  width="17%">变动原因</td>
	<td  width="7%">变动前部门</td>
	<td  width="7%">变动后部门</td>
	<td  width="5%">变动前岗位</td>
	<td  width="5%">变动后岗位</td>
	<td  width="4%">录入时间</td>
	<td  width="3%">录入人</td>
	<td  width="12%">备注</td>
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