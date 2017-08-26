<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;

String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String hth=null;
String sjs=null;
String qye=null;
String wdzgce=null;
String sfyyh=null;
String yhyy=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String hdbz=null;
String khlxbm=null;
String ybjbh=null;
String bz=null;
String bjjb=null;
double sjf=0;
double glf=0;

String cgdz=null;
String hdr=null;
String sfzhm=null;

String csrq=null;
String zybm=null;
String fj=null;
double zkl=0;
String czbm=null;

String xqbm=null;
String sffj=null;
String sfyrz=null;


String dwbh=null;
String jyjdrq=null;

String fjje=null;
String gsfje=null;
String cxhdbm=null;
String ywy=null;
String jzbz=null;
String sfcjq=null;
String sffby=null;
String sfzbcl=null;
String sjsbh=null;
String hykh=null;
String hyklxbm=null;
String yxsjs=null;
String yxsjz=null;
String kgsjqd=null;
String zt=null;
String louhao="";
String qtdh=null;
String email=null;
String yjjzsj=null;
String smhtbh =null;



String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select smhtbh ,yjjzsj,qtdh,email,louhao,zt,kgsjqd,hykh,hyklxbm,yxsjs,yxsjz,sfcjq,sffby,sfzbcl,jzbz,wdzgce,glf,sjf,ywy,bjjb,dwbh,khxm,xb,fwdz,cqbm,lxfs,hxbm,fgflbm,zxjwbm,ysbm,hxmjbm,fwmj,pmjj,hth,sjs,qye,sfyyh,yhyy,qyrq,kgrq,hdbz,khlxbm,bz,jgrq,ybjbh,cgdz,hdr,sfzhm,csrq,zybm,fj,zkl,czbm,xqbm,sffj,sfyrz,jyjdrq,fjje,gsfje,cxhdbm,sjsbh ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		zt=cf.fillNull(rs.getString("zt"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		hykh=cf.fillNull(rs.getString("hykh"));
		hyklxbm=cf.fillNull(rs.getString("hyklxbm"));
		yxsjs=cf.fillNull(rs.getDate("yxsjs"));
		yxsjz=cf.fillNull(rs.getDate("yxsjz"));

		sfcjq=cf.fillNull(rs.getString("sfcjq"));
		sffby=cf.fillNull(rs.getString("sffby"));
		sfzbcl=cf.fillNull(rs.getString("sfzbcl"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		wdzgce=cf.fillNull(rs.getString("wdzgce"));
		glf=rs.getDouble("glf");
		sjf=rs.getDouble("sjf");
		ywy=cf.fillNull(rs.getString("ywy"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));

		csrq=cf.fillNull(rs.getDate("csrq"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		czbm=cf.fillNull(rs.getString("czbm"));
		zkl=rs.getDouble("zkl");
	
		sffj=cf.fillNull(rs.getString("sffj"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
	
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));

		fjje=cf.fillNull(rs.getString("fjje"));
		gsfje=cf.fillNull(rs.getString("gsfje"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
	}
	rs.close();
	ps.close();

	if (kgsjqd.equals(""))
	{
		kgsjqd="Y";
	}

	if (!yjjzsj.equals(""))
	{
		out.println("错误！业绩已结转，不能再修改");
		return;
	}

	ls_sql="SELECT ssfgs,dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
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

<body bgcolor="#CCCCFF">


<form method="post" action="" name="editform" target="_blank">
      <div align="center"> 请修改信息（客户编号：<%=khbh%>）（<font color="#FF0033">*</font>为必填字段）</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">合同号</font></td>
      <td><%=hth%></td>
      <td align="right">书面合同编号</td>
      <td><input type="text" name="smhtbh" value="<%=smhtbh%>" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000FF">客户姓名</font></div>      </td>
      <td width="34%"> 
      <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" readonly>      </td>
      <td width="18%"> 
      <div align="right"><font color="#FF0033">*</font>性别</div>      </td>
      <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
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
      <td width="18%" align="right">业主身份证号码</td>
      <td width="32%"> 
        <input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000FF">房屋地址</font></div>      </td>
      <td colspan="3"> 
        <input type="hidden" name="cqbm" value="<%=cqbm%>" >
        <input type="hidden" name="xqbm" value="<%=xqbm%>" >
        <input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="74" maxlength="100"  onKeyUp="keyTo(cqbm)" readonly>      </td>
    </tr>
	</TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>关系客户</td>
      <td width="34%"> 
        <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
        </select>
      </td>
      <td width="18%" align="right"><font color="#CC0000">*</font>家装标志</td>
      <td width="32%"> 
        <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000FF">设计师</font></div>
      </td>
      <td width="34%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
      </td>
      <td width="18%"> 
        <div align="right"><font color="#0000FF">业务员</font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" height="14" align="right"><font color="#FF0033">*</font>设计费</td>
      <td width="34%" height="14"> 
        <input type="text" name="sjf" size="20" maxlength="16" value="<%=sjf%>" onChange="calValue(editform)">
      </td>
      <td rowspan="5" width="18%"> 
        <div align="right"><font color="#FF0033">*</font>信息来源</div>
      </td>
      <td rowspan="5" width="32%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='1' and khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" height="14" align="right"><font color="#FF0033">*</font><font color="#0000CC">工程原报价</font></td>
      <td width="34%" height="14"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16"  readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" height="10"><font color="#0000CC">打折系数</font></td>
      <td width="34%" height="10"> 
        <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="20" readonly>
        <font color="red">(0---10) </font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" height="10"><font color="#FF0033">*</font><font color="#0000CC">工程签约额</font></td>
      <td width="34%" height="10"> 
        <input type="text" name="qye" size="20" maxlength="16"  value="<%=qye%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" height="10"><font color="#FF0033">*</font>签约日期</td>
      <td width="34%" height="10"> 
        <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>客户类型</td>
      <td width="34%"> 
        <input type="radio" name="zt" value="5" checked >
        设计客户 </td>
      <td width="18%" align="right">所属设计室</td>
      <td width="32%"> 
        <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select a.dwbh,a.dwmc from sq_dwxx a where a.dwlx in('F3') and a.ssdw='"+dwbh+"' order by dwbh",sjsbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="khbh"  value="<%=khbh%>" >
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
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
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
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
	if(	!selectChecked(FormName.xxlybm)) {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
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

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[未打折工程额]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "未打折工程额"))) {
		return false;
	}
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


	if(!FormName.zt.checked) {
		alert("请输入[客户类型]！");
		FormName.zt.focus();
		return false;
	}
    
	FormName.action="SaveEditSjCrm_khxx.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
