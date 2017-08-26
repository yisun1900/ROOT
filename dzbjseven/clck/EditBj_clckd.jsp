<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String ckzsl=null;
String ckzje=null;
String clzt=null;
String ckr=null;
String cksj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String dqbm=null;
String ckdh=cf.GB2Uni(request.getParameter("ckdh"));
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

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;
String fgsbh=null;


try {
	conn=cf.getConnection();

	ls_sql="select ckdh,khbh,ckzsl,ckzje,clzt,ckr,cksj,lrr,lrsj,bz,dqbm ";
	ls_sql+=" from  bj_clckd";
	ls_sql+=" where  (ckdh='"+ckdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckdh=cf.fillNull(rs.getString("ckdh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ckzsl=cf.fillNull(rs.getString("ckzsl"));
		ckzje=cf.fillNull(rs.getString("ckzje"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
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

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
  <div align="center">请修改材料出库单（出库单号：<%=ckdh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">客户编号</div>
      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="18%"> 
        <div align="right">合同号</div>
      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">客户姓名</div>
      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="18%"> 
        <div align="right">签约店面</div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">房屋地址</td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">设计师</div>
      </td>
      <td width="32%"> <%=sjs%> </td>
      <td width="18%"> 
        <div align="right">质检员</div>
      </td>
      <td width="32%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">施工队</div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%"> 
        <div align="right">施工班组</div>
      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">出库总数量</font></td>
      <td width="32%"> 
        <input type="text" name="ckzsl" size="20" maxlength="17"  value="<%=ckzsl%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">出库总金额</font></td>
      <td width="32%"> 
        <input type="text" name="ckzje" size="20" maxlength="17"  value="<%=ckzje%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>出库人</td>
      <td width="32%"> 
        <input type="text" name="ckr" value="<%=ckr%>" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font>出库时间</td>
      <td width="32%"> 
        <input type="text" name="cksj" value="<%=cksj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
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
        <input type="hidden" name="ckdh" value="<%=ckdh%>">
        <input type="hidden" name="khbh" value="<%=khbh%>" >
          <input type="hidden" name="sgd"  value="<%=sgd%>" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
          <input type="button"  value="出库录入" onClick="f_lr(editform)" name="lr" >
          <input type="button"  value="查看明细" onClick="f_ck(editform)" name="ck" >
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
	if(	javaTrim(FormName.ckdh)=="") {
		alert("请输入[出库单号]！");
		FormName.ckdh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ckzsl)=="") {
		alert("请输入[出库总数量]！");
		FormName.ckzsl.focus();
		return false;
	}
	if(!(isFloat(FormName.ckzsl, "出库总数量"))) {
		return false;
	}
	if(	javaTrim(FormName.ckzje)=="") {
		alert("请输入[出库总金额]！");
		FormName.ckzje.focus();
		return false;
	}
	if(!(isFloat(FormName.ckzje, "出库总金额"))) {
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

	FormName.action="SaveEditBj_clckd.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckdh)=="") {
		alert("请输入[出库单号]！");
		FormName.ckdh.focus();
		return false;
	}

	FormName.action="EnterWlbm.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckdh)=="") {
		alert("请输入[出库单号]！");
		FormName.ckdh.focus();
		return false;
	}

	FormName.action="Bj_clckmxList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
