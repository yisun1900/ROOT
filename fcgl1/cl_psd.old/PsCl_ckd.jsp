<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>配送</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ckph=null;
ckph=cf.GB2Uni(request.getParameter("ckph"));

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ckdw=null;
String ckr=null;
String cksj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;
String sgddh=null;
double ckzje=0;
double ckzsl=0;

try { 
	conn=cf.getConnection();

	ls_sql="select dwbh,ckr,cksj,lrr,lrsj,bz,khbh,ckzje,ckzsl,psfs,jhshsj,fkje";
	ls_sql+=" from  cl_ckd";
	ls_sql+=" where ckph='"+ckph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdw=cf.fillNull(rs.getString("dwbh"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ckzje=rs.getDouble("ckzje");
		ckzsl=rs.getDouble("ckzsl");
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
	}
	rs.close();
	ps.close();


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
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
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="12%">材料名称</td>
	<td  width="12%">材料规格</td>
	<td  width="12%">材料大类</td>
	<td  width="7%">出库单价</td>
	<td  width="7%">出库数量</td>
	<td  width="12%">出库金额</td>
</tr>
<%
	int row=0;
	String bgcolor="E8E8FF";

	String clbm=null;
	String clmc=null;
	String clgg=null;
	double gdj=0;
	double cksl=0;
	double ckje=0;
	String cldlmc=null;
	double allcksl=0;
	double allckje=0;

	ls_sql="SELECT cl_ckmx.clbm clbm,ckph,cl_ckmx.clmc,cl_ckmx.clgg,cl_ckmx.gdj,cksl,ckje,cldlmc  ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=rs.getDouble("gdj");
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));

		allcksl=allcksl+cksl;
		allckje=allckje+ckje;

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else 
		{
			bgcolor="FFFFFF";
		}
%>
		<tr align="center" bgcolor="<%=bgcolor%>">
		<td> <%=row%></td>
		<td> <%=clmc%>
		</td>
		<td> <%=clgg%>
		</td>
		<td> <%=cldlmc%>
		</td>
		<td> <%=gdj%>
		</td>
		<td><%=cksl%></td>
		<td> <%=ckje%></td>
		</tr>
<%
	}
	rs.close();
	ps.close();

%>
	<tr align="center">
	<td colspan="3">合 计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td> <%=allcksl%></td>
	<td> <%=allckje%></td>
	</tr>
</table>

<form method="post" action="" name="insertform" >
<div align="center">配送</div>
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
        <div align="right">联系方式</div>
      </td>
      <td width="33%"><%=lxfs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
      <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td width="17%" align="right"><font color="#0000CC">设计师</font></td>
      <td width="33%"><%=sjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">质检员</font></div>
      </td>
      <td width="32%"><%=zjxm%> </td>
      <td width="17%"> 
        <div align="right">签约额</div>
      </td>
      <td width="33%"><%=qye%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC">施工队</font></div>
      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="17%"> 
        <div align="right"><font color="#0000CC">施工班组</font></div>
      </td>
      <td width="33%"> <%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">合同开工日期</font></td>
      <td width="32%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
      <td width="17%" align="right"><font color="#0000CC">合同交工日期</font></td>
      <td width="33%"> <%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">出库批号</font></td>
      <td width="32%"> <%=ckph%> </td>
      <td align="right" width="17%"><font color="#0000CC"></font><font color="#0000CC">分公司</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ckdw+"'",ckdw,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC"></font>出库人</td>
      <td width="32%"> <%=ckr%> </td>
      <td align="right" width="17%"><font color="#0000CC"></font>出库时间</td>
      <td width="33%"> <%=cksj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">出库总数量</td>
      <td width="32%"><%=ckzsl%></td>
      <td align="right" width="17%">出库总金额</td>
      <td width="33%"><%=ckzje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC"></font><font color="#0000CC">录入人</font></td>
      <td width="32%"> <%=lrr%> </td>
      <td align="right" width="17%"><font color="#0000CC"></font><font color="#0000CC">录入时间</font></td>
      <td width="33%"> <%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>配送方式</td>
      <td width="32%"> <%
	cf.radioToken(out, "psfs","1+配送&2+自提&9+其它",psfs,true);
%> </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>计划送货时间</td>
      <td width="33%"> 
        <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>返款金额</td>
      <td width="32%"> 
        <input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="14" readonly>
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>实际送货时间</td>
      <td width="32%"> 
        <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>运费</td>
      <td width="33%"> 
        <input type="text" name="yf" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">配送录入人</font></td>
      <td width="32%"> 
        <input type="text" name="pslrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">配送录入时间</font></td>
      <td width="33%"> 
        <input type="text" name="pslrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>">
        <input type="hidden" name="ckph" value="<%=ckph%>">
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="button"  value="打印配送单" onClick="window.open('dypsd.jsp?ckph=<%=ckph%>')" name="button">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[实际送货时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "实际送货时间"))) {
		return false;
	}

	if(	javaTrim(FormName.pslrr)=="") {
		alert("请输入[配送录入人]！");
		FormName.pslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.pslrsj)=="") {
		alert("请输入[配送录入时间]！");
		FormName.pslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pslrsj, "配送录入时间"))) {
		return false;
	}

	if(	javaTrim(FormName.yf)=="") {
		alert("请输入[运费]！");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "运费"))) {
		return false;
	}

	
	FormName.action="SavePsCl_ckd.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
