<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrdw=(String)session.getAttribute("dwbh");

String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;

String zjxxh=null;
String dqbm=null;
String jzbz=null;
String zjxwcbz=null;
double wdzgce=0;
String qye=null;
double zjxje=0;
double zhzjxje=0;
double zkl=0;
double kglf=0;
double kqtk=0;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String oldgckkspbz=null;
String newzjxxh=null;
String gcjdbm=null;
String gdjsjd="";
String sjsjsbz="";

int count=0;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_khxx.sjsjsbz,crm_khxx.gdjsjd,crm_khxx.gckkspbz,crm_khxx.gcjdbm,khbh,hth,khxm,fwdz,lxfs,dwbh,sgd,zjxm,sgbz,sjs,qyrq,jzbz,zjxwcbz,wdzgce,qye,zkl,zjxje,kglf,kqtk,zhzjxje,zjxxh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		oldgckkspbz=cf.fillNull(rs.getString("gckkspbz"));//工程扣款审批标志
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jzbz=rs.getString("jzbz");
		zjxwcbz=rs.getString("zjxwcbz");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getString("qye");
		zkl=rs.getDouble("zkl");
		zjxje=rs.getDouble("zjxje");
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	rs.close();

	if (oldgckkspbz.equals("Y"))//N：未审批；Y：已审批
	{
		out.println("错误！工程扣款已审批，不能再修改");
		return;
	}
	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再修改");
		return;
	}
	if (sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		out.println("错误！设计师已结算，不能再修改");
		return;
	}
	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！施工队已结算，不能再修改");
		return;
	}


	if (zjxwcbz.equals("2"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("错误！[增减项]已完成，不能再[录入增减项]，请到【维护】中去修改");
		window.location="/jsgl/khjs/EditCrm_zjxdj.jsp?zjxxh=<%=newzjxxh%>";
		//-->
		</SCRIPT>
		<%
		return;
	}

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();

	//获取最新电子报价++++++++++++++++
	double dzbj=0;
	//初始化
	dzbj.Dzbj getdzbj=new dzbj.Dzbj();
	//获取电子报价金额
	if (newzjxxh.equals(""))
	{
		dzbj=getdzbj.getBjje(conn,khbh,"hd");
	}
	else{
		dzbj=getdzbj.getZjxHBjje(conn,khbh,newzjxxh,"hd");
	}

	if ((int)(wdzgce+zjxje)!=(int)dzbj)
	{
		out.println("<font color='#FF0033' SIZE=2px><strong>提醒！【工程原报价＋累计增减项＝"+cf.formatDouble(wdzgce+zjxje)+"】不等于【电子报价总额:"+cf.formatDouble(dzbj)+"】<BR>如果修改报价明细，则系统自动计算【增减项金额】，此时需注意【系统计算增减项金额】是否正确</strong></font>");
	}


	//增减项序号
	ls_sql="select NVL(max(substr(zjxxh,8,2)),0)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	
	zjxxh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">增减项序号</td>
	<td  width="5%">发生阶段</td>
	<td  width="7%">折前增减项发生额</td>
	<td  width="5%">扣管理费</td>
	<td  width="5%">扣其它款</td>
	<td  width="7%">折后增减项发生额</td>
	<td  width="6%">发生时间</td>
	<td  width="5%">录入人</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT  crm_zjxdj.zjxxh,zjxfsjdmc,crm_zjxdj.zjje,crm_zjxdj.kglf,crm_zjxdj.kqtk,crm_zjxdj.jzjje,fssj,crm_zjxdj.lrr";
	ls_sql+=" FROM crm_zjxdj,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
}
%> 
</table>
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">请录入结算信息（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">合同号</font></div>
              </td>
              <td width="33%"> <%=hth%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="31%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td width="33%"><%=fwdz%></td>
              <td width="19%" align="right"><font color="#0000CC">质检</font></td>
              <td width="31%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">电话</font></div>
              </td>
              <td width="33%"> <%=lxfs%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="31%"><%=qyrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%></td>
              <td width="19%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="31%"><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000FF">施工队</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,false);
%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="31%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">折扣</font></td>
              <td width="33%"><%=zkl%></td>
              <td align="right" width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">工程原报价</font></td>
              <td width="33%"><%=wdzgce%></td>
              <td align="right" width="19%"><font color="#0000CC">工程签约额</font></td>
              <td width="31%"><%=qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">折前累计工程增减项</font></td>
              <td width="33%"><%=zjxje%></td>
              <td align="right" width="19%"><font color="#0000CC">折后累计工程增减项</font></td>
              <td width="31%"><%=zhzjxje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#0000CC">累计减项管理费</font></td>
              <td width="33%"><%=kglf%></td>
              <td align="right" width="19%"><font color="#0000CC">累计减项扣其它款</font></td>
              <td width="31%"><%=kqtk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>增减项发生阶段</td>
              <td width="33%"> 
                <select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%> 
                </select>
              </td>
              <td align="right" width="19%"><font color="#FF0000">*</font>增减项发生时间</td>
              <td width="31%"> 
                <input type="text" name="fssj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000FF">折前增减项发生额</font></td>
              <td width="33%"> 
                <input type="text" name="zjje" value="0" size="10" maxlength="17" onChange="f_jzjje(insertform)" readonly>
                <font color="#CC0066"><strong>增项为正，减项为负</strong></font> </td>
              <td rowspan="6" align="right" width="19%"><font color="#FF0000">*</font>增减项原因 
                <div align="right"></div>
                <div align="right"></div>
              </td>
              <td rowspan="6" width="31%"> 
                <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000FF">折后增减项发生额</font></td>
              <td width="33%"> 
                <input type="text" name="jzjje" value="0" size="10" maxlength="17" readonly>
                <font color="#CC0066">增减项发生额×</font><font color="#0000CC">折扣</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>减项扣管理费</td>
              <td width="33%"> 
                <input type="text" name="kglf" value="0" size="10" maxlength="17" >
                <font color="#CC0066"><strong>为正数</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>减项扣其它款</td>
              <td width="33%"> 
                <input type="text" name="kqtk" value="0" size="10" maxlength="17" >
                <font color="#CC0066"><strong>为正数</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="17%"><font color="#FF0000">*</font>增减项完成标志</td>
              <td width="33%"> 
                <input type="radio" name="zjxwcbz" value="2" checked>
                已完成</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>工程扣款</td>
              <td width="33%">
                <input type="text" name="gckk" size="20" maxlength="17" value="0" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>结算说明</td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="74" rows="4"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="lrdw" value="<%=lrdw%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="17" readonly>
                <input type="button"  value="保存" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="增加房间" onClick="f_lrfj(insertform)" name="zjfj" disabled>
                <input type="button"  value="修改房间" onClick="f_xgfj(insertform)" name="xgfj" disabled>
                <input type="button"  value="预览结算书" onClick="f_dybj(insertform)" name="ck" disabled>
                <input type="reset"  value="重输">
                <P> 
                  <input type="button"  value="选择报价项目" onClick="f_xzxm(insertform)" name="lr" disabled>
                  <input type="button"  value="调项目顺序" onClick="f_xmpx(insertform)" name="xmpx" disabled>
                  <input type="button"  value="选其它收费" onClick="f_ewlr(insertform)" name="ewlr" disabled>
                  <input type="button"  value="修改其它收费" onClick="f_ewck(insertform)" name="xgsf" disabled>
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jzjje(FormName)//参数FormName:Form的名称
{
	var jzjje=FormName.zjje.value*<%=zkl%>/10;
	jzjje=round(jzjje,2);
	FormName.jzjje.value=jzjje;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jzjje(FormName);

	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请选择[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxfsjd)=="") {
		alert("请输入[增减项发生阶段]！");
		FormName.zjxfsjd.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "增减项发生时间"))) {
		return false;
	}
	if(	!selectChecked(FormName.zjxyybm)) {
		alert("请输入[增减项原因]！");
		FormName.zjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("请选择[增减项发生额]！");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "增减项发生额"))) {
		return false;
	}
	if(	javaTrim(FormName.kglf)=="") {
		alert("请选择[扣管理费]！");
		FormName.kglf.focus();
		return false;
	}
	if(!(isFloat(FormName.kglf, "扣管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") 
	{
		alert("请选择[扣其它款]！");
		FormName.kqtk.focus();
		return false;
	}

	if(!(isFloat(FormName.kqtk, "扣其它款"))) 
	{
		return false;
	}

	if(	javaTrim(FormName.jzjje)=="") {
		alert("请选择[折后增减项发生额]！");
		FormName.jzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jzjje, "折后增减项发生额"))) {
		return false;
	}
	if(!FormName.zjxwcbz.checked) {
		alert("请输入[增减项完成标志]！");
		FormName.zjxwcbz.focus();
		return false;
	}
	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.select();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxyysm)=="") {
		alert("请输入[增减项说明]！");
		FormName.zjxyysm.focus();
		return false;
	}
	FormName.action="SaveInsertCrm_zjxdj.jsp";
	FormName.submit();

	FormName.zjfj.disabled=false;
	FormName.xgfj.disabled=false;
	FormName.lr.disabled=false;
	FormName.xmpx.disabled=false;
	FormName.ewlr.disabled=false;
	FormName.xgsf.disabled=false;
	FormName.ck.disabled=false;

	return true;
}
function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}
function f_xzxm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}

	FormName.submit();
	return true;
}
function f_dybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxJsList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_khbjmxJsList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	FormName.submit();
	return true;
}

function f_xmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=wherekhbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("/gcgl/zjx/gzdzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=wherekhbh%>",900,600,'YES',"NO");
	}
}

//-->
</SCRIPT>
