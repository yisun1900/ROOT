<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String zxdm=null;
String sjs=null;
String lrr=null;
String lrsj=null;
String zxdjbm=null;
String ssfgs=null;
String dqbm=null;

try {
	conn=cf.getConnection();
	ls_sql="select khxm,xb,fwdz,lxfs,zxdm,sjs,lrr,lrsj,zxdjbm,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_dzyhsq";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已进行过打折申请，不能重复申请");
		return;
	}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_dzyhsq.jsp" name="insertform" target="_blank">
  <div align="center">打折优惠申请</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        客户编号      </td>
      <td width="31%"> <%=khbh%> </td>
      <td width="20%" align="right"> 
        客户姓名      </td>
      <td width="30%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right" bgcolor="#CCCCFF"> 
        性别      </td>
      <td width="31%"> <%
	cf.radioToken(out, "M+男&W+女",xb,true);
%> </td>
      <td width="20%" align="right"> 
        联系方式      </td>
      <td width="30%"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        房屋地址      </td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        咨询店面      </td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
      <td width="20%" align="right"> 
        设计师      </td>
      <td width="30%"><%=sjs%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right"> 
        录入时间      </td>
      <td width="31%"> <%=lrsj%> </td>
      <td width="20%" align="right"> 
        信息录入人      </td>
      <td width="30%"><%=lrr%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>申请人</td>
      <td width="31%"> 
        <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>申请时间</td>
      <td width="30%"> 
        <input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>折扣类型</td>
      <td><input type="radio" name="zklx" value="2" checked>
单项折扣</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>直接费合同折扣</td>
      <td><input type="text" name="sqzkl" value="" size="12" maxlength="9" >
（>0且<=10）</td>
      <td align="right"><font color="#FF0000">*</font>直接费增减项折扣</td>
      <td><input type="text" name="sqzjxzkl" value="" size="12" maxlength="9" >
（>0且<=10）</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>是否申请其它优惠</td>
      <td><input type="radio" name="sfsqqtyh"  value="Y">
是
  <input type="radio" name="sfsqqtyh"  value="N">
否 </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">其它优惠内容</td>
      <td colspan="3"> 
        <textarea name="sqqtyhnr" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>申请原因说明</td>
      <td colspan="3"> 
        <textarea name="sqyysm" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="31%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
  </table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC"> 
      <td colspan="6" align="center">其它收费折扣率</td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <td  width="8%" align="center">项目编码</td>
      <td  width="19%" align="center">收费项目名称</td>
      <td  width="14%" align="center">收费类型</td>
      <td  width="8%" align="center">允许最低</td>
      <td  width="8%" align="center">申请折扣</td>
      <td  width="43%" align="center">备注</td>
    </tr>
    
    <%
	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	String bz=null;
	double gdje=0;
	String sfkdz=null;
	double zdzk=0;

	ls_sql="SELECT sfxmbm,sfxmmc, DECODE(sflx,'1','直接费百分比','2','固定金额(可改)','3','税金(百分比)','4','固定金额(不可改)','5','管理费(百分比)') sflx,gdje, DECODE(sfbxx,'1','必选','2','非必选') sfbxx, DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye, DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz, DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz, DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk,bz ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where dqbm='"+dqbm+"' and sfkdz='Y'";
    ls_sql+=" order by sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		sflx=cf.fillNull(rs.getString("sflx"));
		gdje=rs.getDouble("gdje");
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfjrqye=cf.fillNull(rs.getString("sfjrqye"));
		jrsjbz=cf.fillNull(rs.getString("jrsjbz"));
		jrglfbz=cf.fillNull(rs.getString("jrglfbz"));
		sfkdz=cf.fillNull(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");
		bz=cf.fillNull(rs.getString("bz"));

		double sqdxzkl=0;
		ls_sql="SELECT sqdxzkl";
		ls_sql+=" from  crm_dxdzyh";
		ls_sql+=" where khbh='"+khbh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqdxzkl=rs1.getDouble("sqdxzkl");
		}
		rs1.close();
		ps1.close();

		String xs=null;
		if (sqdxzkl==0)
		{
			xs="";
		}
		else{
			xs=""+sqdxzkl;
		}

		%> 
    <tr bgcolor="#FFFFFF"> 
      <td align="center"><%=sfxmbm%> 
        <input type="hidden" name="sfxmbm" value="<%=sfxmbm%>">      </td>
      <td align="center"><%=sfxmmc%></td>
      <td align="center"><%=sflx%></td>
      <td align="center"><%=zdzk%> 
        <input type="hidden" name="zdzk" value="<%=zdzk%>">      </td>
      <td align="center"> 
        <input type="text" name="sqdxzkl" size="6" maxlength="6" value="<%=xs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >      </td>
      <td align="center"><%=bz%></td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
%> 
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td > 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
      </td>
    </tr>
  </table>
</form>
</body>
</html>




<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



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
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("请输入[申请时间]！");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "申请时间"))) {
		return false;
	}

	if(	javaTrim(FormName.zklx)=="") {
		alert("请选择[折扣类型]！");
		FormName.zklx.focus();
		return false;
	}

		
	if(	javaTrim(FormName.sqzkl)=="") {
		alert("请输入[直接费合同折扣]！");
		FormName.sqzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sqzkl, "直接费合同折扣"))) {
		return false;
	}
	if (FormName.sqzkl.value<=0 || FormName.sqzkl.value>10)
	{
		alert("错误！[直接费合同折扣]应该在0和10之间！");
		FormName.sqzkl.select();
		return false;
	}
	if(	javaTrim(FormName.sqzjxzkl)=="") {
		alert("请输入[直接费增减项折扣]！");
		FormName.sqzjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sqzjxzkl, "直接费增减项折扣"))) {
		return false;
	}
	if (FormName.sqzjxzkl.value<=0 || FormName.sqzjxzkl.value>10)
	{
		alert("错误！[直接费增减项折扣]应该在0和10之间！");
		FormName.sqzjxzkl.select();
		return false;
	}


	if(	!radioChecked(FormName.sfsqqtyh)) {
		alert("请选择[是否申请其它优惠]！");
		FormName.sfsqqtyh[0].focus();
		return false;
	}
	if (FormName.sfsqqtyh[0].checked)
	{
		if(	javaTrim(FormName.sqqtyhnr)=="") {
			alert("请输入[其它优惠内容]！");
			FormName.sqqtyhnr.focus();
			return false;
		}
	}
	else{
		FormName.sqqtyhnr.value="";
	}
	if(	javaTrim(FormName.sqyysm)=="") {
		alert("请输入[申请原因说明]！");
		FormName.sqyysm.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
