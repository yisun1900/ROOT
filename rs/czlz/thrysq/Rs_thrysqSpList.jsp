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
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_thrysq.ztbm='"+ztbm+"')";
	}

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		wheresql+=" and  (rs_thrysq.fgsbh='"+ssfgs+"')";
	}

	ls_sql="SELECT rs_thrysq.sqxh,rs_thrysq.ztbm,DECODE(rs_thrysq.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消') clzt,ztmc,a.dwmc fgsbh,rs_thrysq.ygbh,rs_thrysq.yhmc,rs_thrysq.bianhao,rs_thrysq.sfzh,rs_thrysq.xzzwbm,rs_thrysq.rzsj,b.dwmc dwbh,rs_thrysq.yysm,rs_thrysq.gzbx,rs_thrysq.wpjjqk,rs_thrysq.sqrq,rs_thrysq.lrr,rs_thrysq.lrsj,c.dwmc lrbm,rs_thrysq.bz,rs_thrysq.spxh,rs_thrysq.shr,rs_thrysq.shsj,shjlmc,rs_thrysq.shyj";
	ls_sql+=" FROM rs_thrysq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_thrysq.fgsbh=a.dwbh(+) and rs_thrysq.dwbh=b.dwbh(+) and rs_thrysq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_thrysq.shjl=rs_shjlbm.shjl(+) and rs_thrysq.ztbm=rs_ztbm.ztbm ";
    ls_sql+=wheresql;

    ls_sql+=" and rs_thrysq.ztbm in( ";
	ls_sql+=" select rs_shsq.ztbm ";
	ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
	ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
	ls_sql+=" and rs_ztbm.ztlx='14' and rs_ztbm.ztbm=rs_shsq.ztbm";
    ls_sql+=" ) ";

	ls_sql+=" order by rs_thrysq.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_thrysqSpList.jsp","","","SpRs_thrysq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setEditStr("审批");
//设置显示列
	
	String[] disColName={"sqxh","clzt","ztmc","fgsbh","ygbh","yhmc","bianhao","sfzh","xzzwbm","rzsj","dwbh","yysm","gzbx","wpjjqk","sqrq","lrr","lrsj","lrbm","bz","spxh","shr","shsj","shjlmc","shyj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"sqxh","ztbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量同意"};//按钮的显示名称
	String[] buttonLink={"PlSpRs_thrysq.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_thrysq.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">退回人员申请序号</td>
	<td  width="2%">处理状态</td>
	<td  width="4%">审批状态</td>
	<td  width="3%">所属分公司</td>
	<td  width="2%">员工序号</td>
	<td  width="2%">员工名称</td>
	<td  width="2%">工号</td>
	<td  width="4%">身份证号</td>
	<td  width="3%">行政职务</td>
	<td  width="3%">入职日期</td>
	<td  width="4%">所属部门</td>

	<td  width="10%">退回原因</td>
	<td  width="10%">在职期间工作表现</td>
	<td  width="10%">物品交接情况</td>
	<td  width="3%">申请日期</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="7%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
	<td  width="8%">审核意见</td>
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