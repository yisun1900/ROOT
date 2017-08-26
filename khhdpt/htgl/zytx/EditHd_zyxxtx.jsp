<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String txxh=null;
String khbh=null;
String txbt=null;
String txnr=null;
String txfl=null;
String sfyxkhly=null;
String txdj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wheretxxh=cf.GB2Uni(request.getParameter("txxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String fgsbh=null;


try {
	conn=cf.getConnection();
	ls_sql="select txxh,khbh,txbt,txnr,txfl,sfyxkhly,txdj,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  hd_zyxxtx";
	ls_sql+=" where  (txxh='"+wheretxxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txxh=cf.fillNull(rs.getString("txxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		txbt=cf.fillNull(rs.getString("txbt"));
		txnr=cf.fillNull(rs.getString("txnr"));
		txfl=cf.fillNull(rs.getString("txfl"));
		sfyxkhly=cf.fillNull(rs.getString("sfyxkhly"));
		txdj=cf.fillNull(rs.getString("txdj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=rs.getString("fgsbh");
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditHd_zyxxtx.jsp" name="editform">
  <div align="center">请修改重要提醒（提醒序号：<%=wheretxxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">客户编号</font></div>
      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">合同号</font></div>
      </td>
      <td width="33%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">客户姓名</font></div>
      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">签约店面</font></div>
      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">设计师</font></div>
      </td>
      <td width="32%"> <%=sjs%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">质检员</font></div>
      </td>
      <td width="33%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">施工队</font></div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">施工班组</font></div>
      </td>
      <td width="33%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>提醒标题</td>
      <td colspan="3"> 
        <input type="text" name="txbt" size="75" maxlength="200"  value="<%=txbt%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>提醒内容</td>
      <td colspan="3"> 
        <textarea name="txnr" cols="74" rows="7"><%=txnr%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>提醒分类</td>
      <td width="32%"> 
        <select name="txfl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+交款提醒&2+工地验收提醒&3+结算提醒&4+集成产品提醒&9+其它提醒",txfl);
%> 
        </select>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>客户是否可以留言</td>
      <td width="33%"> <%
	cf.radioToken(out, "sfyxkhly","N+不可以&Y+可以",sfyxkhly);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>提醒等级</td>
      <td width="33%"><%
	cf.radioToken(out, "txdj","1+一般&2+重要&3+特别重要",txdj);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wheretxxh"  value="<%=wheretxxh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.txbt)=="") {
		alert("请输入[提醒标题]！");
		FormName.txbt.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("请输入[提醒内容]！");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.txfl)=="") {
		alert("请选择[提醒分类]！");
		FormName.txfl.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxkhly)) {
		alert("请选择[客户是否可以留言]！");
		FormName.sfyxkhly[0].focus();
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
	if(	!radioChecked(FormName.txdj)) {
		alert("请选择[提醒等级]！");
		FormName.txdj[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
