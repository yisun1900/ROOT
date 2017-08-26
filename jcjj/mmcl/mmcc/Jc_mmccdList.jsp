<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_mmccd.xh xh,mmdglxmc,mlxmc,DECODE(jc_mmccd.dsk,'1','单口','2','双口') dsk,jc_mmccd.mmxh,mmczmc,czmc,azwzmc,kqfxmc,TO_CHAR(jc_mmccd.tjx) tjx,jc_blbj.blxh, DECODE(jc_mmccd.ctbs,'3','三边','4','四边') ctbs,dczlmc,TO_CHAR(jc_mmccd.dbh) dbh,jc_mmccd.mdk||'×'||jc_mmccd.mdg||'×'||jc_mmccd.qh md ,jc_mmccd.msk||'×'||jc_mmccd.msg ms,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,jc_mmccd.sl,TO_CHAR(jc_mmccd.dj) dj,sl*dj zj,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmccd.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmccd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb  ";
    ls_sql+=" where jc_mmccd.blxhbm=jc_blbj.blxhbm(+) and jc_mmccd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmccd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmccd.czbm=dm_czbm.czbm(+) and jc_mmccd.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmccd.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmccd.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmccd.mmxh=jc_mmxhb.mmxh(+) and jc_mmccd.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmccd.mlx=jdm_mlx.mlx(+) and jc_mmccd.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_blbj.dqbm(+)='"+dqbm+"' and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmccd.xh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmccdList.jsp?yddbh="+yddbh,"","","EditJc_mmccdMain.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"mmdglxmc","mlxmc","mmxh","dsk","mmczmc","czmc","azwzmc","kqfxmc","dczlmc","dbh","md","ms","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","dj","zj","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_mmccdList.jsp?yddbh="+yddbh};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from jc_mmccd where "+chooseitem;
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
  <B><font size="3">木门初测单（单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(145);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="3%">单双口</td>
	<td  width="7%">油色</td>
	<td  width="3%">材质</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">地材种类</td>
	<td  width="3%">地材厚</td>
	<td  width="7%">门洞宽×高×墙厚</td>
	<td  width="5%">门扇宽×高</td>
	<td  width="3%">踢脚线/欧式上帽</td>
	<td  width="7%">玻璃型号</td>
	<td  width="4%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="4%">是否有顶窗</td>
	<td  width="3%">订购数量</td>
	<td  width="3%">单价</td>
	<td  width="4%">总价</td>
	<td  width="6%">照片</td>
	<td  width="10%">备注</td>
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