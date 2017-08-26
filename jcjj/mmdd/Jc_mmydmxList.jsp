<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_mmydmx.xh xh,mmdglxmc,mlxmc,jc_mmydmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,jc_blbj.blxh, DECODE(jc_mmydmx.ctbs,'3','三边','4','四边') ctbs,dczlmc,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,jc_mmydmx.sl,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmydmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmydmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm  ";
    ls_sql+=" where jc_mmydmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmydmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmydmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmydmx.czbm=dm_czbm.czbm(+) and jc_mmydmx.ysbm=jdm_mmczbm.mmczbm(+)";
	ls_sql+=" and jc_mmydmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmydmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmydmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmydmx.blxhbm=jc_blbj.blxhbm(+)";
    ls_sql+=" and  jc_mmydmx.mlx=jdm_mlx.mlx(+) and jc_mmydmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmydmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmydmxList.jsp?yddbh="+yddbh,"","","EditJc_mmydmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","blxh","ctbs","dczlmc","sfsmjcc","sfydc","sl","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_mmydmxList.jsp?yddbh="+yddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_mmydmx where "+chooseitem;

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
  <B><font size="3">木门预订单（单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(115);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="4%">木门型号</td>
	<td  width="9%">油色</td>
	<td  width="4%">材质</td>
	<td  width="5%">安装位置</td>
	<td  width="5%">开启方向</td>
	<td  width="10%">玻璃型号</td>
	<td  width="5%">窗套边数</td>
	<td  width="4%">地材</td>
	<td  width="7%">门套/哑口材质</td>
	<td  width="4%">是否有顶窗</td>
	<td  width="4%">订购数量</td>
	<td  width="7%">照片</td>
	<td  width="16%">备注</td>
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