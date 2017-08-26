<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jgrq=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String qyrq=null;
String qydm=null;
String ssfgs=null;
String cxhdbm=null;

String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;


String clgw=null;
String ztjjgw=null;
String xmzy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
double jjje=0;
double xcmje=0;
double htze=0;

double jjzjje=0;
double xcmzjje=0;
double zjhze=0;
String qhtr=null;
String qhtsj=null;
String jhazrq=null;
String kjxsj=null;
String htbz=null;
String clztmc=null;
String jjsjs=null;
double jjzkl=0;
String dzyy=null;

String fkje=null;
String sqdj="";
String khjl=null;


String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String zjxxh="";
String jjwjbz="";
int count=0;

try {
	conn=cf.getConnection();


	ls_sql="select count(*) ";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt='00' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！有增减项未完成，不能继续录入新单");
		return;
	}


	ls_sql="select crm_khxx.jjwjbz,jc_jjdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.khjl,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,jc_jjdd.fgsbh";
	ls_sql+=" ,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.lrr,jc_jjdd.lrsj,jc_jjdd.bz,dwmc,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.htze";
	ls_sql+=" ,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.zjhze,jc_jjdd.qhtr,jc_jjdd.qhtsj,jc_jjdd.jhazrq,jc_jjdd.kjxsj,jc_jjdd.htbz,clztmc";
	ls_sql+=" ,jc_jjdd.jjsjs,jc_jjdd.jjzkl,jc_jjdd.dzyy";
	ls_sql+=" from  crm_khxx,jc_jjdd,sq_dwxx,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh and jc_jjdd.khbh=crm_khxx.khbh(+) and  (jc_jjdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qydm=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
		bz=cf.fillNull(rs.getString("bz"));
		jjje=rs.getDouble("jjje");
		xcmje=rs.getDouble("xcmje");
		htze=rs.getDouble("htze");

		jjzjje=rs.getDouble("jjzjje");
		xcmzjje=rs.getDouble("xcmzjje");
		zjhze=rs.getDouble("zjhze");
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		jjzkl=rs.getDouble("jjzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}


	//增减项序号
	ls_sql="select NVL(max(substr(zjxxh,10,2)),0)";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zjxxh=ddbh+cf.addZero(count+1,2);

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
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
	<td  width="6%">序号</td>
	<td  width="10%">处理状态</td>
	<td  width="8%">客户姓名</td>
	<td  width="15%">家具工厂</td>
	<td  width="15%">型材门工厂</td>
	<td  width="14%">增减项原因</td>
	<td  width="12%">增减项总额</td>
	<td  width="10%">发生时间</td>
	<td  width="10%">录入时间</td>
	</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();

		ls_sql="SELECT jc_jjzjx.zjxxh,DECODE(jc_jjzjx.clzt,'00','录入未完成','01','录入完成','02','工厂已确认','04','安装完成','99','退单'),crm_khxx.khxm,pdgcmc,xcmgcmc,mmzjxyymc,jc_jjzjx.zjxze,jc_jjzjx.zjxfssj,jc_jjzjx.lrsj ";
		ls_sql+=" FROM crm_khxx,jc_jjzjx,jdm_mmzjxyybm  ";
		ls_sql+=" where jc_jjzjx.zjxyybm=jdm_mmzjxyybm.mmzjxyybm";
		ls_sql+=" and jc_jjzjx.khbh=crm_khxx.khbh";
		ls_sql+=" and jc_jjzjx.ddbh='"+ddbh+"'";
		ls_sql+=" order by jc_jjzjx.zjxxh";

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
		coluParm.link="/jcjj/jjddcl/zjx/ViewJc_jjzjx.jsp?";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
		
		pageObj.out=out;
		pageObj.getDate(1);
		pageObj.displayDateSum();

	%> 
	</table>
	<%
}
%>


<form method="post" action="" name="insertform" target="_blank">
  <div align="center">请录入家具增减项（增减项序号：<%=zjxxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF">
      <td align="right">客户编号</td>
      <td><%=khbh%></td>
      <td align="right">合同号</td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">客户姓名</td>
      <td><%=khxm%></td>
      <td align="right">参加促销活动</td>
      <td><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">房屋地址</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#CCCCFF">签约店面</td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qydm+"'",qydm,true);
%></td>
      <td align="right">家装设计师</td>
      <td><%=sjs%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">施工队</td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
      <td align="right">班长</td>
      <td><%=sgbz%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">家装签约日期</td>
      <td><%=qyrq%> </td>
      <td align="right">质检</td>
      <td><%=zjxm%></td>
    </tr>
    <tr bgcolor="#CCFFCC">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right"> 签合同时间</td>
      <td><%=qhtsj%></td>
      <td align="right">可减项截止时间</td>
      <td><%=kjxsj%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#CCCCFF">合同备注</td>
      <td colspan="3"><%=htbz%></td>
    </tr>
    <tr bgcolor="#CCFFCC">
      <td align="right">项目专员</td>
      <td><%=xmzy%></td>
      <td align="right">家居设计师</td>
      <td><%=jjsjs%></td>
    </tr>
    <tr bgcolor="#CCFFCC">
      <td align="right">驻店家居顾问</td>
      <td><%=clgw%> </td>
      <td align="right">展厅家居顾问</td>
      <td><%=ztjjgw%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">家具合同金额</td>
      <td><%=jjje %></td>
      <td align="right">家具增减后金额</td>
      <td><%=jjzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">型材门合同金额</td>
      <td><%=xcmje %></td>
      <td align="right">型材门增减后金额</td>
      <td><%=xcmzjje%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">合同总额</td>
      <td><%=htze%></td>
      <td align="right">增减后总额</td>
      <td><%=zjhze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>增减项折扣</td>
      <td><input type="text" name="jjzkl" size="8" maxlength="8" value="<%=jjzkl%>" readonly>
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>增减项发生时间</td>
      <td><input type="text" name="zjxfssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">增减项打折原因</td>
      <td colspan="3"><textarea name="dzyy" cols="72" rows="2" readonly><%=dzyy%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#FF0033">*</font>增减项原因</td>
      <td width="31%"> 
        <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm","");
%> 
      </select>      </td>
      <td width="19%" align="right">计划安装时间</td>
      <td width="31%"> 
        <input type="text" name="jhazsj" value="<%=jhazrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">录入人</font></td>
      <td width="31%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">录入部门</font></td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
      </select>      </td>
      <td width="19%" align="right"><span class="STYLE1">订单目前状态</span></td>
      <td width="31%"><%=clztmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" height="2">备注</td>
      <td colspan="3" height="2"> 
        <textarea name="bz" cols="72" rows="2"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4" > 
			<table width="100%" border="0">
            <tr>
              <td colspan="3" align="center"><input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="完成" onClick="f_end(insertform)" name="wc" disabled>
				
				<input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
				<input type="hidden" name="qddm" value="<%=qydm%>" >
				<input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="hidden" name="khjl" value="<%=khjl%>" >
				<input type="hidden" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="8">
				<input type="hidden" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" >
				<input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >			  </td>
              </tr>
            <tr>
              <td width="37%" align="right"><input type="button"  value="柜体减项--" onClick="f_gtjx(insertform)" name="gtjx" disabled></td>
              <td width="26%" align="center"><input type="button"  value="柜体增项++" onClick="f_gtzx(insertform)" name="gtzx" disabled></td>
              <td width="37%"><input type="button"  value="柜体--增减明细" onClick="f_gtmx(insertform)" name="gtmx" disabled></td>
            </tr>
            <tr>
              <td align="right"><input type="button"  value="  型材门减项--  " onClick="f_xcmjx(insertform)" name="xcmjx" disabled></td>
              <td align="center"><input type="button"  value="型材门增项++" onClick="f_xcmzx(insertform)" name="xcmzx" disabled></td>
              <td><input type="button"  value="型材门增减明细" onClick="f_xcmmx(insertform)" name="xcmmx" disabled></td>
            </tr>
            <tr>
              <td align="right"><input type="button"  value="成品家具--增减已有项" onClick="f_cpjjjx(insertform)" name="cpjjjx" disabled></td>
              <td align="center"><input type="button"  value="成品家具--增加新项" onClick="f_cpjjzx(insertform)" name="cpjjzx" disabled></td>
              <td><input type="button"  value="成品家具--增减项明细" onClick="f_cpjjmx(insertform)" name="cpjjmx" disabled></td>
            </tr>
        </table>
      </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zjxyybm)=="") {
		alert("请选择[增减项原因]！");
		FormName.zjxyybm.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazsj, "计划安装时间"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "增减项发生时间"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjzkl)=="") {
		alert("请选择[增减项折扣]！");
		FormName.jjzkl.focus();
		return false;
	}

	if(!(isFloat(FormName.jjzkl, "增减项折扣"))) {
		return false;
	}
	if (FormName.jjzkl.value<=0 || FormName.jjzkl.value>10)
	{
		alert("错误！[增减项折扣]应该在0和10之间！");
		FormName.jjzkl.select();
		return false;
	}
	if (FormName.jjzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_jjzjx.jsp";
	FormName.submit();
	FormName.wc.disabled=false;
	FormName.gtjx.disabled=false;
	FormName.gtzx.disabled=false;
	FormName.gtmx.disabled=false;
	FormName.xcmjx.disabled=false;
	FormName.xcmzx.disabled=false;
	FormName.xcmmx.disabled=false;
	FormName.cpjjjx.disabled=false;
	FormName.cpjjzx.disabled=false;
	FormName.cpjjmx.disabled=false;
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="EndJc_jjzjx.jsp";
	FormName.submit();
	return true;
}

function f_gtjx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	
	FormName.action="Jc_jjgtmxJxList.jsp";
	FormName.submit();
	return true;
}
function f_gtzx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="InsertJc_jjgtmx.jsp";
	FormName.submit();
	return true;
}
function f_gtmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="Jc_jjgtZjxList.jsp";
	FormName.submit();
	return true;
}

function f_xcmjx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	
	FormName.action="Jc_jjxcmmxJxList.jsp";
	FormName.submit();
	return true;
}
function f_xcmzx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="InsertJc_jjxcmmxMain.jsp";
	FormName.submit();
	return true;
}
function f_xcmmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="Jc_jjxcmZjxList.jsp";
	FormName.submit();
	return true;
}


function f_cpjjjx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	
	FormName.action="Jc_cpjjddmxJxList.jsp";
	FormName.submit();
	return true;
}
function f_cpjjzx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="InsertJc_cpjjddmxMain.jsp";
	FormName.submit();
	return true;
}
function f_cpjjmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}

	FormName.action="Jc_cpjjZjxList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
