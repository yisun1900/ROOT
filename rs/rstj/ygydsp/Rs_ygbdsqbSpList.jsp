<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_ygbdsqb.ztbm='"+ztbm+"')";
	}

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		wheresql+=" and  (rs_ygbdsqb.fgsbh='"+ssfgs+"')";
	}

	ls_sql="SELECT rs_ygbdsqb.bdxh,rs_ygbdsqb.ztbm,DECODE(rs_ygbdsqb.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消') clzt,rs_ztbm.ztmc,rs_ygbdsqb.ygbh,sq_yhxx.yhmc,sq_yhxx.bianhao,bdsxrq,DECODE(bdxz,'01','转正','02','调薪','03','升职','04','降职','05','调职','06','调动','07','升级','08','降级','99','其他') bdxz,a.dwmc fgsbh,tcf,bdyy,b.dwmc dwbh,c.dwmc dwbh2,rs_ygbdsqb.zwbm,zwbm2,rs_ygbdsqb.lrsj,rs_ygbdsqb.lrr,rs_ygbdsqb.bz,rs_ygbdsqb.spxh,rs_ygbdsqb.shr,rs_ygbdsqb.shsj,shjlmc,rs_ygbdsqb.shyj";
	ls_sql+=" FROM rs_ygbdsqb,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,sq_yhxx,rs_shjlbm  ";
    ls_sql+=" where  rs_ygbdsqb.fgsbh=a.dwbh and rs_ygbdsqb.dwbh=b.dwbh and rs_ygbdsqb.dwbh2=c.dwbh";
    ls_sql+=" and rs_ygbdsqb.ztbm=rs_ztbm.ztbm(+) and rs_ygbdsqb.shjl=rs_shjlbm.shjl(+)";
    ls_sql+=" and rs_ygbdsqb.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=wheresql;

    ls_sql+=" and rs_ygbdsqb.ztbm in( ";
	ls_sql+=" select rs_shsq.ztbm ";
	ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
	ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
	ls_sql+=" and rs_ztbm.ztlx='03' and rs_ztbm.ztbm=rs_shsq.ztbm";
    ls_sql+=" ) ";

	ls_sql+=" order by rs_ygbdsqb.lrsj desc";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ygbdsqbSpList.jsp","","","SpRs_ygbdsqb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setEditStr("审批");
//设置显示列


	String[] disColName={"bdxh","clzt","ztmc","ygbh","yhmc","bianhao","bdsxrq","bdxz","fgsbh","tcf","bdyy","dwbh","dwbh2","zwbm","zwbm2" ,"lrsj","lrr","bz","spxh","shr","shsj","shjlmc","shyj"};
	pageObj.setDisColName(disColName);
//	String[] disColName={"bdxh","clzt","ztmc","ygbh","yhmc","bianhao","bdsxrq","bdxz","fgsbh","tcf","bdyy","dwbh","dwbh2","zwbm","zwbm2" ,"lrsj","lrbm","bz","spxh","shr","shsj","shjlmc","shyj"};

//设置主键
	String[] keyName={"bdxh","ztbm"};
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
/*
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
  <B><font size="3">人事变动－审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">变动序号</td>
	<td  width="3%">处理状态</td>
	<td  width="4%">审批状态</td>
	<td  width="2%">员工序号</td>
	<td  width="3%">名称</td>
	<td  width="2%">工号</td>
	<td  width="3%">变动生效时间</td>
	<td  width="3%">变动性质</td>
	<td  width="4%">申报公司</td>
	<td  width="5%">提出方</td>
	<td  width="12%">变动原因</td>
	<td  width="5%">变动前部门</td>
	<td  width="5%">变动后部门</td>
	<td  width="4%">变动前岗位</td>
	<td  width="4%">变动后岗位</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">录入人</td>
	<td  width="10%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
	<td  width="10%">审核意见</td>
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