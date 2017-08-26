<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sfxmbm=null;
String sfxmmc=null;
String dysfxmmc=null;
String sflx=null;
String sfbxx=null;
String sfjrqye=null;
String jrsjbz=null;
String jrglfbz=null;
String dqbm=null;
String bz=null;
double gdje=0;
String sfkdz=null;
double zdzk=0;
String sfxmlx=null;
String sfcysgdjs=null;
String jldw=null;
String sfxsq=null;
String sfssjf=null;
double cbjbfb=0;
double sgcbjbfb=0;
double gcjcbjbfb=0;
String sffqsk=null;
String cbjjsfs=null;
String sfjrhtjz=null;
String sfjzsf=null;

String wheresfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
String wheresdqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfjzsf,sffqsk,cbjjsfs,gcjcbjbfb,sgcbjbfb,sfxsq,sfxmbm,sfxmmc,dysfxmmc,sflx,sfbxx,sfjrqye,dqbm,bz,gdje,jrsjbz,jrglfbz,sfkdz,zdzk,sfxmlx,sfcysgdjs,jldw,sfssjf,cbjbfb,sfjrhtjz ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and dqbm='"+wheresdqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjzsf=cf.fillNull(rs.getString("sfjzsf"));
		sffqsk=cf.fillNull(rs.getString("sffqsk"));
		cbjjsfs=cf.fillNull(rs.getString("cbjjsfs"));
		gcjcbjbfb=rs.getDouble("gcjcbjbfb");
		sgcbjbfb=rs.getDouble("sgcbjbfb");
		sfxsq=cf.fillNull(rs.getString("sfxsq"));
		sfxmbm=cf.fillNull(rs.getString("sfxmbm"));
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		dysfxmmc=cf.fillNull(rs.getString("dysfxmmc"));
		sflx=cf.fillNull(rs.getString("sflx"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfjrqye=cf.fillNull(rs.getString("sfjrqye"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bz=cf.fillNull(rs.getString("bz"));
		gdje=rs.getDouble("gdje");
		jrsjbz=cf.fillNull(rs.getString("jrsjbz"));
		jrglfbz=cf.fillNull(rs.getString("jrglfbz"));
		sfkdz=cf.fillNull(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");
		sfxmlx=cf.fillNull(rs.getString("sfxmlx"));
		sfcysgdjs=cf.fillNull(rs.getString("sfcysgdjs"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sfssjf=cf.fillNull(rs.getString("sfssjf"));
		cbjbfb=rs.getDouble("cbjbfb");
		sfjrhtjz=cf.fillNull(rs.getString("sfjrhtjz"));
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
		if (ps != null) ps.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
       <div align="center">修改－其它收费项目</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>地区</td>
              <td width="30%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <font color="#FF0000">*</font>收费项目编码              </td>
              <td width="30%"> 
                <input type="text" name="sfxmbm" size="20" maxlength="2"  value="<%=sfxmbm%>" >              </td>
              <td colspan="2">注意：<font color="#CC0000"><b>不同地区可用相同项目编码，最好同一项目用相同编码</b></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收费项目名称</td>
              <td colspan="3"><input type="text" name="sfxmmc" size="73" maxlength="100"  value="<%=sfxmmc%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收费项目打印名称</td>
              <td colspan="3"><input type="text" name="dysfxmmc" value="<%=dysfxmmc%>" size="73" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>收费项目类型</td>
              <td><%
	cf.radioToken(out, "sfxmlx","1+1：间接工程费<BR>&2+2：工程相关费<BR>&3+3：设计费<BR>&5+5：工程管理费<BR>&6+6：工程税金<BR><BR>&7+7：公司购主材管理费<BR>&8+8：公司购主材税金<BR>&4+4：公司购主材间接费<BR><BR>&A+A：自购主材管理费<BR>&B+B：自购主材税金<BR>&C+C：自购主材间接费<BR><BR>&D+D：水电路<BR>&E+E：水电路预收<BR><BR>&9+9：其它",sfxmlx);
%></td>
              <td align="right"><font color="#FF0000">*</font>收费计算方式</td>
              <td  valign="top"><%
	cf.radioToken(out, "sflx","1+1：工程直接费百分比（不可改）<BR>&A+A：工程直接费百分比（可改）<BR><BR>&3+3：税金（折后合同额×税率）<BR>&8+8：税金（折前税金×税金折扣）<BR><BR>&5+5：管理费<BR><BR>&2+2：固定金额(设计师可改)<BR>&4+4：固定金额(设计师不可改)<BR><BR>&6+6：公司购主材百分比(不可改)<BR>&F+F：公司购主材百分比(可改)<BR><BR>&7+7：自购主材百分比(不可改)<BR>&G+G：自购主材百分比(可改)<BR><BR>&9+9：按百分比收设计费<BR><BR>&B+B：精装工程管理费<BR>&C+C：精装主材管理费",sflx);
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>计量单位</td>
              <td><input type="text" name="jldw" value="<%=jldw%>" size="10" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">固定金额</td>
              <td colspan="3"> 
                <input type="text" name="gdje" size="10" maxlength="12"  value="<%=gdje%>" >
针对：『固定金额(设计师可改)、固定金额<font color="#FF0000"><b>（设计师不可改）</b></font>』两类 </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否参与施工队结算</td>
              <td>
<%
	cf.radioToken(out, "sfcysgdjs","Y+是&N+否",sfcysgdjs);
%>			</td>
              <td align="right"><font color="#FF0000">*</font>成本百分比</td>
              <td><input type="text" name="cbjbfb" size="10" maxlength="12"  value="<%=cbjbfb%>" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>施工成本价百分比</td>
              <td><input type="text" name="sgcbjbfb" size="10" maxlength="8"  value="<%=sgcbjbfb%>" >
%</td>
              <td align="right"><font color="#FF0000">*</font>工程基础报价百分比</td>
              <td><input type="text" name="gcjcbjbfb" size="10" maxlength="8"  value="<%=gcjcbjbfb%>" >
%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>是否必选项</td>
              <td width="30%"><%
	cf.radioToken(out, "sfbxx","1+必选&2+非必选",sfbxx);
%></td>
              <td width="20%" align="right"><font color="#FF0000">*</font>是否记入业绩<BR></td>
              <td width="30%"><%
	cf.radioToken(out, "sfjrqye","1+是&2+否",sfjrqye);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>是否收取税金</td>
              <td width="30%"><%
	cf.radioToken(out, "jrsjbz","1+收取&2+不收取",jrsjbz);
%></td>
              <td width="20%" align="right"><font color="#FF0000">*</font>是否收取管理费</td>
              <td width="30%"><%
	cf.radioToken(out, "jrglfbz","1+收取&2+不收取",jrglfbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否收取设计费</td>
              <td><%
	cf.radioToken(out, "sfssjf","1+收取&2+不收取",sfssjf);
%></td>
              <td align="right"><font color="#FF0000">*</font>设计师是否需授权使用</td>
              <td><%
	cf.radioToken(out, "sfxsq","1+不需授权&2+需授权使用&3+停用",sfxsq);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>是否可打折</td>
              <td width="30%"> <%
 	cf.radioToken(out, "sfkdz","N+不可打折&Y+可打折",sfkdz);
%> </td>
              <td width="20%" align="right">最低折扣</td>
              <td width="30%"> 
                <input type="text" name="zdzk" size="10" maxlength="8"  value="<%=zdzk%>" >
                <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否分期收款</td>
              <td><%
 	cf.radioToken(out, "sffqsk","1+是&2+否",sffqsk);
%></td>
              <td align="right"><font color="#FF0000">*</font>是否记入合同净值毛利</td>
              <td><%
 	cf.radioToken(out, "sfjrhtjz","Y+记入&N+否",sfjrhtjz);
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>成本价计算方式</td>
              <td><%
 	cf.radioToken(out, "cbjjsfs","1+折前&2+折后&3+不记入",cbjjsfs);
%></td>
              <td align="right"><font color="#FF0000">*</font>是否精装收费</td>
              <td><%
 	cf.radioToken(out, "sfjzsf","Y+是&N+否",sfjzsf);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" rows="4" cols="71"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                 
                  <input type="hidden" name="wheresfxmbm"  value="<%=wheresfxmbm%>" >
                  <input type="hidden" name="wheresdqbm"  value="<%=wheresdqbm%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输"></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区名称]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请输入[收费项目编码]！");
		FormName.sfxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sfxmmc)=="") {
		alert("请输入[收费项目名称]！");
		FormName.sfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dysfxmmc)=="") {
		alert("请输入[打印收费项目名称]！");
		FormName.dysfxmmc.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfxmlx)) {
		alert("请选择[收费项目类型]！");
		FormName.sfxmlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sflx)) {
		alert("请选择[收费计算方式]！");
		FormName.sflx[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfcysgdjs)) {
		alert("请选择[是否参与施工队结算]！");
		FormName.sfcysgdjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.select();
		return false;
	}

	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjrqye)) {
		alert("请选择[是否记入业绩]！");
		FormName.sfjrqye[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jrsjbz)) {
		alert("请选择[入税金基数标志]！");
		FormName.jrsjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jrglfbz)) {
		alert("请选择[是否收取管理费]！");
		FormName.jrglfbz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkdz)) {
		alert("请选择[是否可打折]！");
		FormName.sfkdz[0].focus();
		return false;
	}
	if (FormName.sfkdz[1].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("请输入[最低折扣]！");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "最低折扣"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("错误！[最低折扣]应该在0和10之间！");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("请选择[设计师是否需授权使用]！");
		FormName.sfxsq[0].focus();
		return false;
	}

	//检查录入是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (FormName.sfxmlx[0].checked || FormName.sfxmlx[1].checked)//收费项目类型：间接工程费、工程相关费
	{
		if (!FormName.sflx[0].checked && !FormName.sflx[1].checked && !FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[14].checked && !FormName.sflx[15].checked)//收费计算方式：工程直接费百分比、固定金额(设计师可改)、固定金额（设计师不可改）
		{
			alert("错误！[收费计算方式]应选择『1：工程直接费百分比（不可改） 或 A：工程直接费百分比（可改） 或 2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）』");
			FormName.sflx[0].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[2].checked)//收费项目类型：设计费
	{
		if (!FormName.sflx[0].checked && !FormName.sflx[1].checked && !FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[11].checked && !FormName.sflx[14].checked && !FormName.sflx[15].checked)//收费计算方式：工程直接费百分比、固定金额(设计师可改)、固定金额（设计师不可改）、按百分比收设计费
		{
			alert("错误！[收费计算方式]应选择『1：工程直接费百分比（不可改） 或 A：工程直接费百分比（可改） 或 2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）、9：按百分比收设计费 』");
			FormName.sflx[0].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[3].checked )//收费项目类型：工程管理费
	{
		if ( !FormName.sflx[0].checked  && !FormName.sflx[1].checked  && !FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[12].checked && !FormName.sflx[13].checked)//收费计算方式：管理费、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『5：管理费 或 2：固定金额(设计师可改)』");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[5].checked )//收费项目类型：公司购主材管理费
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//收费计算方式：管理费、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『5：管理费 或 2：固定金额(设计师可改)』");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if ( FormName.sfxmlx[8].checked )//收费项目类型：自购主材管理费
	{
		if (!FormName.sflx[4].checked  && !FormName.sflx[5].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//收费计算方式：管理费、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『5：管理费 或 2：固定金额(设计师可改)』』");
			FormName.sflx[3].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[4].checked || FormName.sfxmlx[6].checked || FormName.sfxmlx[9].checked)//收费项目类型：工程税金、公司购主材税金、自购主材税金
	{
		if (!FormName.sflx[2].checked && !FormName.sflx[3].checked && !FormName.sflx[5].checked)//收费计算方式：税金（折后按基数计算）、税金（折后按折扣计算）、固定金额(设计师可改)
		{
			alert("错误！[收费计算方式]应选择『3：税金（折后按基数计算） 或 8：税金（折后按折扣计算） 或 2：固定金额(设计师可改)』");
			FormName.sflx[2].focus();
			return false;
		}
		if (!FormName.jrsjbz[1].checked)
		{
			alert("错误！[是否收取税金]应选择『不收取』");
			FormName.jrsjbz[1].focus();
			return false;
		}
		if (!FormName.jrglfbz[1].checked)
		{
			alert("错误！[是否收取管理费]应选择『不收取』");
			FormName.jrglfbz[1].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[7].checked)//收费项目类型：公司购主材间接费
	{
		if (!FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[7].checked && !FormName.sflx[8].checked)//收费计算方式：固定金额(设计师可改)、固定金额（设计师不可改）、公司购主材百分比
		{
			alert("错误！[收费计算方式]应选择『2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）、6：公司购主材百分比、F：公司购主材百分比(可改)』");
			FormName.sflx[6].focus();
			return false;
		}
	}
	else if (FormName.sfxmlx[10].checked)//收费项目类型：自购主材间接费
	{
		if (!FormName.sflx[5].checked && !FormName.sflx[6].checked && !FormName.sflx[9].checked && !FormName.sflx[10].checked)//收费计算方式：固定金额(设计师可改)、固定金额（设计师不可改）、自购主材百分比
		{
			alert("错误！[收费计算方式]应选择『2：固定金额(设计师可改) 或 4：固定金额（设计师不可改）、7：自购主材百分比、G：自购主材百分比(可改)』");
			FormName.sflx[7].focus();
			return false;
		}
	}
	else{
		if (FormName.sflx[2].checked || FormName.sflx[3].checked || FormName.sflx[4].checked)//收费计算方式：税金（折后按基数计算）、税金（折后按折扣计算）、管理费
		{
			alert("错误！[收费计算方式]不能选择选择『3：税金（折后按基数计算） 或 8：税金（折后按折扣计算）、5：管理费』");
			FormName.sflx[0].focus();
			return false;
		}
	}


	if (FormName.sflx[2].checked)//收费计算方式：税金（折后按基数计算）
	{
		if (!FormName.sfkdz[0].checked)
		{
			alert("错误！应选择『不可打折』");
			FormName.sfkdz[0].focus();
			return false;
		}
	}
	else if (FormName.sflx[3].checked)//收费计算方式：税金（折后按折扣计算）
	{
	}
	else if (FormName.sflx[4].checked)//收费计算方式：管理费
	{
	}
	else if (FormName.sflx[6].checked)//收费计算方式：固定金额（设计师不可改）
	{
		if(	javaTrim(FormName.gdje)=="" || FormName.gdje.value=="0" || FormName.gdje.value=="0.0") {
			alert("请输入[固定金额]！");
			FormName.gdje.select();
			return false;
		}
		if(!(isFloat(FormName.gdje, "固定金额"))) {
			return false;
		}
	}
	//检查录入是否正确＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	if(	javaTrim(FormName.cbjbfb)=="") {
		alert("请输入[成本价百分比]！");
		FormName.cbjbfb.select();
		return false;
	}
	if(!(isFloat(FormName.cbjbfb, "成本价百分比"))) {
		return false;
	}
	if (FormName.cbjbfb.value<0 || FormName.cbjbfb.value>100)
	{
		alert("错误！[成本价百分比]应该在0和100之间！");
		FormName.cbjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.sgcbjbfb)=="") {
		alert("请输入[施工成本价百分比]！");
		FormName.sgcbjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbjbfb, "施工成本价百分比"))) {
		return false;
	}
	if (parseFloat(FormName.sgcbjbfb.value)<0 || parseFloat(FormName.sgcbjbfb.value)>100)
	{
		alert("[施工成本价百分比]应该在0到100之间！");
		FormName.sgcbjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.gcjcbjbfb)=="") {
		alert("请输入[工程基础报价百分比]！");
		FormName.gcjcbjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjcbjbfb, "工程基础报价百分比"))) {
		return false;
	}
	if (parseFloat(FormName.gcjcbjbfb.value)<0 || parseFloat(FormName.gcjcbjbfb.value)>100)
	{
		alert("[工程基础报价百分比]应该在0到100之间！");
		FormName.gcjcbjbfb.select();
		return false;
	}
	if(	!radioChecked(FormName.sfssjf)) {
		alert("请选择[是否收取设计费]！");
		FormName.sfssjf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sffqsk)) {
		alert("请选择[是否分期收款]！");
		FormName.sffqsk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cbjjsfs)) {
		alert("请选择[成本价计算方式]！");
		FormName.cbjjsfs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjrhtjz)) {
		alert("请选择[是否记入合同净值毛利]！");
		FormName.sfjrhtjz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjzsf)) {
		alert("请选择[是否精装收费]！");
		FormName.sfjzsf[0].focus();
		return false;
	}

	FormName.action="SaveEditBdm_sfxmbm.jsp";
	FormName.submit();
	return true;
}

function f_edit(FormName)
{
	if ( confirm("系统将更新所有未签单客户，电子报价中涉及本项目的信息，确实要继续吗?") )	
	{
		FormName.action="UpdateDzbjSfxmbm.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</SCRIPT>
