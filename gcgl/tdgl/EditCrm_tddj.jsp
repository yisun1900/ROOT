<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String khxm=null;
String fwdz=null;
String dh=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String tdyybm=null;
String tdyysm=null;
String sffj=null;
String sfyrz=null;
String ytje=null;
String stje=null;
String lrdw=null;
String lrr=null;
String lrsj=null;
String bz=null;
String qye=null;
String qyrq=null;
String sfthlp=null;
String tdsj=null;
String wheretdxh=cf.GB2Uni(request.getParameter("tdxh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

int sflqlp=0;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select tdsj,khbh,khxm,fwdz,dh,sjs,zjxm,sgd,sgbz,dwbh,tdyybm,tdyysm,sffj,sfyrz,ytje,stje,lrdw,lrr,lrsj,bz,sfthlp ";
	ls_sql+=" from  crm_tddj";
	ls_sql+=" where  (tdxh='"+wheretdxh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		dh=cf.fillNull(rs.getString("dh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		tdyybm=cf.fillNull(rs.getString("tdyybm"));
		tdyysm=cf.fillNull(rs.getString("tdyysm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		ytje=cf.fillNull(rs.getString("ytje"));
		stje=cf.fillNull(rs.getString("stje"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sfthlp=cf.fillNull(rs.getString("sfthlp"));
	}
	rs.close();

	ls_sql="select qye,qyrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();

	ls_sql="select count(*)";
	ls_sql+=" from  yx_lqlpdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sflqlp=rs.getInt(1);
	}
	rs.close();
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改退单信息（退单序号：<%=wheretdxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<%
if (sflqlp>0)
{
	%>
	<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=120 >
	<b><font color='#0000CC' class='3dfont' size='2' >请注意:该客户领取过礼品</font></b></marquee>

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%">客户姓名</td>
		<td  width="22%">礼品名称</td>
		<td  width="8%">礼品数量</td>
		<td  width="10%">领取时间</td>
		<td  width="8%">是否退回</td>
		<td  width="10%">退回登记人</td>
		<td  width="10%">退回时间</td>
		<td  width="22%">备注</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT crm_khxx.khxm,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','领取','2','退回'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,yx_lqlpdj.bz";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,yx_lqlpdj  ";
		ls_sql+=" where yx_lqlpdj.khbh=crm_khxx.khbh and yx_lqlpdj.lrbm=a.dwbh ";
		ls_sql+=" and yx_lqlpdj.khbh='"+khbh+"'";;
		ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";
		
		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);
		pageObj.printDate();
	%>
	</table>
	<%
}
%>

<form method="post" action="SaveEditCrm_tddj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="74" maxlength="100"  value="<%=fwdz%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">电话</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="dh" value="<%=dh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>
              </td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="33%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%" align="right"><font color="#0000CC">工程担当</font></td>
              <td width="33%"> 
                <input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">签约额</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="qye" size="20" maxlength="8"  value="<%=qye%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">是否返券</font></div>
              </td>
              <td width="33%"><%
	cf.radioToken(out, "sffj","Y+是&N+否",sffj,true);
%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">是否已认证</font></div>
              </td>
              <td width="33%"><%
	cf.radioToken(out, "sfyrz","Y+是&N+否",sfyrz,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right"><font color="#FF0000">*</font>退单时间</td>
              <td width="33%">
                <input type="text" name="tdsj" value="<%=tdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>应退金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ytje" size="20" maxlength="17"  value="<%=ytje%>" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>实退金额&nbsp;</div>
              </td>
              <td width="33%"> 
                <input type="text" name="stje" size="20" maxlength="17"  value="<%=stje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>退单原因</div>
              </td>
              <td width="33%"> 
                <select name="tdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tdyybm,tdyymc from dm_tdyybm order by tdyybm",tdyybm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>是否退回全部礼品</div>
              </td>
              <td width="33%"> <%
if (sflqlp>0)
{
	cf.radioToken(out, "sfthlp","Y+退回&N+未退回",sfthlp);
}
else{
	cf.radioToken(out, "sfthlp","W+未领礼品",sfthlp);
}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>退单原因说明</td>
              <td colspan="3"> 
                <textarea name="tdyysm" cols="72" rows="5"><%=tdyysm%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="wheretdxh"  value="<%=wheretdxh%>" >
                </div>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[电话]！");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[签单店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.tdyybm)=="") {
		alert("请选择[退单原因]！");
		FormName.tdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sffj)=="") {
		alert("请选择[是否返券]！");
		FormName.sffj.focus();
		return false;
	}
	if(	javaTrim(FormName.sfyrz)=="") {
		alert("请选择[是否已认证]！");
		FormName.sfyrz.focus();
		return false;
	}
	if(	javaTrim(FormName.ytje)=="") {
		alert("请输入[应退金额]！");
		FormName.ytje.focus();
		return false;
	}
	if(!(isFloat(FormName.ytje, "应退金额"))) {
		return false;
	}
	if(	javaTrim(FormName.stje)=="") {
		alert("请输入[实退金额]！");
		FormName.stje.focus();
		return false;
	}
	if(!(isFloat(FormName.stje, "实退金额"))) {
		return false;
	}
	if(	javaTrim(FormName.tdyysm)=="") {
		alert("请输入[退单原因说明]！");
		FormName.tdyysm.focus();
		return false;
	}
	if (FormName.tdyysm.value=="客户自身原因" || FormName.tdyysm.value=="客户原因" )
	{
		alert("请正确录入[退单说明]！");
		FormName.tdyysm.select();
		return false;
	}
	if (FormName.tdyysm.value.length<10)
	{
		alert("请正确录入[退单说明]！");
		FormName.tdyysm.select();
		return false;
	}

	<%
	if (sflqlp>0)
	{
		%>
		if(	!radioChecked(FormName.sfthlp)) {
			alert("请选择[是否退回全部礼品]！");
			FormName.sfthlp[0].focus();
			return false;
		}
		<%
	}
	else{
		%>
		if(!FormName.sfthlp.checked) {
			alert("请选择[是否退回全部礼品]！");
			FormName.sfthlp.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.tdsj)=="") {
		alert("请输入[退单时间]！");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "退单时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
