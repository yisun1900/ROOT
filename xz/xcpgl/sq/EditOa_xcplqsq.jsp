<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String fgsbh=null;
String slr=null;
String jhlqrq=null;
String lrr=null;
String lrrq=null;
String sfxsp=null;
String bz=null;

String yjspr=null;
String yjspsj=null;
String yjspjl=null;
String yjspsm=null;

String ejspr=null;
String ejspsj=null;
String ejspjl=null;
String ejspsm=null;

String sjspr=null;
String sjspsj=null;
String sjspjl=null;
String sjspsm=null;


String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,fgsbh,slr,jhlqrq,lrr,lrrq,sfxsp,bz,yjspr,yjspsj,yjspjl,yjspsm,ejspr,ejspsj,ejspjl,ejspsm,sjspr,sjspsj,sjspjl,sjspsm ";
	ls_sql+=" from  oa_xcplqsq";
	ls_sql+=" where  (sqxh="+sqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		slr=cf.fillNull(rs.getString("slr"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		bz=cf.fillNull(rs.getString("bz"));

		yjspr=cf.fillNull(rs.getString("yjspr"));
		yjspsj=cf.fillNull(rs.getDate("yjspsj"));
		yjspjl=cf.fillNull(rs.getString("yjspjl"));
		yjspsm=cf.fillNull(rs.getString("yjspsm"));

		ejspr=cf.fillNull(rs.getString("ejspr"));
		ejspsj=cf.fillNull(rs.getDate("ejspsj"));
		ejspjl=cf.fillNull(rs.getString("ejspjl"));
		ejspsm=cf.fillNull(rs.getString("ejspsm"));

		sjspr=cf.fillNull(rs.getString("sjspr"));
		sjspsj=cf.fillNull(rs.getDate("sjspsj"));
		sjspjl=cf.fillNull(rs.getString("sjspjl"));
		sjspsm=cf.fillNull(rs.getString("sjspsm"));
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
<form method="post" action="" name="editform" target="_blank">
  <div align="center">印刷品领取申请（<font color="#0000CC"><b><font color="#990000">注意：明细录完后需点击【完成按钮】</font></b></font>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0033">*</font>申领单位</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#CC0033">*</font>申领分公司</td>
      <td width="30%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0033">*</font>申领人</td>
      <td width="32%"> 
        <input type="text" name="slr" size="20" maxlength="20"  value="<%=slr%>" >
      </td>
      <td align="right" width="20%">计划领取日期</td>
      <td width="30%"> 
        <input type="text" name="jhlqrq" size="20" maxlength="10"  value="<%=jhlqrq%>" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0033">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="20%"><font color="#CC0033">*</font><font color="#0000CC">录入日期</font></td>
      <td width="30%"> 
        <input type="text" name="lrrq" size="20" maxlength="10"  value="<%=lrrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">一级审批人</font></td>
      <td width="32%"> <%=yjspr%> </td>
      <td align="right" width="20%"><font color="#0000CC">一级审批时间</font></td>
      <td width="30%"> <%=yjspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">一级审批结论</font></td>
      <td width="32%"><%
	cf.radioToken(out,"1+同意&2+返回上级&3+撤销",yjspjl,true);
%></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">一级审批说明</font></td>
      <td colspan="3"> <%=yjspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">二级审批人</font></td>
      <td width="32%"> <%=ejspr%> </td>
      <td align="right" width="20%"><font color="#0000CC">二级审批时间</font></td>
      <td width="30%"> <%=ejspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">二级审批结论</font></td>
      <td width="32%"><%
	cf.radioToken(out,"1+同意&2+返回上级&3+撤销",ejspjl,true);
%></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">二级审批说明</font></td>
      <td colspan="3"> <%=ejspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">三级审批人</font></td>
      <td width="32%"> <%=sjspr%> </td>
      <td align="right" width="20%"><font color="#0000CC">三级审批时间</font></td>
      <td width="30%"> <%=sjspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">三级审批结论</font></td>
      <td width="32%"><%
	cf.radioToken(out,"1+同意&2+返回上级&3+撤销",sjspjl,true);
%></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">三级审批说明</font></td>
      <td colspan="3"> <%=sjspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="button"  value="录入明细" onClick="f_lrmx(editform)" >
          <input type="button"  value="查看明细" onClick="f_ckmx(editform)" >
          <input type="button"  value="完成" onClick="f_end(editform)" >
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
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[申领单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[申领分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "计划领取日期"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrrq)=="") {
		alert("请输入[录入日期]！");
		FormName.lrrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "录入日期"))) {
		return false;
	}

	FormName.action="SaveEditOa_xcplqsq.jsp"
	FormName.submit();
	return true;
}

function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}

	FormName.action="InsertOa_xcplqmxMain.jsp"
	FormName.submit();
	return true;
}

function f_ckmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}

	FormName.action="Oa_xcplqmxList.jsp"
	FormName.submit();
	return true;
}

function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}

	FormName.action="SaveEnd.jsp"
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
