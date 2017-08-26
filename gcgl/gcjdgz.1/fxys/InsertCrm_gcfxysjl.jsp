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

String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String gj=null;
String dd=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String pdclzt=null;
String kgsjqd=null;
String fgsbh=null;
String sybgcrq=null;
String szqsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ysjlh=null;

try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,crm_khxx.dwbh,dwmc,sgd,sgbz,zjxm,gj,dd,pdclzt,kgsjqd,fgsbh,sybgcrq,szqsj";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(ysjlh,8,3)),0)";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ysjlh=khbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<form method="post" action="SaveInsertCrm_gcfxysjl.jsp" name="insertform" target="_blank">
<div align="center">分项验收－登记（验收记录号：<%=ysjlh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">验收记录号</td>
	<td  width="6%">照片数</td>
	<td  width="34%">验收项目</td>
	<td  width="10%">验收时间</td>
	<td  width="8%">验收人</td>
	<td  width="8%">验收结果</td>
	<td  width="8%">验收得分</td>
	<td  width="8%">发生整改</td>
	<td  width="8%">客户签字</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_gcfxysjl.ysjlh,zpsl,gcysxmmc,crm_gcfxysjl.yssj,crm_gcfxysjl.ysr,DECODE(crm_gcfxysjl.ysjg,'1','合格','2','不合格'),crm_gcfxysjl.ysdf,DECODE(crm_gcfxysjl.sffszg,'1','是','2','否'),DECODE(crm_gcfxysjl.sfkhbrqz,'Y','是','N','否') ";
	ls_sql+=" FROM crm_gcfxysjl  ";
    ls_sql+=" where crm_gcfxysjl.khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_gcfxysjl.ysjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="30%"> <%=khxm%></td>
              <td width="19%" align="right"> 
                合同号              </td>
              <td width="32%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">房屋地址</td>
              <td width="30%"><%=fwdz%></td>
              <td width="19%" align="right">工程担当</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                签约店面              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="19%" align="right"> 
                设计师              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                签约日期              </td>
              <td width="30%"><%=qyrq%> </td>
              <td width="19%" align="right"> 
                工程签约额              </td>
              <td width="32%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                施工队              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="19%" align="right"> 
                班长              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">管家</td>
              <td><%=gj%></td>
              <td align="right">调度</td>
              <td><%=dd%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">合同开工日期</td>
              <td width="30%"><font color="#000000"><%=kgrq%></font></td>
              <td width="19%" align="right">合同竣工日期</td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">实际开工日期</td>
              <td width="30%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="19%" align="right">实际竣工日期</td>
              <td width="32%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">隐蔽工程完成日期</td>
              <td width="30%"><font color="#000000"><%=sybgcrq%></font></td>
              <td width="19%" align="right">中期验收日期</td>
              <td width="32%"><font color="#000000"><%=szqsj%></font></td>
            </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>验收项目分类</td> 
  <td width="30%"> 
    <select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeYsxmflbm(insertform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>验收项目</td> 
  <td colspan="3"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
    <option value="">请首先选择【验收项目分类】</option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>验收人</td>
  <td><input type="text" name="ysr" value="<%=zjxm%>" size="20" maxlength="20" ></td>
  <td align="right"><font color="#FF0000">*</font>验收时间</td>
  <td><input type="text" name="yssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>验收结果</td>
  <td>
	<input type="radio" name="ysjg"  value="1">合格
	<input type="radio" name="ysjg"  value="2">不合格  </td>
  <td align="right"><font color="#FF0000">*</font>验收得分</td>
  <td><input type="text" name="ysdf" value="" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否发生整改</td>
  <td><input type="radio" name="sffszg"  value="2">
    否
      <input type="radio" name="sffszg"  value="1">
      是</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否客户本人签字</td>
  <td><input type="radio" name="sfkhbrqz"  value="Y">
    是
    <input type="radio" name="sfkhbrqz"  value="N">
    否 </td>
  <td align="right">代签字是否有授权</td>
  <td><input type="radio" name="dqzysq"  value="Y">
    有
    <input type="radio" name="dqzysq"  value="N">
    无授权 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">验收说明</td> 
  <td colspan="3"><textarea name="yssm" cols="72" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font> </td> 
  <td width="30%"> 
	  <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font> </td> 
  <td width="32%"> 
	  <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font> </td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
	<input type="button"  value="上传照片" onClick="f_lr(insertform)" name="lr" disabled>
    <input type="button"  value="查看照片" onClick="f_ck(insertform)" name="ck" disabled>
	<input name="cl" type="button" onClick="f_new(insertform)"  value="录入下一笔" disabled>
    <input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


function changeYsxmflbm(FormName) 
{
	FormName.gcysxmbm.length=1;

	if (FormName.ysxmflbm.value=="")
	{
		return;
	}

	var sql;
	sql="select gcysxmbm,gcysxmmc||DECODE(sfhf,'Y','（需回访）','N','') from dm_gcysxm where ysxmflbm='"+FormName.ysxmflbm.value+"' order by gcysxmbm";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.gcysxmbm,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("请选择[验收项目分类]！");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	FormName.gcysxmbm.value=="") {
		alert("请选择[验收项目]！");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("请输入[验收人]！");
		FormName.ysr.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("请输入[验收时间]！");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "验收时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.ysjg)) {
		alert("请选择[验收结果]！");
		FormName.ysjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ysdf)=="") {
		alert("请输入[验收得分]！");
		FormName.ysdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysdf, "验收得分"))) {
		return false;
	}


	if(	!radioChecked(FormName.sffszg)) {
		alert("请选择[是否发生整改]！");
		FormName.sffszg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkhbrqz)) {
		alert("请选择[是否客户本人签字]！");
		FormName.sfkhbrqz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkhbrqz)) {
		alert("请选择[是否客户本人签字]！");
		FormName.sfkhbrqz[0].focus();
		return false;
	}

	if (FormName.sfkhbrqz[1].checked)
	{
		if(	!radioChecked(FormName.dqzysq)) {
			alert("请选择[代签字是否有授权]！");
			FormName.dqzysq[0].focus();
			return false;
		}
	}
	else{
		FormName.dqzysq[0].checked=false;
		FormName.dqzysq[1].checked=false;
	}

	if (FormName.ysjg[1].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("验收结果不合格，请输入[验收说明]！");
			FormName.yssm.focus();
			return false;
		}
	}
	if (FormName.sffszg[1].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("发生整改，请输入[验收说明]！");
			FormName.yssm.focus();
			return false;
		}
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	
	FormName.action="SaveInsertCrm_gcfxysjl.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	FormName.cl.disabled=false;
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_new(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_gcfxysjl.jsp";
	FormName.target="";
	FormName.submit();

	FormName.bc.disabled=false;
	FormName.lr.disabled=true;
	FormName.ck.disabled=true;
	FormName.cl.disabled=true;
	return true;
}

//-->
</SCRIPT>
