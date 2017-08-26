<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String pdclzt=null;
String kgsjqd=null;
String fgsbh=null;
String jhybgcrq=null;
String jhzqsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String djjlh=null;
String hfcsbz=null;
String hfcsbzStr="";

try {
	conn=cf.getConnection();
	ls_sql="select jhybgcrq,jhzqsj,crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm,pdclzt,kgsjqd,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jhybgcrq=cf.fillNull(rs.getDate("jhybgcrq"));
		jhzqsj=cf.fillNull(rs.getDate("jhzqsj"));
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
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	if (sjkgrq==null || sjkgrq.equals(""))
	{
		out.println("错误！未进行[开工登记]，不能进行[隐蔽工程验收登记]");
		return;
	}

	String hfsjzdsz="00000";
	ls_sql="SELECT hfsjzdsz";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
	}
	else{
		out.println("错误！单位信息表中，没有设置回访参数");
		return;
	}
	rs.close();
	ps.close();
	if (hfsjzdsz.length()!=5)
	{
		out.println("单位信息表中回访参数设置不正确，要求5位："+hfsjzdsz);
		return;
	}

	hfcsbz=hfsjzdsz.substring(1,2);
	if (hfcsbz.equals("1"))
	{
		hfcsbzStr="<B><font color=\"#CC0000\">（自动设置客服回访）</font></B>";
	}

	int count=0;
	ls_sql="select NVL(max(substr(djjlh,8,3)),0)";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	djjlh=khbh+cf.addZero(count+1,3);
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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">隐蔽工程完成登记（登记记录号：<%=djjlh%>）<%=hfcsbzStr%></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">登记记录号</td>
	<td  width="6%">照片数</td>
	<td  width="9%">工程进度</td>
	<td  width="8%">工程进度完成日期</td>
	<td  width="5%">是否设置回访</td>
	<td  width="8%">回访设置记录号</td>

	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="32%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_gcjddjjl.djjlh,crm_gcjddjjl.zpsl,dm_gcjdbm.ysgcjdmc,crm_gcjddjjl.djsj,DECODE(crm_gcjddjjl.sfszhf,'1','设置','0','不设置'),crm_gcjddjjl.hfszjlh,crm_gcjddjjl.lrr,crm_gcjddjjl.lrsj,sq_dwxx.dwmc,crm_gcjddjjl.bz ";
	ls_sql+=" FROM crm_gcjddjjl,dm_gcjdbm,sq_dwxx  ";
    ls_sql+=" where crm_gcjddjjl.gcjdbm=dm_gcjdbm.gcjdbm and crm_gcjddjjl.lrdw=sq_dwxx.dwbh ";
    ls_sql+=" and crm_gcjddjjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gcjddjjl.djjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();


%>
</table>

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> <%=khxm%></td>
              <td width="18%" align="right"> 
                合同号              </td>
              <td width="32%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><%=fwdz%></td>
              <td width="18%" align="right">工程担当</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                签约店面              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%" align="right"> 
                设计师              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                签约日期              </td>
              <td width="32%"><%=qyrq%> </td>
              <td width="18%" align="right"> 
                工程签约额              </td>
              <td width="32%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                施工队              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%" align="right"> 
                班长              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">合同开工日期</td>
              <td width="32%"><font color="#000000"><%=kgrq%></font></td>
              <td width="18%" align="right">合同竣工日期</td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">实际开工日期</td>
              <td width="32%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="18%" align="right">实际竣工日期</td>
              <td width="32%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">计划隐蔽工程验收</span></td>
              <td><span class="STYLE1"><%=jhybgcrq%></span></td>
              <td align="right"><span class="STYLE1">计划中期验收时间</span></td>
              <td><span class="STYLE1"><%=jhzqsj%></span></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>工程进度              </td>
              <td width="32%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm where gcjdbm='6' order by gcjdbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font>隐蔽工程完成时间              </td>
              <td width="32%"> 
              <input type="text" name="djsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000CC">录入人</font> </td>
              <td width="32%"> 
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000CC">录入时间</font> </td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000CC">录入单位</font></td>
              <td width="32%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw);
%> 
              </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="4"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="djjlh" value="<%=djjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="hfcsbz" value="<%=hfcsbz%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="上传照片" onClick="f_lr(insertform)" name="lr" disabled>
                <input type="button"  value="查看照片" onClick="f_ck(insertform)" name="ck" disabled>
                <input type="button"  value="录入施工队处罚" onClick="f_lrcf(insertform)" name="lrcf" disabled>
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("请选择[工程进度]！");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.djsj)=="") {
		alert("请输入[隐蔽工程完成时间]！");
		FormName.djsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.djsj, "隐蔽工程完成时间"))) {
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_gcjddjjl.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	FormName.lrcf.disabled=false;
	return true;
}
function f_lrcl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="InsertCrm_cljcmx.jsp";
	FormName.submit();
	return true;
}

function f_ckcl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="Crm_cljcmxList.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="/gcgl/gcjdgz/loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="/gcgl/gcjdgz/viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_lrcf(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}

	FormName.action="/sgdgl/xjgd/InsertKp_xjgdjl.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

