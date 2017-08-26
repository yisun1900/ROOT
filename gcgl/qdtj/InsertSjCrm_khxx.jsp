<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.Date,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");

String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String fwdz="";
String lxfs="";
String sjs="";
String khjl="";

String csrq="";
String zybm="";
String fj="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String jiedao="";
String ywyssxz=null;
String sjsbh=null;

String lrsj1=null;//信息录入时间


double qye1=0;
double qye=0;
//int qye=0;
double sjf=0;
double glf=0;
double zcbjje=0;

String mark="";
String hth="";
String qtdh=null;
String email=null;
String ysy=null;

String dzbjjc="";//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]；2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程原报价]，不自动计算4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
String zxkhlrjc="";//签单登记中，[咨询录入时间]和[签单录入时间]允许相差最小天数
int zxkhlrts=0;//咨询客户提前录入天数

double sjjryjbfb=0;
double sssjf=0;

try {
	conn=cf.getConnection();

	ls_sql="select ysy,ywyssxz,sjsbh,jiedao,hth,khjl,sjf,qtdh,email,louhao,zcbjje,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,csrq,zybm,fj,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
    //out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysy=cf.fillNull(rs.getString("ysy"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		hth=cf.fillNull(rs.getString("hth"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sssjf=rs.getDouble("sjf");
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		louhao=cf.fillNull(rs.getString("louhao"));
		zcbjje=rs.getDouble("zcbjje");
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=rs.getString("fj");
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=rs.getString("fgyqbm");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm,dzbjjc,zxkhlrjc,zxkhlrts,sjjryjbfb";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));//启用咨询客户录入检查
		zxkhlrts=rs.getInt("zxkhlrts");//咨询客户提前录入天数

		sjjryjbfb=rs.getDouble("sjjryjbfb");//设计客户计入业绩收款比例 
	}
	rs.close();
	ps.close();

  
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>

      <div align="center">设计客户--录入（<font color="#FF0033">*</font>为必填字段）（客户编号：<%=khbh%>）</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同号</td>
      <td><input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20"  >
      </td>
      <td align="right">书面合同编号</td>
      <td><input type="text" name="smhtbh" value="" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">客户姓名</font>      </td>
      <td width="34%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>      </td>
      <td width="17%" align="right"> 
      <font color="#FF0033">*</font>性别      </td>
      <td width="33%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        男 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>手机</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">用于接收短信，最好录一部,有多个电话<font color="#0000FF">用英文逗号</font>分隔</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">其它电话</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(注意：有多个电话<font color="#0000FF">用英文逗号</font>分隔)</font>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">电子邮件</td>
      <td width="34%"> 
      <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">      </td>
      <td width="17%" align="right">业主身份证号码</td>
      <td width="33%"> 
        <input type="text" name="sfzhm" value="" size="20" maxlength="18" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"> 
        <input type="hidden" name="cqbm" value="<%=cqbm%>" >
        <input type="hidden" name="xqbm" value="<%=xqbm%>" >
        <input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="hidden" name="jiedao" value="<%=jiedao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="74" maxlength="100"  onKeyUp="keyTo(cqbm)" readonly>      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>关系客户</td>
      <td width="34%"> 
        <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(sjs)">
          <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">普通客户</option>");
	}
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0033">*</font>家装标志</td>
      <td width="33%"> 
        <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">设计师</font>      </td>
      <td width="34%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>      </td>
      <td width="17%" align="right"> 
        <font color="#0000FF">业务员</font>      </td>
      <td width="33%"> 
        <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">客户经理</font></td>
      <td><input name="khjl" type="text" id="khjl" value="<%=khjl%>" size="20" maxlength="20" readonly></td>
      <td align="right" width="17%"><font color="#FF0033">*</font>签约日期</td>
      <td width="33%"><input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>设计费</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="" size="20" maxlength="16"  >      </td>
      <td align="right" width="17%"><font color="#0000CC">折扣</font></td>
      <td width="33%"><input type="text" name="zkl" value="10" size="20" maxlength="20" readonly>
        <font color="red">(0---10) </font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">工程原报价</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="0" size="20" maxlength="8"  readonly>      </td>
      <td align="right" width="17%"><font color="#FF0033">*</font><font color="#0000CC">折后签约额</font></td>
      <td width="33%"><input type="text" name="qye" value="0" size="20" maxlength="8" readonly></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>客户类型</td>
      <td width="34%"> 
        <input type="radio" name="zt" value="5" checked >
        设计客户 </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">签约店面</font></td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">录入时间</font>      </td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="17%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">信息录入人</font>      </td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        备注      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="sjsbh" value="<%=sjsbh%>"  >
        <input type="hidden" name="ywyssxz" value="<%=ywyssxz%>"  >
        <input type="hidden" name="ysy" value="<%=ysy%>"  >
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
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


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("请输入[手机]或[其它电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}

	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}

<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("请输入[业主身份证号码]！");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "身份证号码"))) {
			return false;
		}
		<%
	}
%>

	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费"))) {
		return false;
	}
	if (parseFloat(FormName.sjf.value)==0)
	{
		alert("[设计费]不能为0！");
		FormName.sjf.select();
		return false;
	}
	
	//这个地方已经改过（2005-12-30）
	if(!(isFloat(FormName.zkl, "折扣系数!!"))) {
		return false;
	}
	if (parseFloat(FormName.zkl.value)<0 ||parseFloat(FormName.zkl.value)>10)
	{

		alert("[折扣系数]不能小于0或者大于10！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
/*
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[工程签约额]不能为0！");
		FormName.qye.select();
		return false;
	}
*/
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[未打折工程额]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "未打折工程额"))) {
		return false;
	}
/*	
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[工程原报价]不能为0！");
		FormName.wdzgce.select();
		return false;
	}
*/
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[工程原报价]不能小于[工程签约额]！");
		FormName.qye.select();
		return false;
	}


	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if (FormName.qyrq.value > "<%=cf.today()%>")
	{
		alert("[签约日期]不能大于[今天]！");
		FormName.qyrq.select();
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



	
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.lrr.focus();
		return false;
	}

/*
	if(	javaTrim(FormName.sjsbh)=="") {
		alert("请输入[所属设计室]！");
		FormName.sjsbh.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[签约店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	if(!FormName.zt.checked) {
		alert("请输入[客户类型]！");
		FormName.zt.focus();
		return false;
	}
 
	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("『设计费』录入错误！实收设计费『<%=sssjf%>』未达到公司实收标准『<%=sjjryjbfb%>』%规定");
		FormName.sjf.select();
		return false;
	}
   
	FormName.action="SaveInsertSjCrm_khxx.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
