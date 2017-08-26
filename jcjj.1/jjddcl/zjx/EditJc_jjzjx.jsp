<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改增减项</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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


String ddbh=null;
String zjxyybm=null;
String jhazsj=null;
String zjxlrr=null;
String zjxlrsj=null;
String zjxbz=null;
String zjxfssj=null;

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

String fkje=null;
String sqdj="";

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="select ddbh,zjxyybm,jhazsj,lrr,lrsj,bz,zjxfssj ";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxyybm=cf.fillNull(rs.getString("zjxyybm"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		zjxlrr=cf.fillNull(rs.getString("lrr"));
		zjxlrsj=cf.fillNull(rs.getDate("lrsj"));
		zjxbz=cf.fillNull(rs.getString("bz"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
	}
	rs.close();
	ps.close();

	ls_sql="select jc_jjdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.jgrq,crm_khxx.sgd,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.dwbh,cxhdbm,jc_jjdd.fgsbh";
	ls_sql+=" ,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.lrr,jc_jjdd.lrsj,jc_jjdd.bz,dwmc,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.htze";
	ls_sql+=" ,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.zjhze,jc_jjdd.qhtr,jc_jjdd.qhtsj,jc_jjdd.jhazrq,jc_jjdd.kjxsj,jc_jjdd.htbz,clztmc";
	ls_sql+=" from  crm_khxx,jc_jjdd,sq_dwxx,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh and jc_jjdd.khbh=crm_khxx.khbh(+) and  (jc_jjdd.ddbh='"+ddbh+"')  ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
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
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+qydm+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


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
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">修改家具增减项（增减项序号：<%=zjxxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">客户编号</td>
      <td width="29%"><%=khbh%></td>
      <td width="19%" align="right">合同号</td>
      <td width="31%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">客户姓名</td>
      <td width="29%"><%=khxm%>（<%=lxfs%>） </td>
      <td width="19%" align="right">参加促销活动</td>
      <td width="31%"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">房屋地址</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right" bgcolor="#CCCCFF">签约店面</td>
      <td width="29%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qydm+"'",qydm,true);
%></td>
      <td width="19%" align="right">家装设计师</td>
      <td width="31%"><%=sjs%>（<%=sjsdh%>）</td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">施工队</td>
      <td width="29%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> （<%=dzdh%>） </td>
      <td width="19%" align="right">班长</td>
      <td width="31%"><%=sgbz%>（<%=bzdh%>） </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">家装签约日期</td>
      <td width="29%"><%=qyrq%> </td>
      <td width="19%" align="right">质检</td>
      <td width="31%"><%=zjxm%>（<%=zjdh%>） </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="21%" align="right">合同开工日期</td>
      <td width="29%"><%=kgrq%> </td>
      <td width="19%" align="right">合同竣工日期</td>
      <td width="31%"><%=jgrq%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">项目专员</td>
      <td><%=xmzy%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">驻店家居顾问</td>
      <td><%=clgw%> </td>
      <td align="right">展厅家居顾问</td>
      <td><%=ztjjgw%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right" bgcolor="#CCFFCC">录入人</td>
      <td><%=lrr%> </td>
      <td align="right">录入时间</td>
      <td><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">录入部门</td>
      <td><%=lrbm%></td>
      <td align="right"></td>
      <td></td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right">备注</td>
      <td colspan="3"><%=bz%></td>
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
    <tr bgcolor="#CCCCFF"> 
      <td align="right"> 签合同时间</td>
      <td><%=qhtsj%></td>
      <td align="right">签合同人</td>
      <td><%=qhtr%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right">计划安装日期</td>
      <td><%=jhazrq%></td>
      <td align="right">可减项截止时间</td>
      <td><%=kjxsj%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" bgcolor="#CCCCFF">合同备注</td>
      <td colspan="3"><%=htbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0033">*</font>增减项原因</td>
      <td width="31%"> 
        <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm",zjxyybm);
%> 
        </select>
      </td>
      <td align="right" width="17%">计划安装时间</td>
      <td width="33%"> 
        <input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jhazsj%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%"><font color="#FF0000">*</font>增减项发生时间</td>
      <td width="31%">
        <input type="text" name="zjxfssj" value="<%=zjxfssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0033">*</font><font color="#0000FF">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=zjxlrr%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#FF0033">*</font><font color="#0000FF">录入时间</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=zjxlrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"><%=zjxbz%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4" >
        
        <table width="100%" border="0">
          <tr>
            <td colspan="3" align="center"><input type="hidden" name="zjxxh" value="<%=zjxxh%>" size="20" >
              <input type="hidden" name="ddbh" value="<%=ddbh%>" size="20" >
              <input type="hidden" name="khbh" value="<%=khbh%>" size="20" >
              <input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
              <input type="reset"  value="重输" name="reset">
              <input type="button"  value="完成" onClick="f_end(insertform)" name="wc" ></td>
          </tr>
          <tr>
            <td width="40%" align="right"><input type="button"  value="柜体减项--" onClick="f_gtjx(insertform)" name="gtjx" ></td>
            <td width="20%" align="center"><input type="button"  value="柜体增项++" onClick="f_gtzx(insertform)" name="gtzx" ></td>
            <td width="40%"><input type="button"  value="柜体--增减明细" onClick="f_gtmx(insertform)" name="gtmx" ></td>
          </tr>
          <tr>
            <td align="right"><input type="button"  value="型材门减项" onClick="f_xcmjx(insertform)" name="xcmjx" ></td>
            <td align="center"><input type="button"  value="型材门增项" onClick="f_xcmzx(insertform)" name="xcmzx" ></td>
            <td><input type="button"  value="型材门增减明细" onClick="f_xcmmx(insertform)" name="xcmmx" ></td>
          </tr>
          <tr>
            <td align="right"><input type="button"  value="成品家具--增减已有项" onClick="f_cpjjjx(insertform)" name="cpjjjx" ></td>
            <td align="center"><input type="button"  value="成品家具--增加新项" onClick="f_cpjjzx(insertform)" name="cpjjzx" ></td>
            <td><input type="button"  value="成品家具--增减项明细" onClick="f_cpjjmx(insertform)" name="cpjjmx" ></td>
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
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
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

	FormName.action="SaveEditJc_jjzjx.jsp";
	FormName.submit();
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
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
