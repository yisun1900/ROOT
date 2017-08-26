<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xqmc=null;
String yjfy=null;
String yjcc=null;
String sjfy=null;
String sjcc=null;
String spjl=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String bz=null;
String spzt=null;
String scbfzr=null;
String scbfzrdh=null;
String scbzrs=null;
String scbsffz=null;
String gjjzgwrs=null;
String ryydl=null;
String kfql=null;
String fasfwc=null;
String kfxs=null;
String kfmb=null;
String xqhdmc=null;

String wherexqmc=cf.getParameter(request,"xqmc");
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xqhdmc,kfmb,xqmc,yjfy,yjcc,sjfy,sjcc,spjl,spr,spsj,spyj,lrr,lrsj,fgsbh,bz,spzt,scbfzr,scbfzrdh,scbzrs,scbsffz,gjjzgwrs,ryydl,kfql,fasfwc,kfxs ";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqhdmc=cf.fillNull(rs.getString("xqhdmc"));
		kfmb=cf.fillNull(rs.getString("kfmb"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		yjfy=cf.fillNull(rs.getString("yjfy"));
		yjcc=cf.fillNull(rs.getString("yjcc"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		sjcc=cf.fillNull(rs.getString("sjcc"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bz=cf.fillNull(rs.getString("bz"));
		spzt=cf.fillNull(rs.getString("spzt"));
		scbfzr=cf.fillNull(rs.getString("scbfzr"));
		scbfzrdh=cf.fillNull(rs.getString("scbfzrdh"));
		scbzrs=cf.fillNull(rs.getString("scbzrs"));
		scbsffz=cf.fillNull(rs.getString("scbsffz"));
		gjjzgwrs=cf.fillNull(rs.getString("gjjzgwrs"));
		ryydl=cf.fillNull(rs.getString("ryydl"));
		kfql=cf.fillNull(rs.getString("kfql"));
		fasfwc=cf.fillNull(rs.getString("fasfwc"));
		kfxs=cf.fillNull(rs.getString("kfxs"));
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
<title>审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveSpYx_xqcxhdgl.jsp" name="editform">
<div align="center">申请－审批</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">公司</td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="18%">小区名称</td>
      <td width="32%"><%=xqmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">小区活动名称</td>
      <td colspan="3"><%=xqhdmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">市场部负责人</td>
      <td width="32%"><%=scbfzr%> </td>
      <td align="right" width="18%">市场部负责人电话</td>
      <td width="32%"><%=scbfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">市场部总人数</td>
      <td width="32%"><%=scbzrs%> </td>
      <td align="right" width="18%">市场部是否分组</td>
      <td width="32%"> <%
	cf.radioToken(out, "scbsffz","N+未分组&Y+分组",scbsffz,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">高级家装顾问人数</td>
      <td width="32%"><%=gjjzgwrs%> </td>
      <td align="right" width="18%">人员异动率</td>
      <td width="32%"><%=ryydl%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"></td>
      <td width="32%"> </td>
      <td align="right" width="18%">开发潜力</td>
      <td width="32%"><%=kfql%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">开发方案是否完成</td>
      <td width="32%"> <%
	cf.radioToken(out, "fasfwc","N+未完成&Y+完成",fasfwc,true);
%> </td>
      <td align="right" width="18%">开发形式</td>
      <td width="32%"><%=kfxs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">预计费用</td>
      <td width="32%"><%=yjfy%> </td>
      <td align="right" width="18%">预计产出</td>
      <td width="32%"><%=yjcc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">开发目标</td>
      <td colspan="3"><%=kfmb%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">实际费用</td>
      <td width="32%"><%=sjfy%> </td>
      <td align="right" width="18%">实际产出</td>
      <td width="32%"><%=sjcc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%"><%=lrr%> </td>
      <td align="right" width="18%">录入时间</td>
      <td width="32%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"><%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>审批结论</td>
      <td width="32%"> 
        <select name="spjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"Y+同意&N+不同意","");
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>审批人</td>
      <td width="32%"> 
        <input type="text" name="spr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>审批时间</td>
      <td width="32%"> 
        <input type="text" name="spsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审批意见</td>
      <td colspan="3"> 
        <textarea name="spyj" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherexqmc"  value="<%=wherexqmc%>" >
    <input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
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
	if(	javaTrim(FormName.spjl)=="") {
		alert("请选择[审批结论]！");
		FormName.spjl.focus();
		return false;
	}
	if(	javaTrim(FormName.spr)=="") {
		alert("请输入[审批人]！");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("请输入[审批时间]！");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
