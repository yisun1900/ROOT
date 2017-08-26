<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgd=null;
String zbj=null;
String zbjxs=null;
String bzs=null;
String khpjdf=null;
String tsdf=null;
String wxdf=null;
String kpdf=null;
String fdfs=null;
String bqzf=null;
String bqpm=null;
String sqpm=null;
String sqsyddje=null;
String sqsyzdje=null;
String sqsyxdje=null;
String sqpjqde=null;
String gdjdexs=null;
String bqbzjdze=null;
String gsddbl=null;
String gdddbl=null;
String ddbzjde=null;
String gszdbl=null;
String gdzdbl=null;
String zdbzjde=null;
String gsxdbl=null;
String gdxdbl=null;
String xdbzjde=null;
String ddhdje=null;
String zdhdje=null;
String xdhdje=null;
String zdtscs=null;
String tskddje=null;
String tskzdje=null;
String tskxdje=null;
String tsjcdd=null;
String tsjczd=null;
String tsjcxd=null;
String kjddze=null;
String kjzdze=null;
String kjxdze=null;
String kjdze=null;
String yjddje=null;
String yjzdje=null;
String yjxdje=null;
String syddje=null;
String syzdje=null;
String syxdje=null;
String djbz=null;
String bz=null;
String wherekpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sgd,zbj,zbjxs,bzs,khpjdf,tsdf,wxdf,kpdf,fdfs,bqzf,bqpm,sqpm,sqsyddje,sqsyzdje,sqsyxdje,sqpjqde,gdjdexs,bqbzjdze,gsddbl,gdddbl,ddbzjde,gszdbl,gdzdbl,zdbzjde,gsxdbl,gdxdbl,xdbzjde,ddhdje,zdhdje,xdhdje,zdtscs,tskddje,tskzdje,tskxdje,tsjcdd,tsjczd,tsjcxd,kjddze,kjzdze,kjxdze,kjdze,yjddje,yjzdje,yjxdje,syddje,syzdje,syxdje,djbz,bz ";
	ls_sql+=" from  kp_yzfsgdkpjg";
	ls_sql+=" where  (kpjlh="+wherekpjlh+") and  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		zbj=cf.fillNull(rs.getString("zbj"));
		zbjxs=cf.fillNull(rs.getString("zbjxs"));
		bzs=cf.fillNull(rs.getString("bzs"));
		khpjdf=cf.fillNull(rs.getString("khpjdf"));
		tsdf=cf.fillNull(rs.getString("tsdf"));
		wxdf=cf.fillNull(rs.getString("wxdf"));
		kpdf=cf.fillNull(rs.getString("kpdf"));
		fdfs=cf.fillNull(rs.getString("fdfs"));
		bqzf=cf.fillNull(rs.getString("bqzf"));
		bqpm=cf.fillNull(rs.getString("bqpm"));
		sqpm=cf.fillNull(rs.getString("sqpm"));
		sqsyddje=cf.fillNull(rs.getString("sqsyddje"));
		sqsyzdje=cf.fillNull(rs.getString("sqsyzdje"));
		sqsyxdje=cf.fillNull(rs.getString("sqsyxdje"));
		sqpjqde=cf.fillNull(rs.getString("sqpjqde"));
		gdjdexs=cf.fillNull(rs.getString("gdjdexs"));
		bqbzjdze=cf.fillNull(rs.getString("bqbzjdze"));
		gsddbl=cf.fillNull(rs.getString("gsddbl"));
		gdddbl=cf.fillNull(rs.getString("gdddbl"));
		ddbzjde=cf.fillNull(rs.getString("ddbzjde"));
		gszdbl=cf.fillNull(rs.getString("gszdbl"));
		gdzdbl=cf.fillNull(rs.getString("gdzdbl"));
		zdbzjde=cf.fillNull(rs.getString("zdbzjde"));
		gsxdbl=cf.fillNull(rs.getString("gsxdbl"));
		gdxdbl=cf.fillNull(rs.getString("gdxdbl"));
		xdbzjde=cf.fillNull(rs.getString("xdbzjde"));
		ddhdje=cf.fillNull(rs.getString("ddhdje"));
		zdhdje=cf.fillNull(rs.getString("zdhdje"));
		xdhdje=cf.fillNull(rs.getString("xdhdje"));
		zdtscs=cf.fillNull(rs.getString("zdtscs"));
		tskddje=cf.fillNull(rs.getString("tskddje"));
		tskzdje=cf.fillNull(rs.getString("tskzdje"));
		tskxdje=cf.fillNull(rs.getString("tskxdje"));
		tsjcdd=cf.fillNull(rs.getString("tsjcdd"));
		tsjczd=cf.fillNull(rs.getString("tsjczd"));
		tsjcxd=cf.fillNull(rs.getString("tsjcxd"));
		kjddze=cf.fillNull(rs.getString("kjddze"));
		kjzdze=cf.fillNull(rs.getString("kjzdze"));
		kjxdze=cf.fillNull(rs.getString("kjxdze"));
		kjdze=cf.fillNull(rs.getString("kjdze"));
		yjddje=cf.fillNull(rs.getString("yjddje"));
		yjzdje=cf.fillNull(rs.getString("yjzdje"));
		yjxdje=cf.fillNull(rs.getString("yjxdje"));
		syddje=cf.fillNull(rs.getString("syddje"));
		syzdje=cf.fillNull(rs.getString("syzdje"));
		syxdje=cf.fillNull(rs.getString("syxdje"));
		djbz=cf.fillNull(rs.getString("djbz"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditKp_yzfsgdkpjg.jsp" name="editform">
<div align="center">请修改考评结果</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">施工队</td>
      <td width="31%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd);
%> 
        </select>
      </td>
      <td align="right" width="20%">质保金</td>
      <td width="30%"> <%=zbj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">质保金系数</td>
      <td width="31%"> <%=zbjxs%> </td>
      <td align="right" width="20%">班组数</td>
      <td width="30%"> <%=bzs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">客户评价得分</td>
      <td width="31%"> <%=khpjdf%> </td>
      <td align="right" width="20%">投诉项得分</td>
      <td width="30%"> <%=tsdf%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">维修项得分</td>
      <td width="31%"> <%=wxdf%> </td>
      <td align="right" width="20%">考评得分</td>
      <td width="30%"> <%=kpdf%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">浮动分数</td>
      <td width="31%"> <%=fdfs%> </td>
      <td align="right" width="20%">本期总分</td>
      <td width="30%"> <%=bqzf%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">本期排名</td>
      <td width="31%"> <%=bqpm%> </td>
      <td align="right" width="20%">上期排名</td>
      <td width="30%"> <%=sqpm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">上期剩余大单金额</td>
      <td width="31%"> <%=sqsyddje%> </td>
      <td align="right" width="20%">上期剩余中单金额</td>
      <td width="30%"> <%=sqsyzdje%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">上期剩余小单金额</td>
      <td width="31%"> <%=sqsyxdje%> </td>
      <td align="right" width="20%">上期平均签单额</td>
      <td width="30%"> <%=sqpjqde%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">工队接单额系数</td>
      <td width="31%"> <%=gdjdexs%> </td>
      <td align="right" width="20%">本期准接接单总额</td>
      <td width="30%"> <%=bqbzjdze%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">公司大单所占比例</td>
      <td width="31%"> <%=gsddbl%> </td>
      <td align="right" width="20%">施工队大单比例</td>
      <td width="30%"> <%=gdddbl%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">大单标准接单额</td>
      <td width="31%"> <%=ddbzjde%> </td>
      <td align="right" width="20%">公司中单所占比例</td>
      <td width="30%"> <%=gszdbl%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">施工队中单比例</td>
      <td width="31%"> <%=gdzdbl%> </td>
      <td align="right" width="20%">中单标准接单额</td>
      <td width="30%"> <%=zdbzjde%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">公司小单所占比例</td>
      <td width="31%"> <%=gsxdbl%> </td>
      <td align="right" width="20%">施工队小单比例</td>
      <td width="30%"> <%=gdxdbl%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">小单标准接单额</td>
      <td width="31%"> <%=xdbzjde%> </td>
      <td align="right" width="20%">大单回单金额</td>
      <td width="30%"> <%=ddhdje%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">中单回单金额</td>
      <td width="31%"> <%=zdhdje%> </td>
      <td align="right" width="20%">小单回单金额</td>
      <td width="30%"> <%=xdhdje%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">重大投诉次数</td>
      <td width="31%"> <%=zdtscs%> </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%"><font color="#FF0000">*</font>重大投诉扣大单金额</td>
      <td width="31%">
        <input type="text" name="tskddje" size="20" maxlength="17"  value="<%=tskddje%>" >
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>特殊奖励或处罚大单</td>
      <td width="30%">
        <input type="text" name="tsjcdd" size="20" maxlength="17"  value="<%=tsjcdd%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>重大投诉扣中单金额</td>
      <td width="31%"> 
        <input type="text" name="tskzdje" size="20" maxlength="17"  value="<%=tskzdje%>" >
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>特殊奖励或处罚中单</td>
      <td width="30%">
        <input type="text" name="tsjczd" size="20" maxlength="17"  value="<%=tsjczd%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>重大投诉扣小单金额</td>
      <td width="31%">
        <input type="text" name="tskxdje" size="20" maxlength="17"  value="<%=tskxdje%>" >
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>特殊奖励或处罚小单</td>
      <td width="30%">
        <input type="text" name="tsjcxd" size="20" maxlength="17"  value="<%=tsjcxd%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>下期可接大单总额</td>
      <td width="31%">
        <input type="text" name="kjddze" size="20" maxlength="17"  value="<%=kjddze%>" >
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>下期可接中单总额</td>
      <td width="30%">
        <input type="text" name="kjzdze" size="20" maxlength="17"  value="<%=kjzdze%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>下期可接小单总额</td>
      <td width="31%">
        <input type="text" name="kjxdze" size="20" maxlength="17"  value="<%=kjxdze%>" >
      </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>下期可接单总额</td>
      <td width="30%">
        <input type="text" name="kjdze" size="20" maxlength="17"  value="<%=kjdze%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">已接大单金额</td>
      <td width="31%"><%=yjddje%> </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">已接中单金额</td>
      <td width="31%"> <%=yjzdje%> </td>
      <td align="right" width="20%">已接小单金额</td>
      <td width="30%"> <%=yjxdje%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">剩余大单金额</td>
      <td width="31%"> <%=syddje%> </td>
      <td align="right" width="20%">剩余中单金额</td>
      <td width="30%"> <%=syzdje%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">剩余小单金额</td>
      <td width="31%"> <%=syxdje%> </td>
      <td align="right" width="20%"><font color="#FF0000">*</font>冻结标志</td>
      <td width="30%"> <%
	cf.radioToken(out, "djbz","N+未冻结&Y+已冻结",djbz);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="69" rows="3">&lt;%=bz%&gt;</textarea>
      </td>
    </tr>
    <input type="hidden" name="wherekpjlh"  value="<%=wherekpjlh%>" >
    <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
    <tr> 
      <td colspan="4" > 
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.tskddje, "重大投诉扣大单"))) {
		return false;
	}
	if(!(isFloat(FormName.tskzdje, "重大投诉扣中单"))) {
		return false;
	}
	if(!(isFloat(FormName.tskxdje, "重大投诉扣小单"))) {
		return false;
	}
	if(!(isFloat(FormName.tsjcdd, "特殊奖励或处罚大单"))) {
		return false;
	}
	if(!(isFloat(FormName.tsjczd, "特殊奖励或处罚中单"))) {
		return false;
	}
	if(!(isFloat(FormName.tsjcxd, "特殊奖励或处罚小单"))) {
		return false;
	}
	if(!(isFloat(FormName.kjddze, "下期可接大单总额"))) {
		return false;
	}
	if(!(isFloat(FormName.kjzdze, "下期可接中单总额"))) {
		return false;
	}
	if(!(isFloat(FormName.kjxdze, "下期可接小单总额"))) {
		return false;
	}
	if(!(isFloat(FormName.kjdze, "下期可接单总额"))) {
		return false;
	}
	if(	!radioChecked(FormName.djbz)) {
		alert("请选择[冻结标志]！");
		FormName.djbz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
