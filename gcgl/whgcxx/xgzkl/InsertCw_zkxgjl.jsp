<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String dwbh= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
double wdzgce= 0;
double qye= 0;
double suijin= 0;
double suijinbfb= 0;
double sjf= 0;
double glf= 0;
double zqguanlif= 0;
double guanlif= 0;
double zkl= 0;
double zjxzkl= 0;
double cdzwjmje= 0;
double glfjmje= 0;
double sjjmje= 0;
double zqwjrqyexm= 0;
double zhwjrqyexm= 0;
String wjrqyexmsm=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zklx="";
double glfbfb=0;//管理费百分比


try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,fgsbh,dwbh,sjsbh,sjs,sjsgh,wdzgce,zkl,zjxzkl,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,cdzwjmje,glfjmje,sjjmje,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		zjxzkl=rs.getDouble("zjxzkl");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();

	ls_sql="select zklx";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();


%>


<form method="post" action="SaveInsertCw_zkxgjl.jsp" name="insertform" target="_blank">
<div align="center"><strong>修改单项折扣</strong>（<font color="#0000FF">客户编号</font>：<%=khbh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">合同号</font></td>
      <td width="29%"> <%=hth%> </td>
      <td align="right" width="21%"><font color="#0000FF">客户姓名</font></td>
      <td width="29%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">分公司</font></td>
      <td width="29%"> 
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,false);
%>      </td>
      <td align="right" width="21%"><font color="#0000FF">签约店面</font></td>
      <td width="29%">
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">设计师</font></td>
      <td width="29%"><%=sjs%></td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">工程原报价</font></td>
      <td width="29%"><%=wdzgce%></td>
      <td align="right" width="21%"><font color="#0000FF">签约额</font></td>
      <td width="29%"><%=qye%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">税金百分比</font></td>
      <td width="29%"><%=suijinbfb%>% </td>
      <td align="right" width="21%"><font color="#0000FF">税金</font></td>
      <td width="29%"><%=suijin%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">管理费百分比</font></td>
      <td><%=glfbfb%>%</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">折前－管理费</font></td>
      <td><%=zqguanlif%></td>
      <td align="right"><font color="#0000FF">折后－管理费</font></td>
      <td><%=guanlif%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">未记入签约额部分</font></td>
      <td><%=zqwjrqyexm%><strong><font color="#0000FF">（</font></strong><font color="#0000FF"><strong>折前）</strong></font></td>
      <td align="right"><font color="#0000FF">未记入签约额部分</font></td>
      <td><%=zhwjrqyexm%><font color="#0000FF"><strong>（折后）</strong></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">未记入签约额项目</font></td>
      <td colspan="3"><%=wjrqyexmsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">设计费</font></td>
      <td width="29%"><%=sjf%></td>
      <td align="right" width="21%"><font color="#0000FF">服务费</font></td>
      <td width="29%"><%=glf%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">公司促销活动</font></td>
      <td colspan="3"> <%=cxhdbm%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#0000FF">小区促销活动</font></td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" width="21%"><font color="#0000FF">展会促销活动</font></td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">折扣类型</font></td>
      <td>
      <%
	cf.radioToken(out, "zklx","1+全额折扣&2+单项折扣",zklx,true);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">修改前直接费合同折扣</font></td>
      <td><input type="text" name="gxqzkl" value="<%=zkl%>" size="10" maxlength="6" readonly>
        （0&lt;折扣&lt;=10）</td>
      <td align="right"><font color="#FF0000">*</font>修改后直接费合同折扣</td>
      <td><input type="text" name="gxhzkl" size="10" maxlength="6" value="<%=zkl%>" >
        （0&lt;折扣&lt;=10）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">修改前增减项折扣率</font></td>
      <td><input type="text" name="gxqzjxzkl" value="<%=zjxzkl%>" size="10" maxlength="6" readonly>
        （0&lt;折扣&lt;=10）</td>
      <td align="right"><font color="#FF0000">*</font>修改后增减项折扣率</td>
      <td><input type="text" name="gxhzjxzkl" size="10" maxlength="6" value="<%=zjxzkl%>" >
        （0&lt;折扣&lt;=10）</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">修改前合同减免额</font></td>
      <td><input type="text" name="gxqcdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0000">*</font>修改后合同减免额</td>
      <td><input type="text" name="gxhcdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">修改前管理费减免额</font></td>
      <td><input type="text" name="gxqglfjmje" value="<%=glfjmje%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0000">*</font>修改后管理费减免额</td>
      <td><input type="text" name="gxhglfjmje" value="<%=glfjmje%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">修改前税金减免额</font></td>
      <td><input type="text" name="gxqsjjmje" value="<%=sjjmje%>" size="20" maxlength="16" readonly></td>
      <td align="right"><font color="#FF0000">*</font>修改后税金减免额</td>
      <td><input type="text" name="gxhsjjmje" value="<%=sjjmje%>" size="20" maxlength="16"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000CC">修改人</font></td>
      <td width="29%"> 
      <input type="text" name="xgr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000CC">修改时间</font></td>
      <td width="29%"> 
      <input type="text" name="xgsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><font color="#FF0000">*</font>备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="2"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="hidden" name="khxm" value="<%=khxm%>" >
	  <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
        <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
		<tr bgcolor="#CCCCCC"> 
		  <td colspan="8" align="center">其它收费折扣率</td>
		</tr>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="8%">项目编码</td>
			<td  width="24%">收费项目名称</td>
			<td  width="15%">收费类型</td>
			<td  width="12%">原折前收费金额</td>
			<td  width="12%">原折后收费金额</td>
			<td  width="9%">修改前单项折扣</td>
			<td  width="11%"><font color="#FF0000">*</font>修改后单项折扣</td>
		</tr>
		  

	 <%
		String sfxmbm=null;
		String sfxmmc=null;
		String sflx=null;
		double dxzkl=0;
		double zdzk=0;
		double zqsfje=0;
		double sfje=0;

		ls_sql="SELECT sfxmbm,sfxmmc, DECODE(sflx,'1','直接费百分比','2','固定金额(可改)','3','税金','4','固定金额(不可改)','5','管理费','6','设计费') sflx";
		ls_sql+=" ,dxzkl,zdzk,zqsfje,sfje";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sflx!='3'";
		ls_sql+=" order by sfxmbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
			sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
			sflx=cf.fillNull(rs.getString("sflx"));
			dxzkl=rs.getDouble("dxzkl");

			zdzk=rs.getDouble("zdzk");
			zqsfje=rs.getDouble("zqsfje");
			sfje=rs.getDouble("sfje");


			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><%=sfxmbm%>
				  <input type="hidden" name="sfxmbm" value="<%=sfxmbm%>">				</td>
				<td><%=sfxmmc%></td>
				<td><%=sflx%></td>
				<td><%=zqsfje%></td>
				<td><%=sfje%></td>
				<td><%=dxzkl%>
				  <input type="hidden" name="gxqdxzkl" value="<%=dxzkl%>">				</td>
				</td>
				<td>
				<input type="text" name="gxhdxzkl" size="6" maxlength="6" value="<%=dxzkl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >				</td>
				</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

%>	
  </table>
</form>
</body>
</html>

<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

	if(	javaTrim(FormName.zklx)=="") {
		alert("请输入[折扣类型]！");
		FormName.zklx.focus();
		return false;
	}

	if(	javaTrim(FormName.gxhzkl)=="") {
		alert("请输入[修改后直接费合同折扣]！");
		FormName.gxhzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzkl, "修改后直接费合同折扣"))) {
		return false;
	}
	if (FormName.gxhzkl.value<=0 || FormName.gxhzkl.value>10)
	{
		alert("错误！[修改后直接费合同折扣]应该在0和10之间！");
		FormName.gxhzkl.select();
		return false;
	}

	if(	javaTrim(FormName.gxhzjxzkl)=="") {
		alert("请输入[更新后增减项折扣率]！");
		FormName.gxhzjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzjxzkl, "更新后增减项折扣率"))) {
		return false;
	}
	if (FormName.gxhzjxzkl.value<=0 || FormName.gxhzjxzkl.value>10)
	{
		alert("错误！[更新后增减项折扣率]应该在0和10之间！");
		FormName.gxhzjxzkl.select();
		return false;
	}

	
	
	if(	javaTrim(FormName.gxqcdzwjmje)=="") {
		alert("请输入[更新前合同减免额]！");
		FormName.gxqcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxqcdzwjmje, "更新前合同减免额"))) {
		return false;
	}

	if(	javaTrim(FormName.gxhcdzwjmje)=="") {
		alert("请输入[更新后合同减免额]！");
		FormName.gxhcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhcdzwjmje, "更新后合同减免额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhglfjmje)=="") {
		alert("请输入[更新后管理费减免额]！");
		FormName.gxhglfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglfjmje, "更新后管理费减免额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsjjmje)=="") {
		alert("请输入[更新后税金减免额]！");
		FormName.gxhsjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjjmje, "更新后税金减免额"))) {
		return false;
	}


	if(	javaTrim(FormName.xgr)=="") {
		alert("请输入[修改人]！");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsj)=="") {
		alert("请输入[修改时间]！");
		FormName.xgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xgsj, "修改时间"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注]！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
