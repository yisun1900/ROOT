<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String shr=(String)session.getAttribute("yhmc");

String ygbh=null;
String bdsxrq=null;
String bdxz=null;
String bdyy=null;
String fgsbh=null;
String tcf=null;
String dwbh=null;
String dwbh2=null;
String zwbm=null;
String zwbm2=null;
String bdqgwgz=null;
String bdhgwgz=null;
String bdqjbgz=null;
String bdhjbgz=null;
String bdqkhgz=null;
String bdhkhgz=null;
String bdqbuzhu=null;
String bdhbuzhu=null;
String bdqjtbt=null;
String bdhjtbt=null;
String bdqcb=null;
String bdhcb=null;
String bdqdhbt=null;
String bdhdhbt=null;
String bdqsfzszg=null;
String bdhsfzszg=null;
String bz=null;
String lrsj=null;
String lrr=null;
String yhmc=null;
String bianhao=null;
String clzt=null;
String ztbm=null;

String shjl=null;
String shyj=null;
String spxh=null;
String shsj=null;

String yclzt=null;
String yztbm=null;
String bdsqsplc="";

String bdxh=cf.GB2Uni(request.getParameter("bdxh"));
String xgztbm=cf.GB2Uni(request.getParameter("ztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select ygbh,bdsxrq,bdxz,bdyy,fgsbh,tcf,dwbh,dwbh2,zwbm,zwbm2,bdqgwgz,bdhgwgz,bdqjbgz,bdhjbgz,bdqkhgz,bdhkhgz,bdqbuzhu,bdhbuzhu,bdqjtbt,bdhjtbt,bdqcb,bdhcb,bdqdhbt,bdhdhbt,bz,lrsj,lrr,clzt,ztbm,shjl,shyj,spxh,shsj,bdqsfzszg,bdhsfzszg ";
	ls_sql+=" from  rs_ygbdsqb";
	ls_sql+=" where bdxh='"+bdxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bdsxrq=cf.fillNull(rs.getDate("bdsxrq"));
		bdxz=cf.fillNull(rs.getString("bdxz"));
		bdyy=cf.fillHtml(rs.getString("bdyy"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		tcf=cf.fillHtml(rs.getString("tcf"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwbh2=cf.fillNull(rs.getString("dwbh2"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		zwbm2=cf.fillNull(rs.getString("zwbm2"));
		bdqgwgz=cf.fillNull(rs.getString("bdqgwgz"));
		bdhgwgz=cf.fillNull(rs.getString("bdhgwgz"));
		bdqjbgz=cf.fillNull(rs.getString("bdqjbgz"));
		bdhjbgz=cf.fillNull(rs.getString("bdhjbgz"));
		bdqkhgz=cf.fillNull(rs.getString("bdqkhgz"));
		bdhkhgz=cf.fillNull(rs.getString("bdhkhgz"));
		bdqbuzhu=cf.fillNull(rs.getString("bdqbuzhu"));
		bdhbuzhu=cf.fillNull(rs.getString("bdhbuzhu"));
		bdqjtbt=cf.fillNull(rs.getString("bdqjtbt"));
		bdhjtbt=cf.fillNull(rs.getString("bdhjtbt"));
		bdqcb=cf.fillNull(rs.getString("bdqcb"));
		bdhcb=cf.fillNull(rs.getString("bdhcb"));
		bdqdhbt=cf.fillNull(rs.getString("bdqdhbt"));
		bdhdhbt=cf.fillNull(rs.getString("bdhdhbt"));
		bz=cf.fillHtml(rs.getString("bz"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));

		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		spxh=cf.fillNull(rs.getString("spxh"));
		shsj=cf.fillNull(rs.getDate("shsj"));

		bdqsfzszg=cf.fillNull(rs.getString("bdqsfzszg"));
		bdhsfzszg=cf.fillNull(rs.getString("bdhsfzszg"));
	}
	rs.close();
	ps.close();

	ls_sql="select yclzt,yztbm";
	ls_sql+=" from  rs_bdsh";
	ls_sql+=" where spxh="+spxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yclzt=cf.fillNull(rs.getString("yclzt"));
		yztbm=cf.fillNull(rs.getString("yztbm"));
	}
	rs.close();
	ps.close();

	if (!yztbm.equals(xgztbm))
	{
		out.println("错误！『审批状态』已改变，不能再修改");
		return;
	}

	ls_sql="select yhmc,bianhao";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
	}
	rs.close();
	ps.close();


	String ztmc=null;
	ls_sql="select ztmc";
	ls_sql+=" from  rs_ygbdsplc,rs_ztbm";
	ls_sql+=" where rs_ygbdsplc.ztbm=rs_ztbm.ztbm and rs_ygbdsplc.bdxh='"+bdxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));

		bdsqsplc+="-->"+ztmc;
	}
	rs.close();
	ps.close();
	if (!bdsqsplc.equals(""))
	{
		bdsqsplc=bdsqsplc.substring(3);
	}
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<title>审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgSpRs_ygbdsqb.jsp" name="editform">
  <div align="center">人事变动－修改审批（变动序号：<%=bdxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动序号 </td>
      <td width="31%"><%=bdxh%> </td>
      <td align="right" width="20%"> 员工序号 </td>
      <td width="30%"><%=ygbh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">员工名称</td>
      <td width="31%"><%=yhmc%></td>
      <td align="right" width="20%">工号</td>
      <td width="30%"><%=bianhao%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动生效时间 </td>
      <td width="31%"><%=bdsxrq%> </td>
      <td align="right" width="20%"> 变动性质 </td>
      <td width="30%"><%
	cf.selectToken(out,"01+转正&02+调薪&03+升职&04+降职&05+调职&06+调动&07+升级&08+降级&99+其他",bdxz,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动原因 </td>
      <td colspan="3"><%=bdyy%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 提出方 </td>
      <td width="31%"><%=tcf%> </td>
      <td align="right" width="20%">申报分公司 </td>
      <td width="30%"><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);%> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前部门 </td>
      <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
      <td align="right" width="20%"> 变动后部门 </td>
      <td width="30%"><%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh2+"'",dwbh2,true);%> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前岗位 </td>
      <td width="31%"><%=zwbm%> </td>
      <td align="right" width="20%"> 变动后岗位 </td>
      <td width="30%"><%=zwbm2%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前岗位工资 </td>
      <td width="31%"><%=bdqgwgz%> </td>
      <td align="right" width="20%"> 变动后岗位工资 </td>
      <td width="30%"><%=bdhgwgz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前基本工资 </td>
      <td width="31%"><%=bdqjbgz%> </td>
      <td align="right" width="20%"> 变动后基本工资 </td>
      <td width="30%"><%=bdhjbgz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前考核工资 </td>
      <td width="31%"><%=bdqkhgz%> </td>
      <td align="right" width="20%"> 变动后考核工资 </td>
      <td width="30%"><%=bdhkhgz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前补助 </td>
      <td width="31%"><%=bdqbuzhu%> </td>
      <td align="right" width="20%"> 变动后补助 </td>
      <td width="30%"><%=bdhbuzhu%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前交通补贴 </td>
      <td width="31%"><%=bdqjtbt%> </td>
      <td align="right" width="20%"> 变动后交通补贴 </td>
      <td width="30%"><%=bdhjtbt%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前餐补 </td>
      <td width="31%"><%=bdqcb%> </td>
      <td align="right" width="20%"> 变动后餐补 </td>
      <td width="30%"><%=bdhcb%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 变动前电话补贴 </td>
      <td width="31%"><%=bdqdhbt%> </td>
      <td align="right" width="20%"> 变动后电话补贴 </td>
      <td width="30%"><%=bdhdhbt%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">变动前员工状态</td>
      <td width="31%"><%
	cf.selectToken(out,"M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退",bdqsfzszg,true);
%></td>
      <td align="right" width="20%">变动后员工状态</td>
      <td width="30%"><%
	cf.selectToken(out,"M+实习生&Y+转正&N+试用期&D+待岗&S+辞职&T+辞退",bdhsfzszg,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 录入人 </td>
      <td width="31%"><%=lrr%> </td>
      <td align="right" width="20%"> 录入时间 </td>
      <td width="30%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"> 备注 </td>
      <td colspan="3"><%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><b>员工变动审批流程</b></td>
      <td colspan="3"><%=bdsqsplc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="34">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">审核人</font></td>
      <td width="31%"> 
        <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">审核时间</font></td>
      <td width="30%"> 
        <input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>审核结论</td>
      <td width="31%"> 
        <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rs_shjlbm.shjl,shjlmc from rs_shjlbm,rs_shztlc where rs_shjlbm.shjl=rs_shztlc.shjl and rs_shztlc.ztbm='"+yztbm+"' order by rs_shjlbm.shjl",shjl);
%> 
        </select>
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">审核意见</td>
      <td colspan="3"> 
        <textarea name="shyj" cols="73" rows="3"><%=shyj%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"> 
          <input type="hidden" name="bdxh"  value="<%=bdxh%>" >
          <input type="hidden" name="spxh"  value="<%=spxh%>" >
          <input type="hidden" name="xgztbm"  value="<%=xgztbm%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
          <input type="hidden" name="bdxh"  value="<%=bdxh%>" >
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
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("请选择[审核结论]！");
		FormName.shjl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
